<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>请填写您的电话</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<!--标准mui.css-->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/weixin/css/mui.min.css">
		
	</head>
	
	<body>
		<header class="mui-bar mui-bar-nav">
			<h1 class="mui-title">填写本机手机号码</h1>
		</header>
		<div class="mui-content">
			<div class="mui-card">
						<div class="mui-collapse-content">
							<form class="mui-input-group" action="${pageContext.request.contextPath}/move.do?p=bohaopan2" method="post" id="formgo">
								
								<div class="mui-input-row">
									<label style="width: 100%;
									
									
									">填写本机手机号码并接听等待回拨</label>
								</div>
								<div class="mui-input-row">
									<label style="width: 40%;">电&nbsp&nbsp&nbsp&nbsp话</label>
									<input type="text" style="width: 60%;" id="tel" name="tel" class="mui-input-clear" value="${wxuser.wxtel}" placeholder="请输入电话号码">
									<input type="hidden" style="width: 60%;" id="bhpwxh" name="bhpwxh" class="mui-input-clear" value="${wxuser.openid}" placeholder="请输入电话号码">
									<input type="hidden" style="width: 60%;" id="calltime" name="calltime" class="mui-input-clear" value="${wxuser.timeLeft}" placeholder="请输入电话号码">
									<input type="hidden" style="width: 60%;" id="uwx" name="uwx" class="mui-input-clear" value="${uwx}" placeholder="请输入电话号码">
									<input type="hidden" style="width: 60%;" id="str" name="str" class="mui-input-clear" value="${utel}" placeholder="请输入电话号码">
									<input type="hidden" style="width: 60%;" id="weizhin" name="weizhin" class="mui-input-clear" value="${weizhin}" placeholder="请输入电话号码">
								</div>
								<div class="mui-input-row">
									<label style="width: 40%;">免费剩余分钟</label>
									
									<input type="text" style="width: 60%;" id="tel1" class="mui-input-clear" value="${empty wxuser.timeLeft ? 0 : wxuser.timeLeft}" placeholder="" readonly="readonly">
								</div>
								
								
								
							
							
		
								<div class="mui-button-row" style="height: 60px; margin-top: 5%;">
									 <button type="button" class="mui-btn mui-btn-primary mui-btn-block" onclick="go()">确定</button>
								</div>
							</form>
						</div>
			</div>
		</div>
		<script src="${pageContext.request.contextPath }/weixin/js/mui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js"></script>
		<script>
			function go(){
			
            var str = window.document.getElementById("tel").value;
            var calltime = window.document.getElementById("calltime").value;
            var re = /^134[0-8]\d{7}$|^13[^4]\d{8}$|^14[5-9]\d{8}$|^15[^4]\d{8}$|^16[6]\d{8}$|^17[0-8]\d{8}$|^18[\d]{9}$|^19[8,9]\d{8}$ /;
            if(${wxuser!=null}){
	            if(calltime > 0){
	 				if(re.test(str)){
	 					$("#formgo").submit();
	 					return;
	 				}else{
	  				alert("请您填写正确的手机号码！");
	  					return false;
	 				}
	 			}else{
	 			alert("余额不足，请及时充值");
	 			return false;
	 			}
	 		}else{
	 			alert("请关注微信公众号");
	 			return false;
	 		}
 			
 			
           }
		</script>
	</body>

</html>