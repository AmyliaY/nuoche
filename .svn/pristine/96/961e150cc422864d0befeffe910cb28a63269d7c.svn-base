<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>代理充值页面</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/daili/css/amazeui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/daili/css/main.css" />

</head>
<body>
<div class="pay">
	<!--主内容开始编辑-->
	<div class="tr_recharge">
		<div class="tr_rechtext">
			<p class="te_retit"><img src="${pageContext.request.contextPath }/daili/images/dailichongzhi/coin.png" alt="" />代理充值中心</p>
			</div>
		<form action="${pageContext.request.contextPath}/dlchongzhi.do?p=topay&proxyid=${proxy.id }&dingdanhao=${dingdanhao }&fee=${fee }" method="post" class="am-form" id="doc-vld-msg">
			<div class="tr_rechbox">
				<div class="tr_rechhead" style="font-size:16px;">
					<img src="${pageContext.request.contextPath }/daili/images/dailichongzhi/ys_head2.jpg" />
					<p>充值帐号：
						<a>${proxy.realname }</a>
					</p>
					<div class="tr_rechheadcion">
						<img src="${pageContext.request.contextPath }/daili/images/dailichongzhi/coin.png" alt="" />
						<span>当前余额：<span>
						<c:if test="${!empty proxy.keCash}">
							${proxy.keCash}元
						</c:if>
						<c:if test="${empty proxy.keCash}">
							0元
						</c:if>
						
						</span></span>
					</div>
				</div>
				<div class="tr_rechli am-form-group">
									
									<input id="cash1" type="text" name="rechnum" class="rechnum" placeholder="请输入充值金额"> 
						
					<!--<span>1招兵币=1元 10元起充</span>-->
				</div>
				
				<br>
				<div class="tr_rechcho am-form-group">
					<span>充值方式：</span>
					<label class="am-radio">
							<input type="radio" checked name="radio1" value="" data-am-ucheck required data-validation-message="请选择一种充值方式"><img src="${pageContext.request.contextPath }/daili/images/dailichongzhi/wechatpay.png">
						</label>
					<!-- 
					<label class="am-radio" style="margin-right:30px;">
							<input type="radio" name="radio1" value="" data-am-ucheck data-validation-message="请选择一种充值方式"><img src="${pageContext.request.contextPath }/daili/images/dailichongzhi/zfbpay.png">
					</label>
					 -->
				</div>
				
			</div>
			<div class="tr_paybox">
				<input type="submit" value="确认支付" onclick=" return czsubmit(${proxy.id })" class="tr_pay am-btn"  />
				<span>温馨提示：遇到问题请拨打联系电话。</span>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath }/daili/js/dailichongzhi/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/daili/js/dailichongzhi/amazeui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/daili/js/dailichongzhi/ui-choose.js"></script>
<script type="text/javascript">
	//   提交
	function czsubmit(proxyid){
		var money = $(".rechnum").val()*1.0;
		
		 var reg = /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/;
		 if (window.document.getElementById("cash1").value.search(reg) == -1) {
			alert("输入金额有误");
			window.document.getElementById("cash1").value = "";
			return false;
		}
		else{
		
		if(money==0){
		
			alert("输入有误");
			return false;
		}
		if(money>=100000){
			alert("充值金额小于10万");
			return false;
		}
		
			var con;
			con=confirm("本次充值金额"+money+"元！请点击【确认】跳转支付页面..."); //在页面上弹出对话框
			if(con==true)
			{
				return true;
		
			
			}
			return false;
		}
		
		
	
	}
	
	
	// 将所有.ui-choose实例化
	$('.ui-choose').ui_choose();
	// uc_01 ul 单选
	var uc_01 = $('#uc_01').data('ui-choose'); // 取回已实例化的对象
	uc_01.click = function(index, item) {
		console.log('click', index, item.text())
	}
	uc_01.change = function(index, item) {
		console.log('change', index, item.text())
	}
	
	$(function() {
		$('#doc-vld-msg').validator({
			onValid: function(validity) {
				$(validity.field).closest('.am-form-group').find('.am-alert').hide();
			},
			onInValid: function(validity) {
				var $field = $(validity.field);
				var $group = $field.closest('.am-form-group');
				var $alert = $group.find('.am-alert');
				// 使用自定义的提示信息 或 插件内置的提示信息
				var msg = $field.data('validationMessage') || this.getValidationMessage(validity);

				if(!$alert.length) {
					$alert = $('<div class="am-alert am-alert-danger"></div>').hide().
					appendTo($group);
				}
				$alert.html(msg).show();
			}
		});
	});
</script>

</body>
</html>