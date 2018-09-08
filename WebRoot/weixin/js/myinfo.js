$(document).ready(function() {
	mui.init();
	var ServerUrl = null;
	var uid=null;
	mui.plusReady(function() {
		uid=plus.storage.getItem("uid");
		ServerUrl = plus.storage.getItem("ServerUrl");
		mui.ajax(ServerUrl + "appuser.do?p=getMyinfo", {
			data: {
				uid:uid
			},
			dataType: 'JSONP ', 
			type: 'POST',
			timeout: 10000,
			success: function(data) { 
				var d=eval("("+data+")");
				var fphone=d.bdphone;
				var xsphone="";
				if(fphone!=""){
					$(".head").find("img").attr("src",plus.storage.getItem("headimgurl"));
					$(".username").find("span").last().html(plus.storage.getItem("username"));
					$(".province").find("span").last().html(plus.storage.getItem("province"));
					$(".city").find("span").last().html(plus.storage.getItem("city"));
					if(fphone!="null"){
						for(var i = 0; i < fphone.length; i++) {
							if(i > 2 && i < 7) {  
								xsphone = xsphone + "*";
							} else {
								xsphone = xsphone + fphone[i]; 
							}
						}
						$("#phone").find("span:nth-child(2)").html(xsphone);
					}else{
						$("#phone").find("span:nth-child(2)").html("未绑定");
					}
					
				}else{
					$("#phone").find("span:nth-child(2)").html("未绑定");
				}
				
			},
			error: function(xhr, type, errerThrown) {
				mui.toast('网络异常,请稍候再试');
			}
		});
	});
	$(".phone").click(function() {
		var content=$(this).find("span:nth-child(2)").html();
		var title="取消绑定手机";
		var op=0;
		if(content=="未绑定"){
			op=1;
			title="添加绑定手机";
		}
		var btnArray = [{
			title: "确定"
		}];
		plus.nativeUI.actionSheet({
			title: title,
			cancel: "取消",
			buttons: btnArray
		}, function(e) {
			var index = e.index;
			if(index==1){
				if(op==1){
					mui.openWindow({
						id: 'bdPhone',
						url: 'bdPhone.html',
						show: { //跳转方式
							aniShow: 'pop-in',
							duration: 100
						}
					});
				}else{
					
				}
				
			}
		});
	});
	$(".zfpwd").click(function() {
		var btnArray = [{
			title: "确定"
		}];
		plus.nativeUI.actionSheet({
			title: "修改支付密码",
			cancel: "取消",
			buttons: btnArray
		}, function(e) {
			var index = e.index;
			if(index==1){
				mui.openWindow({
					id: 'yzm',
					url: 'yzm.html',
					show: { //跳转方式
						aniShow: 'pop-in',
						duration: 100
					},
					extras:{
						type:1
					}
				});
			}
		});
	});
	$(".dlpwd").click(function() {
		var btnArray = [{
			title: "确定"
		}];
		plus.nativeUI.actionSheet({
			title: "修改登录密码",
			cancel: "取消",
			buttons: btnArray
		}, function(e) {
			var index = e.index;
			if(index==1){
				mui.openWindow({
					id: 'yzm',
					url: 'yzm.html',
					show: { //跳转方式
						aniShow: 'pop-in',
						duration: 100
					},
					extras:{
						type:0
					}
				});
			}
			
		});
	});
});