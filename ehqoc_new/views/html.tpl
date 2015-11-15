<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
		<meta charset="utf-8" />
		 <meta name="viewport" content="width=device-width, initial-scale=1">


    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="/static/bootstrap.min.css" rel="stylesheet">
    <link href="/static/style.css" type="text/css" rel="stylesheet">
	  <script src="/static/jquery.min.js"></script>
    <script src="/static/bootstrap.min.js"></script>
    <script src="/static/scripts.js"></script>

    <link 
        rel="stylesheet" 
        href="http://cdn.leafletjs.com/leaflet-0.7/leaflet.css"
    />
	<link 
        rel="stylesheet" 
        src="dvf.css"
    />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script
        src="http://cdn.leafletjs.com/leaflet-0.7/leaflet.js">
    </script>
	<script
        src="https://cdnjs.cloudflare.com/ajax/libs/leaflet-dvf/0.2/leaflet-dvf.js">
    </script>
    <script>


//var admission_code =  {"AdmissionCodeKey" : ["7410","7411","7412","7413","7414","7415"]};
var procedure_code =  {"ProcedureCodeKey" : ["PROCEDURE_IS_9904","PROCEDURE_IS_3893","PROCEDURE_IS_3995","PROCEDURE_IS_8856","PROCEDURE_IS_3722","PROCEDURE_IS_8853","PROCEDURE_IS_8872","PROCEDURE_IS_9604","PROCEDURE_IS_0040","PROCEDURE_IS_4516","PROCEDURE_IS_8154","PROCEDURE_IS_9671","PROCEDURE_IS_0066","PROCEDURE_IS_9390","PROCEDURE_IS_4513","PROCEDURE_IS_9672","PROCEDURE_IS_9907","PROCEDURE_IS_3607","PROCEDURE_IS_0045","PROCEDURE_IS_3491","PROCEDURE_IS_3897","PROCEDURE_IS_9929","PROCEDURE_IS_3895","PROCEDURE_IS_9921","PROCEDURE_IS_8151","PROCEDURE_IS_9339","PROCEDURE_IS_4523","PROCEDURE_IS_0966","PROCEDURE_IS_3961","PROCEDURE_IS_3324","PROCEDURE_IS_0309","PROCEDURE_IS_5794","PROCEDURE_IS_9383","PROCEDURE_IS_8703","PROCEDURE_IS_8162","PROCEDURE_IS_4311","PROCEDURE_IS_8842","PROCEDURE_IS_5491","PROCEDURE_IS_9915","PROCEDURE_IS_9905","PROCEDURE_IS_8848","PROCEDURE_IS_3950","PROCEDURE_IS_3891","PROCEDURE_IS_4525","PROCEDURE_IS_8051","PROCEDURE_IS_5123","PROCEDURE_IS_3783","PROCEDURE_IS_3772","PROCEDURE_IS_3615","PROCEDURE_IS_7935","PROCEDURE_IS_8622","PROCEDURE_IS_3404","PROCEDURE_IS_5459","PROCEDURE_IS_8801","PROCEDURE_IS_0598","PROCEDURE_IS_8451","PROCEDURE_IS_8152","PROCEDURE_IS_0046","PROCEDURE_IS_9919","PROCEDURE_IS_0041","PROCEDURE_IS_0481","PROCEDURE_IS_3606","PROCEDURE_IS_4542","PROCEDURE_IS_0331","PROCEDURE_IS_8604","PROCEDURE_IS_8741","PROCEDURE_IS_3723","PROCEDURE_IS_0387","PROCEDURE_IS_5732","PROCEDURE_IS_3812","PROCEDURE_IS_9925","PROCEDURE_IS_8891","PROCEDURE_IS_7779","PROCEDURE_IS_9923","PROCEDURE_IS_9607","PROCEDURE_IS_9960","PROCEDURE_IS_9394","PROCEDURE_IS_8107","PROCEDURE_IS_8659","PROCEDURE_IS_9955","PROCEDURE_IS_8628","PROCEDURE_IS_8841","PROCEDURE_IS_9962","PROCEDURE_IS_7915","PROCEDURE_IS_4443","PROCEDURE_IS_9910","PROCEDURE_IS_0311","PROCEDURE_IS_9952","PROCEDURE_IS_5185","PROCEDURE_IS_8877","PROCEDURE_IS_8954","PROCEDURE_IS_3990","PROCEDURE_IS_0074","PROCEDURE_IS_0017","PROCEDURE_IS_8774","PROCEDURE_IS_8191","PROCEDURE_IS_8753","PROCEDURE_IS_3612","PROCEDURE_IS_8847","PROCEDURE_IS_8102","PROCEDURE_IS_8952","PROCEDURE_IS_4562","PROCEDURE_IS_4131","PROCEDURE_IS_9920","PROCEDURE_IS_7936","PROCEDURE_IS_3929","PROCEDURE_IS_8607","PROCEDURE_IS_9918","PROCEDURE_IS_8452","PROCEDURE_IS_8605","PROCEDURE_IS_9462","PROCEDURE_IS_0403","PROCEDURE_IS_1742","PROCEDURE_IS_8339","PROCEDURE_IS_8838","PROCEDURE_IS_8411","PROCEDURE_IS_8914","PROCEDURE_IS_8945","PROCEDURE_IS_3322","PROCEDURE_IS_5451","PROCEDURE_IS_3734","PROCEDURE_IS_6029","PROCEDURE_IS_4573","PROCEDURE_IS_8163","PROCEDURE_IS_5122","PROCEDURE_IS_8944","PROCEDURE_IS_3726","PROCEDURE_IS_9961","PROCEDURE_IS_3521","PROCEDURE_IS_8192","PROCEDURE_IS_4011","PROCEDURE_IS_9396","PROCEDURE_IS_9375","PROCEDURE_IS_8627","PROCEDURE_IS_8949","PROCEDURE_IS_6561","PROCEDURE_IS_3613","PROCEDURE_IS_9427","PROCEDURE_IS_5188","PROCEDURE_IS_5749","PROCEDURE_IS_3761","PROCEDURE_IS_8849","PROCEDURE_IS_5187","PROCEDURE_IS_4576","PROCEDURE_IS_4292","PROCEDURE_IS_9900","PROCEDURE_IS_3971","PROCEDURE_IS_3611","PROCEDURE_IS_3142","PROCEDURE_IS_8965","PROCEDURE_IS_8876","PROCEDURE_IS_3323","PROCEDURE_IS_0047","PROCEDURE_IS_3794","PROCEDURE_IS_8108"]};

