import bottle
from bottle import route, run,template
import pymysql
import MySQLdb
import pdb
import json
from bottle import response, get, post, request
from bottle import static_file

# function for the index page
@bottle.route('/')
def firstpage():
	print "template"
	return template('html')

def index():
	print "reached home"
	data = query_to_db()
	response.content_type = 'application/json'
	return template('html.tpl')
 # return json.dumps(data)
	#return "hello"

@bottle.route('/getHospitals', method='POST')
def query_to_db():
	print "reached query"
	input2 = request.json['codeList']
	print str(input2[0])
	in_param = ''
	for i in input2:
			in_param=in_param+"'"+str(i)+"',"
	in_param=in_param[:-1]
	db = MySQLdb.connect(host='127.0.0.1', port=3307, db='e_hqoc', user='root', passwd='Sairam', local_infile = 1)
	zipcode = request.json['zipcode']
	print zipcode
	#Drop table query
	drop_table = 'Drop table if exists NPI;'
	cur = db.cursor()
	cur.execute("USE e_hqoc")
	cur.execute(drop_table)


	##########################################
	'''query = "SELECT a.NATIONAL_PROVIDER_ID,COUNT(*) AS Cases_ADC,cnt_admit Cases_Total,\
	COUNT(*) / cnt_admit * 100 AS Incidence FROM ehqoc a INNER JOIN (SELECT NATIONAL_PROVIDER_ID, COUNT(*) AS cnt_admit \
	FROM ehqoc GROUP BY NATIONAL_PROVIDER_ID) b ON a.NATIONAL_PROVIDER_ID = b.NATIONAL_PROVIDER_ID WHERE \
	admitting_diagnosis_code in ("+in_param+") GROUP BY a.NATIONAL_PROVIDER_ID"'''
	##########################################

	#get NPI data
	npi_query = "create table NPI as (select a.NATIONAL_PROVIDER_ID,count(*) AS Cases_ADC,cnt_admit Cases_Total,count(*)/cnt_admit * 100 as Incidence," \
							" substring(PROVIDER_ZIP_CODE,1,5) as Zipcode, a.PROVIDER_CITY_NAME from ehqoc a inner join (select NATIONAL_PROVIDER_ID,count(*) as cnt_admit" \
							" from ehqoc group by NATIONAL_PROVIDER_ID) b on a.NATIONAL_PROVIDER_ID = b.NATIONAL_PROVIDER_ID" \
							" where admitting_diagnosis_code in ("+in_param+") group by a.NATIONAL_PROVIDER_ID order by Incidence desc);"

	cur = db.cursor()
	cur.execute("USE e_hqoc")
	cur.execute(npi_query)

	zipcode_query = "select NATIONAL_PROVIDER_ID,Cases_ADC,Cases_Total,Incidence,distance,PROVIDER_CITY_NAME,Lat1,Long1" \
				" from NPI inner join"	\
				" (select Zip,Lat1,Long1,3961*(2*atan2(sqrt(inner_form),sqrt(1-inner_form))) as Distance from"	\
				" (select Zip,Lat1,Long1,sin((LAT1_RAD-LAT2_RAD)/2)*sin((LAT1_RAD - LAT2_RAD)/2) + cos(LAT1_RAD)*cos(LAT2_RAD)*sin((LONG1_RAD-LONG2_RAD)/2)*sin((LONG1_RAD-LONG2_RAD)/2)" \
				" as inner_form from (select Zip_EHQOC.Zip,Zip_EHQOC.Lat1,Zip_EHQOC.Long1,radians(Lat1) as LAT1_RAD,radians(Long1) as LONG1_RAD,radians(Lat2) as LAT2_RAD,radians(Long2) as LONG2_RAD from"	\
				" (select Zip,latitude as Lat1,longitude as Long1 from zipcode where zip in" \
				" (select Zipcode from NPI)) Zip_EHQOC,(select Zip,latitude as Lat2,longitude as Long2 from zipcode where zip = '"+zipcode+"') Zip_Usr) SQ1) SQ2) Dist on zipcode = zip;"
	cur = db.cursor()
	cur.execute("USE e_hqoc")
	cur.execute(zipcode_query)

	data = cur.fetchall()
	#pdb.set_trace()
	print data
	#NATIONAL_PROVIDER_ID Cases_ADC Cases_Total Incidence
	json_var = []
	response.content_type = 'application/json'
	for value in data:
			json_dict = {}
			json_dict['NATIONAL_PROVIDER_ID'] = value[0]
			json_dict['Cases_ADC'] = value[1]
			json_dict['Cases_Total'] = value[2]
			json_dict['Incidence'] = float(value[3])
			json_dict['distance'] = float(value[4])
			json_dict['PROVIDER_CITY_NAME'] = value[5]
			json_dict['Lat1'] = float(value[6])
			json_dict['Long1'] = float(value[7])
			json_var.append(json_dict)
	return json.dumps(json_var)
	#return json_var

