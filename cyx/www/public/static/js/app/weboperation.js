function completegetcityzonelist(data) {
	alert("completegetcityzonelist");
    $('#cityid').empty();
    $('#cityid').html(data.data.citylist);
    $('#zoneid').empty();
    $('#zoneid').html(data.data.zonelist);
}
function getcitylist() {
	alert("getcitylist");
	$.post('__URL__/getcityzonelist',{'provinceid':$('#provinceid').val()},completegetcityzonelist,'json');
}

function completegetzonelist(data) {
	alert("completegetzonelist");
	$('#zoneid').empty();
    $('#zoneid').html(data.data.zonelist);
}
function getzonelist() {
	alert("getzonelist");
	$.post('__URL__/getzonelist',{'cityid':$('#cityid').val()},completegetzonelist,'json');
}
		
/*
function complete_submit(data) {
	alert(data.info);
	//$('#result').html("<span>"+data.info+"</span>");
	if(data.status == 1) {
		if(data.data == 'ADD') $("input").value("");
		else $("input").css("color","black");
		$('#result').fadeIn("slow");
		location.href = "__URL__/index";
	}
}


function complete_query(data) {
    $("#datalistbox").empty();
    $("#datalistbox").html(data.data.datahtml);
    $("#page").html(data.data.page);
    
    $('#btn_query').removeClass('querying');
	$('#btn_query').val('查询');
	$("#btn_query").attr("disabled","");
	$('#btn_query').addClass('btn_query');		
}


function set_duringquerinstyle() {
	$('#btn_query').removeClass('btn_query');
	$('#btn_query').val('');
	$("#btn_query").attr("disabled","disabled");
	$('#btn_query').addClass('querying');
}

function set_querinstyle(objId) {
	$('#'+objId).removeClass('btn_query');
	$('#'+objId).val('');
	$("#"+objId).attr("disabled","disabled");
	$('#'+objId).addClass('querying');
}

function restore_querystyle(objId) {
	$('#'+objId).removeClass('querying');
	$('#'+objId).val('查询');
	$('#'+objId).addClass('btn_query');
	$("#"+objId).attr("disabled","");
}

*/