var admission_code = {"AdmissionCodeKey" : ["V7281","V714","V703","V6285","V6284","V5875","V5849","V5841","V5811","V5789","V560","V554","V553","V551","V5489","V5481","V5413","V5332","V5331","V5042","V4613","V4589","V221","V220","99931","99889","99883","9986","99859","99832","99831","99830","99813","99812","99811","99769","99762","9974","9971","99681","99678","99677","99674","99673","99672","99669","99668","99667","99666","99665","99662","99661","99659","99649","99647","99644","99643","99642","99631","9962","9961","99601","99592","99590","99529","9951","9950","9941","9923","9920","9916","990","9895","9893","986","9858","9828","9779","9752","9729","9726","9698","9695","9694","9693","96909","96905","9680","9679","9678","9658","9654","9651","96509","96500","9642","9630","9623","9599","9597","9596","9593","9592","95919","95911","95909","95901","95206","95205","94231","9351","9249","9244","92410","92401","92310","92303","9221","9219","920","9190","9100","9072","8821","88111","88101","88100","8793","8770","8751","8745","87342","8670","8600","85406","85310","85306","85300","85226","85221","85220","85206","85201","85200","85186","85180","84500","8449","8439","8404","8360","83412","8280","82525","8248","8246","8244","8242","8240","82382","82380","82302","82300","8220","82129","82123","82120","82101","82100","8208","82022","82021","82020","82009","82002","82000","81400","81354","81352","81344","81342","81341","81333","81305","81301","81251","81240","81221","81220","81211","81209","81201","81200","81002","8088","80849","80842","8082","8080","8074","80709","80704","80703","80701","80700","8064","80609","80606","80604","8058","8054","8052","80504","80502","80501","80227","80126","80121","80120","80100","80020","7993","79929","7991","79902","7969","7964","7963","7944","79439","79431","7921","7919","79093","79092","7907","7906","79029","7901","78959","78939","78934","78930","7892","78909","78907","78906","78904","78903","78902","78901","78900","78899","78869","78830","78829","78820","7881","78791","78760","7873","78729","78724","78720","7871","78703","78702","78701","7866","78659","78652","78651","78650","78639","78630","7862","7861","78609","78607","78605","7859","7856","78559","78551","7854","7851","7850","7847","78459","78451","7843","7842","7840","7837","78341","78321","7830","7827","7824","7823","7822","7821","7820","78199","78194","7813","7812","7810","78099","78097","78096","78079","78064","78061","78060","7804","78039","7802","7801","78009","78001","75612","7384","73739","73730","73642","73606","7350","734","73390","73382","7336","73342","73314","73313","73028","73027","73026","73025","73024","73020","73004","72992","72989","72982","72981","7295","7294","7291","72888","72887","72886","72885","72751","72740","72705","72700","72665","72633","72610","7246","7245","7244","7243","7242","7241","72403","72402","72400","7231","7230","72293","72292","72283","72280","72273","72272","72271","72252","7224","7222","72211","72210","7220","72141","7213","7211","7210","71995","71987","7197","71956","71947","71946","71945","71943","71942","71941","71940","71909","71906","7177","71696","71691","71617","71611","71596","71595","71591","71589","71537","71536","71535","71531","71516","71515","71511","7149","7140","71106","71105","71101","7099","7079","70719","70715","70714","70712","70711","70710","70709","70707","70705","70704","70703","70700","6959","69581","6930","6929","6924","6869","683","6829","6828","6827","6826","6825","6824","6823","6822","6821","6820","68110","68100","6801","65993","65423","64923","64823","64803","64683","64663","64633","64193","6271","6268","6264","6262","6259","6258","6256","6238","62212","6218","6202","61889","6185","6184","6183","6182","6181","61804","61801","6164","6144","6142","61172","6110","6089","60886","60883","6084","60784","605","6039","6010","60001","60000","59971","59970","59960","5990","5989","5961","5959","5941","5939","5921","5920","591","59080","59010","586","5856","5849","5845","5789","5781","5780","5779","5771","5770","5769","5768","5761","5759","5758","57511","57510","5750","57471","57460","57450","57431","57420","57410","57400","5722","5720","570","5699","56985","56983","56981","56969","5695","56949","56942","5693","5691","5690","56889","56881","5679","56731","56722","566","5649","56489","56409","56400","56212","56211","56210","5609","56089","56081","56032","5602","5601","5589","5582","5581","5579","5571","5569","5559","5550","5538","5533","55329","55321","55320","5531","5529","55221","55220","5521","55092","55091","55090","55010","542","5409","5401","5400","5374","5370","53649","53642","5363","5362","53500","53470","53310","53240","53089","53081","5307","5303","53011","53010","5285","5272","52689","5264","5259","52460","5225","5206","5192","51911","51909","51902","51889","51884","51883","51882","51881","5185","5184","5180","5163","515","514","5128","5121","5119","51181","5110","5109","5070","496","4941","49392","49390","49322","4919","49122","49121","490","4878","4871","4870","486","485","4829","48283","48242","48230","4821","4820","481","47824","475","4660","4659","462","4619","4618","45989","45981","4592","4589","4580","4578","4560","4558","4556","4552","4550","45383","45381","45342","45341","45340","4471","44422","4439","4430","4423","4414","44101","44030","44029","44024","44023","44022","44021","44020","4389","43820","4373","4372","436","4359","43491","43490","43411","43401","43381","43330","43321","43320","43311","43310","43301","4321","431","430","42843","42833","42831","42830","42823","42821","42820","4281","4280","4279","42789","42781","42769","4275","42732","42731","4271","4270","4269","4263","42613","42611","4260","4254","4241","4240","4239","4238","4233","4219","4210","41519","4150","4148","41404","41402","41401","41400","4139","4111","41092","41091","41081","41071","41041","41031","41021","41011","41001","40491","40391","40390","40300","4019","4010","3911","38830","38600","38300","3829","3823","38200","38010","37992","37854","3699","3689","3688","3682","36816","36551","36234","3594","35921","35801","35800","35782","3570","3569","3501","3489","34839","34831","34830","34693","34691","34690","34591","34590","34550","3453","34510","3441","34400","34290","3419","340","3384","3383","33829","33819","33818","33811","3379","3369","3361","33390","33372","3332","3320","3315","3310","32723","3241","3202","3129","311","3079","30272","30001","2989","2983","2981","2967","29664","29654","29653","29644","29634","29633","29624","29620","29590","29570","29534","2948","2930","29281","2920","29181","28869","28860","28850","28803","28800","2875","28731","2869","2860","2859","2858","28522","28521","2851","2841","2830","28262","28260","2811","2809","2801","2800","27801","27730","2768","2767","27669","27652","27651","27650","2762","2761","2760","27542","2749","27401","262","2536","2512","25092","25083","25082","25081","25080","25072","25070","25062","25060","25022","25013","25012","25002","25001","25000","24981","24290","2411","2410","2396","23875","2381","2375","2370","2353","2352","2332","2330","2271","226","2252","220","2189","2113","2104","20961","20890","20500","20280","1991","1985","1983","1966","1965","1960","193","1919","1890","1889","1820","1749","1748","1744","1740","1736","1726","1725","1715","1702","1629","1624","1623","1622","1589","1542","1541","1540","1539","1536","1534","1533","1532","1531","1519","1509","1505","1410","1179","1173","11281","0830","0820","0539","05379","05319","042","04189","0389","0383","0382","03812","0380","0310","0270","0091","0090","0088","00845","00843","0059"]};