@bottle.route('/getAQoC', method='POST')
def AQoC_to_db():
	print "reached queryAQoC"
	input2 = request.json['codeList']
	print str(input2[0])
	in_param = ''
	for i in input2:
			in_param=in_param+"'"+str(i)+"',"
	in_param=in_param[:-1]
	input3 = request.json['codeList1']
	#input3 = input3[:-1]
	print str(input3[0])
	in_param1 = ''
	for i in input3:
		in_param1=in_param1+str(i)
	in_param1=in_param1[:-1]
	print in_param1
	db = MySQLdb.connect(host='127.0.0.1', port=3307, db='e_hqoc', user='root', passwd='Sairam', local_infile = 1)
	zipcode = request.json['zipcode']
	print zipcode
	cur = db.cursor()
	print "printing query"
	query1 = "Drop table if exists temp;"
	cur.execute(query1);
	cur = db.cursor()
	query = "create table temp as select ehqoc.NATIONAL_PROVIDER_ID,(COUNT(*)/CNT)*100 as Inhospital_disease, SUBSTRING(PROVIDER_ZIP_CODE, 1, 5) AS Zipcode \
					 from ehqoc,(SELECT NATIONAL_PROVIDER_ID,count(*) AS CNT FROM EHQOC group by NATIONAL_PROVIDER_ID) A  \
					 where admitting_diagnosis_code = "+in_param+" and "+in_param1+"=1  \
					 and ehqoc.NATIONAL_PROVIDER_ID = A.NATIONAL_PROVIDER_ID GROUP BY Ehqoc.NATIONAL_PROVIDER_ID;"
	cur.execute(query);
	cur = db.cursor()
	query2 = "select NATIONAL_PROVIDER_ID, Inhospital_disease, latitude, longitude, zip \
					 from temp, \
					(Select Latitude, Longitude, Zip from zipcode where zip in (select Zipcode from temp)) SQ where zipcode = zip;"
	query3 = "select max(Inhospital_disease) from temp;"
	query4 = "select min(Inhospital_disease) from temp;"
	query5 = "select avg(Inhospital_disease) from temp;"
	print query2
	cur.execute(query2)
	data1 = cur.fetchall()
	print data1
	print query3
	cur.execute(query3)
	data2 = cur.fetchall()
	print data2
	print query4
	cur.execute(query4)
	data3 = cur.fetchall()
	print data3
	print query5
	cur.execute(query5)
	data4 = cur.fetchall()
	print data4
	for i in data4:
		avg = float(i[0]);
	for i in data2:
		max = float(i[0]);
	for i in data3:
		min = float(i[0]);
	med = (max + min)/2;
	half = med/2;
	less = med - half;
	more = med + half;
	print min
	print less
	print med
	print more
	print max
	l = [];
	for inhos in data1:
			l.append(inhos[3]);
	json_var = []
	response.content_type = 'application/json'
	for value in data1:
			json_dict1 = {}
			json_dict1['NATIONAL_PROV_ID'] = value[0]
			json_dict1['Inhospital_disease'] = float(value[1])
			json_dict1['Latitude'] = float(value[2])
			json_dict1['Longitude'] = float(value[3])
			if(min <= float(value[1]) <  less):
				json_dict1['color'] = "#f5cccc"
			if(less <= float(value[1]) <  med):
				json_dict1['color'] = "#dc4c4c"
			if(med <= float(value[1]) <  more):
				json_dict1['color'] = "#cd0000"
			elif(more <= float(value[1]) <=  max):
				json_dict1['color'] = "#7b0000"
			json_var.append(json_dict1)
	print json_var
	return json.dumps(json_var)
	#return json_var
	
