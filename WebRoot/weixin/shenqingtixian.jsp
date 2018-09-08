<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!doctype html>
<html class="no-js">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no">
		<title>申请提现 </title>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/css/amazeui.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/css/style.css" />

		<script type="text/javascript" src="${pageContext.request.contextPath}/weixin/js/jquery.min.js"></script>
		<!--[if (gte IE 9)|!(IE)]><!-->
		<script type="text/javascript" src="${pageContext.request.contextPath}/weixin/js/amazeui.min.js"></script>

		<!--<![endif]-->

	</head>

	<body style="width:100%;max-width:640px;margin:0px auto;">
		<div class="am-modal am-modal-alert" tabindex="-1" id="fq_alert">
			<div class="am-modal-dialog">
				<div class="am-modal-hd" id="fq_alert_title"></div>
				<div class="am-modal-bd" id="fq_alert_info">
				</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn">确定</span>
				</div>
			</div>
		</div>

		<div class="am-modal am-modal-confirm" tabindex="-1" id="fq_confirm">
			<div class="am-modal-dialog">
				<div class="am-modal-hd" id="fq_confirm_title"></div>
				<div class="am-modal-bd" id="fq_confirm_info"></div>
				<div class="am-modal-footer">
					<span class="am-modal-btn" data-am-modal-confirm>确定</span>
				</div>
			</div>
		</div>

		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/font5.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/nb-withdraw.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/page.css" />
		<style>
			#cash_log tbody tr td {
				vertical-align: middle !important;
			}
		</style>
		<div style="margin-bottom:50px">
			<header class="fq-background-white">
				
				<div class="am-text-center am-padding-vertical-sm am-text-default"style="background-color: blue;font-size: x-large;height: 70px;color: white;" >提  &nbsp;&nbsp;&nbsp;现</div>
			</header>
			
			<div class="fq-withdraw fq-background-white am-padding-vertical-sm am-center am-text-center" style="background-color:#D6D6D6;" >
				<img class="fq-withdraw-gold am-center" src="${pageContext.request.contextPath}/weixin/images/gold.png" />
				<div class="fq-withdraw-num">
					
					<span class="am-text-xl"><fmt:formatNumber value="${tjmap.ketixiansum}" type="currency"/>元</span>
					<br />
					<span class="fq-withdraw-gray am-padding-horizontal am-text-sm">可提现余额</span>
				</div>
			</div>

			
		<form class="mui-input-group" id="formgo"
					action="${pageContext.request.contextPath }/mymoney.do?p=inserttixian&weixinhao=${weixinhao}"
					method="post">
			<div class="fq-free-withdraw fq-background-white am-margin-top-sm">
				<a class="am-margin-horizontal-sm am-padding-vertical-sm am-vertical-align am-block">
				<input style="width: 100%;height: 50px;font-style: normal;text-align: center; " class="am-text-sm am-text" type="text" id="cash1" name="cash1"  placeholder="请输入提现金额" >
					
					<
				</a>
				<div class="am-padding-horizontal-sm am-padding-bottom-sm">
					<div class="am-center am-text-center am-margin-top-sm">
						<button type=“button” class="fq-withdraw-button fq-background-white am-btn am-round am-padding-vertical-sm "  
						 onclick="return go()" style="font-size: large;" >我要提现</button>
					</div>
				</div>

			</div>
			
		</form>
			<div class="am-center am-text-center am-margin-top-sm">
				<a class="fq-withdraw-button fq-background-white am-btn am-round am-padding-vertical-sm" href="${pageContext.request.contextPath }/mymoney.do?p=record&weixinhao=${weixinhao}" >
					<span class="fq-record-black am-text-middle am-text-sm am-inline-block" style="color:#000000;font-size: large;" >提现记录</span>	
				</a>
			</div>

		

		</div>

		<!--确认模态框开始-->
		<div class="am-modal am-modal-confirm" tabindex="-1" id="fq_confirms">
			<div class="am-modal-dialog">
				<div class="am-modal-hd" id="fq_confirm_title"></div>
				<div class="am-modal-bd" id="fq_confirm_infos"></div>
				<div class="am-modal-footer">
					<span class="am-modal-btn" data-am-modal-confirm>确定</span>
				</div>
			</div>
		</div>
		<!--确认模态框结束-->



	


		<div class="fq-withdraw-massage am-modal am-modal-confirm" tabindex="-1" id="wxpay_withdraw">
			<div class="fq-background-white am-modal-dialog">
				<div class="am-modal-hd">
					微信提现
				</div>
				<div class="am-modal-bd am-text-sm">
					<div class="am-cf">
						<span class="am-fl">微信账号</span>
						<span class="am-fr" id="wxpay_withdraw_text"></span>
					</div>

					<div class="am-cf">
						<span class="am-fl">提现金额</span>
						<span class="am-fr" id="wxpay_withdraw_count_text"></span>
					</div>
				</div>
				<div class="am-modal-footer">
					<ul class="fq-withdraw-option am-avg-sm-2 am-margin-bottom">
						<li>
							<span class="am-modal-btn fq-option-cancel fq-background-white am-fr am-round am-padding-vertical-sm am-margin-right-sm" data-am-modal-cancel>取消</span>
						</li>
						<li>
							<span class="am-modal-btn fq-option-cancel fq-background-white am-fl am-round am-padding-vertical-sm am-margin-left-sm" data-am-modal-confirm>确认提现</span>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<input type="hidden" class="wd_type" value="1">

		<div class="am-modal am-modal-alert" tabindex="-1" id="fq_alert_msg">
			<div class="am-modal-dialog">
				<div class="am-modal-hd" id="fq_alert_msg_title"></div>
				<div class="am-modal-bd am-text-sm" id="fq_alert_msg_info">
					<span>交易号：</span><br><span id="trade"></span>
				</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn" data-am-modal-confirm>确定</span>
				</div>
			</div>
		</div>

		<div class="am-modal am-modal-alert" tabindex="-1" id="fq_alert_refuse_msg">
			<div class="am-modal-dialog">
				<div class="am-modal-hd"></div>
				<div class="am-modal-bd am-text-sm">
					<span>拒绝原因：</span><br><span id="reason"></span>
				</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn" data-am-modal-confirm>确定</span>
				</div>
			</div>
		</div>
		<input type="hidden" id="aa" value="${tjmap.ketixiansum}" >
		</body>