var ICD_code = {"ICDCodeKey" : ["ICD_486_WAS_ACQUIRED_IN_HOSPITAL","ICD_0389_WAS_ACQUIRED_IN_HOSPITAL","ICD_5990_WAS_ACQUIRED_IN_HOSPITAL","ICD_5070_WAS_ACQUIRED_IN_HOSPITAL","ICD_6826_WAS_ACQUIRED_IN_HOSPITAL","ICD_27651_WAS_ACQUIRED_IN_HOSPITAL","ICD_41519_WAS_ACQUIRED_IN_HOSPITAL","ICD_99859_WAS_ACQUIRED_IN_HOSPITAL","ICD_00845_WAS_ACQUIRED_IN_HOSPITAL","ICD_03842_WAS_ACQUIRED_IN_HOSPITAL","ICD_45341_WAS_ACQUIRED_IN_HOSPITAL","ICD_99662_WAS_ACQUIRED_IN_HOSPITAL","ICD_56081_WAS_ACQUIRED_IN_HOSPITAL","ICD_99673_WAS_ACQUIRED_IN_HOSPITAL","ICD_72210_WAS_ACQUIRED_IN_HOSPITAL","ICD_70703_WAS_ACQUIRED_IN_HOSPITAL","ICD_99931_WAS_ACQUIRED_IN_HOSPITAL","ICD_99666_WAS_ACQUIRED_IN_HOSPITAL","ICD_03849_WAS_ACQUIRED_IN_HOSPITAL","ICD_0380_WAS_ACQUIRED_IN_HOSPITAL","ICD_99664_WAS_ACQUIRED_IN_HOSPITAL","ICD_6823_WAS_ACQUIRED_IN_HOSPITAL","ICD_6827_WAS_ACQUIRED_IN_HOSPITAL","ICD_6822_WAS_ACQUIRED_IN_HOSPITAL","ICD_03812_WAS_ACQUIRED_IN_HOSPITAL","ICD_45340_WAS_ACQUIRED_IN_HOSPITAL","ICD_99681_WAS_ACQUIRED_IN_HOSPITAL","ICD_0088_WAS_ACQUIRED_IN_HOSPITAL","ICD_45342_WAS_ACQUIRED_IN_HOSPITAL","ICD_48242_WAS_ACQUIRED_IN_HOSPITAL","ICD_4821_WAS_ACQUIRED_IN_HOSPITAL","ICD_9974_WAS_ACQUIRED_IN_HOSPITAL","ICD_99649_WAS_ACQUIRED_IN_HOSPITAL","ICD_03811_WAS_ACQUIRED_IN_HOSPITAL","ICD_99674_WAS_ACQUIRED_IN_HOSPITAL"]};
$(document).ready(function(){

    /*
    Call server to get list of admission codes and procedure codes. Set it to variables
    */

    var rbtnAdmission = $('<input type="radio" id="rbtnAdmission" name="selectionCriteria" value="admissionCode" /><label for="rbtnAdmission">Admission</label>');
    var rbtnProcedure = $('<input type="radio" id="rbtnProcedure" name="selectionCriteria" value="procedureCode" /><label for="rbtnProcedure">Procedure</label>');
		var qoc = $('<input type="button" id="QoC" name="QoC" value="QoC" onclick="OnMapQoCSubmit()"/>');
		var coc = $('<input type="button" id="CoC" name="CoC" value="CoC" onclick="OnMapCoCSubmit()"/>');
		var LoS = $('<input type="button" id="LoS" name="LoS" value="LoS" onclick="OnMapLoSSubmit()"/>');
    //rbtnProcedure.appendTo('#mainDiv');
    var mainDiv = document.getElementById('mainDiv');
    $('#mainDiv').append('<p>Find Hospitals based on Admission Code or Procedure Code</p><br>');
    $('#mainDiv').append(rbtnAdmission);
    $('#mainDiv').append(rbtnProcedure);
	$('#mainDiv').append('<br><br>');
    var selectBox =  $("<select class='form-control' class='form-control' style='width:50%'></select>").attr("id", 'selectDropdown').attr('multiple','multiple');

		var maps = document.getElementById('maps');
		$('#maps').append(qoc);
		$('#maps').append(coc);
		$('#maps').append(LoS);

    $('#mainDiv').append(selectBox);
	var labelZipCode = $('<label>Zip Code </label>');
	var tbZipCode = $('<input type="text" class="form-control" id="zipcode" width="50%">');
    $('#mainDiv').append('<br><br>');
    $('#mainDiv').append(labelZipCode);
    $('#mainDiv').append(tbZipCode);
	$('#mainDiv').append('<br><br>');
    var submitBtn = $('<button type="button" id="getHospitals" onclick="OnSubmitCheck()">Get Hospitals</button>');
    $('#mainDiv').append(submitBtn);
		
	
	$('#maps').append('<p>Inhospital Diseases</p>');
	var selectBox1 =  $("<select class='form-control' style='width:50%'></select>").attr("id", 'selectDropdown1').attr('multiple','multiple');

    $('#maps').append(selectBox1);
	$('#maps').append('<br><br>');
    var submitBtn = $('<button type="button" id="getInHospitaldisease" onclick="OnSubmitDisease()">InHospital diseases</button>');
    $('#maps').append(submitBtn);
    //selectBox.insertAfter('#rbtnProcedure')
		
		
		

    //var div_main = document.getElementById('main')

    $('#rbtnAdmission').click(function(){
           var element = displayAdmissionCodes();
		   var element = displayICDList();
     });

    $('#rbtnProcedure').click(function(){
           var element = displayProcedureList();
		   var element = displayICDList();
     });

     $('.link').click(function(){
    var test = $(this).attr('id');
    //alert(test);
});

});

