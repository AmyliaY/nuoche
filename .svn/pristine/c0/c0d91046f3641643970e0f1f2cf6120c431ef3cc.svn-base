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
		<title>订单详情</title>
	</head>
	<style>
		#rightdiv{margin-top: 3px}
	</style>
	<body>
		<div class="pd-20">
				<div class="form form-horizontal" id="form-member-add">
					<div class="row cl">
						<label class="form-label col-2">申请订单号：</label>
						<div class="formControls col-5" id="rightdiv">
							${applydetail.orderId}
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-2">微信订单号：</label>
						<div class="formControls col-5" id="rightdiv">
							${applydetail.orderWx}
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-2">下单时间：</label>
						<div class="formControls col-5" id="rightdiv">
							${applydetail.created}
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-2">运费：</label>
						<div class="formControls col-2" id="rightdiv">
							${applydetail.postFee}
						</div>
						<label class="form-label col-2">卡费：</label>
						<div class="formControls col-2" id="rightdiv">
							${applydetail.cardFee}
						</div>
						<label class="form-label col-2">总金额：</label>
						<div class="formControls col-2" id="rightdiv">
							${applydetail.totalFee}
						</div>
					</div>
					<c:if test="${applydetail.status!=1}">
					<div class="row cl">
						<label class="form-label col-2">支付方式：</label>
						<div class="formControls col-2" id="rightdiv">
							微信支付
							<%-- <c:if test="${god.goodsorders.orPaytype==0}">微信</c:if>
							<c:if test="${god.goodsorders.orPaytype==1}">支付宝</c:if> --%>
						</div>
						<%-- <label class="form-label col-2">第三方支付金额：</label>
						<div class="formControls col-2" id="rightdiv">
							${god.goodsorders.orThreepay}
						</div>
						<label class="form-label col-2">使用了多少积分：</label>
						<div class="formControls col-2" id="rightdiv">
							${god.goodsorders.orJifen}
						</div> --%>
					</div>
					</c:if>
					<div class="row cl">
						<label class="form-label col-2">配送方式：</label>
						<div class="formControls col-2" id="rightdiv">
							快递
							<%-- <c:if test="${god.goodsorders.orPeisongtype==0}">自提</c:if>
							<c:if test="${god.goodsorders.orPeisongtype==1}">快递</c:if>
							<c:if test="${god.goodsorders.orPeisongtype==2}">送货上门</c:if> --%>
						</div>
						<c:if test="${applydetail.status==3}">
						<label class="form-label col-2">配送公司：</label>
						<div class="formControls col-2" id="rightdiv">
							${applydetail.peisongCorp.pscchinesename}
						</div>
						<label class="form-label col-2">配送单号：</label>
						<div class="formControls col-2" id="rightdiv">
							${applydetail.shippingCode}
						</div>
						</c:if>
					</div>
					<div class="row cl">
						<label class="form-label col-2">收货人：</label>
						<div class="formControls col-2" id="rightdiv">
							${applydetail.buyer}
						</div>
						<label class="form-label col-2">电话号码：</label>
						<div class="formControls col-2" id="rightdiv">
							${applydetail.buyerTel}
						</div>
					</div>
					<div class="row cl">
						<label class="form-label col-2">收货地址：</label>
						<div class="formControls col-5" id="rightdiv">
							${applydetail.buyerAddr}
						</div>
					</div>
					
					<%-- <div class="row cl">
						<label class="form-label col-2">订单备注：</label>
						<div class="formControls col-5" id="rightdiv">
							<c:if test="${god.goodsorders.orRemark==null}">未填写</c:if>
							<c:if test="${god.goodsorders.orRemark!=null}">${god.goodsorders.orRemark}</c:if>
						</div>
					</div> --%>
					<div class="row cl">
					<div class="col-10 col-offset-10">
						<input class="btn btn-primary radius" id="sub"
							onclick="tijiao()" type="submit"
							value="&nbsp;&nbsp;返回&nbsp;&nbsp;">
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
	window.parent.location.reload();
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