@bottle.route('/getALoS', method='POST')
def ALoS_to_db():
	print "reached queryALoS"
	input2 = request.json['codeList']
	print str(input2[0])
	in_param = ''
	for i in input2:
			in_param=in_param+"'"+str(i)+"',"
	in_param=in_param[:-1]
	db = MySQLdb.connect(host='127.0.0.1', port=3307, db='e_hqoc', user='root', passwd='Sairam', local_infile = 1)
	zipcode = request.json['zipcode']
	print zipcode
	cur = db.cursor()
	print "printing query"
	query1 = "Drop table if exists temp4;"
	cur.execute(query1);
	cur = db.cursor()
	query = "create table temp4 as select ehqoc.NATIONAL_PROVIDER_ID,sum(LENGTH_OF_STAY)/CNT * 100 as Avg_LOS, SUBSTRING(PROVIDER_ZIP_CODE, 1, 5) AS Zipcode" \
					" from ehqoc,(SELECT NATIONAL_PROVIDER_ID,sum(LENGTH_OF_STAY) AS CNT FROM EHQOC group by NATIONAL_PROVIDER_ID) A" \
					" where admitting_diagnosis_code = "+in_param+" and ehqoc.NATIONAL_PROVIDER_ID = A.NATIONAL_PROVIDER_ID GROUP BY Ehqoc.NATIONAL_PROVIDER_ID;"
	cur.execute(query);
	cur = db.cursor()
	query2 = "select NATIONAL_PROVIDER_ID,Avg_LOS,latitude,longitude,zip from temp4, \
						(Select Latitude, Longitude, Zip from zipcode where zip in (select Zipcode from temp4)) SQ where zipcode = zip;"
	query3 = "select max(Avg_LOS) from temp4;"
	query4 = "select min(Avg_LOS) from temp4;"
	query5 = "select avg(Avg_LOS) from temp4;"
	print query2
	cur.execute(query2)
	data1 = cur.fetchall()
	print data1
	print query3
	cur.execute(query3)
	data2 = cur.fetchall()
	print data2
	print query4
	cur.execute(query4)
	data3 = cur.fetchall()
	print data3
	print query5
	cur.execute(query5)
	data4 = cur.fetchall()
	print data4
	for i in data4:
		avg = float(i[0]);
	for i in data2:
		max = float(i[0]);
	for i in data3:
		min = float(i[0]);
	med = (max + min)/2;
	half = med/2;
	less = med - half;
	more = med + half;
	print min
	print less
	print med
	print more
	print max
	l = [];
	mid_ranges = [];
	for inhos in data1:
			l.append(inhos[3]);
	json_var = []
	response.content_type = 'application/json'
	for value in data1:
		if (min <= float(value[1]) <  less):
			mid_ranges.append(float(value[1]));
	for value in mid_ranges:
		print value
	print "-----min value------ \n"
	mid_ranges.sort(key=float)
	mid_min = mid_ranges[0]
	print "-----max value------ \n"
	mid_ranges.sort(key=float, reverse = True)
	mid_max = mid_ranges[0]
	mid_med = (mid_max + mid_min)/2;
	mid_half = mid_med/2;
	mid_less = mid_med - mid_half;
	mid_more = mid_med + mid_half;
	print "-----max value------ \n" 
	print mid_max
	print "-----min value------ \n"
	print mid_min
	print "-----med value------ \n"
	print mid_med 
	print "-----less value------ \n"
	print mid_less
	print "-----more value------ \n"
	print mid_more
	for value in data1:
			json_dict1 = {}
			json_dict1['NATIONAL_PROV_ID'] = value[0]
			json_dict1['Avg_LOS'] = float(value[1])
			json_dict1['Latitude'] = float(value[2])
			json_dict1['Longitude'] = float(value[3])
			if(min <= float(value[1]) <  less):
				if(mid_min <= float(value[1]) <  mid_less):
					json_dict1['color'] = "red"
				if(mid_less <= float(value[1]) <  mid_med):
					json_dict1['color'] = "blue"
				if(mid_med <= float(value[1]) <  mid_more):
					json_dict1['color'] = "green"
				if(mid_more <= float(value[1]) <  mid_max):
					json_dict1['color'] = "yellow"
			if(less <= float(value[1]) <  med):
				json_dict1['color'] = "#4ca64c"
			if(med <= float(value[1]) <  more):
				json_dict1['color'] = "#008000"
			elif(more <= float(value[1]) <=  max):
				json_dict1['color'] = "#004000"
			json_var.append(json_dict1)
	print json_var
	return json.dumps(json_var)
	#return json_var

@bottle.route('/getPLoS', method='POST')
def PLoS_to_db():
	print "reached queryPLoS"
	input2 = request.json['codeList']
	print str(input2[0])
	in_param = ''
	for i in input2:
			in_param=in_param+str(i)
	in_param=in_param[:-1]
	db = MySQLdb.connect(host='127.0.0.1', port=3307, db='e_hqoc', user='root', passwd='Sairam', local_infile = 1)
	zipcode = request.json['zipcode']
	print zipcode
	cur = db.cursor()
	print "printing query"
	query1 = "Drop table if exists temp4;"
	cur.execute(query1);
	cur = db.cursor()
	query = "create table temp4 as select ehqoc.NATIONAL_PROVIDER_ID,sum(LENGTH_OF_STAY)/CNT * 100 as Avg_LOS, SUBSTRING(PROVIDER_ZIP_CODE, 1, 5) AS Zipcode" \
					" from ehqoc,(SELECT NATIONAL_PROVIDER_ID,sum(LENGTH_OF_STAY) AS CNT FROM EHQOC group by NATIONAL_PROVIDER_ID) A" \
					" where "+in_param+"=1 and ehqoc.NATIONAL_PROVIDER_ID = A.NATIONAL_PROVIDER_ID GROUP BY Ehqoc.NATIONAL_PROVIDER_ID;"
	cur.execute(query);
	cur = db.cursor()
	query2 = "select NATIONAL_PROVIDER_ID,Avg_LOS,latitude,longitude,zip from temp4, \
						(Select Latitude, Longitude, Zip from zipcode where zip in (select Zipcode from temp4)) SQ where zipcode = zip;"
	query3 = "select max(Avg_LOS) from temp4;"
	query4 = "select min(Avg_LOS) from temp4;"
	query5 = "select avg(Avg_LOS) from temp4;"
	print query2
	cur.execute(query2)
	data1 = cur.fetchall()
	print data1
	print query3
	cur.execute(query3)
	data2 = cur.fetchall()
	print data2
	print query4
	cur.execute(query4)
	data3 = cur.fetchall()
	print data3
	print query5
	cur.execute(query5)
	data4 = cur.fetchall()
	print data4
	for i in data4:
		avg = float(i[0]);
	for i in data2:
		max = float(i[0]);
	for i in data3:
		min = float(i[0]);
	med = (max + min)/2;
	half = med/2;
	less = med - half;
	more = med + half;
	print min
	print less
	print med
	print more
	print max
	l = [];
	for inhos in data1:
			l.append(inhos[3]);
	json_var = []
	response.content_type = 'application/json'
	for value in data1:
			json_dict1 = {}
			json_dict1['NATIONAL_PROV_ID'] = value[0]
			json_dict1['Avg_LOS'] = float(value[1])
			json_dict1['Latitude'] = float(value[2])
			json_dict1['Longitude'] = float(value[3])
			if(min <= float(value[1]) <  less):
				json_dict1['color'] = "#b2d8b2"
			if(less <= float(value[1]) <  med):
				json_dict1['color'] = "#4ca64c"
			if(med <= float(value[1]) <  more):
				json_dict1['color'] = "#008000"
			elif(more <= float(value[1]) <=  max):
				json_dict1['color'] = "#004000"
			json_var.append(json_dict1)
	print json_var
	return json.dumps(json_var)
	#return json_var	
	
