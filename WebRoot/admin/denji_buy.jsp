<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>购买等级</title>
</head>
<body>
	<div class="pd-20">
			<form
			class="form form-horizontal" id="form-article-add"
			>
			<div class="form form-horizontal" id="form-member-add">
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>当前级别：</label>
					<div class="formControls col-5">
						<input value="${not empty userinfo.dengji ? userinfo.dengji.djname : '无' }" type="text" class="input-text" readonly="readonly" placeholder="" id="jbname" name="jbname">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>选择等级：</label>
					<div class="formControls col-5">
						 <span class="select-box" style="width:192px;">
							<select class="select" id="denjiId" name="denjiId" size="1" onchange="go();">
								<c:forEach items="${list}" var="t">
								    <option id="${t.djjine }" value="${t.djid}">${t.djname}</option>
								</c:forEach>
								
							</select>
				       </span>
					</div>
				</div>
				
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>购买级别金额：</label>
					<div class="formControls col-5">
						<input type="text" class="input-text"
							placeholder="" id="money" name="money" readonly="readonly">
					</div>
				</div>
				
				<!-- 
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>直推奖励金额：</label>
					<div class="formControls col-5">
						<input type="text" class="input-text"
							placeholder="" id="djtuijiangli" name="djtuijiangli">
					</div>
				</div>
				 -->
				 
				 
				
				<div class="row cl">
				<div class="col-10 col-offset-2">
					<button onclick="tianjia()" id="sub" class="btn btn-primary radius"
						type="button">
						<i class="Hui-iconfont">&#xe632;</i> 购&nbsp;&nbsp;&nbsp;买
					</button>
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
	var gid = '${param.gid}';
	
	function go()
	{
	   var money = $("#denjiId>option:selected").attr("id");
	   $("#money").val(money);
	}
	
	$(function(){
	   go();
	});
	
	function tianjia() {
			
			var denjiId = $("#denjiId").val();
			
			
			layer
					.confirm(
							"确定 要购买？",
							function(index) {
								$
										.post(

												"${pageContext.request.contextPath}/dengji.do?p=buyDenji",
												{
													denjiId:denjiId,
													userid: ${userinfo.usersId}
												},
												function() {
													var url = "${header.referer}";
													layer.msg("购买成功", {
														icon : 6,
														time : 1000
													});
													//location.replace(location.href);
													parent.location.reload();
												}

										);

							});
		}
		
		
	</script>
</body>
</html>