function displayAdmissionCodes()
{
    var selectBox = document.getElementById('selectDropdown');
    $('#selectDropdown').empty();
    $.each(admission_code.AdmissionCodeKey, function(i,code){
        $('#selectDropdown').append('<option value=' + code + ">" + code + '</option>');
    });

    return selectBox;
}

function displayProcedureList()
{
    var selectBox = document.getElementById('selectDropdown');
    $('#selectDropdown').empty();
    $.each(procedure_code.ProcedureCodeKey, function(i,code){
        $('#selectDropdown').append('<option value=' + code + "'>" + code + '</option>');
    });

    return selectBox;
}

function OnSubmitCheck()
{
	var x = document.getElementById('rbtnAdmission')
	var y = document.getElementById('rbtnProcedure')
	if (x.checked){
	var z = getHospitals();
	}else if (y.checked){
	var z = getprocHospitals();
	}
}

function OnMapQoCSubmit()
{
	var x = document.getElementById('rbtnAdmission')
	var y = document.getElementById('rbtnProcedure')
	if (x.checked){
	var z = getAQoC();
	}else if (y.checked){
	var z = getPQoC();
	}
}

function OnMapCoCSubmit()
{
	var x = document.getElementById('rbtnAdmission')
	var y = document.getElementById('rbtnProcedure')
	if (x.checked){
	var z = getACoC();
	}else if (y.checked){
	var z = getPCoC();
	}
}

function OnMapLoSSubmit()
{
	var x = document.getElementById('rbtnAdmission')
	var y = document.getElementById('rbtnProcedure')
	if (x.checked){
	var z = getALoS();
	}else if (y.checked){
	var z = getPLoS();
	}
}

function OnSubmitDisease()
{
	var x = document.getElementById('rbtnAdmission')
	var y = document.getElementById('rbtnProcedure')
	if (x.checked){
	var z = getInHospitaldisease();
	}else if (y.checked){
	var z = getprocInHospitaldisease();
	}
}

function displayICDList()
{
    var selectBox1 = document.getElementById('selectDropdown1');
    $('#selectDropdown1').empty();
    $.each(ICD_code.ICDCodeKey, function(i,code){
        $('#selectDropdown1').append('<option value=' + code + "'>" + code + '</option>');
    });

    return selectBox1;
}

function getHospitals()
{
    var selectedList = $('select#selectDropdown').val();
    var zipcode = $('#zipcode').val();
    console.log(zipcode);
    //alert(zipcode);
    //ajax call with the list to server.
    var name;
    $.ajax({
    type: 'POST',
    url: "/getHospitals",
    contentType: 'application/json; charset=utf-8',
    data: JSON.stringify({ 'codeList': selectedList, 'zipcode': zipcode, locale: 'en-US' }),
    dataType: 'json',
    success: displayHospitalList
    });
    console.log(name);
    //return json data from server.
}

function getAQoC()
{
    var selectedList = $('select#selectDropdown').val();
    var zipcode = $('#zipcode').val();
		var selectedList1 = $('select#selectDropdown1').val();
    console.log(zipcode);
    //alert(zipcode);
    //ajax call with the list to server.
    var name;
    $.ajax({
    type: 'POST',
    url: "/getAQoC",
    contentType: 'application/json; charset=utf-8',
    data: JSON.stringify({ 'codeList': selectedList, 'codeList1': selectedList1, 'zipcode': zipcode, locale: 'en-US' }),
    dataType: 'json',
    success: displayAQoC
    });
    console.log(name);
    //return json data from server.
}

