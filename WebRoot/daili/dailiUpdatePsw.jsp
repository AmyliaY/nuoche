<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport"
			content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link href="${pageContext.request.contextPath }/lib/css/H-ui.min.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath }/lib/css/H-ui.admin.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath }/lib/lib/icheck/icheck.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath }/lib/lib/Hui-iconfont/1.0.7/iconfont.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/webuploader.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/layer/2.1/layer.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/icheck/jquery.icheck.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/Validform/5.3.2/Validform.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/webuploader.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/ueditor/1.4.3/ueditor.config.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/js/H-ui.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/js/H-ui.admin.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/js/ajaxfileupload.js"></script>
		<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
		<title>修改密码</title>
		<style>
#showimage {
	margin-top: 40px;
	height: 20%;
	padding-bottom: 20px;
}

.defaultimage,.fimage {
	margin-left: 1%;
	float: left;
	border: 1px solid #cccccc;
	height: 100px;
	width: 100px;
	line-height: 100px;
	text-align: center;
	cursor: pointer;
	background: #f2f2f2;
}

.fimage:first-child {
	margin-left: 16.5%;
}

.defaultimage img,.fimage img {
	height: 50px;
	width: 50px;
	margin-top: 25%;
}

.ui-droplist-wrap {
	margin-top: 31px;
	background: #fff;
	border: 1px solid #2ca1b3;
	z-index: 500;
	max-height: 340px;
	overflow: auto;
	margin-left: 13.4%;
}

.ui-droplist-wrap .droplist {
	background-color: #fff;
	position: relative;
}

.select {
	width: 91%;
}
</style>
	</head>
	<body>
		<div class="pd-20">
			<form  class="form form-horizontal"  id="mainform" name="mainform" action="${pageContext.request.contextPath}/daili_updatepsw.do?p=updatpsw2" method="post" >
				<div class="row cl">
					<label class="form-label col-2">
						<span class="c-red">*</span>代理账号：
					</label>
					<div class="formControls col-10">
						${proxy.tel }
						
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-2">
						<span class="c-red">*</span>原密码：
					</label>
					<div class="formControls col-10">
						<input type="text" class="input-text" style="width: 200px;" 
							value="" placeholder="请输入原密码" id="oldpsd" name="oldpsd" />
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-2">
						<span class="c-red">*</span>新密码：
					</label>
					<div class="formControls col-10">
						<input type="text" class="input-text" style="width: 200px;"  
							value="" placeholder="请输入新密码" id="psd" name="psd" />
					</div>
				</div>
				<div class="row cl">
					<div class="col-10 col-offset-2">
						<button onclick="add()" id="sub" class="btn btn-primary radius"
							type="button">
							<i class="Hui-iconfont">&#xe632;</i> 修改
						</button>
					</div>
				</div>
			</form>
		</div>


<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/jquery.form.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/popwin.js?v1"></script>


<script type="text/javascript">
function add()
{	
	var oldpsd=$('#oldpsd').val();
	var psd=$("#psd").val();
	if(oldpsd==null || ""==oldpsd)
	{
		layer.msg("请输入原密码",{icon:6,time:1000});
		return false;
	}
	if(psd==null || ""==psd)
	{
		layer.msg("请输入新密码",{icon:6,time:1000});
		return false;
	}
	$.ajax({
			url:'${pageContext.request.contextPath}/daili_updatepsw.do?p=checkUpdate',
			type:'post',
			dataType:'json',
			data: $('#mainform').serialize(),
			async: false,
			success:function(jd){
				if(jd=="1"){
					layer.msg("修改成功",{icon:6,time:1000});
					//showPopWin(1,"修改成功");
					window.setTimeout(function() {
						$('#mainform').submit();
					}, 1000);
				}else{
					//showPopWin(1,"原密码错误");
					layer.msg("原密码错误",{icon:6,time:1000});
				}				
			},
			error:function(){
				//showPopWin(1,"修改失败，请稍后重试！");
				layer.msg("修改失败，请稍后重试！",{icon:6,time:1000});
			}
	});	
	
}

</script>
	</body>
</html>