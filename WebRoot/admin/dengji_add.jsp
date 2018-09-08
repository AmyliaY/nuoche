<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
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
		<title>会员等级 - 新增会员等级</title>
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
			<form class="form form-horizontal" id="form-qiuhao-add" onsubmit="return false">
			
				<div class="row cl col-offset-3">
					<label class="form-label col-2">
						<span class="c-red">*</span>等级称号：
					</label>
					<div class="formControls col-2">
						<input type="text" class="input-text" onchange="yzgname()"
							 placeholder="等级称号：" id="djname" name="djname" />
					</div>
				</div>
				<div class="row cl col-offset-3">
					<label class="form-label col-2">
						<span class="c-red">*</span>直推起始人数：
					</label>
					<div class="formControls col-2">
						<input type="text" class="input-text" placeholder="直推起始人数"
							id="djbegintui" name="djbegintui">
					</div>
				</div>
				<div class="row cl col-offset-3">
					<label class="form-label col-2">
						<span class="c-red">*</span>直推结束人数：
					</label>
					<div class="formControls col-2">
						<input type="text" class="input-text" placeholder="直推结束人数"
							id="djendtui" name="djendtui">
					</div>
				</div>
				<div class="row cl col-offset-3">
					<label class="form-label col-2">
						<span class="c-red">*</span>团队起始人数：
					</label>
					<div class="formControls col-2">
						<input type="text" class="input-text" placeholder="团队起始人数"
							id="djbegintuan" name="djbegintuan">
					</div>
				</div>
				<div class="row cl col-offset-3">
					<label class="form-label col-2">
						团队结束人数：
					</label>
					<div class="formControls col-2">
						<input type="text"
							name="djendtuan" id="djendtuan" placeholder="团队结束人数"
							class="input-text">
					</div>
				</div>
				<div class="row cl col-offset-3">
					<label class="form-label col-2">
						购买等级金额：
					</label>
					<div class="formControls col-2">
						<input type="text"
							name="djjine" id="djjine" placeholder="购买等级金额"
							class="input-text">
					</div>
				</div>
				
				
				<div class="col-9 col-offset-5" style="margin-top: 20px">
					<button class="btn btn-primary radius" onclick="dengjiupdate()">&nbsp;&nbsp;提交&nbsp;&nbsp;</button>
				</div>
			</form>
		</div>
		</div>

<script type="text/javascript">
	function dengjiupdate(){
		var djname=$("#djname").val();
		var djbegintui=$("#djbegintui").val();
		var djendtui=$("#djendtui").val();
		var djbegintuan=$("#djbegintuan").val();
		var djendtuan=$("#djendtuan").val();
		var djjine=$("#djjine").val();
		
		
		if(djname==null || ""==djname)
		{
			layer.msg("请输入等级称号!",{icon:6,time:1000});
			return false;
	    }
		if(isNaN(djbegintui))
		{
			layer.msg("请输入数字",{icon:6,time:1000});
			return false;
	    }
		if(isNaN(djendtui))
		{
			layer.msg("请输入数字",{icon:6,time:1000});
			return false;
	    }
		if(isNaN(djbegintuan))
		{
			layer.msg("请输入数字",{icon:6,time:1000});
			return false;
	    }
		if(isNaN(djendtuan))
		{
			layer.msg("请输入数字",{icon:6,time:1000});
			return false;
	    }
		if(isNaN(djjine))
		{
			layer.msg("请输入数字",{icon:6,time:1000});
			return false;
	    }
		
		
		$.ajax({
			type: 'post',
			url: "${pageContext.request.contextPath}/dengji.do?p=dengjiAdd" ,
			data:$("#form-qiuhao-add").serialize(),
			success: function(data){
				layer.msg('新增成功!',{icon:6,time:1000});
				setTimeout(function(){window.parent.location.reload();},1000);

			},
	        error: function(XmlHttpRequest, textStatus, errorThrown){
				layer.msg('error!',{icon:2,time:1000});
			}
		});
	}
</script>
	</body>
</html>