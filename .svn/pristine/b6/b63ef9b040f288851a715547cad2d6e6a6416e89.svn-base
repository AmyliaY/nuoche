
var page=1;
	var count=null;
	var ServerUrl = null;
	var ImgUrl = null; 
	
$(document).ready(function() {
	mui.init({
		pullRefresh: {
			container: '#pullrefresh',
			up: {
				contentrefresh: '正在加载...',
				callback: pullupRefresh
			}
		}
	});
	
	mui.plusReady(function() {
		var height = localStorage.getItem("height");
		$(".list_show").css("height", height);
		ServerUrl = plus.storage.getItem("ServerUrl");
		ImgUrl = plus.storage.getItem("ImgUrl");
		mui.ajax(ServerUrl+"home.do?p=yuyueGoods", {
	        data:{},
	        dataType: 'JSONP ',
	        type: 'POST',
	        timeout: 10000,
	        success: function(data) {
	        	var map=eval("("+data+")");
	        	for(key in map){
	        		if(key=="count"){
	        			count=parseInt(map[key]);
	        		}else{
	        			var yuyueGoods=map[key];
	        			var fragment=document.createDocumentFragment();
	        			if(yuyueGoods!=null){
	        				for(var i=0;i<yuyueGoods.length;i++){
		        				var goodsDiv=document.createElement("div");
		        				goodsDiv.className="col-xs-6 mb10";
		        				goodsDiv.id=yuyueGoods[i].goodsId;
		        				goodsDiv.innerHTML=
					        					'<a href="#">'+
													'<img src="img/layzr.gif" data-layzr='+ImgUrl+yuyueGoods[i].goodsImg+' class="w100">'+
												'</a>'+
												'<div class="pro_detail">'+
													'<div class="pt10b3 texthidden">'+
														'<a href="#">'+yuyueGoods[i].goodsName+'</a>'+
													'</div>'+
													'<div class="h20">'+
														'<span class="pro_price"><strong>￥'+yuyueGoods[i].goodsPrice+'</strong></span>'+
														'<span class="pro_oriprice pull-right">￥'+yuyueGoods[i].goodsyyprice+'</span>'+
													'</div>'+
												'</div>';
								fragment.appendChild(goodsDiv);				
		        			}
		        			$(".hot-content").append(fragment);
		        			setJs();
	        			}else{
	        				var p=document.createElement("p");
	        				$(p).css({"color":"#666","text-align":"center","padding-top":"20px"});
	        				p.innerHTML="目前没有预约商品哦";
	        				$(".hot-content").append(p);
	        			}
	        			
	        		}
	        	}
	        },
	        error: function(xhr, type, errerThrown) {
	            mui.toast('网络异常,请稍候再试');
	             
	            mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
	        }
	     });    
	});
	function pullupRefresh(){
		if(++page>count){
			mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
			return;
		}
		mui('#pullrefresh').pullRefresh().endPullupToRefresh(false);
		mui.ajax(ServerUrl+"home.do?p=yuyueGoods", {
	        data:{
	        	page:page
	        },
	        dataType: 'JSONP ',
	        type: 'POST',
	        timeout: 10000,
	        success: function(data) {
	        	var map=eval("("+data+")");
	        	for(key in map){
	        		if(key!="count"){
	        			var yuyueGoods=map[key];
	        			var fragment=document.createDocumentFragment();
	        			for(var i=0;i<yuyueGoods.length;i++){
	        				var goodsDiv=document.createElement("div");
	        				goodsDiv.className="col-xs-6 mb10";
	        				goodsDiv.id=yuyueGoods[i].goodsId;
	        				goodsDiv.innerHTML=
				        					'<a href="#">'+
												'<img src="img/layzr.gif" data-layzr='+ImgUrl+yuyueGoods[i].goodsImg+' class="w100">'+
											'</a>'+
											'<div class="pro_detail">'+
												'<div class="pt10b3 texthidden">'+
													'<a href="#">'+yuyueGoods[i].goodsName+'</a>'+
												'</div>'+
												'<div class="h20">'+
													'<span class="pro_price"><strong>￥'+yuyueGoods[i].goodsPrice+'</strong></span>'+
													'<span class="pro_oriprice pull-right">￥'+yuyueGoods[i].goodsyyprice+'</span>'+
												'</div>'+
											'</div>';
							fragment.appendChild(goodsDiv);				
	        			}
	        			$(".hot-content").append(fragment);
	        			setJs();
	        		}
	        	}
	        },
	        error: function(xhr, type, errerThrown) {
	            mui.toast('网络异常,请稍候再试');
	            mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
	        }
	    });
	}
	function setJs(){
		var layzr = new Layzr({
			container: null,
			selector: '[data-layzr]',
			attr: 'data-layzr',
			retinaAttr: 'data-layzr-retina',
			bgAttr: 'data-layzr-bg',
			hiddenAttr: 'data-layzr-hidden',
			threshold: 0,
			callback: null
		});
		var goods=document.querySelectorAll(".col-xs-6");
		for(var i=0;i<goods.length;i++){
			goods[i].ontouchstart = function() {
				$(this).find("img").css("opacity", "0.7");
			}
			goods[i].ontouchend = function() {
				$(this).find("img").css("opacity", "1");
			}
			goods[i].onclick = function() {
				var goodsId=parseInt($(this).attr("id"));
				mui.openWindow({ 
					id: 'yuyuedate',
					url: 'yuyuedate.html',
					show: {
						aniShow: 'pop-in',
						duration: 100
					},
					waiting: {
						autoShow: false
					},
					extras:{
						type:1,//1代表预约商品
						sid:goodsId
					}
				});
			};
		}
	}
});