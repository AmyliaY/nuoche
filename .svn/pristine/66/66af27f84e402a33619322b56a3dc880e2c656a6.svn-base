$(function() {
	//下拉与上拉加载	
	mui.init({
		pullRefresh: {
			container: '#pullrefresh',
			up: { //上拉加载
				//auto:true,//可选,默认false.自动上拉加载一次
				contentrefresh: '正在加载...',
				contentnomore: '没有更多数据了', //可选，请求完毕若没有更多数据时显示的提醒内容；
				callback: pullupRefresh
			}
		}
	});
	/*延迟加载*/
	var ServerUrl = null;
	var self = null;
	var ImgUrl = null;
	var page = 1;
	var count = null;
	var activeIndex = null;
	mui.plusReady(function() {
		ServerUrl = plus.storage.getItem("ServerUrl");
		ImgUrl = plus.storage.getItem("ImgUrl");
		self = plus.webview.getWebviewById("goodsType");
		activeIndex = self.index;
		getData();
	});
	window.addEventListener("changeType", function(e) {
		activeIndex = (e.detail.type);
		count == null;
		page = 1;
		$(".hot-content").html("");
		//重置刷新
		mui('#pullrefresh').pullRefresh().refresh(true);
		getData();
	});

	function pullupRefresh() {
		if(++page > count) {
			mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
			return;
		}
		mui('#pullrefresh').pullRefresh().endPullupToRefresh(false);
		getData();
	}

	function getData() {
		var data = {};
		if(count == null) { //说明是第一次加载或者切换了选项卡
			data = {
				type: activeIndex
			}
		} else {
			data = {
				type: activeIndex,
				page: page
			}
		}
		//查询选择商品分类的所有商品
		mui.ajax(ServerUrl + "home.do?p=getTypeGoods", {
			data: data,
			dataType: 'JSONP ',
			type: 'POST',
			timeout: 10000,
			success: function(data) {
				var map = eval("(" + data + ")");
				for(var key in map) {
					if(key == "count") {
						count = map[key];
					}
					if(key == "goods") {
						var goods = map[key];
						var fragment = document.createDocumentFragment();
						if(goods != null) {
							for(var i = 0; i < goods.length; i++) {
								var goodsDiv = document.createElement("div");
								goodsDiv.className = "col-xs-6 mb10";
								goodsDiv.id = goods[i].goodsId;
								goodsDiv.setAttribute("onclick","dian("+goods[i].goodsId+")");
								goodsDiv.innerHTML =
									'<a href="#">' +
									'<img src="img/layzr.gif" data-layzr=' + ImgUrl + goods[i].goodsImg + ' class="w100">' +
									'</a>' +
									'<div class="pro_detail">' +
									'<div class="pt10b3 texthidden">' +
									'<a href="#">' + goods[i].goodsName + '</a>' +
									'</div>' +
									'<div class="h20">' +
									'<span class="pro_price"><strong>￥' + goods[i].goodsPrice + '</strong></span>' +
									'<span class="pro_oriprice pull-right">销量' + goods[i].goodsSale + '</span>' +
									'</div>' +
									'</div>';

								fragment.appendChild(goodsDiv);
							}
							$(".hot-content").append(fragment);
							setJs();
						} else {
							var tishi = "<p style='text-align:center;background:inherit;padding-top:20px'>该分类目前没有没有商品哦</p>";
							$(".hot-content").html(tishi);
							mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
						}
					}
				}
			},
			error: function(xhr, type, errerThrown) {
				mui.toast('网络异常,请稍候再试');
				mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
			}
		});
	}

	function setJs() {
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
		var goods = document.querySelectorAll(".col-xs-6");
		for(var i = 0; i < goods.length; i++) {
			goods[i].ontouchstart = function() {
				$(this).find("img").css("opacity", "0.7");
			}
			goods[i].ontouchend = function() {
				$(this).find("img").css("opacity", "1");
			}
		}
	}

});

function dian(sid) {
		mui.openWindow({
			id: 'detail',
			url: 'detail.html',
			show: {
				aniShow: 'slide-left',
				duration: 200
			},
			extras: {
				sid: sid
			}
		});

	}