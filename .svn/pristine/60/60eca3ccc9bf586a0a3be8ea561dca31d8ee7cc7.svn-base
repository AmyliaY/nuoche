$(document).ready(function() {
	var slider = mui("#slider");
	$(window).scroll(function() {
		if($(window).scrollTop() > 0) {
			$("#headsearch").addClass("ui-form-color-nav");
		} else if($(window).scrollTop() == 0) {
			$("#headsearch").removeClass("ui-form-color-nav");
		}
	});
	document.getElementById("search").addEventListener("tap", function() {
		mui.openWindow({
			id: 'search',
			url: 'search.html',
			show: {
				aniShow: 'pop-in',
				duration: 100
			},
			waiting: {
				autoShow: false
			},
			extras: {
				type: 0
			}
		});
	});
	document.getElementById("moreType").addEventListener("tap", function() {
		mui.openWindow({
			id: 'goodsType',
			url: 'goodsType.html',
			show: {
				aniShow: 'pop-in',
				duration: 100
			},
			waiting: {
				autoShow: false
			},
			extras: {
				index: 1
			}
		});
	});
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
	var ServerUrl = null;
	var ImgUrl = null;
	var page = 1;
	var count = 0;
	var wgtUrl = null;
	var checkUrl = null;
	mui.plusReady(function() {
		ServerUrl = plus.storage.getItem("ServerUrl");
		ImgUrl = plus.storage.getItem("ImgUrl");
		wgtUrl = ServerUrl + "H5F81FA19.wgt";
		checkUrl = ServerUrl + "apk.do?p=appupdata";
		mui.ajax(ServerUrl + "home.do?p=myHome", {
			data: {},
			dataType: 'JSONP ',
			type: 'POST',
			timeout: 12000,
			success: function(data) {
				var map = eval("(" + data + ")");
				for(var key in map) {
					/*设置轮播图*/
					if(key == "lunbotus") {
						var frament = document.createDocumentFragment();
						var lunbotus = map[key];
						var last = lunbotus.length - 1;
						var duplicate_first = document.createElement("div");
						/*var div_duplicate=document.querySelectorAll(".mui-slider-item-duplicate");
						$(div_duplicate[0]).find("img").attr("src",ImgUrl+lunbotus[last].LName);
						$(div_duplicate[0]).find("a").attr("index",lunbotus[last].LId); 
						$(div_duplicate[1]).find("img").attr("src",ImgUrl+lunbotus[0].LName);
						$(div_duplicate[1]).find("a").attr("index",lunbotus[0].LId);
						var pics=document.querySelectorAll(".slider-item");
						for (var i=0;i<lunbotus.length;i++) {
							$(pics[i]).find("img").attr("src",ImgUrl+lunbotus[i].LName);
							$(pics[i]).find("a").attr("index",lunbotus[i].LId);
						}*/
						duplicate_first.className = "mui-slider-item mui-slider-item-duplicate";
						duplicate_first.innerHTML = '<a index=' + lunbotus[last].tid + ' class=' + lunbotus[last].type + '><img src="img/layzr.gif" data-layzr=' + ImgUrl + lunbotus[last].LName + '></a>';
						frament.appendChild(duplicate_first);
						for(var i = 0; i < lunbotus.length; i++) {
							var slide_item = document.createElement("div");
							slide_item.className = "mui-slider-item";
							slide_item.innerHTML = '<a index=' + lunbotus[i].tid + ' class=' + lunbotus[i].type + '><img src="img/layzr.gif" data-layzr=' + ImgUrl + lunbotus[i].LName + '></a>';
							frament.appendChild(slide_item);
						}
						var duplicate_last = document.createElement("div");
						duplicate_last.className = "mui-slider-item mui-slider-item-duplicate";
						duplicate_last.innerHTML = '<a index=' + lunbotus[0].tid + ' class=' + lunbotus[0].type + '><img src="img/layzr.gif" data-layzr=' + ImgUrl + lunbotus[0].LName + '></a>';
						frament.appendChild(duplicate_last);
						$("#lun").append(frament);
						slider.slider({
							interval: 2000
						});
					}
					if(key == "goodsTypes") {
						var goodsTypes = map[key];
						var typeDivs = document.createDocumentFragment();
						for(i = 0; i < goodsTypes.length; i++) {
							var typeDiv = document.createElement("div");
							typeDiv.className = "col-xs-3 clearPadding text-center";
							typeDiv.id = goodsTypes[i].gtypeid; //goodstypeid
							typeDiv.innerHTML = '<img src="img/layzr.gif" data-layzr=' + ImgUrl + goodsTypes[i].gtypeimg + ' alt=""><div class="typeName">' + goodsTypes[i].gtypename + '</div>';
							typeDivs.appendChild(typeDiv);
						}
						$("#type").append(typeDivs);
					}
					if(key == "news") {
						var news = map[key];
						var newsFragment = document.createDocumentFragment();
						for(i = 0; i < news.length; i++) {
							var li = document.createElement("li");
							li.className = "suoni";
							li.id = news[i].newsId;
							li.innerHTML = '<a href="#">' +
								'<div class="destination-image">' +
								'<span style="background-image: url(' + ImgUrl + news[i].newsImg + '); opacity: 1;"></span>' +
								'</div>' +
								'<div class="destination-title">' +
								'<h3>' + news[i].newsTitle + '</h3>' +
								'</div>' +
								'</a>';
							newsFragment.appendChild(li);
						}
						$("#clearfix").append(newsFragment);
					}
					if(key == "tjgoods") {
						var tjgoods = map[key];
						var tjfragment = document.createDocumentFragment();
						if(tjgoods != null) {
							for(var i = 0; i < tjgoods.length; i++) {
								var li = document.createElement("li");
								li.className = "ui-border-b";
								//li.style.borderBottom = "1px solid #E3E3E3";
								li.id = tjgoods[i].goodsId;
								/*li.innerHTML =
									'<a>' +
									'<div class="around-other-image fl">' +
									'<div class="around-other-thumbnail" style="background-size:cover; background-image:url(' + ImgUrl + tjgoods[i].goodsImg + '); opacity:1;"></div>' +
									'</div>' +
									'<div class="around-other-info">' +
									'<h3>' + tjgoods[i].goodsName + '</h3>' +
									'<div>' +
									'<span class="shop">' +
									'<img src="img/store.png"/>' +
									"<span>" + tjgoods[i].shopName + "</span>" +
									'</span>' +
									'<p class="around-other-price price">' +
									"<span>￥</span>" +
									'<strong>' + tjgoods[i].goodsPrice + '</strong>' +
									'<span class="mui-pull-right xl" style="font-size: 0.75rem;">销量' + tjgoods[i].goodsSale + '</span>' +
									'</p>' +
									"</div>" +
									'</div>' +
									'</a>';
								tjfragment.appendChild(li);*/
								li.innerHTML =
											'<div class="mui-card">' +
											'<div class="mui-card-header mui-card-media" style="height:40vw;background-image:url(' + ImgUrl + tjgoods[i].goodsImg + ')"></div>' +
											'<div class="mui-card-content">' +
									 		'<div class="mui-card-content-inner">' +
											'<p style="color: #333;">'+tjgoods[i].goodsName+'     '+tjgoods[i].goodsDescribe+'</p>' +
											'</div>' + 
											'</div>' +
											'<div class="mui-card-footer">' +
											'<a class="mui-card-link" style="color:red;"><span>￥</span>'+tjgoods[i].goodsPrice+'</a>' +
											'<a class="mui-card-link" style="margin-right:100px;">'+tjgoods[i].shopAddress+'</a>' +
											'<a class="mui-card-link"><button type="button" class="mui-btn mui-btn-danger">去购买</button></a>' +
											'</div>' +
											'</div>';
								tjfragment.appendChild(li);
							}
							$("#recommend").append(tjfragment);
						}

					}
					if(key == "count") {
						count = map[key];

					}
				}
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
				//设置js以及效果  
				plus.nativeUI.closeWaiting();
				setJs();
			},
			error: function(xhr, type, errerThrown) {
				mui.toast('网络异常,请稍候再试');
				plus.nativeUI.closeWaiting()
				mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
			}
		});
		if(window.plus) { //检查更新
			plusReady();
		} else {
			document.addEventListener('plusready', plusReady, false);
		}
	});

	function plusReady() {
		// ......
		// 获取本地应用资源版本号
		plus.runtime.getProperty(plus.runtime.appid, function(inf) {
			wgtVer = inf.version;
			//console.log("当前应用版本：" + wgtVer);
			checkUpdate();
		});
	}

	function checkUpdate() {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			switch(xhr.readyState) {
				case 4:
					plus.nativeUI.closeWaiting();
					if(xhr.status == 200) {
						//console.log("检测更新成功：" + xhr.responseText);
						var newVer = xhr.responseText;
						var json1 = eval("(" + newVer + ")")
						if(wgtVer && json1.version && (wgtVer != json1.version)) {
							var btnArray = ['否', '是'];
							mui.confirm(json1.description, '版本更新', btnArray, function(e) {
								if(e.index == 1) {
									downWgt(); // 下载升级包
								} else {}
							})

						} else {}
					} else {
						console.log("检测更新失败！");
					}
					break;
				default:
					break;
			}
		}
		xhr.open('GET', checkUrl);
		xhr.send();
	}

	// 下载wgt文件

	function downWgt() {
		plus.nativeUI.showWaiting("正在下载更新wgt文件...请勿退出");
		plus.downloader.createDownload(wgtUrl, {
			filename: "_doc/update/"
		}, function(d, status) {
			if(status == 200) {
				console.log("下载wgt成功：" + d.filename);
				installWgt(d.filename); // 安装wgt包
			} else {
				console.log("下载wgt失败！");
				plus.nativeUI.alert("下载wgt失败！");
			}
			plus.nativeUI.closeWaiting();
		}).start();
	}

	// 更新应用资源
	function installWgt(path) {
		plus.nativeUI.showWaiting("安装wgt文件...");
		plus.runtime.install(path, {}, function() {
			plus.nativeUI.closeWaiting();
			console.log("安装wgt文件成功！");
			plus.nativeUI.alert("应用资源更新完成！", function() {
				plus.runtime.restart();
			});
		}, function(e) {
			plus.nativeUI.closeWaiting();
			console.log("安装wgt文件失败[" + e.code + "]：" + e.message);
			plus.nativeUI.alert("安装wgt文件失败[" + e.code + "]：" + e.message);
		});
	}

	function pullupRefresh() {
		if(++page > count) {
			mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
			return;
		}
		mui('#pullrefresh').pullRefresh().endPullupToRefresh(false);
		mui.ajax(ServerUrl + "home.do?p=moreTjGoods", {
			data: {
				page: page
			},
			dataType: 'JSONP ',
			type: 'POST',
			timeout: 10000,
			success: function(data) {
				var tjgoods = eval("(" + data + ")");
				var tjfragment = document.createDocumentFragment();
				for(var i = 0; i < tjgoods.length; i++) {
					var li = document.createElement("li");
					li.className = "ui-border-b";
					li.id = tjgoods[i].goodsId;
					li.style.borderBottom = "1px solid #E3E3E3";
					li.innerHTML =
						'<a>' +
						'<div class="around-other-image fl">' +
						'<div class="around-other-thumbnail" style="background-size:cover; background-image:url(' + ImgUrl + tjgoods[i].goodsImg + '); opacity:1;"></div>' +
						'</div>' +
						'<div class="around-other-info">' +
						'<h3>' + tjgoods[i].goodsName + '</h3>' +
						'<div>' +
						'<span class="shop">' +
						'<img src="img/store.png"/>' +
						"<span>" + tjgoods[i].shopName + "</span>" +
						'</span>' +
						'<p class="around-other-price price">' +
						"<span>￥</span>" +
						'<strong>' + tjgoods[i].goodsPrice + '</strong>' +
						'<span class="mui-pull-right xl" style="font-size: 0.75rem;">销量' + tjgoods[i].goodsSale + '</span>' +
						'</p>' +
						"</div>" +
						'</div>' +
						'</a>';
					tjfragment.appendChild(li);
					/*
											var div=document.createElement("div");
											div.style.height="1px";
											div.style.background="#E3E3E3";
											div.style.width="100%";
											tjfragment.appendChild(div);*/
				}
				$("#recommend").append(tjfragment);
				//设置js以及效果  
				setJs();
			},
			error: function(xhr, type, errerThrown) {
				mui.toast('网络异常,请稍候再试');

				mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
			}
		});
	}

	function setJs() {
		var type = document.querySelectorAll("#type .col-xs-3");

		for(var i = 0; i < type.length; i++) {
			type[i].onclick = function() {
				var typeId = parseInt($(this).attr("id"));
				mui.openWindow({
					id: 'goodsType',
					url: 'goodsType.html',
					show: {
						aniShow: 'pop-in',
						duration: 100
					},
					waiting: {
						autoShow: false
					},
					extras: {
						index: typeId
					}
				});
			}
			type[i].ontouchstart = function() {
				$(this).css("background", "#f1f1f1");
			}
			type[i].ontouchend = function() {
				$(this).css("background", "#FFFFFF");
			}
		}
		/**
		 *  跳转到新闻列表 
		 */
		var goods_lis = document.querySelectorAll(".clearfix .suoni");
		for(var i = 0; i < goods_lis.length; i++) {
			goods_lis[i].ontouchstart = function() {
				$(this).css("opacity", "0.7");
			}
			goods_lis[i].ontouchend = function() {
				$(this).css("opacity", "1");
			}
			goods_lis[i].onclick = function() {
				var newsId = parseInt($(this).attr("id"));
				mui.openWindow({
					id: 'Newsdetails',
					url: 'Newsdetails.html',
					show: {
						aniShow: 'pop-in',
						duration: 100
					},
					waiting: {
						autoShow: false
					},
					extras: {
						sid: newsId
					}
				});
			};
		}
		/**
		 * 点击更多 去新闻列表
		 */
		document.getElementById("goss").addEventListener("tap", function() {
			mui.openWindow({
				id: 'Gossip',
				url: 'Gossip.html',
				show: {
					aniShow: 'pop-in',
					duration: 100
				},
				waiting: {
					autoShow: false
				}

			});
		});

		/**
		 * 
		 * 到商品详情界面
		 * 
		 */
		var goods_li = document.querySelectorAll("#recommend .ui-border-b");
		for(var i = 0; i < goods_li.length; i++) {
			goods_li[i].ontouchstart = function() {
				$(this).css("background", "#f1f1f1");
			}
			goods_li[i].ontouchend = function() {
				$(this).css("background", "#FFFFFF");
				$(this).css("border-bottom", "1px solid #E3E3E3");
			}
			goods_li[i].onclick = function() {
				var goodsId = parseInt($(this).attr("id"));
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
			};
		}
		/**
		 * 
		 * 轮播图跳转
		 * 
		 */
		var lunbotus = document.querySelectorAll(".mui-slider-item");
		for(var i = 0; i < lunbotus.length; i++) {
			lunbotus[i].ontouchstart = function() {
				$(this).css("opacity", "0.7");
			}
			lunbotus[i].ontouchend = function() {
				$(this).css("opacity", "1");
			}
			lunbotus[i].onclick = function() {
				var type = parseInt($(this).find("a").attr("class"));
				var tid = parseInt($(this).find("a").attr("index"));

				if(type == 0) { //跳转到商品界面
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
							sid: tid
						}
					});
				} else if(type == 1) { //跳转到服务界面
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
							sid: tid
						}
					});
				} else if(type == 2) { //跳转到商店界面
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
							ids: tid
						}
					});
				} else { //跳转到众筹界面
					mui.openWindow({
						id: 'crowmdfundingdetail',
						url: 'crowmdfundingdetail.html',
						show: {
							aniShow: 'pop-in',
							duration: 100
						},
						waiting: {
							autoShow: false
						},
						extras: {
							cid: tid
						}
					});
				}
			};
		}
	}

});