function getACoC()
{
    var selectedList = $('select#selectDropdown').val();
    var zipcode = $('#zipcode').val();
		var selectedList1 = $('select#selectDropdown1').val();
    console.log(zipcode);
    //alert(zipcode);
    //ajax call with the list to server.
    var name;
    $.ajax({
    type: 'POST',
    url: "/getACoC",
    contentType: 'application/json; charset=utf-8',
    data: JSON.stringify({ 'codeList': selectedList, 'codeList1': selectedList1, 'zipcode': zipcode, locale: 'en-US' }),
    dataType: 'json',
    success: displayACoC
    });
    console.log(name);
    //return json data from server.
}

function getALoS()
{
    var selectedList = $('select#selectDropdown').val();
    var zipcode = $('#zipcode').val();
		var selectedList1 = $('select#selectDropdown1').val();
    console.log(zipcode);
    //alert(zipcode);
    //ajax call with the list to server.
    var name;
    $.ajax({
    type: 'POST',
    url: "/getALoS",
    contentType: 'application/json; charset=utf-8',
    data: JSON.stringify({ 'codeList': selectedList, 'codeList1': selectedList1, 'zipcode': zipcode, locale: 'en-US' }),
    dataType: 'json',
    success: displayALoS
    });
    console.log(name);
    //return json data from server.
}

function getPLoS()
{
    var selectedList = $('select#selectDropdown').val();
    var zipcode = $('#zipcode').val();
		var selectedList1 = $('select#selectDropdown1').val();
    console.log(zipcode);
    //alert(zipcode);
    //ajax call with the list to server.
    var name;
    $.ajax({
    type: 'POST',
    url: "/getPLoS",
    contentType: 'application/json; charset=utf-8',
    data: JSON.stringify({ 'codeList': selectedList, 'codeList1': selectedList1, 'zipcode': zipcode, locale: 'en-US' }),
    dataType: 'json',
    success: displayPLoS
    });
    console.log(name);
    //return json data from server.
}

function getPCoC()
{
    var selectedList = $('select#selectDropdown').val();
    var zipcode = $('#zipcode').val();
		var selectedList1 = $('select#selectDropdown1').val();
    console.log(zipcode);
    //alert(zipcode);
    //ajax call with the list to server.
    var name;
    $.ajax({
    type: 'POST',
    url: "/getPCoC",
    contentType: 'application/json; charset=utf-8',
    data: JSON.stringify({ 'codeList': selectedList, 'codeList1': selectedList1, 'zipcode': zipcode, locale: 'en-US' }),
    dataType: 'json',
    success: displayPCoC
    });
    console.log(name);
    //return json data from server.
}

function getPQoC()
{
    var selectedList = $('select#selectDropdown').val();
    var zipcode = $('#zipcode').val();
		var selectedList1 = $('select#selectDropdown1').val();
    console.log(zipcode);
    //alert(zipcode);
    //ajax call with the list to server.
    var name;
    $.ajax({
    type: 'POST',
    url: "/getPQoC",
    contentType: 'application/json; charset=utf-8',
    data: JSON.stringify({ 'codeList': selectedList, 'codeList1': selectedList1, 'zipcode': zipcode, locale: 'en-US' }),
    dataType: 'json',
    success: displayPQoC
    });
    console.log(name);
    //return json data from server.
}

function getprocHospitals()
{
    var selectedList = $('select#selectDropdown').val();
    var zipcode = $('#zipcode').val();
    console.log(zipcode);
    //alert(zipcode);
    //ajax call with the list to server.
    var name;
    $.ajax({
    type: 'POST',
    url: "/getprocHospitals",
    contentType: 'application/json; charset=utf-8',
    data: JSON.stringify({ 'codeList': selectedList, 'zipcode': zipcode, locale: 'en-US' }),
    dataType: 'json',
    success: displayprocHospitalList
    });
    console.log(name);
    //return json data from server.
}

function getInHospitaldisease()
{
    var selectedList1 = $('select#selectDropdown1').val();
    console.log(selectedList1);
	var selectedList = $('select#selectDropdown').val();
	console.log(selectedList);
    //ajax call with the list to server.
    var name;
    $.ajax({
    type: 'POST',
    url: "/getInHospitaldisease",
    contentType: 'application/json; charset=utf-8',
    data: JSON.stringify({ 'codeList': selectedList, 'codeList1': selectedList1, locale: 'en-US' }),
	dataType: 'json',
	success: displayInHospitalICDList
	});
    console.log(name);
    //return json data from server.
}

function getprocInHospitaldisease()
{
    var selectedList1 = $('select#selectDropdown1').val();
    console.log(selectedList1);
	var selectedList = $('select#selectDropdown').val();
	console.log(selectedList);
    //ajax call with the list to server.
    var name;
    $.ajax({
    type: 'POST',
    url: "/getprocInHospitaldisease",
    contentType: 'application/json; charset=utf-8',
    data: JSON.stringify({ 'codeList': selectedList, 'codeList1': selectedList1, locale: 'en-US' }),
	dataType: 'json',
	success: displayprocInHospitalICDList
	});
    console.log(name);
    //return json data from server.
}

function displayNPIDetails(data)
{
    console.log(data);
    $('#mainDiv').find('#hospital_list').remove();
    var table_tag = $('<table class="table" id="hospital_list"></table>')
    var table_head = $('<tr><th>Average Length of Stay</th><th>Standard Deviation</th><th>Mode length of stay</th><th>Average Cost</th><th>Average Coverage</th><th>Standard Deviation Cost</th></tr>');
    table_tag.append(table_head);
    //$.each(data, function(i,record){
        var row = $('<tr></tr>');
        var avg_los = $('<td>'+data['average_los']+'</td>');
        var std_deviation_los = $('<td>'+data['std_deviation_los']+'</td>');
        var mode_los = $('<td>'+data['mode_los']+'</td>');
        var average_cost = $('<td>'+data['average_cost']+'</td>');
        var average_coverage = $('<td>'+data['average_coverage']+'</td>');
        var std_deviation_cost = $('<td>'+data['std_deviation_cost']+'</td>');
        //console.log(record['Cases_ADC']);
        row.append(avg_los);
        row.append(std_deviation_los);
        row.append(mode_los);
        row.append(average_cost);
        row.append(average_coverage);
        row.append(std_deviation_cost);
        table_tag.append(row);
    //});


    $('#mainDiv').append(table_tag);

}

