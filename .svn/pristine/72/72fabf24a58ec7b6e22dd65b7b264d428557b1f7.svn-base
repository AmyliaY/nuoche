$(document).ready(function() {
	var ServerUrl = null;
	mui.init({
		statusBarBackground: '#f7f7f7'
	});
	var btn=document.querySelector(".mui-icon-weixin");
	var ServerUrl=null;
	mui.plusReady(function() {
		plus.screen.lockOrientation("portrait-primary");
		ServerUrl=plus.storage.getItem("ServerUrl");
				//第三方登录
		var authBtns = ['weixin']; //配置业务支持的第三方登录
		var auths = {};
		var oauthArea = document.querySelector('.oauth-area');
		plus.oauth.getServices(function(services) {
			for(var i in services) {
				var service = services[i];
				auths[service.id] = service;
				if(~authBtns.indexOf(service.id)) {
					var isInstalled = app.isInstalled(service.id);
					//如果微信未安装，则为不启用状态
					btn.authId = service.id;
				}
			}
			$(oauthArea).on('tap', '.oauth-btn', function() {
				if(this.classList.contains('disabled')) {
					plus.nativeUI.toast('您尚未安装微信客户端');
					return;
				}
				var auth = auths[this.authId];
				var waiting = plus.nativeUI.showWaiting();
				auth.login(function() {
					plus.nativeUI.toast("登录认证成功");
					auth.getUserInfo(function() {
						
						
						plus.nativeUI.toast("获取用户信息成功");
						var name = auth.userInfo.nickname || auth.userInfo.name;
						var headimgurl = auth.userInfo.headimgurl;
						var openid = auth.userInfo.openid;
						var city=auth.userInfo.city ;
						var province=auth.userInfo.province;
						mui.post(ServerUrl+"appuser.do?p=loginBywechat",{
							name:name,
							headimgurl:headimgurl,
							openid:openid
						},function(data){
							var d=eval("("+data+")");
							if(d.uid!=null){
								var view=plus.webview.currentWebview().opener();
								plus.storage.setItem("username", name);
								plus.storage.setItem("headimgurl", headimgurl);
								plus.storage.setItem("city", city);
								plus.storage.setItem("province", province);
								plus.storage.setItem("uid",d.uid);
								mui.fire(view,"setUid",{uid:parseInt(d.uid)});
								mui.fire(plus.webview.getWebviewById("cart.html"),"shuaxingwc",{memId:d.uid});
								view.evalJS("$('#userinfo').find('img').attr('src','"+headimgurl+"')");
								view.evalJS("$('#userinfo').attr('index','1')");
								view.evalJS("$('#userinfo').find('.userName').html('"+name+"')");
								waiting.close();
								mui.back();
							}else{
								waiting.close();
								mui.toast("登录异常，请稍候重试");
							}
							
						});
					}, function(e) {
						waiting.close();
						plus.nativeUI.toast("获取用户信息失败：" + e.message);
					});
				}, function(e) {
					waiting.close();
					plus.nativeUI.toast("登录认证失败：" + e.message);
				});
			});
		}, function(e) {
			oauthArea.style.display = 'none';
			plus.nativeUI.toast("获取登录认证失败：" + e.message);
		});

		// close splash
		setTimeout(function() {
			//关闭 splash 
			plus.navigator.closeSplashscreen();
		}, 600);
	});
	$("#btn_login").click(function(){
		plus.nativeUI.showWaiting("正在登录中")
		//loginByaccount
		var phone=document.getElementById("phone").value;
		var pwd=document.getElementById("password").value;
		mui.ajax(ServerUrl+"appuser.do?p=loginByaccount", {
	        data:{
	        	phone:phone,
				pwd:pwd 
	        },
	        dataType: 'JSONP ',
	        type: 'POST',
	        timeout: 10000,
	        success: function(data) {
	        	if(data!=""){
	        	var obj=eval("("+data+")");
				if(obj.memId!=null&&obj.memId!=""){
					var view=plus.webview.currentWebview().opener();
					mui.fire(view,"setUid",{uid:parseInt(obj.memId)});
					plus.storage.setItem("username", obj.memNickname);
					plus.storage.setItem("headimgurl", obj.memHeadimg);
					plus.storage.setItem("uid",obj.memId);
					view.evalJS("$('#userinfo').find('img').attr('src','"+obj.memHeadimg+"')");
					view.evalJS("$('#userinfo').attr('index','1')");
					view.evalJS("$('#userinfo').find('.userName').html('"+obj.memNickname+"')");
					plus.nativeUI.closeWaiting();
					mui.back();
				}}
	        	else{
					mui.toast("账号或者密码有误");
					plus.nativeUI.closeWaiting();
				} 
				
	        },
	        error: function(xhr, type, errerThrown) {
				plus.nativeUI.closeWaiting();
				mui.toast('网络异常,请稍候再试');
	        }
	     });    
	});
	$(".forget").click(function(){
		mui.openWindow({
			id: 'mimabdPhone',
			url: 'mimabdPhone.html',
			show: { //跳转方式
				aniShow: 'pop-in',
				duration: 100
			}
		});
	});
	
});