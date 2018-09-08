$(document).ready(function() {
	var db = openDatabase('mylocaldatabase', '1.0', '用户购物车本地数据库', 2 * 1024 * 1024);
	mui.init({
		pullRefresh: {
			container: '#pullrefresh',
			up: {
				contentrefresh: '正在加载...',
				callback: pullupRefresh
			}
		}
	});
	var type_show = false; //是否显示种类
	var targetIndex = null; //种类 0-商品 1-服务 2-店铺
	var search_content = null; //搜索内容
	var popover_show = false; //popover是否显示
	var self = null;
	var ServerUrl = null;
	var ImgUrl = null;
	var sort = 0; //0-综合 1-销量优先 2-价格升序 3-价格降序
	var count = null;
	var page = 1;
	var none = false;
	mui('body').on('shown', '.mui-popover', function(e) {
		//console.log('shown', e.detail.id);//detail为当前popover元素
		popover_show = false;
	});
	mui('body').on('hidden', '.mui-popover', function(e) {
		//console.log('hidden', e.detail.id);//detail为当前popover元素
		popover_show = false;
	});
	document.getElementById("content").addEventListener("tap", function() {
		$("#search_content").val("");
		mui("#searchPopover").popover("show");
		popover_show = true;
	});
	document.getElementById("type").addEventListener("tap", function() {
		if(!type_show) {
			$("#searchPopover ul").show();
			type_show = true;
		} else {
			$("#searchPopover ul").hide();
			type_show = false;
		}
	});
	$("#searchPopover li").click(function() {
		var content = $(this).find("span").html();
		targetIndex = parseInt($(this).attr("index"));
		$(".target").html(content);
		$("#searchPopover ul").hide();
		mui("#searchPopover").popover("show");
	});

	mui.plusReady(function() {
		ServerUrl = plus.storage.getItem("ServerUrl");
		ImgUrl = plus.storage.getItem("ImgUrl");
		var height = localStorage.getItem("height");
		$(".list_show").css("height", parseInt(height) + 48);
		self = plus.webview.currentWebview();
		search_content = self.content;
		targetIndex = parseInt(self.type);
		setTimeout(function() {
			//显示搜索内容
			$("#content").val(search_content);
			//设置popover里面的种类
			if(targetIndex == 0) {
				$(".target").html("商品");
				$("#shop").hide();
				$("#product").show();
			} else if(targetIndex == 1) {
				$(".target").html("服务");
				$("#shop").hide();
				$("#product").show();
			} else {
				$("#product").hide();
				$("#shop").show();
				$(".sortRole").last().find(".role").css("color", "#f1f1f1");
				$(".sortRole").find(".zdy-icon").css("color", "#f1f1f1");
			}
			//ajax得到搜索数据

			getData();
		}, 300)

	});
	$(".sortRole").click(function() {
		mui('#pullrefresh').pullRefresh().refresh(true);
		if(targetIndex != 2) {
			sort = parseInt($(this).attr("data-index"));
			$(".sortRole").find(".role").removeClass("zdy-active");
			$(".sortRole").find(".zdy-icon").css("color", "#999999");
			$(this).find(".role").addClass("zdy-active");
			if(sort == 2) {
				$(this).attr("data-index", 3);
				sort = 3;
				$(this).find(".zdy-icon:first-child").css("color", "#6CCCCA");
				$(this).find(".zdy-icon:last-child").css("color", "#999999");
			} else if(sort == 3) {
				$(this).attr("data-index", 2);
				sort = 2;
				$(this).find(".zdy-icon:last-child").css("color", "#6CCCCA");
				$(this).find(".zdy-icon:first-child").css("color", "#999999");
			}
			$(".hot-content").html("");

		} else {
			sort = parseInt($(this).attr("data-index"));
			if(sort < 2) {
				$(this).siblings().find(".role").removeClass("zdy-active");
				$(this).find(".role").addClass("zdy-active");
			} else {
				mui.toast("店铺搜索暂时不支持价格排序哦");
				return;
			}
			$("#shopList").html("");

		}
		count = null;
		getData();

	});
	document.getElementById("go_search").addEventListener("tap", function() {
		mui('#pullrefresh').pullRefresh().refresh(true);
		//以及修改历史记录
		var content = $("#search_content").val();
		if(content == "") {
			mui.toast("请输入搜素内容");
			return;
		}
		mui("#searchPopover").popover("hide");
		if(targetIndex != 2) {
			$("#shop").hide();
			$("#product").show();
			$(".sortRole").last().find(".role").css("color", "#666");
			$(".sortRole").find(".zdy-icon").css("color", "#666");
		} else {
			$("#product").hide();
			$("#shop").show();
			$(".sortRole").last().find(".role").css("color", "#f1f1f1");
			$(".sortRole").find(".zdy-icon").css("color", "#f1f1f1");
		}
		//先查询历史记录里面有没有这条数据 如果没有直接插入 否则将该条数据插入到最后
		db.transaction(function(tx) {
			tx.executeSql("SELECT * FROM search where content=? and type=?", [content, targetIndex],
				function(tx, results) {
					if(results.rows.length > 0) { //先删除该条数据 在插入到最后
						tx.executeSql("DELETE FROM search where content=? and type=?", [content, targetIndex], null, null);
					}
					tx.executeSql("INSERT INTO search (content,type) values(?,?)", [content, targetIndex], null, null);

				}, null);
		});
		popover_show = false;
		//点击搜索默认按照综合排序 需要将其他排序设置为null
		sort = 0;
		count = null;
		$("#shopList").html("");
		$(".hot-content").html("");
		test(); //调用change方法是为了测试看看搜索种类是否变更
		$("#content").val(content);
		getData();
	});

	function pullupRefresh() {
		if(none) {
			mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
		} else {
			if(++page > count) {
				mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
				return;
			}
			mui('#pullrefresh').pullRefresh().endPullupToRefresh(false);
			getData();
		}
	}

	function getData() {
		var data = {};
		if(count == null) { //说明是第一次加载
			data = {
				role: sort, //排序规则
				type: targetIndex, //搜索种类
				content: search_content
			}
		} else {
			data = {
				role: role,
				page: page,
				type: targetIndex, //搜索种类
				content: search_content
			}
		}
		if(targetIndex != 2) {
			plus.nativeUI.showWaiting();
			mui.ajax(ServerUrl + "home.do?p=search", {
				data: data,
				dataType: 'JSONP ',
				type: 'POST',
				timeout: 10000,
				success: function(data) {
					var map = eval("(" + data + ")");
					var contents = null;
					for(var key in map) {
						if(key == "count") {
							count = map[key];
						}
						if(key == "searchVOs") {
							contents = map[key];
						}
					}
					//遍历数据 
					var fragment = document.createDocumentFragment();
					if(contents != null) {
						for(var i = 0; i < contents.length; i++) {
							var productDiv = document.createElement("div");
							productDiv.className = "col-xs-6 mb10";
							productDiv.id = contents[i].pid;
							productDiv.innerHTML =
								'<a href="#">' +
								'<img src=' + ImgUrl + contents[i].pic + ' class="w100">' +
								'</a>' +
								'<div class="pro_detail">' +
								'<div class="pt10b3 texthidden">' +
								'<a href="#">' + contents[i].pname + '</a>' +
								'</div>' +
								'<div class="h20">' +
								'<span class="pro_price"><strong>￥' + contents[i].price + '</strong></span>' +
								'<span class="pro_oriprice pull-right">销量' + contents[i].sale + '</span>' +
								'</div>' +
								'</div>';
							fragment.appendChild(productDiv);
						}
						plus.nativeUI.closeWaiting();
						$(".hot-content").append(fragment);
						setJs();
					} else {
						var p = document.createElement("p");
						$(p).css({
							"color": "#666",
							"text-align": "center",
							"padding-top": "20px",
							"background": "#efeff4"
						});
						p.innerHTML = "没有搜索到商品哦，换个名字试试吧";
						plus.nativeUI.closeWaiting();
						$(".hot-content").append(p);
						none = true;
					}

				},
				error: function(xhr, type, errerThrown) {
					mui.toast('网络异常,请稍候再试');
					plus.nativeUI.closeWaiting();
					mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
				}
			});
		} else { //查询商店
			mui.ajax(ServerUrl + "home.do?p=dianpu", {
				data: data,
				dataType: 'JSONP ',
				type: 'POST',
				timeout: 10000,
				success: function(data) {
					var map = eval("(" + data + ")");
					var shops = null;
					var goods = null;
					for(var key in map) {
						if(key == "count") {
							count = map[key];
						}
						if(key == "shops") {
							shops = map[key];
						}
						if(key == "listgoods") {
							goods = map[key];
						}
					}
					//生成数据 
					if(shops != null) {
						var fragment = document.createDocumentFragment();
						for(var i = 0; i < shops.length; i++) {
							var content = "";
							var li = document.createElement("li");
							li.className = "mui-table-view-cell";
							content =
								'<div class="zdy-shop" id=' + shops[i].shopId + '>' +
								'<span class="shop-pic">' +
								'<img src="' + ImgUrl + shops[i].shopLogo + '"/>' +
								'</span>' +
								"<span class='shop_details'>" +
								"<span class='shop_name'>" + shops[i].shopName + "</span>" +
								"<div class='shop_describe'>" +
								'<span style="margin-left:5px">宝贝' + shops[i].countBaobei + '</span>' +
								'<span style="margin-left:5px">销量' + shops[i].shopxl + '</span>' +
								'</div>' +
								'</span>' +
								'<span class="mui-icon mui-icon-arrowright arrow"></span>' +
								'</div>';
							var shop_goods = goods[i];
							content = content + '<div class="inner_ul">';
							for(var j = 0; j < shop_goods.length; j++) {
								content = content +
									'<section class="goods">' +
									'<a href="#">' +
									' <div class="destination-image">' +
									'<span id=' + shop_goods[j].goodsId + ' class="goods_img" style="background-image: url(' + ImgUrl + shop_goods[j].goodsImg + '); opacity: 1;"></span>' +
									' </div>' +
									' <div class="destination-title">' +
									' <h3>' + shop_goods[j].goodsName + '</h3>' +
									' </div>' +
									" </a>" +
									" </section>";

							}
							content = content + '</div>';
							li.innerHTML = content;
							fragment.appendChild(li);
						}
						$("#shopList").append(fragment);
						//设置js以及效果   
						setshopJs();
					} else {
						var p = document.createElement("p");
						$(p).css({
							"color": "#666",
							"text-align": "center",
							"padding-top": "20px",
							"background": "#efeff4"
						});
						p.innerHTML = "没有搜索到该商店哦，换个名字试试吧";
						plus.nativeUI.closeWaiting();
						$("#shopList").append(p);
						none = true;
					}

				},
				error: function(xhr, type, errerThrown) {
					mui.toast('网络异常,请稍候再试');

					mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
				}
			});
		}
	}

	function test() {
		$(".sortRole").find(".zdy-icon").css("color", "#999999");
		$(".sortRole").find(".role").removeClass("zdy-active");
		$(".sortRole").find(".role").first().addClass("zdy-active");
		if(targetIndex != 2) {
			$(".sortRole:last-child").find(".change").html("价格");
		} else {
			$(".sortRole:last-child").find(".change").html("信用");
		}
	}

	function setJs() {

		var goods = document.querySelectorAll(".col-xs-6");
		for(var i = 0; i < goods.length; i++) {
			goods[i].ontouchstart = function() {
				$(this).find("img").css("opacity", "0.7");
			}
			goods[i].ontouchend = function() {
				$(this).find("img").css("opacity", "1");
			}
			goods[i].onclick = function() {
				var goodsId = parseInt($(this).attr("id"));
				setTimeout(function() {
					mui.openWindow({
						id: 'detail',
						url: 'detail.html',
						show: {
							aniShow: 'pop-in',
							duration: 100
						},
						waiting: {
							autoShow: false
						},
						extras: {
							sid: goodsId
						}
					});
				}, 200)
			};
		}
	}

	function setshopJs() {
		var shops = document.querySelectorAll(".zdy-shop");
		for(var i = 0; i < shops.length; i++) {
			shops[i].ontouchstart = function() {
				$(this).css("background", "#eee");
			}
			shops[i].ontouchend = function() {
				$(this).css("background", "#FFFFFF");

			}
			shops[i].onclick = function() {
				var shopId = $(this).attr("id");
				setTimeout(function() {
					mui.openWindow({
						id: 'shop_detail',
						url: 'shop_detail.html',
						show: {
							aniShow: 'pop-in',
							duration: 100
						},
						waiting: {
							autoShow: false
						},
						extras: {
							shopId: shopId
						}
					});
				}, 200)

			}
		}
		var goods = document.querySelectorAll(".goods_img");
		for(var i = 0; i < goods.length; i++) {
			goods[i].ontouchstart = function() {
				$(this).css("opacity", "0.7");
			}
			goods[i].ontouchend = function() {
				$(this).css("opacity", "1");
			}
			goods[i].onclick = function() {
				var goodsId = $(this).attr("id");
				setTimeout(function() {
					mui.openWindow({
						id: 'detail',
						url: 'detail.html',
						show: {
							aniShow: 'pop-in',
							duration: 100
						},
						waiting: {
							autoShow: false
						},
						extras: {
							sid: goodsId
						}
					});
				}, 200)
			}
		}
	}
	var back = mui.back;
	mui.back = function() {
		console.log(0)
		var view = plus.webview.getWebviewById("search");
		mui.fire(view, "refresh", {
			cid: 0
		});
		if(popover_show) {
			mui("#searchPopover").popover("hide");
			popover_show = false;
		} else {
			back();
		}
	}
});