@bottle.route('/getACoC', method='POST')
def ACoC_to_db():
	print "reached queryACoC"
	input2 = request.json['codeList']
	print str(input2[0])
	in_param = ''
	for i in input2:
			in_param=in_param+"'"+str(i)+"',"
	in_param=in_param[:-1]
	db = MySQLdb.connect(host='127.0.0.1', port=3307, db='e_hqoc', user='root', passwd='Sairam', local_infile = 1)
	zipcode = request.json['zipcode']
	print zipcode
	cur = db.cursor()
	print "printing query"
	query1 = "Drop table if exists temp2;"
	cur.execute(query1);
	cur = db.cursor()
	query = "create table temp2 as select NATIONAL_PROVIDER_ID,Avg(TOTAL_CHARGES) as Avg_Tot_Charges,SUBSTRING(PROVIDER_ZIP_CODE, 1, 5) AS Zipcode from ehqoc \
					where ADMITTING_DIAGNOSIS_CODE = "+in_param+" group by NATIONAL_PROVIDER_ID;"
	cur.execute(query);
	cur = db.cursor()
	query2 = "select NATIONAL_PROVIDER_ID,Avg_Tot_Charges,latitude,longitude,zip from temp2, \
						(Select Latitude, Longitude, Zip from zipcode where zip in (select Zipcode from temp2)) SQ where zipcode = zip;"
	query3 = "select max(Avg_Tot_Charges) from temp2;"
	query4 = "select min(Avg_Tot_Charges) from temp2;"
	query5 = "select avg(Avg_Tot_Charges) from temp2;"	
	print query2
	cur.execute(query2)
	data1 = cur.fetchall()
	print query3
	cur.execute(query3)
	data2 = cur.fetchall()
	print data2
	print query4
	cur.execute(query4)
	data3 = cur.fetchall()
	print data3
	print query5
	cur.execute(query5)
	data4 = cur.fetchall()
	print data4
	for i in data4:
		avg = float(i[0]);
	for i in data2:
		max = float(i[0]);
	for i in data3:
		min = float(i[0]);
	med = (max + min)/2;
	half = med/2;
	less = med - half;
	more = med + half;
	print min
	print less
	print med
	print more
	print max
	l = [];
	for inhos in data1:
			l.append(inhos[3]);
	json_var = []
	response.content_type = 'application/json'
	for value in data1:
			json_dict1 = {}
			json_dict1['NATIONAL_PROV_ID'] = value[0]
			json_dict1['Avg_Tot_Charges'] = float(value[1])
			json_dict1['Latitude'] = float(value[2])
			json_dict1['Longitude'] = float(value[3])
			if(min <= float(value[1]) <  less):
				json_dict1['color'] = "green"
			if(less <= float(value[1]) <  med):
				json_dict1['color'] = "yellow"
			if(med <= float(value[1]) <  more):
				json_dict1['color'] = "blue"
			elif(more <= float(value[1]) <=  max):
				json_dict1['color'] = "red"
			json_var.append(json_dict1)
	print json_var
	return json.dumps(json_var)
	#return json_var
	
