<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
		<title>订单发货</title>
	</head>
	<body>
		<div class="pd-20">
				<div class="form form-horizontal" id="form-member-add">
					<div class="row cl">
						<label class="form-label col-3">
							<span class="c-red">*</span>配送单号：
						</label>
						<div class="formControls col-5">
							 <input type="text" class="input-text" placeholder="" id="orrecipient" name="orrecipient" >
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row cl">
						<label class="form-label col-3">
							<span class="c-red">*</span>配送公司：
						</label>
						<div class="formControls col-5"> <span class="select-box" style="width:192px;">
						<select class="select" id="pscid" name="pscid" size="1">
					<option value="-1">--请选择--</option>
							<c:forEach items="${corplist}" var="c">
							<option value="${c.id}">${c.pscchinesename}</option>
							</c:forEach>
				</select>
				</span> </div>
					</div>
					<div class="row cl">
					<div class="col-9 col-offset-3">
						<input class="btn btn-primary radius" id="sub"
							onclick="return tijiao()" type="submit"
							value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
					</div>
				</div>
				</div>
		</div>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/icheck/jquery.icheck.min.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/Validform/5.3.2/Validform.min.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/My97DatePicker/WdatePicker.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/datatables/1.10.0/jquery.dataTables.min.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/layer/2.1/layer.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/js/H-ui.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/js/H-ui.admin.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/webuploader.min.js">
</script>
		<script type="text/javascript">
function tijiao()
{
	var orrecipient=$("#orrecipient").val();
	var pscid=$("#pscid").val();
	if(orrecipient==null || ""==orrecipient)
	{
		layer.msg("请填写配送单号!",{icon:6,time:1000});
		return false;
	}
	if(pscid==-1)
	{
		layer.msg("请选择配送公司!",{icon:6,time:1000});
		return false;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/admin_order.do?p=ordersfahuo&id=${id}",
		type:"post",
		data:{orrecipient:orrecipient,pscid:pscid},
		success:function()
		{
			window.parent.location.reload();
		}
	});
}
$(function() {
	$('.skin-minimal input').iCheck( {
		checkboxClass : 'icheckbox-blue',
		radioClass : 'iradio-blue',
		increaseArea : '20%'
	});

});
</script>
	</body>
</html>