<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>编辑服务类型</title>
</head>
<body>
	<div class="pd-20">
			<form
			action="${pageContext.request.contextPath}/admin.do?p=addAdmin"
			method="post" class="form form-horizontal" id="form-article-add"
			enctype="multipart/form-data">
			<div class="form form-horizontal" id="form-member-add">
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>服务类型：</label>
					<div class="formControls col-5">
						<input type="text" class="input-text" value="${servicetype.name }"
							placeholder="请输入服务类型" id="typename" name="typename">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>创建时间：</label>
					<div class="formControls col-5">
						<span><fmt:formatDate value="${servicetype.created }" pattern="yyyy-MM-dd HH:mm:ss"/></span>  
							
					</div>
				</div>
				
				<div class="row cl">
					<div class="col-9 col-offset-3">
						<input class="btn btn-primary radius" id="sub"
							onclick="tijiao(${servicetype.id})" type="button"
							value="&nbsp;&nbsp;修改&nbsp;&nbsp;">
						<input class="btn btn-primary radius" id=""
							onclick="dodelete(${servicetype.id})" type="button"
							value="&nbsp;&nbsp;删除&nbsp;&nbsp;">
					</div>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/icheck/jquery.icheck.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/Validform/5.3.2/Validform.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/layer/2.1/layer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/js/H-ui.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/js/H-ui.admin.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/webuploader.min.js"></script>
	<script type="text/javascript">
		
	</script>
	
</body>
<script type="text/javascript">
	function tijiao(id)
	{
		var name = $("#typename").val();
		var url="${pageContext.request.contextPath}/admin_fuwutype.do?p=updatefuwutypego";
		var param={id:id,name:name};
		$.post(url,param,function(data){
		if (data == "yes") 
		{ 
			alert("修改成功!");
			window.location.href="${pageContext.request.contextPath}/admin_fuwutype.do?p=fuwutypelist";
			return;
		}
		});
		
	
	}
	function dodelete(fuwutypeid)
{
	if(window.confirm("确定执行该操作?"))
	{
		var url="${pageContext.request.contextPath}/admin_fuwutype.do?p=dodelete";
		var param={id:fuwutypeid};
		$.post(url,param,function(data){
		if (data == "yes") 
		{ 
			alert("操作成功!");
			window.location.href="${pageContext.request.contextPath}/admin_fuwutype.do?p=fuwutypelist";
			return;
		}
		});
	}
}
	
	
</script>
</html>