@bottle.route('/getPCoC', method='POST')
def PCoC_to_db():
	print "reached queryPCoC"
	input2 = request.json['codeList']
	print str(input2[0])
	in_param = ''
	for i in input2:
			in_param=in_param+str(i)
	in_param=in_param[:-1]
	db = MySQLdb.connect(host='127.0.0.1', port=3307, db='e_hqoc', user='root', passwd='Sairam', local_infile = 1)
	zipcode = request.json['zipcode']
	print zipcode
	cur = db.cursor()
	print "printing query"
	query1 = "Drop table if exists temp2;"
	cur.execute(query1);
	cur = db.cursor()
	query = "create table temp2 as select NATIONAL_PROVIDER_ID,Avg(TOTAL_CHARGES) as Avg_Tot_Charges,SUBSTRING(PROVIDER_ZIP_CODE, 1, 5) AS Zipcode from ehqoc \
					where "+in_param+"=1 group by NATIONAL_PROVIDER_ID;"
	cur.execute(query);
	cur = db.cursor()
	query2 = "select NATIONAL_PROVIDER_ID,Avg_Tot_Charges,latitude,longitude,zip from temp2, \
						(Select Latitude, Longitude, Zip from zipcode where zip in (select Zipcode from temp2)) SQ where zipcode = zip;"
	query3 = "select max(Avg_Tot_Charges) from temp2;"
	query4 = "select min(Avg_Tot_Charges) from temp2;"
	query5 = "select avg(Avg_Tot_Charges) from temp2;"	
	print query2
	cur.execute(query2)
	data1 = cur.fetchall()
	print query3
	cur.execute(query3)
	data2 = cur.fetchall()
	print data2
	print query4
	cur.execute(query4)
	data3 = cur.fetchall()
	print data3
	print query5
	cur.execute(query5)
	data4 = cur.fetchall()
	print data4
	for i in data4:
		avg = float(i[0]);
	for i in data2:
		max = float(i[0]);
	for i in data3:
		min = float(i[0]);
	med = (max + min)/2;
	half = med/2;
	less = med - half;
	more = med + half;
	print min
	print less
	print med
	print more
	print max
	l = [];
	for inhos in data1:
			l.append(inhos[3]);
	json_var = []
	response.content_type = 'application/json'
	for value in data1:
			json_dict1 = {}
			json_dict1['NATIONAL_PROV_ID'] = value[0]
			json_dict1['Avg_Tot_Charges'] = float(value[1])
			json_dict1['Latitude'] = float(value[2])
			json_dict1['Longitude'] = float(value[3])
			if(min <= float(value[1]) <  less):
				json_dict1['color'] = "green"
			if(less <= float(value[1]) <  med):
				json_dict1['color'] = "yellow"
			if(med <= float(value[1]) <  more):
				json_dict1['color'] = "blue"
			elif(more <= float(value[1]) <=  max):
				json_dict1['color'] = "red"
			json_var.append(json_dict1)
	print json_var
	return json.dumps(json_var)
	#return json_var	

@bottle.route('/getPQoC', method='POST')
def PQoC_to_db():
	print "reached queryPQoC"
	input2 = request.json['codeList']
	print str(input2[0])
	in_param = ''
	for i in input2:
			in_param=in_param+str(i)
	in_param=in_param[:-1]

	input3 = request.json['codeList1']
	#input3 = input3[:-1]
	print str(input3[0])
	in_param1 = ''
	for i in input3:
		in_param1=in_param1+str(i)
	in_param1=in_param1[:-1]
	print in_param1
	print in_param
	db = MySQLdb.connect(host='127.0.0.1', port=3307, db='e_hqoc', user='root', passwd='Sairam', local_infile = 1)
	zipcode = request.json['zipcode']
	print zipcode
	cur = db.cursor()
	print "printing query"
	query1 = "Drop table if exists temp;"
	cur.execute(query1);
	cur = db.cursor()
	query = "create table temp as select ehqoc.NATIONAL_PROVIDER_ID,(COUNT(*)/CNT)*100 as Inhospital_disease, SUBSTRING(PROVIDER_ZIP_CODE, 1, 5) AS Zipcode \
					 from ehqoc,(SELECT NATIONAL_PROVIDER_ID,count(*) AS CNT FROM EHQOC group by NATIONAL_PROVIDER_ID) A  \
					 where "+in_param+"=1 and "+in_param1+"=1  \
					 and ehqoc.NATIONAL_PROVIDER_ID = A.NATIONAL_PROVIDER_ID GROUP BY Ehqoc.NATIONAL_PROVIDER_ID;"
	cur.execute(query);
	print query
	cur = db.cursor()
	query2 = "select NATIONAL_PROVIDER_ID, Inhospital_disease, latitude, longitude, zip \
					 from temp, \
					(Select Latitude, Longitude, Zip from zipcode where zip in (select Zipcode from temp)) SQ where zipcode = zip;"
	query3 = "select max(Inhospital_disease) from temp;"
	query4 = "select min(Inhospital_disease) from temp;"
	query5 = "select avg(Inhospital_disease) from temp;"	
	print query2
	cur.execute(query2)
	data1 = cur.fetchall()
	print query3
	cur.execute(query3)
	data2 = cur.fetchall()
	print data2
	print query4
	cur.execute(query4)
	data3 = cur.fetchall()
	print data3
	print query5
	cur.execute(query5)
	data4 = cur.fetchall()
	print data4
	for i in data4:
		avg = float(i[0]);
	for i in data2:
		max = float(i[0]);
	for i in data3:
		min = float(i[0]);
	med = (max + min)/2;
	half = med/2;
	less = med - half;
	more = med + half;
	print min
	print less
	print med
	print more
	print max
	l = [];
	for inhos in data1:
			l.append(inhos[3]);
	json_var = []
	response.content_type = 'application/json'
	for value in data1:
			json_dict1 = {}
			json_dict1['NATIONAL_PROV_ID'] = value[0]
			json_dict1['Inhospital_disease'] = float(value[1])
			json_dict1['Latitude'] = float(value[2])
			json_dict1['Longitude'] = float(value[3])
			if(min <= float(value[1]) <  less):
				json_dict1['color'] = "#f5cccc"
			if(less <= float(value[1]) <  med):
				json_dict1['color'] = "#dc4c4c"
			if(med <= float(value[1]) <  more):
				json_dict1['color'] = "#cd0000"
			elif(more <= float(value[1]) <=  max):
				json_dict1['color'] = "#7b0000"
			json_var.append(json_dict1)
	#print json_var
	return json.dumps(json_var)
	#return json_var
	