function tableClick(element)
{
    var selectedNPI = $(element).attr('id');
	var selectedList = $('select#selectDropdown').val();
    //alert(selectedNPI);
    $.ajax({
    type: 'POST',
    url: "/getNPIData",
    contentType: 'application/json; charset=utf-8',
    data: JSON.stringify({ 'codeList': selectedList, 'selected_npi': selectedNPI, locale: 'en-US' }),
    dataType: 'json',
    success: displayNPIDetails
    });
}

function tableprocClick(element)
{
    var selectedNPI = $(element).attr('id');
	var selectedList = $('select#selectDropdown').val();
    //alert(selectedNPI);
    $.ajax({
    type: 'POST',
    url: "/getprocNPIData",
    contentType: 'application/json; charset=utf-8',
    data: JSON.stringify({ 'codeList': selectedList, 'selected_npi': selectedNPI, locale: 'en-US' }),
    dataType: 'json',
    success: displayNPIDetails
    });
}

function displayHospitalList(data)
{

	var point = [];
	document.getElementById("map").innerHTML = "<center><div id='map1' style='width: 500px; height: 500px;'></div></center>";
	var bounds = new L.LatLngBounds(new L.LatLng(-90, -180), new L.LatLng(90, 180));
	var state = [];
	var map = L.map('map1', {
            center: [39.5, -98.35],
            zoom: 2,
            maxBounds: bounds
         });
		 
	var blueMarker = {
	radius: 12,
	fillColor: "blue",
	color: "blue"
	};
	
	var greenMarker = {
	radius: 8,
	color: "green"
	};
	
    /*$.each(data, function(i,record){
        console.log(record['Cases_ADC']);
    });*/
    $('#mainDiv').find('#hospital_list').remove();
    var table_tag = $('<table id="hospital_list"></table>')
    var table_head = $('<tr><th>National Provider Id</th><th>Cases ADC</th><th>Cases Total</th><th>Incidence</th><th>Distance</th><th>Provider City Name</th></tr>');
    table_tag.append(table_head);
    $.each(data, function(i,record){
        var row = $('<tr></tr>');
        var national_provider_id = $('<td><label class="link" onclick="tableClick(this)" id="'+record['NATIONAL_PROVIDER_ID']+'">'+record['NATIONAL_PROVIDER_ID']+'</label></td>');
        var case_adc = $('<td>'+record['Cases_ADC']+'</td>');
        var cases_Total = $('<td>'+record['Cases_Total']+'</td>');
        var incidence = $('<td>'+record['Incidence']+'</td>');
		var distance = $('<td>'+record['distance']+'</td>');
		var PROVIDER_CITY_NAME = $('<td>'+record['PROVIDER_CITY_NAME']+'</td>');
				//alert(record['Lat1']);
        //console.log(record['Cases_ADC']);
        row.append(national_provider_id);
        row.append(case_adc);
        row.append(cases_Total);
        row.append(incidence);
		row.append(distance);
		row.append(PROVIDER_CITY_NAME);
        table_tag.append(row);	
				
		L.circleMarker([record['Lat1'],record['Long1']],blueMarker).addTo(map).bindPopup("<b>National Provider ID:</b><br>"+record['NATIONAL_PROVIDER_ID']).openPopup();
    });
		
		
		
    $('#mainDiv').append(table_tag);
		
	
	
                        
                            //var map = L.map('map').setView([points[i][2], points[i][3]], 13);
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png',
        {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }
    ).addTo(map);



}

function displayAQoC(data)
{

	var point = [];
	document.getElementById("map").innerHTML = "<center><div id='map1' style='width: 500px; height: 500px;'></div></center>";
	var bounds = new L.LatLngBounds(new L.LatLng(-90, -180), new L.LatLng(90, 180));
	var state = [];
	var map = L.map('map1', {
            center: [39.5, -98.35],
            zoom: 2,
            maxBounds: bounds
         });
		 
	var blueMarker = {
	radius: 8,
	fillColor: "blue"
	};
	
	var greenMarker = {
	radius: 8,
	color: "green"
	};
	
    /*$.each(data, function(i,record){
        console.log(record['Cases_ADC']);
    });*/

		
    $.each(data, function(i,record){	
		
		L.circleMarker([record['Latitude'],record['Longitude']],{radius:10,fillColor:record['color'],fillOpacity:0.8}
).addTo(map).bindPopup("<b>Inhospital_disease:</b><br>"+record['Inhospital_disease']).openPopup();

		
		
	
    });
		
		
		
	
	
                        
                            //var map = L.map('map').setView([points[i][2], points[i][3]], 13);
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png',
        {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }
    ).addTo(map);



}

function displayACoC(data)
{

	var point = [];
	document.getElementById("map").innerHTML = "<center><div id='map1' style='width: 500px; height: 500px;'></div></center>";
	var bounds = new L.LatLngBounds(new L.LatLng(-90, -180), new L.LatLng(90, 180));
	var state = [];
	var map = L.map('map1', {
            center: [39.5, -98.35],
            zoom: 2,
            maxBounds: bounds
         });
		 
	var blueMarker = {
	radius: 8,
	fillColor: "blue"
	};
	
	var greenMarker = {
	radius: 8,
	color: "green"
	};
	
    /*$.each(data, function(i,record){
        console.log(record['Cases_ADC']);
    });*/

		
    $.each(data, function(i,record){	
		
		L.circleMarker([record['Latitude'],record['Longitude']],{radius:10,fillColor:record['color'],fillOpacity:0.8}
).addTo(map).bindPopup("<b>Average Total Charges:</b><br>"+record['Avg_Tot_Charges']).openPopup();
    });
		
		
		
	
	
                        
                            //var map = L.map('map').setView([points[i][2], points[i][3]], 13);
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png',
        {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }
    ).addTo(map);



}