<script>
	function go() {
		
		var ketixian=document.getElementById("aa").value;
		
		var cash=document.getElementById("cash1").value;
		
		 var reg = /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/;
		 if (window.document.getElementById("cash1").value.search(reg) == -1) {
			alert("输入金额有误");
			window.document.getElementById("cash1").value = "";
			return false;
		}
		else{
		if(cash>ketixian){
			alert("余额不足");
		return false;
		}
		if(cash==0){
			alert("输入有误");
		return false;
		}
		
		
		 
     $("#formgo").submit();
		return;
		}
		
    
		
	}
</script>
		<script>
			function fq_alert(info) {
				$('#fq_alert_info').text(info);
				$('#fq_alert').modal();
			}
			$(function() {
				$('.js_default').removeClass('icon-icon2').addClass('icon-radio');
				var withdraw_type = "1";
				if (withdraw_type == 0) {
					$('.js_alipay').removeClass('icon-radio').addClass('icon-icon2');
				} else {
					$('.js_wxpay').removeClass('icon-radio').addClass('icon-icon2');
				}
				$('.js_default').click(function() {
					$('.js_default').removeClass('icon-icon2').addClass('icon-radio');
					$(this).removeClass('icon-radio').addClass('icon-icon2');
					$('.wd_type').val($(this).attr('data-id'));
					if ($(this).attr('data-id') == 0) {
						//$('.type_name').text('支付宝');
					} else {
						//$('.type_name').text('微信');
					}
				})
			})
			$(document).ready(function() {
				$('.js_refuse').click(function() {
					var reason = $(this).attr('data-reason') || '请自行联系商家';
					$('#reason').text(reason);
					$('#fq_alert_refuse_msg').modal();
				})
				$('.js_pass').click(function() {
						$('#trade').text($(this).attr('data-trade'))
						$('#fq_alert_msg').modal();
					})
					//绑定支付宝账号显影
				if ("" == "") {
					$(".fq-alipay a").click(function() {
						$(".fq-alipay-message").slideToggle("slow", function() {
							if ($(".fq-alipay-message").is(":hidden")) {
								$(".fq-alipay-text").removeClass('fq-move');
								$(".fq-alipay-explain").css('display', 'inline-block');
								$(".fq-alipay-icon").removeClass('am-icon-angle-down').addClass('am-icon-angle-right');
								$(".fq-alipay a").css('border-bottom', 'none');
							} else {
								$(".fq-alipay-text").addClass('fq-move');
								$(".fq-alipay-explain").css('display', 'none');
								$(".fq-alipay a").css('border-bottom', '1px solid #F2EFED');
								$(".fq-alipay-icon").removeClass('am-icon-angle-right').addClass('am-icon-angle-down');
							}
						});
					});
				}
				$(".fq-wxpay a").click(function() {
					$(".fq-wxpay-message").slideToggle("slow", function() {
						if ($(".fq-wxpay-message").is(":hidden")) {
							$(".fq-wxpay-text").removeClass('fq-move');
							$(".fq-wxpay-explain").css('display', 'inline-block');
							$(".fq-wxpay-icon").removeClass('am-icon-angle-down').addClass('am-icon-angle-right');
							$(".fq-wxpay a").css('border-bottom', 'none');
						} else {
							$(".fq-wxpay-text").addClass('fq-move');
							$(".fq-wxpay-explain").css('display', 'none');
							$(".fq-wxpay a").css('border-bottom', '1px solid #F2EFED');
							$(".fq-wxpay-icon").removeClass('am-icon-angle-right').addClass('am-icon-angle-down');
						}
					});
				});
				$(".fq-card a").click(function() {
					$(".fq-card-message").slideToggle("slow", function() {
						if ($(".fq-card-message").is(":hidden")) {
							$(".fq-bank-card").removeClass('fq-move');
							$(".fq-card-explain").css('display', 'inline-block');
							$(".fq-card-icon").removeClass('am-icon-angle-down').addClass('am-icon-angle-right');
							$(".fq-card a").css('border-bottom', 'none');
						} else {
							$(".fq-bank-card").addClass('fq-move');
							$(".fq-card-explain").css('display', 'none');
							$(".fq-card a").css({
								'border-bottom': '1px solid #F2EFED',
								'position': 'relative'
							});
							$(".fq-card-icon").removeClass('am-icon-angle-right').addClass('am-icon-angle-down');
						}
					});
				});
				//转账记录显影
				$(".fq-withdraw-record").click(function() {
					$(".fq-record-message").slideToggle("slow", function() {
						if ($(".fq-record-message").is(":hidden")) {
							$(".fq-record-icon").removeClass('am-icon-angle-down').addClass('am-icon-angle-right');
							$(".fq-withdraw-record a").css('border-bottom', 'none');
						} else {
							$(".fq-record-icon").removeClass('am-icon-angle-right').addClass('am-icon-angle-down');
							$(".fq-withdraw-record a").css('border-bottom', '1px solid #F2EFED');
						}
					});
				});
				var value = $('#withdraw_count').val();
				var cash = parseFloat("");
				$('#withdraw_count').on('input', function() {
					var str = $(this).val();
					if (str != '') {
						if (str.match(/^(\d{1,})$/) == null && str.match(/^^(\d{0,}\.\d{0,2})$/) == null) {
							$(this).val(value);
						} else if (parseFloat(('0' + str)) > cash) {
							$(this).val(cash);
							value = cash;
						} else {
							value = str;
						}
					} else {
						value = str;
					}
				});
			});

			function back() {
				window.history.back();
			}
			//支付宝绑定
			$('.alipay_bound').click(function() {
				var ID = $('#alipay').val();
				var ID_name = $('#alipay_name').val();
				if (ID == "") {
					$('#fq_alert_info').text('支付宝账号不能为空');
					$('#fq_alert').modal();
					return false;
				}
				if (ID_name == "") {
					$('#fq_alert_info').text('真实姓名不能为空');
					$('#fq_alert').modal();
					return false;
				}
				$('#alipay_text').text($('#alipay').val());
				$('#alipay_name_text').text($('#alipay_name').val())
				$('#alipay_edit').modal({
					relatedTarget: this,
					onConfirm: function() {
						var alipay = $('#alipay_text').text();
						var alipay_name = $('#alipay_name_text').text();
						var alipay_openid = "";
						$.ajax({
							type: 'post',
							url: "./index.php?i=3&c=entry&do=ajax_alipay_bound&m=bsht_tbkdl",
							data: {
								'alipay': alipay,
								'alipay_name': alipay_name,
								'alipay_openid': alipay_openid
							},
							dataType: 'json',
							success: function(data) {
								if (data.status == 1) {
									$("#fq_confirm_infos").text(data.info);
									$('#fq_confirms').modal({
										closeViaDimmer: false,
										relatedTarget: this,
										onConfirm: function(options) {
											window.location.reload();
										}
									});
								} else {
									$("#fq_alert_info").text(data.info);
									$('#fq_alert').modal();
								}
							}
						});
					}
				})
			})
			//微信绑定
			$('.wxpay_bound').click(function() {
				var ID = $('#wxpay').val();
				var ID_name = $('#wxpay_name').val();
				var ID_mobile = $('#wxpay_mobile').val();
				var ID_qq = $('#wxpay_qq').val();
				if (ID == "") {
					$('#fq_alert_info').text('微信账号不能为空');
					$('#fq_alert').modal();
					return false;
				}
				if (ID_name == "") {
					$('#fq_alert_info').text('真实姓名不能为空');
					$('#fq_alert').modal();
					return false;
				}
				if (ID_mobile == "") {
					$('#fq_alert_info').text('手机号不能为空');
					$('#fq_alert').modal();
					return false;
				}
				if (ID_qq == "") {
					//$('#fq_alert_info').text('QQ号不能为空');
					//$('#fq_alert').modal();
					//return false;
				}
				$('#wxpay_text').text($('#wxpay').val());
				$('#wxpay_name_text').text($('#wxpay_name').val());
				$('#wxpay_mobile_text').text($('#wxpay_mobile').val());
				$('#wxpay_qq_text').text($('#wxpay_qq').val());
				$('#wxpay_edit').modal({
					relatedTarget: this,
					onConfirm: function() {
						var wxpay = $('#wxpay_text').text();
						var wxpay_name = $('#wxpay_name_text').text();
						var wxpay_mobile = $('#wxpay_mobile_text').text();
						var wxpay_qq = $('#wxpay_qq_text').text();
						var wxpay_openid = "";
						$.ajax({
							type: 'post',
							url: "./index.php?i=3&c=entry&do=ajax_wxpay_bound&m=bsht_tbkdl",
							data: {
								'wxpay': wxpay,
								'wxpay_name': wxpay_name,
								'wxpay_mobile': wxpay_mobile,
								'wxpay_qq': wxpay_qq,
								'wxpay_openid': wxpay_openid
							},
							dataType: 'json',
							success: function(dat) {
								console.log(dat);
								if (dat.status == 1) {
									$("#fq_confirm_infos").text(dat.info);
									$('#fq_confirms').modal({
										closeViaDimmer: false,
										relatedTarget: this,
										onConfirm: function(options) {
											window.location.reload();
										}
									});
								} else {
									$("#fq_alert_info").text(dat.info);
									$('#fq_alert').modal();
								}
							}
						});
					}
				})
			})
			//银行卡绑定
			$('.card_bound').click(function() {
				var yourname = $('#yourname').val();
				var cardnumber = $('#cardnumber').val();
				var card = $('#card').val();
				$('#truename').text($('#yourname').val());
				$('#bankcacd').text($('#cardnumber').val());
				$('#bank').text($('#card').val());
				$('#card_edit').modal({
					relatedTarget: this,
					onConfirm: function() {
						var truename = $('#truename').text();
						var bankcacd = $('#bankcacd').text();
						var bank = $('#bank').text();
						$.ajax({
							type: 'post',
							url: "/agent/bank_bound.html",
							data: {
								'truename': truename,
								'bankcacd': bankcacd,
								'bank': bank
							},
							success: function(data) {
								if (data.status == 1) {
									$("#fq_confirm_infos").text(data.info);
									$('#fq_confirms').modal({
										closeViaDimmer: false,
										relatedTarget: this,
										onConfirm: function(options) {
											window.location.reload();
										}
									});
								} else {
									$("#fq_alert_info").text(data.info);
									$('#fq_alert').modal();
								}
							}
						});
					}
				})
			})
			$('.withdraw').click(function() {
				var withdraw_count = $('#withdraw_count').val();
				var sum = "";
				var ti_openid = "";
				var change_type = $('.wd_type').val();
				if (change_type) {
					var wd_type = change_type;
				} else {
					var wd_type = '1';
				}
				if (wd_type == 0) {
					var alipay = "";
					var alipay_name = "";
					if (alipay == "") {
						$('#fq_alert_info').text('请绑定支付宝');
						$('#fq_alert').modal();
						return false;
					}
					if (withdraw_count == "") {
						$('#fq_alert_info').text('提现金额不能为空');
						$('#fq_alert').modal();
						return false;
					}
					var cash = parseFloat(('0' + $('#withdraw_count').val())).toFixed(2);
					if (cash == 0) {
						$('#fq_alert_info').text('提现金额不能为零');
						$('#fq_alert').modal();
						return false;
					}
					$('#alipay_withdraw_text').text($('.alipay_exit').text());
					$('#alipay_withdraw_count_text').text(cash);
					$('#alipay_withdraw').modal({
						relatedTarget: this,
						onConfirm: function() {
							var count = $('#withdraw_count').val();
							$.ajax({
								type: 'post',
								url: "./index.php?i=3&c=entry&do=ajax_ti&m=bsht_tbkdl",
								data: {
									'withdraw_count': count,
									'alipay': alipay,
									'alipay_name': alipay_name,
									'sum': sum,
									'wd_type': '0',
									'openid': ti_openid
								},
								dataType: 'json',
								success: function(data) {
									if (data.status == 1) {
										$("#fq_confirm_infos").text(data.info);
										$('#fq_confirms').modal({
											closeViaDimmer: false,
											relatedTarget: this,
											onConfirm: function(options) {
												window.location.reload();
											}
										});
									} else {
										$("#fq_alert_info").text(data.info);
										$('#fq_alert').modal();
									}
								}
							});
						}
					})
				} else {
					var wxpay = "";
					var wxpay_name = "";
					if (wxpay == "") {
						$('#fq_alert_info').text('请绑定微信账号');
						$('#fq_alert').modal();
						return false;
					}
					if (withdraw_count == "") {
						$('#fq_alert_info').text('提现金额不能为空');
						$('#fq_alert').modal();
						return false;
					}
					var cash = parseFloat(('0' + $('#withdraw_count').val())).toFixed(2);
					if (cash == 0) {
						$('#fq_alert_info').text('提现金额不能为零');
						$('#fq_alert').modal();
						return false;
					}
					$('#wxpay_withdraw_text').text($('.wxpay_exit').text());
					$('#wxpay_withdraw_count_text').text(cash);
					$('#wxpay_withdraw').modal({
						relatedTarget: this,
						onConfirm: function() {
							var count = $('#withdraw_count').val();
							$.ajax({
								type: 'post',
								url: "./index.php?i=3&c=entry&do=ajax_ti&m=bsht_tbkdl",
								data: {
									'withdraw_count': count,
									'wxpay': wxpay,
									'wxpay_name': wxpay_name,
									'sum': sum,
									'wd_type': '1',
									'openid': ti_openid
								},
								dataType: 'json',
								success: function(data) {
									if (data.status == 1) {
										$("#fq_confirm_infos").text(data.info);
										$('#fq_confirms').modal({
											closeViaDimmer: false,
											relatedTarget: this,
											onConfirm: function(options) {
												window.location.reload();
											}
										});
									} else {
										$("#fq_alert_info").text(data.info);
										$('#fq_alert').modal();
									}
								}
							});
						}
					})
				}
			})
		</script>
		<script>
			var ckua = navigator.userAgent.toLowerCase();
			if (ckua.match(/iphone/i) == "iphone") {
				if (/iphone/gi.test(navigator.userAgent) && (screen.height == 812 && screen.width == 375)) {
					console.log('X');
					$(".nb-menu").attr('style', 'bottom:1.8rem');
				}
			}
		</script>