@bottle.route('/getInHospitaldisease', method='POST')
def query1_to_db():
	print "reached query1"
	input2 = request.json['codeList']
	print str(input2[0])
	in_param = ''
	for i in input2:
			in_param=in_param+"'"+str(i)+"',"
	in_param=in_param[:-1]
	input3 = request.json['codeList1']
	#input3 = input3[:-1]
	print str(input3[0])
	in_param1 = ''
	for i in input3:
		in_param1=in_param1+str(i)
	in_param1=in_param1[:-1]
	print in_param1
	db = MySQLdb.connect(host='127.0.0.1', port=3307, db='e_hqoc', user='root', passwd='Sairam', local_infile = 1)
	cur = db.cursor()
	cur.execute("USE e_hqoc")
	query = "select ehqoc.NATIONAL_PROVIDER_ID as NATIONAL_PROV_ID,(COUNT(*)/CNT)*100 as Inhospital_disease from ehqoc,\
(SELECT NATIONAL_PROVIDER_ID,count(*) AS CNT FROM EHQOC group by NATIONAL_PROVIDER_ID) A \
where admitting_diagnosis_code = "+in_param+" and "+in_param1+"=1 \
and ehqoc.NATIONAL_PROVIDER_ID = A.NATIONAL_PROVIDER_ID GROUP BY Ehqoc.NATIONAL_PROVIDER_ID"
	print query
	cur.execute(query)
	data1 = cur.fetchall()
	print data1
	json_var = []
	response.content_type = 'application/json'
	for value in data1:
			json_dict1 = {}
			json_dict1['NATIONAL_PROV_ID'] = value[0]
			json_dict1['Inhospital_disease'] = float(value[1])
			json_var.append(json_dict1)
	print json_var
	return json.dumps(json_var)
	#return json_var

@bottle.route('/getprocInHospitaldisease', method='POST')
def query3_to_db():
	print "reached query3"
	input2 = request.json['codeList']
	print str(input2[0])
	in_param = ''
	for i in input2:
		in_param=in_param+str(i)
	in_param=in_param[:-1]
	print in_param
	input3 = request.json['codeList1']
	#input3 = input3[:-1]
	print str(input3[0])
	in_param1 = ''
	for i in input3:
		in_param1=in_param1+str(i)
	in_param1=in_param1[:-1]
	print in_param1
	db = MySQLdb.connect(host='127.0.0.1', port=3307, db='e_hqoc', user='root', passwd='Sairam', local_infile = 1)
	cur = db.cursor()
	cur.execute("USE e_hqoc")
	query = "select ehqoc.NATIONAL_PROVIDER_ID,(COUNT(*)/CNT)*100 as Inhospital_disease \
from ehqoc,(SELECT NATIONAL_PROVIDER_ID,count(*) AS CNT FROM EHQOC group by NATIONAL_PROVIDER_ID) A \
where "+in_param+" = 1 and "+in_param1+"=1 and ehqoc.NATIONAL_PROVIDER_ID = A.NATIONAL_PROVIDER_ID \
GROUP BY Ehqoc.NATIONAL_PROVIDER_ID"
	print query
	cur.execute(query)
	data1 = cur.fetchall()
	print data1
	json_var = []
	response.content_type = 'application/json'
	for value in data1:
			json_dict1 = {}
			json_dict1['NATIONAL_PROV_ID'] = value[0]
			json_dict1['Inhospital_disease'] = float(value[1])
			json_var.append(json_dict1)
	print json_var
	return json.dumps(json_var)
	#return json_var

