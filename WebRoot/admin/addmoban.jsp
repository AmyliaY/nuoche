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
<title>新增商品</title>
</head>
<body>
<div class="pd-20">
<form action="${pageContext.request.contextPath}/admin_moban.do?p=addxiaoxilisting" method="post" class="form form-horizontal" id="form-article-add">
	<div class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-2">模板标题：</label>
			<div class="formControls col-10">
				<input type="text" class="input-text"  value="" placeholder="请输入模板标题" id="tptitle" name="tptitle">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">模板开头：</label>
			<div class="formControls col-10">
				<input type="text" class="input-text"  value="" placeholder="请输入模板开头" id="tpstart" name="tpstart">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">模板结尾：</label>
			<div class="formControls col-10"> 
				<input type="text" class="input-text" value="" placeholder="请输入模板结尾" id="tpending" name="tpending">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">模板链接：</label>
			<div class="formControls col-10">
				<input type="text" class="input-text" value="" placeholder="请输入模板链接" id="tplink" name="tplink">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">模板参数：</label>
			<div class="formControls col-10"> 
				<input type="text" class="input-text" value="" placeholder="请输入模板参数" id="tpparameters" name="tpparameters">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">模板含义：</label>
			<div class="formControls col-10"> 
				<input type="text" class="input-text" value="" placeholder="请输入模板含义" id="tpmeaning" name="tpmeaning"> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">微信模板编号：</label>
			<div class="formControls col-10"> 
				<input type="text" class="input-text" value="" placeholder="请输入微信模板编号" id="tpweixin_id" name="tpweixin_id">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">微信模板名称：</label>
			<div class="formControls col-10"> 
				<input type="text" class="input-text" value="" placeholder="请输入微信模板名称" id="tpweixin_name" name="tpweixin_name"> 
			</div>
		</div>
		<div class="row cl">
			<div class="col-10 col-offset-2">
				<button onclick="return add()" id="sub" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 提交模板</button>
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
function add()
{
	var tptitle=$("#tptitle").val();
	var tpstart=$("#tpstart").val();
	var tpending=$("#tpending").val();
	var tplink=$("#tplink").val();
	var tpparameters=$("#tpparameters").val();
	var tpmeaning=$("#tpmeaning").val();
	var tpweixin_id=$("#tpweixin_id").val();
	var tpweixin_name=$("#tpweixin_name").val();
	if(tptitle==null || ""==tptitle)
	{
		layer.msg("请输入模板标题!",{icon:6,time:1500});
		return false;
	}
	if(tpstart==null || ""==tpstart)
	{
		layer.msg("请输入模板开头!",{icon:6,time:1500});
		return false;
	}
	if(tpending==null || ""==tpending)
	{
		layer.msg("请输入模板结尾!",{icon:6,time:1500});
		return false;
	}
	
	if(tplink==null || ""==tplink)
	{
		layer.msg("请输入模板链接!",{icon:6,time:1500});
		return false;
	}
	if(tpparameters==null || ""==tpparameters)
	{
		layer.msg("请输入模板参数!",{icon:6,time:1500});
		return false;
	}
	var b= /^[0-9]*$/
	if(!b.test(tpparameters))
	{
		$("#tpparameters").val("");
		layer.msg("请输入模板参数!（数字）",{icon:6,time:1500});
		return false;
	}
	
	
	if(tpweixin_id==null || ""==tpweixin_id)
	{
		layer.msg("请输入微信模板编号!",{icon:6,time:1500});
		return false;
	}
	
	
	if(tpweixin_name==null || ""==tpweixin_name)
	{
		layer.msg("请输入微信模板名称!",{icon:6,time:1500});
		return false;
	}
}

</script>
</body>
</html>