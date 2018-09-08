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
<title>新增公告</title>
</head>
<body>
<div class="pd-20">
<form action="${pageContext.request.contextPath}/notice.do?p=update" method="post" class="form form-horizontal" id="form-article-add">
	<div class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-2">公告状态：</label>
			<div class="formControls col-2"> <span class="select-box">
				<select class="select" id="noStatus" name="noStatus">
					<option value="1">启用</option>
					<option value="0">禁用</option>
				</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">公告类型：</label>
			<div class="formControls col-2"> <span class="select-box">
				<select class="select" id="noType" name="noType">
					<option value="-1">--请选择--</option>
					<option value="1">公司政策</option>
					<option value="2">新品通知</option>
					<option value="3">促销通知</option>
					<option value="4">特价通知</option>
				</select>
				</span> 
				<script type="text/javascript">
					document.getElementById("noStatus").value ='${tnotice.noStatus }' ;
					document.getElementById("noType").value  = "${tnotice.noType}";
				</script>
				</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">公告标题：</label>
			<div class="formControls col-10">
				<input type="text" class="input-text" value="${tnotice.noTitle }" placeholder="" id="noTitle" name="noTitle">
			</div>
		</div>
		<input type="hidden" name='id' value="${tnotice.noId }">
		
		<input type="hidden" name="noContent" id="noContent"/>
		<div class="row cl">
			<label class="form-label col-2">公告内容：</label>
			<div class="formControls col-10"> 
				<script id="editor"   type="text/plain" style="width:100%;height:200px;"></script> 
			</div>
		</div>
		<div class="row cl">
			<div class="col-10 col-offset-2">
				<button onclick="return add()" id="sub" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i>修改</button>
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
var ue = UE.getEditor('editor');
ue.ready(function() {//编辑器初始化完成再赋值  
   ue.setContent('${tnotice.noContent}');  //赋值给UEditor  
});  


function add()
{
	var noType=$("#noType").val();
	var noTitle=$("#noTitle").val();
	var editor=ue.getContent();
	if(noType=="-1")
	{
		layer.msg("请选择公告类型!",{icon:6,time:1000});
		return false;
	}
	if(noTitle==null || ""==noTitle)
	{
		layer.msg("请输入公告标题!",{icon:6,time:1000});
		return false;
	}
	
	if(editor==null || ""==editor)
	{
		layer.msg("请输入公告内容!",{icon:6,time:1000});
		return false;
	}else{
		$("input[name=noContent]").attr("value",editor);
	}
}

</script>
</body>
</html>