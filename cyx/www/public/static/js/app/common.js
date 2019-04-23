/**
* 文件用途描述
* @date: 2017年1月17日 下午3:17:13
* @description:js文件
* @author: Administrator：chenkeyu
*/
////////////////////////////////// 表单检查公共函数  ///////////////////////////

function checkforeachlenvalid(ObjId,maxlength,displayname)
{
	len = document.getElementById(ObjId).value.length;
	if(len > maxlength) {
		alert(displayname+" 输入的长度应小于"+maxlength+"，请重新输入");
		document.getElementById(ObjId).focus();
		return false;
	}
	return true;
}

function checkforeachmustinput(ObjId,displayname)
{
	value = document.getElementById(ObjId).value;
	if(value == "") {
		alert("请输入 "+displayname);
		document.getElementById(ObjId).focus();
		return false;
	}
	return true;
}

function checkfornumberformat(ObjId,displayname)
{
	value = document.getElementById(ObjId).value;
	if(value != "" && !isNumber(value)) {
		alert(displayname+" 请输入整数");
		document.getElementById(ObjId).focus();
		document.getElementById(ObjId).style.color='red';
		return false;
	}
	return true;
}

function checkfornumericformat(ObjId,displayname)
{
	value = document.getElementById(ObjId).value;
	if(value != "" && !isNumeric(value)) {
		alert(displayname+" 请输入数字");
		document.getElementById(ObjId).focus();
		document.getElementById(ObjId).style.color='red';
		return false;
	}
	return true;
}

function checkfordateformat(ObjId,displayname)
{
	value = document.getElementById(ObjId).value;
	if(value != "" && !isDate(value)) {
		alert(displayname+" 的格式不正确，应该为:yyyy-mm-dd 格式，请重新输入");
		document.getElementById(ObjId).focus();
		document.getElementById(ObjId).style.color='red';
		return false;
	}
	return true;
}	

function checkemailformat(ObjId,displayname)
{
	value = document.getElementById(ObjId).value;
	var format = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
    if(!format.test(value)){
        alert("电子邮箱格式不对,请输入正确的电子邮箱");
		document.getElementById(ObjId).focus();
		document.getElementById(ObjId).style.color = "red";	
		return false;
    }
    return true;
}

function checkmobileformat(ObjId,displayname)
{
	value = document.getElementById(ObjId).value;
    var format = /^1\d{10}$/;
    if(!format.test(value)) {
    	alert(displayname+"格式不对,请输入正确的"+displayname);
		document.getElementById(ObjId).focus();
		document.getElementById(ObjId).style.color = "red";	
		return false;
    }
    return true;
}

function ispersonalcardno(card)  
{ 
	alert("-- ispersonalcardno -");
   //身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X  
   var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
   if(reg.test(card) === false)  {  
       alert("身份证输入不合法");  
       return  false;  
   }
   return true;
}  

function ismoney(obj){
	var tempValue=obj.value.replace(/(^s+)|(s+$)/g,'').replace('￥','');
	if(!tempValue){ return true; }
	if(/^-?d+(.d+)?$/.test(tempValue)){
		obj.value="￥"+parseFloat(tempValue).toFixed(2);
	} else {
		alert('请输入合法的货币值！');
		return false;
	}
}

///////////////////////// 右侧在线咨询栏控制显示弹出窗口的函数  ///////////////////

function showonlinepopupwindow(whethershow,ObjId1,ObjId2){
	if(whethershow == 1) {
		document.getElementById(ObjId1).style.display="block";
		document.getElementById(ObjId2).style.display="none";
	} else {
		document.getElementById(ObjId1).style.display="none";
		document.getElementById(ObjId2).style.display="none";
	}
}

function changevalueprompt(sender)
{
    sender.style.color='red';
}

function getSelectCheckboxValuesbyName(name){
		alert("1");
        var obj = document.getElementsByName(name);
        var result ='';
        for (var i=0;i<obj.length;i++)
        {
            if (obj[i].checked){
                result += obj[i].value+",";
            }
        }
        return result.substring(0, result.length-1);
}