@bottle.route('/getprocHospitals', method='POST')
def query2_to_db():
	print "reached query2"
	input2 = request.json['codeList']
	print str(input2[0])
	in_param = ''
	for i in input2:
		in_param=in_param+str(i)
	in_param=in_param[:-1]
	print in_param
	db = MySQLdb.connect(host='127.0.0.1', port=3307, db='e_hqoc', user='root', passwd='Sairam', local_infile = 1)
	zipcode = request.json['zipcode']
	print zipcode

	##########################################
	'''query = "SELECT a.NATIONAL_PROVIDER_ID,COUNT(*) AS Cases_ADC,cnt_admit Cases_Total,\
	COUNT(*) / cnt_admit * 100 AS Incidence FROM ehqoc a INNER JOIN (SELECT NATIONAL_PROVIDER_ID, COUNT(*) AS cnt_admit \
	FROM ehqoc GROUP BY NATIONAL_PROVIDER_ID) b ON a.NATIONAL_PROVIDER_ID = b.NATIONAL_PROVIDER_ID WHERE \
	admitting_diagnosis_code in ("+in_param+") GROUP BY a.NATIONAL_PROVIDER_ID"'''
	##########################################

	#get NPI data
	zipcode_query = "select NATIONAL_PROVIDER_ID,distance,PROVIDER_CITY_NAME,Lat1,Long1  from \
									(select NATIONAL_PROVIDER_ID,PROVIDER_CITY_NAME,substring(PROVIDER_ZIP_CODE,1,5) as Zipcode from ehqoc where "+in_param+"=1) proc inner join \
									(select Zip,Lat1,Long1,3961*(2*atan2(sqrt(inner_form),sqrt(1-inner_form))) as Distance from \
									(select Zip,Lat1,Long1,sin((LAT1_RAD-LAT2_RAD)/2)*sin((LAT1_RAD - LAT2_RAD)/2) + cos(LAT1_RAD)*cos(LAT2_RAD)*sin((LONG1_RAD-LONG2_RAD)/2)*sin((LONG1_RAD-LONG2_RAD)/2) \
									as inner_form from (select Zip_EHQOC.Zip,Zip_EHQOC.Lat1,Zip_EHQOC.Long1,radians(Lat1) as LAT1_RAD,radians(Long1) as LONG1_RAD,radians(Lat2) as LAT2_RAD,radians(Long2) as LONG2_RAD from \
									(select Zip,latitude as Lat1,longitude as Long1 from zipcode where zip in \
									(select substring(PROVIDER_ZIP_CODE,1,5) as Zipcode from ehqoc where "+in_param+"=1)) Zip_EHQOC, \
									(select Zip,latitude as Lat2,longitude as Long2 from zipcode where zip = '"+zipcode+"') Zip_Usr) SQ1) SQ2) Dist on zipcode = zip group by NATIONAL_PROVIDER_ID,distance,PROVIDER_CITY_NAME;"

	print zipcode_query
	cur = db.cursor()
	cur.execute("USE e_hqoc")
	cur.execute(zipcode_query)

	data = cur.fetchall()
	#pdb.set_trace()
	print data
	#NATIONAL_PROVIDER_ID Cases_ADC Cases_Total Incidence
	json_var = []
	response.content_type = 'application/json'
	for value in data:
			json_dict = {}
			json_dict['NATIONAL_PROVIDER_ID'] = value[0]
			json_dict['distance'] = float(value[1])
			json_dict['PROVIDER_CITY_NAME'] = value[2]
			json_dict['Lat1'] = float(value[3])
			json_dict['Long1'] = float(value[4])
			json_var.append(json_dict)
	return json.dumps(json_var)
	#return json_var

@bottle.route('/getNPIData', method='POST')
def get_NPI_Data():
	print 'in get npi data'
	input2 = request.json['codeList']
	print str(input2[0])
	in_param = ''
	for i in input2:
			in_param=in_param+"'"+str(i)+"',"
	in_param=in_param[:-1]
	in_npi = str(request.json['selected_npi'])
	db = MySQLdb.connect(host='127.0.0.1', port=3307, db='e_hqoc', user='root', passwd='Sairam', local_infile = 1)
	query = "SELECT Avg(ehqoc.LENGTH_OF_STAY) as Mean_LOS, stddev(ehqoc.LENGTH_OF_STAY) as STD_LOS, m.LENGTH_OF_STAY as Mode_LOS \
from ehqoc,(SELECT LENGTH_OF_STAY,COUNT(LENGTH_OF_STAY) as cnt_LOS FROM ehqoc where NATIONAL_PROVIDER_ID = '"+in_npi+"' \
and admitting_diagnosis_code = "+in_param+" GROUP BY LENGTH_OF_STAY order by cnt_LOS desc limit 1) m \
where NATIONAL_PROVIDER_ID = '"+in_npi+"' and admitting_diagnosis_code = "+in_param+";" 


	cur = db.cursor()
	cur.execute("USE e_hqoc")
	cur.execute(query)

	data = cur.fetchall()
	#pdb.set_trace()
	print data
	#NATIONAL_PROVIDER_ID Cases_ADC Cases_Total Incidence
	#json_var = []
	response.content_type = 'application/json'
	#for value in data:
	json_dict = {}
	json_dict['average_los'] = data[0][0]
	json_dict['std_deviation_los'] = data[0][1]
	json_dict['mode_los'] = data[0][2]

	#################################################
	rank_charges = "SELECT Avg(TOTAL_CHARGES) as Avg_COC, stddev(TOTAL_CHARGES) as SD_COC from ehqoc where NATIONAL_PROVIDER_ID = '"+in_npi+"' and admitting_diagnosis_code = "+in_param+";"
	cur = db.cursor()
	cur.execute("USE e_hqoc")
	cur.execute(rank_charges)

	data = cur.fetchall()
	#pdb.set_trace()
	print data
	#NATIONAL_PROVIDER_ID Cases_ADC Cases_Total Incidence
	#json_var = []
	response.content_type = 'application/json'
	#for value in data:
	#json_dict = {}
	json_dict['average_cost'] = data[0][0]
	json_dict['std_deviation_cost'] = data[0][1]
	#json_dict['mode_los'] = data[0][2]

	query_coverage = "SELECT Avg(TOTAL_CHARGES/COVERED_CHARGES) as Avg_CR from ehqoc where NATIONAL_PROVIDER_ID = '"+in_npi+"' and admitting_diagnosis_code = "+in_param+";"
	cur = db.cursor()
	cur.execute("USE e_hqoc")
	cur.execute(query_coverage)

	data = cur.fetchall()
	response.content_type = 'application/json'
	json_dict['average_coverage'] = data[0][0]

	query_discharge_ratio = "SELECT Avg(dead_cnt/tot_cnt) as Avg_CR from (select count(*) as tot_cnt from ehqoc " \
													"where NATIONAL_PROVIDER_ID = '"+in_npi+"' and admitting_diagnosis_code = "+in_param+") T, (select count(*) as dead_cnt from ehqoc " \
													"where NATIONAL_PROVIDER_ID = '"+in_npi+"' and admitting_diagnosis_code = "+in_param+" and DISCHARGE_STATUS = '2') D;"

	cur = db.cursor()
	cur.execute("USE e_hqoc")
	cur.execute(query_discharge_ratio)

	data = cur.fetchall()
	response.content_type = 'application/json'
	#json_dict['average_discharge_ratio'] = data[0][0]




	#################################################


			#json_var.append(json_dict)
	return json.dumps(json_dict)


