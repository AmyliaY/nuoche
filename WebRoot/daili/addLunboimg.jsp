<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="${pageContext.request.contextPath }/lib/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/lib/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/lib/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/lib/lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>新增轮播</title>
</head>
<body>
<div class="pd-20">
<form action="${pageContext.request.contextPath}/daili_lunboimg.do?p=addlunboimg" method="post" class="form form-horizontal" id="form-article-add" enctype="multipart/form-data">
	<div class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>轮播标题：</label>
			<div class="formControls col-10">
				<input type="text" class="input-text"  value="" placeholder="" id="cimgtitle" name="cimgtitle">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">轮播状态：</label>
			<div class="formControls col-2"> <span class="select-box">
				<select class="select" id="cimgstatus" name="cimgstatus">
					<option value="1">启用</option>
					<option value="0">禁用</option>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">轮播类型：</label>
			<div class="formControls col-2"> <span class="select-box">
				<select class="select" onchange="genhuan()" id="cimgtype" name="cimgtype">
					<option value="0">内容</option>
					<option value="1">链接到服务</option>
					<option value="2">链接到商家</option>
					
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>轮播图片：</label>
			<input type="file" id="cimages" name="cimages" width="150px" runat="server" onchange="javascript:setImagePreview(this,localImag,preview);" />
			  <div id="localImag">
      <img id="preview"  src="" style="width: 180px; height: 60px;" />
		</div>
		<div class="row cl" style="display: none" id="url">
			<div class="row cl">
				<label class="form-label col-2"> <span class="c-red">*</span>商品列表：
				</label>
				<div class="formControls col-2">
					<span class="select-box"> <select name="bid" id="bid"
						class="select" onchange="findservice()">
							<option value="-1">--请选择--</option>
							<c:forEach items="${business }" var="l">
								<option value="${l.id }">${l.shopname }</option>
							</c:forEach>
					</select>
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2"> <span class="c-red">*</span>服务列表：
				</label>
				<div class="formControls col-2">
					<span class="select-box"> <select name="sid" id="sid"
						class="select">
							<option value="-1">--请选择--</option>
							<option value=""></option>
					</select>
					</span>
				</div>
			</div>
		</div>
		<input type="hidden" name="cimgdescribe" id="cimgcescribe"/>
		<div class="row cl" id="detail" style="margin-top: 8%">
			<label class="form-label col-2">轮播内容：</label>
			<div class="formControls col-10"> 
				<script id="editor"  type="text/plain" style="width:100%;height:200px;"></script> 
			</div>
		</div>
		<div class="row cl" id="desc" style="margin-top: 8%;display: none;">
			<label class="form-label col-2"> <span class="c-red">*</span>商品列表：
				</label>
				<div class="formControls col-2">
					<span class="select-box"> <select name="bid2" id="bid2"
						class="select">
							<option value="-1">--请选择--</option>
							<c:forEach items="${business }" var="l">
								<option value="${l.id }">${l.shopname }</option>
							</c:forEach>
					</select>
					</span>
				</div>
		</div>
		
		<div class="row cl">
			<div class="col-10 col-offset-2">
				<button onclick="return add()" id="sub" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 添加</button>
			</div>
		</div>
	</div>
</div>
</form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/Validform/5.3.2/Validform.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/js/H-ui.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/js/ajaxfileupload.js"></script> 
<script type="text/javascript">

function findservice() {
	var bid = $("#bid").val();
	if(bid.trim == ""){
		bid=-1;
	}
	
	var url = "${pageContext.request.contextPath}/daili_lunboimg.do?p=findservice";
	var param = {bid:bid};
	$.post(url,param,function(data){
	    
		var json=eval("("+data+")");
		$("#sid").empty();
		var options=document.getElementById("sid");
		for(var i=0;i<json.length;i++)
		{
			
		    var option = new Option(json[i].title,json[i].id);
		    var sss = json[i].title;
			options.add(option);
		}
		
	});
}



