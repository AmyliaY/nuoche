<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<link href="${pageContext.request.contextPath }/lib/css/H-ui.admin.css"
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
	src="${pageContext.request.contextPath }/lib/lib/ueditor/1.4.3/ueditor.all.min.js">
	
</script>
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
<title>修改级别</title>
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
	height: 80px;
	width: 80px;
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
		<form class="form form-horizontal" id="form-article-add">

			<div class="row cl">
				<label class="form-label col-2">店铺名称：
				</label>
				<div class="formControls col-10">
					<input type="text" class="input-text"
						value="${list.shopname }" placeholder=""/>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2">开店人：
				</label>
				<div class="formControls col-10">
					<input type="text" class="input-text"
						value="${list.userinfo.usersName }" placeholder=""/>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2">联系方式：
				</label>
				<div class="formControls col-10">
					<input type="text" class="input-text"
						value="${list.shoptel }" placeholder=""/>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2">开店时间：
				</label>
				<div class="formControls col-10">
					<input type="text" class="input-text"
						value="${list.shoptime }" placeholder=""/>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2">店铺状态：
				</label>
				<div class="formControls col-10">
				    <c:if test="${list.shopstate==0 }">
				         <input type="text" class="input-text"
						value="休息" placeholder=""/>
				    </c:if>
				    <c:if test="${list.shopstate==1 }">
				         <input type="text" class="input-text"
						value="营业" placeholder=""/>
				    </c:if>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2">店铺类型：
				</label>
				<div class="formControls col-10">
					<input type="text" class="input-text"
						value="${list.shoptype.typename }" placeholder=""/>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2">店铺地址：
				</label>
				<div class="formControls col-10">
					<input type="text" class="input-text"
						value="${list.area.city.provice.prName }${list.area.city.ctName }${list.area.arName }${list.shopaddress }" placeholder=""/>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2">店铺介绍：
				</label>
				<div class="formControls col-10">
					<input type="text" class="input-text"
						value="${list.shopjieshao}" placeholder=""/>
				</div>
			</div>
			
			<div class="row cl">
					<label class="form-label col-2">
						店铺图片：
					</label>
					<div class="formControls col-10" style="margin-left: -150px;">
						<div index=0 class="fimage">
						    <img src="${pageContext.request.contextPath }/${list.shoppicture}">
						</div>
					</div>
				</div>
				
            <div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">店铺详情：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<textarea name="abstract" cols="" rows="" class="textarea" datatype="*10-100" dragonfly="true">${list.shopxiangqing }</textarea>
				</div>
		    </div>
		</form>
	</div>
	</div>

	<script type="text/javascript">
	    
	
		
		
	</script>
</body>
</html>