function displayALoS(data)
{

	var point = [];
	document.getElementById("map").innerHTML = "<center><div id='map1' style='width: 500px; height: 500px;'></div></center>";
	var bounds = new L.LatLngBounds(new L.LatLng(-90, -180), new L.LatLng(90, 180));
	var state = [];
	var map = L.map('map1', {
            center: [39.5, -98.35],
            zoom: 2,
            maxBounds: bounds
         });
		 
	var blueMarker = {
	radius: 8,
	fillColor: "blue"
	};
	
	var greenMarker = {
	radius: 8,
	color: "green"
	};
	
    /*$.each(data, function(i,record){
        console.log(record['Cases_ADC']);
    });*/

		
    $.each(data, function(i,record){	
		L.circleMarker([record['Latitude'],record['Longitude']],{radius:10,fillColor:record['color'],fillOpacity:0.8}
).addTo(map).bindPopup("<b>Average Length of Stay:</b><br>"+record['Avg_LOS']).openPopup();
    });
		
		
		
	
	
                        
                            //var map = L.map('map').setView([points[i][2], points[i][3]], 13);
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png',
        {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }
    ).addTo(map);



}

function displayPLoS(data)
{

	var point = [];
	document.getElementById("map").innerHTML = "<center><div id='map1' style='width: 500px; height: 500px;'></div></center>";
	var bounds = new L.LatLngBounds(new L.LatLng(-90, -180), new L.LatLng(90, 180));
	var state = [];
	var map = L.map('map1', {
            center: [39.5, -98.35],
            zoom: 2,
            maxBounds: bounds
         });
		 
	var blueMarker = {
	radius: 8,
	fillColor: "blue"
	};
	
	var greenMarker = {
	radius: 8,
	color: "green"
	};
	
    /*$.each(data, function(i,record){
        console.log(record['Cases_ADC']);
    });*/

		
    $.each(data, function(i,record){	
		L.circleMarker([record['Latitude'],record['Longitude']],{radius:10,fillColor:record['color'],fillOpacity:0.8}
).addTo(map).bindPopup("<b>Average Length of Stay:</b><br>"+record['Avg_LOS']).openPopup();
    });
		
		
		
	
	
                        
                            //var map = L.map('map').setView([points[i][2], points[i][3]], 13);
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png',
        {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }
    ).addTo(map);



}

function displayPCoC(data)
{

	var point = [];
	document.getElementById("map").innerHTML = "<center><div id='map1' style='width: 500px; height: 500px;'></div></center>";
	var bounds = new L.LatLngBounds(new L.LatLng(-90, -180), new L.LatLng(90, 180));
	var state = [];
	var map = L.map('map1', {
            center: [39.5, -98.35],
            zoom: 2,
            maxBounds: bounds
         });
		 
	var blueMarker = {
	radius: 8,
	fillColor: "blue"
	};
	
	var greenMarker = {
	radius: 8,
	color: "green"
	};
	
	  Array.prototype.max = function() {
  return Math.max.apply(null, this);
};

Array.prototype.min = function() {
  return Math.min.apply(null, this);
};
	
    /*$.each(data, function(i,record){
        console.log(record['Cases_ADC']);
    });*/

		$.each(data, function(i,record){
		point.push(record['Inhospital_disease']);
		});
		
		var max = point.max();
		var min = point.min();
		var med =((max+min)/2);
		var c = Math.floor(med/2);
		var a = (med - c);
		var b = (med + c);
		
		
		
		
    $.each(data, function(i,record){	
		L.circleMarker([record['Latitude'],record['Longitude']],{radius:10,fillColor:record['color'],fillOpacity:0.8}
).addTo(map).bindPopup("<b>Average Total Charges:</b><br>"+record['Avg_Tot_Charges']).openPopup();
    });
		
		
		
	
	
                        
                            //var map = L.map('map').setView([points[i][2], points[i][3]], 13);
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png',
        {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }
    ).addTo(map);



}

function displayPQoC(data)
{

	var point = [];
	document.getElementById("map").innerHTML = "<center><div id='map1' style='width: 500px; height: 500px;'></div></center>";
	var bounds = new L.LatLngBounds(new L.LatLng(-90, -180), new L.LatLng(90, 180));
	var state = [];
	var map = L.map('map1', {
            center: [39.5, -98.35],
            zoom: 2,
            maxBounds: bounds
         });
		 
	var blueMarker = {
	fillColor: "#0000FF",
	opacity: 1
	};
	
	var redMarker = {
	fillColor: "#FF0000",
	opacity: 1
	};
	
	var greenMarker = {
	fillColor: "#008000",
	opacity: 1
	};
	
	var yellowMarker = {
	fillColor: "#FFFF00",
	opacity: 1
	};
	
	  Array.prototype.max = function() {
  return Math.max.apply(null, this);
};

Array.prototype.min = function() {
  return Math.min.apply(null, this);
};


    /*$.each(data, function(i,record){
        console.log(record['Cases_ADC']);
    });*/
    $.each(data, function(i,record){
		point.push(record['Inhospital_disease']);
		});
		
		var max = point.max();
		var min = point.min();
		var med = parseInt(parseInt((max+min)/2));
		var c = parseInt(Math.floor(med/2));
		var a = parseInt(med - c);
		var b = parseInt(med + c);
		
		
		//alert(med);
		//alert(max);
		//alert(min);
		//alert(a);
		//alert(b);
		
		var color;
		
		
    $.each(data, function(i,record){
		L.circleMarker([record['Latitude'],record['Longitude']],{radius:10,fillColor:record['color'],fillOpacity:0.8}
).addTo(map).bindPopup("<b>Inhospital_disease:</b><br>"+record['Inhospital_disease']).openPopup();

		
		
	
		});
		
		
		
	
	
                        
                            //var map = L.map('map').setView([points[i][2], points[i][3]], 13);
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png',
        {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }
    ).addTo(map);



}

