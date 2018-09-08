<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>编辑商品一级分类</title>
</head>
<body>
<div class="pd-20">

</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/Validform/5.3.2/Validform.min.js"></script><form action="${pageContext.request.contextPath}/goodstwotypeback.do?p=edittwotype&amp;id=${gtt.gttId}&amp;page=${page}" method="post" class="form form-horizontal" id="form-article-add" enctype="multipart/form-data">
    <div class="form form-horizontal" id="form-member-add">
    <div class="row cl">
      <label class="form-label col-3">一级分类名称：</label>
      <div class="formControls col-5">
        <span class="select-box" style="width:192px;">
			
				<select class="select" id="gtid" name="gtid" size="1" onchange="findtwotype();">
					<option value="${gtt.goodsonetype.gtId}">${gtt.goodsonetype.gtName}</option>
					<c:forEach items="${onelist}" var="t">
					<option value="${t.gtId}">${t.gtName}</option>
					</c:forEach>
					
				</select>
				</span>
      </div>
      <div class="col-4"> </div>
    </div>
    <div class="row cl">
			<label class="form-label col-3">二级类别名称：</label>
			<div class="formControls col-5"> 
				 <span style="position:absolute;border:solid 1px #ddd;;width:190px;height:31px;">
							<select name="gtname" id="gtname" class="select" style="width:180px;height:21px;margin-left: 5px;margin-top: 5px;border: 0px;" onchange="findgttlogo();changeF();">	
														
												
						</select>
						</span> <span style="width:192px;height:31px;border:0px;">
							<input type="text" name="gtname2" id="gtname2" value="${gtt.gttName}" style="position:absolute; width:157px;height:30px;border:0px;border-left:solid 1px #ddd;padding-left: 8px;margin-top: 1px;font-size: 14px;">
						</span>
				 </div>
		</div>
    <div class="row cl">
		<label class="form-label col-3">二级分类LOGO：</label>
			 <input type="file" id="img" name="gttlogo" width="150px" runat="server" onchange="javascript:setImagePreview(this,localImag,preview);">
			  <div id="localImag">
			  <input type="hidden" name="oldgttimages" id="oldgttimages">
			   <input type="hidden" name="delgttimages" id="delgttimages">
      <img id="preview" alt="预览图片" src="${pageContext.request.contextPath}/${gtt.gttLogo}" style="width: 180px; height: 200px;">
     </div>
     <div class="col-4"> </div>
	</div>
	<div class="row cl">
      <div class="col-9 col-offset-3">
        <input class="btn btn-primary radius" onclick="return tijiao()" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
      </div>
    </div>
</div>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/layer/2.1/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/js/H-ui.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript">

		var index;
		var jsonstr = "[]";
		var jsonarray = eval("(" + jsonstr + ")");
		function findtwotype() {
			var gtid = $("#gtid").val();
			if (gtid.trim == "") {
				gtid = -1;
			}
			var url = "${pageContext.request.contextPath}/goodstwotypeback.do?p=findtwotype";
			var param={gtid:gtid};
			$.post(url,param,function(data){
				var json=eval("("+data+")");
				if(json.length==0){
					$("#gtname2").val("请编辑或输入");
				}
				$("#gtname").empty();
				$("#gtname2").val(json[0].gttName);
				
				for(var i=0;i<json.length;i++)
				{				
					$('#gtname').append("<option id="+json[i].gttId+" value=" + json[i].gttName + ">" + json[i].gttName+ "</option>");					
				}
							
					$("#preview").attr("src", "${pageContext.request.contextPath}"+json[0].gttLogo);
			});
		}
		function findgttlogo(){
			var gtid=$("#gtid").val();
			var gttname=$("#gtname").val();
			var url = "${pageContext.request.contextPath}/goodstwotypeback.do?p=findgttlogo";
			var param={gtid:gtid,gttname:gttname};
			$.post(url,param,function(data){
				var json=eval("("+data+")");							
				$("#preview").attr("src", "${pageContext.request.contextPath}"+json[0].gttLogo); 				
			});	
		}
window.onload=function(){
	var img=$("#preview")[0].src;
	var arr=img.split("/");
	var len=arr.length;
	var imgName=arr[len-1];
	$("#delgttimages").attr("value",imgName);
}
function changeF() {
			document.getElementById('gtname2').value = document
					.getElementById('gtname').options[document
					.getElementById('gtname').selectedIndex].value;				
			console.log(document.getElementById('gtname2').value);
		}
function tijiao()
{
	var fileImg=$("#img").val();
	
	//如果文件为空
	var gtname=$("#gtname2").val();
	
	if (gtname=="请编辑或输入") {
		layer.msg("请选择或编辑二级类别名称！",{icon:5,time:1000});
		return false;
	}
			if(gtname){
				
			}else{
				layer.msg("请选择或编辑二级类别名称！",{icon:5,time:1000});
				return false;
			}
	if(fileImg==null || ""==fileImg){
		var img=$("#preview")[0].src;
		var arr=img.split("/");
		var len=arr.length;
		var imgName=arr[len-1];
		if(img==null || ""==img)
		{
			layer.msg("请选择图片!",{icon:6,time:1000});
			return false;
		}
		$("#oldgttimages").attr("value",imgName);
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
       imgObjPreview.style.width = '180px';
       imgObjPreview.style.height = '200px';
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


$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
});
</script>
</body>
</html>