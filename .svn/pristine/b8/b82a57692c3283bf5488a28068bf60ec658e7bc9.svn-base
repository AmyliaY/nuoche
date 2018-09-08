<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" import="java.lang.*" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<!--<base href="/static_files/"/>-->

<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<!--<meta content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;" name="viewport">-->
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<meta charset="utf-8">
<meta name="description" content="" /><!--网站描述-->
<meta name="keywords" content="" /><!--网站关键字-->
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0,maximum-scale=1.0"/>
<!--width - viewport的宽度 height - viewport的高度
initial-scale - 初始的缩放比例
minimum-scale - 允许用户缩放到的最小比例
maximum-scale - 允许用户缩放到的最大比例
user-scalable - 用户是否可以手动缩放-->
<link href="${pageContext.request.contextPath }/weixin/css/css.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/weixin/css/style.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/weixin/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/weixin/css/font-awesome.css" rel="stylesheet" type="text/css">

<!--页面滚动插件-->


<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/jquery.form.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/popwin.js"></script>
<style>


.button {
	display: inline-block;
	cursor:pointer;
	outline: none;
	text-align: center;
	text-decoration: none;
	font: 16px/100% 'Microsoft yahei',Arial, Helvetica, sans-serif;
	padding: .5em 2em .55em;
	-webkit-border-radius: .5em; 
	-moz-border-radius: .5em;
	border-radius: .5em;
	color: #606060;
	border: solid 1px #b7b7b7;
	background: #ededed;
	width: calc(63% - 5px);
}
.button:hover {
	text-decoration: none;
	background: #fff;
}
.button:active {
	position: relative;
	top: 1px;
	color: #999;
}

</style>         
<title>车主信息</title>

</head>
<body>

<div id="wrapper" style="top: 0;bottom:0">
	<ul>
		<li class="paymentIngT">车主信息</li>
		
		
		<li>			
			
			<div class="pay_txt" style="color: #999;">
				&nbsp;车&nbsp;牌&nbsp;号： ${user.plateNumber }<br />
			</div>
			<div class="pay_txt" style="color: #999;">
				车主姓名：${fn:substring(user.name,0,1) }先生/女士 <br />
			</div>
			<div class="pay_txt" style="color: #999;">
				所在位置：<input style="border: 0px;width: 70%;font-size: 15px;color: #c1c1c1;" type="text" placeholder="正在定位当前城市..."  id="weixin1" name="weizhin" value="">
			</div>
			
			<div class="pay_txt" id="tz" style="color: #999;display: block;">
				<span class="fill_inB"><input type="text" placeholder="" style="font-size:15px;color: #ff0000;"  id="tz1" name="" value=""></span>
			</div>
			
			
		</li>
		<li class="butB" name="li1">
			
			<form action="" method="post" name="myform">
				<input type="button" class="button" value="微信通知"  id="phone_btn" name="phone" onclick="showtime(10)">
			</form>
			
		</li>
		
		<li class="butB" name="li1">
			
			<form action="" method="post" name="myform3">
				<input type="button" class="button" value="平台通知"  id="phone_btn" name="phone3" onclick="showtime2(90)">
			</form>
			
		</li>
		
		<li class="butB" name="li1">
			
			<form action="" method="post" name="myform4" id="myform4">
				<input type="button" class="button" value="电话通知"  id="phone_btn" name="phone4" onclick="showtime4()">
			</form>
			
		</li>
		
	
		<%-- <li class="butB" name="li2">
			
			<form action="${pageContext.request.contextPath }/move.do?p=dhtongzhi" method="post" name="myform2">
				<input type="submit" class="button" value="电话通知"  id="phone_btn" name="phone2">
			</form>
		</li> --%>
		
		

	</ul>
	<div>
		<c:if test="${sessionScope.gz == 1}">
		       长按二维码关注，享受更多优惠 <br/>
		   <img src="${pageContext.request.contextPath}/weixin/images/weixin.jpg" style="width:180px;height:180px;" />
		</c:if>
	</div>
</div>