@bottle.route('/getprocNPIData', method='POST')
def getproc_NPI_Data():
	print 'in get proc npi data'
	input2 = request.json['codeList']
	print str(input2[0])
	in_param = ''
	for i in input2:
		in_param=in_param+str(i)
	in_param=in_param[:-1]
	in_npi = str(request.json['selected_npi'])
	db = MySQLdb.connect(host='127.0.0.1', port=3307, db='e_hqoc', user='root', passwd='Sairam', local_infile = 1)
	query = "SELECT Avg(ehqoc.LENGTH_OF_STAY) as Mean_LOS, stddev(ehqoc.LENGTH_OF_STAY) as STD_LOS, m.LENGTH_OF_STAY as Mode_LOS \
from ehqoc,(SELECT LENGTH_OF_STAY,COUNT(LENGTH_OF_STAY) as cnt_LOS FROM ehqoc where NATIONAL_PROVIDER_ID = '"+in_npi+"' \
and "+in_param+" = 1 GROUP BY LENGTH_OF_STAY order by cnt_LOS desc limit 1) m \
where NATIONAL_PROVIDER_ID = '"+in_npi+"' and "+in_param+" = 1;" 


	cur = db.cursor()
	cur.execute("USE e_hqoc")
	cur.execute(query)

	data = cur.fetchall()
	#pdb.set_trace()
	print data
	#NATIONAL_PROVIDER_ID Cases_ADC Cases_Total Incidence
	#json_var = []
	response.content_type = 'application/json'
	#for value in data:
	json_dict = {}
	json_dict['average_los'] = data[0][0]
	json_dict['std_deviation_los'] = data[0][1]
	json_dict['mode_los'] = data[0][2]

	#################################################
	rank_charges = "SELECT Avg(TOTAL_CHARGES) as Avg_COC, stddev(TOTAL_CHARGES) as SD_COC from ehqoc where NATIONAL_PROVIDER_ID = '"+in_npi+"' and "+in_param+" = 1;"
	cur = db.cursor()
	cur.execute("USE e_hqoc")
	cur.execute(rank_charges)

	data = cur.fetchall()
	#pdb.set_trace()
	print data
	#NATIONAL_PROVIDER_ID Cases_ADC Cases_Total Incidence
	#json_var = []
	response.content_type = 'application/json'
	#for value in data:
	#json_dict = {}
	json_dict['average_cost'] = data[0][0]
	json_dict['std_deviation_cost'] = data[0][1]
	#json_dict['mode_los'] = data[0][2]

	query_coverage = "SELECT Avg(TOTAL_CHARGES/COVERED_CHARGES) as Avg_CR from ehqoc where NATIONAL_PROVIDER_ID = '"+in_npi+"' and "+in_param+" = 1;"
	cur = db.cursor()
	cur.execute("USE e_hqoc")
	cur.execute(query_coverage)

	data = cur.fetchall()
	response.content_type = 'application/json'
	json_dict['average_coverage'] = data[0][0]

	query_discharge_ratio = "SELECT Avg(dead_cnt/tot_cnt) as Avg_CR from (select count(*) as tot_cnt from ehqoc " \
													"where NATIONAL_PROVIDER_ID = '"+in_npi+"' and "+in_param+" = 1) T, (select count(*) as dead_cnt from ehqoc " \
													"where NATIONAL_PROVIDER_ID = '"+in_npi+"' and "+in_param+" = 1 and DISCHARGE_STATUS = '2') D;"

	cur = db.cursor()
	cur.execute("USE e_hqoc")
	cur.execute(query_discharge_ratio)

	data = cur.fetchall()
	response.content_type = 'application/json'
	#json_dict['average_discharge_ratio'] = data[0][0]




	#################################################


			#json_var.append(json_dict)
	return json.dumps(json_dict)



# @route('/static/<filepath:path>')
# def serve_static(filepath):
# 	print filepath
# 	return static_file(filepath, root='C:\\Users\\AmanKaur\\PycharmProjects\\ehqoc_new\\static')
#

run(host='127.0.0.1', port=6060,debug=True)