function genhuan()
{
	var cimgtype=$("#cimgtype").val();
	if(cimgtype==1)
	{
		document.getElementById("url").style.display='block';
		document.getElementById("detail").style.display='none';
		document.getElementById("desc").style.display='none';
	}else if(cimgtype==0){
		document.getElementById("url").style.display='none';
		document.getElementById("desc").style.display='none';
		document.getElementById("detail").style.display='block';
	}else{
		document.getElementById("url").style.display='none';
		document.getElementById("desc").style.display='block';
		document.getElementById("detail").style.display='none';
	}
}
var ue = UE.getEditor('editor');
function add()
{
	var editor=ue.getContent();
	$("input[name=cimgdescribe]").attr("value",editor);
	var cimgtitle=$("#cimgtitle").val();
	if(cimgtitle==null || ""==cimgtitle)
	{
		layer.msg("请输入轮播图片标题",{icon:6,time:1000});
		return false;
	}
	var cimages=$("#cimages").val();
	if(cimages==null || ""==cimages)
	{
		layer.msg("请选择图片",{icon:6,time:1000});
		return false;
	}
	var cimgtype=$("#cimgtype").val();
	var cimgurl=$("#sid").val();
	var bid2=$("#bid2").val();
	if(cimgtype==0){
		if(editor==null || ""==editor)
		{
		layer.msg("请输入轮播内容",{icon:6,time:1000});
		return false;
		}
	}else if(cimgtype == 1){
		if(cimgurl==-1 || ""==cimgurl || cimgurl==null)
		{
			layer.msg("请选择服务",{icon:6,time:1000});
			return false;
		}
	}else{
		if(bid2==-1 || ""==bid2 || bid2==null)
		{
			layer.msg("请选择商家",{icon:6,time:1000});
			return false;
		}
	}
}
//检查图片的格式是否正确,同时实现预览
  function setImagePreview(obj, localImagId, imgObjPreview) {
   var array = new Array('gif', 'jpeg', 'png', 'jpg', 'bmp'); //可以上传的文件类型 
   if (obj.value == '') {
    $.messager.alert("提示", "让选择要上传的图片!");
    flag = false;
    return false;
   }
   else {
    var fileContentType = obj.value.match(/^(.*)(\.)(.{1,8})$/)[3]; //这个文件类型正则很有用 
    ////布尔型变量 
    var isExists = false;
    var objValue = obj.value;
    try {
     //对于IE判断要上传的文件的大小 
     var fso = new ActiveXObject("Scripting.FileSystemObject");
     fileLenth = parseInt(fso.getFile(objValue).size);
    } catch (e) {
     try {
      //对于非IE获得要上传文件的大小 
      fileLenth = parseInt(obj.files[0].size);
     } catch (e) {
      flag = false;
      return false;
     }
    }
    //循环判断图片的格式是否正确 
    for (var i in array) {
     if (fileContentType.toLowerCase() == array[i].toLowerCase()) {
      //图片格式正确之后，根据浏览器的不同设置图片的大小 
      if (obj.files && obj.files[0]) {
       //火狐下，直接设img属性 
       imgObjPreview.style.display = 'block';
       imgObjPreview.style.width = '360px';
       imgObjPreview.style.height = '120px';
       //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式 
       imgObjPreview.src = window.URL.createObjectURL(obj.files[0]);
       if (fileLenth > 102400) {
        $.messager.alert("提示", "请选择小于100k的图片!");
        flag = false;
        return false;
       }
      }
      else {
       //IE下，使用滤镜 
       obj.select();
       var imgSrc = document.selection.createRange().text;
       //必须设置初始大小 
       localImagId.style.width = "180px";
       localImagId.style.height = "200px";
       //图片异常的捕捉，防止用户修改后缀来伪造图片 
       try {
        localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
        localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
       }
       catch (e) {
    	   alert("laile");
        $.messager.alert("提示", "您上传的图片格式不正确，请重新选择!");
        flag = false;
        return false;
       }
       imgObjPreview.style.display = 'none';
       document.selection.empty();
      }
      isExists = true;
      flag = true;
      return true;
     }
    }
    if (isExists == false) {
     $.messager.alert("提示", "上传图片类型不正确!");
     flag = false;
     return false;
    }
    flag = false;
    return false;
   }
  } 

</script>
</body>
</html>