<!-- 确认 弹窗 -->
<div class="pop" id="checkWin" style="display: none;">
	<div class="popC">
		<div class="pop_tit">操作确认</div>
		<div class="popCC"><strong id="checkMsgTip"></strong></div>
		<div class="popBut">
			<a onclick="hidePopWin()">取 消</a>
			<a id="btnCheck" class="butRed">确 认</a>
		</div>
	</div>
</div>

<!-- 提示 弹窗 -->
<div class="pop" id="msgWin" style="display: none;">
	<div class="popC">
		<div class="pop_tit">操作提示</div>
		<div class="popCC"><strong id="msgTip">提示语</strong></div>
		<div class="popBut">
			<a onclick="hidePopWin()" class="butRed">确 定</a>
		</div>
	</div>
</div>

<!-- loading 弹窗 -->
<div class="pop" id="loadingWin" style="display: none;">
	<div class="popC">
		<div class="popCC"><strong id="loadingMsg"></strong></div>	
	</div>
</div>




</script>
<script type="text/javascript" src="js/wxshare.js"></script>

 <input type="hidden" value="${weixinhao}" id="weixinhao" />
    

 <script>
var secs = 30;
document.agree.agreeb.disabled=true;
for(var i=1;i<=secs;i++) {
	window.setTimeout("update(" + i + ")", i * 1000);
}
function update(num) {
	if(num == secs) {
		document.agree.agreeb.value =" 我 同 意 ";
		document.agree.agreeb.disabled=false;
	}
	else {
		var printnr = secs-num;
		document.agree.agreeb.value = "请认真查看<服务条款和声明> (" + printnr +")";
	}
}

function showtime(t){
	document.myform.phone.disabled=true;
	
	var weizhin = document.getElementById("weixin1").value;
		var url="${pageContext.request.contextPath}/move.do?p=dxtongzhi&wxh=${user.weixinUser.openid }&tel=${user.tel}&chepai=${user.plateNumber}&cpqz=${user.chepaiqianzhui}&user_wx=${user_wx}";
		var param={weizhin:weizhin};
		$.post(url,param,function(data){
		var json=eval("("+data+")");
			if (json[0] == "yes") 
			{	
				$("#tz1").val("平台已发送微信信息给车主，正在等待车主回复");
				setInterval(function() {
					var url="${pageContext.request.contextPath}/move.do?p=cxzt&wxh=${user.weixinUser.openid }&tel=${user.tel}&mcid="+json[1];
					var param={};
					$.post(url,param,function(data2){
						if(data2 == "yes"){
							document.getElementById("tz1").value = "车主已收到您的消息，请您耐心等待...";
						}
					
					});
				}, 1000);
			}else{
				$("#tz1").val("平台发送微信信息给车主失败");
			}
			
		});
	
	for(i=1;i<=t;i++) {
		window.setTimeout("update_p(" + i + ","+t+")", i * 1000);
	}

}

function update_p(num,t) {
	if(num == t) {
		document.myform.phone.value =" 重新发送 ";
		document.myform.phone.disabled=false;
	}
	else {
		printnr = t-num;
		document.myform.phone.value = " (" + printnr +")秒后重新发送";
	}
}

function showtime2(t){
	document.myform3.phone3.disabled=true;
	$("#tz1").val("等待平台通知");
	var weizhin = document.getElementById("weixin1").value;
		var url="${pageContext.request.contextPath}/move.do?p=pttongzhi&wxh=${user.weixinUser.openid }&tel=${user.tel}&chepai=${user.plateNumber}&cpqz=${user.chepaiqianzhui}&user_wx=${user_wx}";
		var param={weizhin:weizhin};
		$.post(url,param,function(data){
		var json=eval("("+data+")");
		
			if (json[0] == "yes") 
			{	
				$("#tz1").val("平台正在语音通知");
				setInterval(function() {
					var url="${pageContext.request.contextPath}/move.do?p=cxzt&wxh=${user.weixinUser.openid }&tel=${user.tel}&mcid="+json[1];
					var param={};
					$.post(url,param,function(data2){
						if(data2 == "yes"){
							document.getElementById("tz1").value = "车主已收到您的消息，请您耐心等待...";
						}
					
					});
					
					
				
				
				
				}, 1000);
				
			}else{
				alert("发送失败");
			}
			
		});
	
	for(i=1;i<=t;i++) {
		
		window.setTimeout("update_p2(" + i + ","+t+")", i * 1000);
	}

}