function displayprocHospitalList(data)
{

	var point = [];
	document.getElementById("map").innerHTML = "<center><div id='map1' style='width: 500px; height: 500px;'></div></center>";
	var bounds = new L.LatLngBounds(new L.LatLng(-90, -180), new L.LatLng(90, 180));
	var state = [];
	var map = L.map('map1', {
            center: [39.5, -98.35],
            zoom: 2,
            maxBounds: bounds
         });
		 
	var blueMarker = {
	radius: 8,
	fillColor: "blue"
	};
	
	var greenMarker = {
	radius: 8,
	color: "green"
	};
	
    /*$.each(data, function(i,record){
        console.log(record['Cases_ADC']);
    });*/
    $('#mainDiv').find('#hospital_list').remove();
    var table_tag = $('<table id="hospital_list"></table>')
    var table_head = $('<tr><th>National Provider Id</th><th>Cases ADC</th><th>Cases Total</th></tr>');
    table_tag.append(table_head);
    $.each(data, function(i,record){
        var row = $('<tr></tr>');
        var national_provider_id = $('<td><label class="link" onclick="tableprocClick(this)" id="'+record['NATIONAL_PROVIDER_ID']+'">'+record['NATIONAL_PROVIDER_ID']+'</label></td>');
        var case_adc = $('<td>'+record['distance']+'</td>');
        var cases_Total = $('<td>'+record['PROVIDER_CITY_NAME']+'</td>');
        //console.log(record['Cases_ADC']);
        row.append(national_provider_id);
        row.append(case_adc);
        row.append(cases_Total);
        table_tag.append(row);
				
		if(record['distance'] > 20){		
		L.circle([record['Lat1'],record['Long1']],50,{
    color: 'red',
}).addTo(map).bindPopup("<b>National Provider ID:</b><br>"+record['NATIONAL_PROVIDER_ID']).openPopup();
    }
		if(record['distance'] < 20){		
		L.circle([record['Lat1'],record['Long1']],50,{
    color: 'green',
}).addTo(map).bindPopup("<b>National Provider ID:</b><br>"+record['NATIONAL_PROVIDER_ID']).openPopup();
}
    });
	
	


    $('#mainDiv').append(table_tag);
		
		                    
                            //var map = L.map('map').setView([points[i][2], points[i][3]], 13);
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png',
        {
            attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
        }
    ).addTo(map);

}

function displayInHospitalICDList(data)
{
    /*$.each(data, function(i,record){
        console.log(record['Cases_ADC']);
    });*/
    $('#mainDiv').find('#hospital_list').remove();
    var table_tag = $('<table id="hospital_list"></table>')
    var table_head = $('<tr><th>National Provider Id</th><th>Inhospital Disease Percent</th></tr>');
    table_tag.append(table_head);
    $.each(data, function(i,record){
        var row = $('<tr></tr>');
        var national_provider_id = $('<td><label class="link" onclick="tableClick(this)" id="'+record['NATIONAL_PROV_ID']+'">'+record['NATIONAL_PROV_ID']+'</label></td>');
        var inhospital_disease = $('<td>'+record['Inhospital_disease']+'</td>');
        //console.log(record['Cases_ADC']);
        row.append(national_provider_id);
        row.append(inhospital_disease);
        table_tag.append(row);
    });


    $('#mainDiv').append(table_tag);

}

function displayprocInHospitalICDList(data)
{
    /*$.each(data, function(i,record){
        console.log(record['Cases_ADC']);
    });*/
    $('#mainDiv').find('#hospital_list').remove();
    var table_tag = $('<table id="hospital_list"></table>')
    var table_head = $('<tr><th>National Provider Id</th><th>Inhospital Disease Percent</th></tr>');
    table_tag.append(table_head);
    $.each(data, function(i,record){
        var row = $('<tr></tr>');
        var national_provider_id = $('<td><label class="link" onclick="tableprocClick(this)" id="'+record['NATIONAL_PROV_ID']+'">'+record['NATIONAL_PROV_ID']+'</label></td>');
        var inhospital_disease = $('<td>'+record['Inhospital_disease']+'</td>');
        //console.log(record['Cases_ADC']);
        row.append(national_provider_id);
        row.append(inhospital_disease);
        table_tag.append(row);
    });


    $('#mainDiv').append(table_tag);

}


</script>
	
<style>
    body
	{
    background-color:#778899;
}
    img{
    background-color: #2F4F4F;
    }

</style>
</head>
<body>

  <div>
  <img src="/static/logo.png" alt="Logo" title="Intelligent" width="80%" height="90px">
     <img src="./static/logo2.png" alt="Logo" title="MediQoc" align="right" width=20%" height="90px">
      </div>
    <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h2>
					EHQOC
				</h2>
			</div>
			<h3>
				Find Hospitals based on Admission Code or Procedure Code
			</h3>
			<div class="col-md-6">
				<div id="mainDiv">

			</div>
				</div>
				<div class="col-md-6">
				<fieldset>
<div id = "maps">
</div>
<div id = "map">
</fieldset>
</div>

				</div>


		</div>
	</div>
</div>
<div class="navbar navbar-default navbar-fixed-bottom"  style="background-color:#778899">
    <div class="container">
   <p class="navbar-text" style="color: black" >This website and its content is copyright of Dimitrios Zikos, Intelligent Information-Driven Healthcare Lab -&copy; 2015. All rights reserved.</p>
        </div>
 </div>

</body>

<script>
	
</script>
</html>