/**
* 文件用途描述
* @date: 2017年1月17日 下午3:17:13
* @description:js文件
* @author: Administrator：chenkeyu
*/
//delete-删除，shiftdelete-彻底删除 ------单个
function del(url,id){
	var ret = confirm('删除确认');
	if (ret){
		$.post(url,{'id':id},function(json){
			if(json.code == 1){
				alert(json.msg)
				window.location.href = json.data;
			}else{
				alert(json.msg);
				window.location.href = json.data;
			}
		},'json')
	}
}
function dele(url){
	var inputValue = $("input[type='checkbox']:checked").val();
	if (inputValue =='' || inputValue == undefined){
		alert("请选择编辑项");
		return;
	}
	var ret = confirm('删除确认');
	if (ret){
		$.post(url,{'id':inputValue},function(json){
			if(json.code == 1){
				alert(json.msg)
				window.location.href = json.data;
			}else{
				alert(json.msg);
				window.location.href = json.data;
			}
		},'json')
	}
}
/**
 * 函数用途描述
 * @date: 2017年8月22日 下午1:56:40
 * @author: Administrator：chenkeyu
 * @description: multidel-删除 ------多个
 * @param: variable
 * @return:
 */
function multidel(url){
	
	var a = $("input[type='checkbox']:checked");
	var multidelarray = [];
	
	for(i=0;i<a.length;i++){
		multidelarray[i] = $("input[type='checkbox']:checked").eq(i).val()
	}
	if (multidelarray ==''){
		alert("请选择编辑项");
		return;
	}
	var ret = confirm('删除确认');
	if (ret){
		$.post(url,{'multidelarray':multidelarray},function(json){
			alert(json.msg);
			location.replace(location.href);//刷新页面
		},'json')
	}
}
//还原函数
function reduction(url){
	
	var a = $("input[type='checkbox']:checked");
	var reductionarray = [];
	
	for(i=0;i<a.length;i++){
		reductionarray[i] = $("input[type='checkbox']:checked").eq(i).val()
	}
	if (reductionarray ==''){
		alert("请选择编辑项");
		return;
	}
	var ret = confirm('还原确认');
	if (ret){
		$.post(url,{'reductionarray':reductionarray},function(json){
			alert(json.msg);
			location.replace(location.href);//刷新页面
		},'json')
	}
}
//编辑函数
function edit(url,id){
	
	if (id){
		var inputValue = id;
	}else{
		var inputValue = $("input[type='checkbox']:checked").val();
	}
	if ($("#page .active span").html()){
		var page = $("#page .active span").html().replace(/\D+/g,"")
	}
	if (inputValue == undefined){
		alert("请选择编辑项");
		return;
	}else{
		window.location.href = url+'/id/'+inputValue+'/page/'+page;
	}
}
function detail(url,id){
	
	if ($("#page .active span").html()){
		var page = $("#page .active span").html().replace(/\D+/g,"")
	}
	window.location.href = url+'/id/'+id+'/page/'+page;
}
//文章详情页面
function geturl(id) {
	url = "http://www.jinqiugangwan.com/index.php/Index/wenzhangdetail/id/"+id;
	alert(url);
}
//发布
function publish(url,id){
	
	$.post(url,{'id':id},function(json){
		if(json.code == 1){
			alert(json.msg)
			location.replace(location.href);//刷新页面
		}else{
			alert(json.msg);
			location.replace(location.href);//刷新页面
		}
	},'json')
}
//取消发布
function unpublish(url,id){
	
	$.post(url,{'id':id},function(json){
		if(json.code == 1){
			alert(json.msg)
			location.replace(location.href);//刷新页面
		}else{
			alert(json.msg);
			location.replace(location.href);//刷新页面
		}
	},'json')
}
/**
 * 函数用途描述
 * @date: 2017年3月1日 上午10:56:40
 * @author: Administrator：chenkeyu
 * @description: 查询字段数据是否存在-单个
 * @param: variable
 * @return:
 */
function enquiriesDataIfExist(url,id){
	
	var element = document.getElementById(id);
	var elementValue = element.value;
	$.post(url,{'id':elementValue},function(json){
		$("#edie").empty();
		if(json.code){
			$("#"+id).after("<span id='edie'>√"+json.msg+"</span>");
			$("#edie").css("color","green");
		}else{
			$("#"+id).after("<span id='edie'>×"+json.msg+"</span>");
			$("#edie").css("color","red");
		}
	},'json')
	
}
/**
* 函数用途描述
* @date: 2017年8月21日 下午2:29:05
* @author: Administrator：chenkeyu
* @description: 省市联动 ---添加、修改
* @param: variable
* @return:
*/
function obtaincitylist(url){
	
	$.post(url,{'provinceid':$('#province option:selected').val()},function(json){
		$("#city").empty();
		$("#city").append(json.data.selectitems);
		$("#zone").empty();
		$("#zone").append(json.data.zoneitems);
	},'json')
}
function obtainzonelist(url){
	
	$.post(url,{'cityid':$('#city option:selected').val()},function(json){
		$("#zone").empty();
		$("#zone").append(json.data);
	},'json')
}
/**
* 函数用途描述
* @date: 2017年8月21日 下午2:29:05
* @author: Administrator：chenkeyu
* @description: 省市联动 ---查询
* @param: variable
* @return:
*/
function obtainquerycitylist(url){
	
	$.post(url,{'provinceid':$('#province option:selected').val()},function(json){
		$("#city").empty();
		$("#city").append(json.data);
	},'json')
}
function obtainqueryzonelist(url){
	
	$.post(url,{'cityid':$('#city option:selected').val()},function(json){
		$("#zone").empty();
		$("#zone").append(json.data);
	},'json')
}
//上传图片
function onUploadImgChange(sender,idforimgreview,width,hight){
    if( !sender.value.match( /.jpg|.jpeg|.gif|.png|.bmp/i ) ){
        alert('图片格式无效！');
        return false;
    }
    if( sender.files && sender.files[0] ){
        document.getElementById(idforimgreview).src = window.URL.createObjectURL(sender.files[0]);
        document.getElementById(idforimgreview).style.width = width;
        if(hight != "") {
        	document.getElementById(idforimgreview).style.height = hight;
        }
    }
}





