function update_p2(num,t) {
	/* var url="${pageContext.request.contextPath}/move.do?p=cxzt&mcid=${mcid}";
		var param={'weixinhao':$("#weixinhao").val()};
		$.post(url,param,function(data){
			if (data == "yes") 
			{	
				alert("发送成功，请稍等");
			}else{
				alert("发送失败");
			}
			
		}); */
	if(num == t) {
		if(document.getElementById("tz1").value == "车主已收到您的消息，请您耐心等待..."  ){
		document.getElementById("tz1").value = "车主手机可能已关机，暂时无法联系..";
		
		}
		document.myform3.phone3.value =" 重新发送  ";
		document.myform3.phone3.disabled=false;
	}
	else {
		printnr = t-num;
		document.myform3.phone3.value = " (" + printnr +")秒后重新发送";
	}
}

function showtime4(){
	
	var weizhin = document.getElementById("weixin1").value;
	var url="${pageContext.request.contextPath}/move.do?p=dianhua&utel=${user.tel}&uwx=${user.weixinUser.openid}&weizhin="+weizhin;
	document.myform4.action=url;
	document.myform4.submit();

}




</script>

<script src="http://map.qq.com/api/js?v=2.exp"></script>

<script>
    
	wx.config( {
		debug : false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
		appId : '${appId}', // 必填，企业号的唯一标识，此处填写企业号corpid
		timestamp : parseInt("${timestamp}", 10), // 必填，生成签名的时间戳
		nonceStr : '${nonceStr}', // 必填，生成签名的随机串
		signature : '${signature }',// 必填，签名，见附录1
		jsApiList : [ 'getLocation' ]
	// 必填，需要使用的JS接口列表，所有JS接口列表见附录2
			});
	
	wx.ready(function() {
	var weizhi = document.getElementById('weixin1');
			wx.getLocation( {

							success : function(res) {
							
							
							latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
					        longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
					        var speed = res.speed; // 速度，以米/每秒计
					        var accuracy = res.accuracy; // 位置精度
					        let geocoder = new qq.maps.Geocoder({
					           complete: function (result) {
					              //weizhi.value = result.detail.address;
					              province = result.detail.addressComponents.province;//获取省份  
						          city = result.detail.addressComponents.city;//获取城市  
						          address = result.detail.addressComponents.district;//区
						          street  = result.detail.addressComponents.street; //街
						          streetNum = result.detail.addressComponents.streetNumber;//号
					              weizhi.value = province+city+address+street+streetNum+"附近";
					            }
					        })
					       var coord = new qq.maps.LatLng(res.latitude, res.longitude);
					       geocoder.getAddress(coord);
       
							
							
							
							
							/* var geocoder = new qq.maps.Geocoder({
		               			complete: function (result) {
		                    var province = result.detail.addressComponents.province;
						    var city = result.detail.addressComponents.city;
						    var district=result.detail.addressComponents.district;
						   alert(province+city+district);
						    
			               
			                cityPicker.pickers[0].setSelectedValue(provinceId);
				            cityPicker.pickers[1].setSelectedValue(cityId);
				            cityPicker.pickers[2].setSelectedValue(districtId);
		                    cityResult.innerText=province+" "+city+" "+district;
		                    countryid = districtId; 
		                    ajax();
		                    
		                }
                    });	
                    	var coord = new qq.maps.LatLng(res.latitude, res.longitude);
                    	geocoder.getAddress(coord)
                    	alert(cityResult); */
                    	
                    	
                    	
						},
						fail : function(error) {
							AlertUtil.error("获取地理位置失败，请确保开启GPS且允许微信获取您的地理位置！");
						}
						});
			});

	wx.error(function(res) {
	});
</script>





</body>




</html>

