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
		<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
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
		<title>新增商品</title>
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
		<div class="pd-20" style=" width:400px;margin:100px auto;font-size: 14px;">
			<div class="" >
				
					<span class="c-red">*</span>短信剩余条数：${messageCount}
				
			</div>
			</br>
			<div class="">
				
					<span class="c-red">*</span>续费网站：<a href="http://253.com" target="_blank">http://253.com</a>
				
			</div>
			</br>
			<div class="">
				
					<span class="c-red">*</span>账号：${account }
				
			</div>
			</br>
		</div>
	</body>
</html>