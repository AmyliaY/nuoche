<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.util.URLManager"%>
<%@page import="weixin.popular.util.JSSDKUtil"%>
<%@page import="weixin.popular.api.QrcodeAPI"%>
<%@page import="weixin.popular.bean.QrcodeTicket"%>
<%@page import="com.listener.WeixinGetAccessTokenListen"%>
<%@page import="com.pojo.Userinfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport"
			content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>我的二维码</title>
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/weixin/css/mui.min.css">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/weixin/css/icons-extra.css" />
		<script type="text/javascript"
			src="http://res.wx.qq.com/open/js/jweixin-1.1.0.js"></script>
	</head>
	<style>
body {
	background-color: #ffffff;
}

.saoyisao {
	color: #888888;
}

#topPopover {
	position: fixed;
	top: 16px;
	right: 6px;
}

#topPopover .mui-popover-arrow {
	left: auto;
	right: 6px;
}

span.mui-icon {
	font-size: 14px;
	color: #007aff;
	margin-left: -15px;
	padding-right: 10px;
}

.mui-popover {
	height: 100px;
}

.mui-content {
	padding: 10px;
}
</style>
	<body>
		<img id="img" src='_www/img/300300.jpg' style="display: none;" />
		<div style="width: 100%; text-align: center; padding-top: 40%;">
			<div style="width: 100%;">
				养生商城会员
			</div>
			<br>
			<div style="width: 100%">
				<div id="code"></div>
			</div>
			<br>
			<span class="saoyisao">扫一扫二维码，注册养生商城！</span>
		</div>
			<%
		
		    Userinfo userinfo = (Userinfo)session.getAttribute("userinfo");
		    if (userinfo==null)
		    {
		       out.println("请登录");
		       return;
		    }
		    
		    JSSDKUtil.setJsSdkParam(request);
		
		    QrcodeAPI qrcodeAPI = new QrcodeAPI();
		    //qrcodeAPI.qrcodeCreateTemp(WeixinGetAccessTokenListen.access_token,1800, userinfo.getUsersId().intValue());
		    QrcodeTicket qrcodeTicket = qrcodeAPI.qrcodeCreateFinal(WeixinGetAccessTokenListen.access_token,userinfo.getUsersPhone());
		    String ticket = qrcodeTicket.getTicket();
		    String url = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket="+ticket;
		 %>
	

		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/weixin/js/jquery-1.9.0.min.js"></script>
		
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/weixin/js/jquery.qrcode.min.js"></script>
			
		<script>
		
		
			mui.init();
//			mui.plusReady(function () {
//				var view = plus.nativeObj.View.getViewById("title");
//				
//				var bitmap = new plus.nativeObj.Bitmap("back");
//				bitmap.loadBase64Data("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAMAAABg3Am1AAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAb1BMVEUAAAAAev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8Aev8AAACubimgAAAAI3RSTlMAGfUTGfQTGPMSGPIYGhgaGBsXGxcbFxwXHBccFhwWHRYdHWufDPQAAAABYktHRACIBR1IAAAAB3RJTUUH4QETEBwooeTlkQAAAJVJREFUSMft1EkSgkAQRNFGUXFWHBDBibr/HTUwD5B/48Ig1y+io7u6MqUhf5hsNEY+j5hMgZ/FJ8Xc9ovos3T96utjbfqN/Nb0O/m96Uv5g+mP8ifTn+Ur01/ka9Nf5RvTt/I309/lH6Z/yr9Mn+Q71/MT8B34K/E58Enzv8R/K98HvnF8p3lr8F7izce7lbf3kJ/lDQp9HdBhgg3PAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE3LTAxLTE5VDE2OjI4OjQwKzA4OjAwpTDFwQAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxNy0wMS0xOVQxNjoyODo0MCswODowMNRtfX0AAAAASUVORK5CYII=");
//				view.drawBitmap(bitmap, {}, {
//					top: "10px",
//					left: "10px",
//					width: "24px",
//					height: "24px"
//				});
//				
//				view.setTouchEventRect({top:"0px",left:"0px",width:"44px",height:"100%"});
//			});
		var	userid='${userinfo.usersId}';
		
		if(userid.trim().length > 0){
			//Usershow(Userinfo);
		}else{
			window.top.location = "${pageContext.request.contextPath}/weixin/home/login.jsp";					
		}
		
		
		var userPhone='${userinfo.usersPhone}'; 
		window.onload = function (){
			$('#code').qrcode("<%=url%>"); //二维码链接
 			
          //  updateSerivces(); 
			
		}
 		
         
        var sharehref="<%=url%>";
		var sharehrefTitle="我的二维码";//链接标题
		var sharehrefDes="扫一扫，注册养生商城";//链接描述
        
			
			//---------------------------------------------------------------------------------
			
			
			
			wx.config({
				    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
				    appId: '${appId}', // 必填，公众号的唯一标识
				    timestamp:'${timestamp}' , // 必填，生成签名的时间戳
				    nonceStr: '${nonceStr}', // 必填，生成签名的随机串
				    signature: '${signature}',// 必填，签名，见附录1
				    jsApiList: ["chooseImage","onMenuShareTimeline","onMenuShareAppMessage","onMenuShareQQ","onMenuShareWeibo","onMenuShareQZone"] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
              });
              
               wx.ready(
               
               function(){
		             var memid='${memid}';
		             var dd='<%=URLManager.getServerURL(request)%>/app/zhuce.html?userPhone=<%= userinfo.getUsersPhone() %>';
		             var tubiao='<%=URLManager.getServerURL(request)%>/weixin/weixinImage/weixin.jpg';
		             var ds='归真太极养生';
		             var tit= '注册新会员'
		             wx.onMenuShareAppMessage({
					    title:tit, // 分享标题
					    desc:ds, // 分享描述
					    link: dd, // 分享链接
					    imgUrl: tubiao, // 分享图标
					    type: '', // 分享类型,music、video或link，不填默认为link
					    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
					    success: function () { 
					        // 用户确认分享后执行的回调函数
					    },
					    cancel: function () { 
					        // 用户取消分享后执行的回调函数
					    }
		             }); 

					wx.onMenuShareTimeline({
				    title:tit, // 分享标题
				    link:dd, // 分享链接
				    imgUrl:tubiao, // 分享图标
				    success: function () { 
				        // 用户确认分享后执行的回调函数
				    },
				    cancel: function () { 
				        // 用户取消分享后执行的回调函数
				    }
                   });
            

                  // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
               }
               );
           
           
			
		</script>
	</body>
</html>
