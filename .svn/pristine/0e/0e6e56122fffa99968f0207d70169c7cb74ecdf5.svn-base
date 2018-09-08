<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<meta name="viewport"
	content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/wap/css/mui.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/wap/css/icons-extra.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/wap/css/mui.picker.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/wap/css/mui.poppicker.css" />
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.mui-control-content {
	background-color: white;
	min-height: 215px;
}

.mui-control-content .mui-loading {
	margin-top: 50px;
}

.flex-container {
	display: -webkit-box;
	display: -webkit-flex;
	display: flex;
	-webkit-flex-flow: row wrap;
	justify-content: space-between;
	text-align: center;
}

.mui-content a {
	color: #8F8F94;
}

.mui-content a.active {
	color: #007aff;
}

#ul1 li {
	float: left;
}

.ul2 li {
	clear: both;
}

.mui-table-view-cell li {
	margin-left: -20px;
}
.mui-ellipsis p{
	width: 70%;
	height: 20px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.distance{
	width: 5%;
	margin-right:-15px;
	float: right;
}
</style>
</head>
<body>
	<header class="mui-bar mui-bar-nav" style="background-color: #FF7900">
		<div class="mui-content container" style="background-color: #FF7900">
			<div class="flex-container row">

				<div id="icon-location">
					<button id='showCityPicker3' class="mui-btn mui-btn-block"
						type='button' style="background-color: #FF7900;border: none;">
						<span id="address" class="mui-icon mui-icon-location"
							style="color: white;font-weight: bold;background-color: #FF7900;font-size: 18px;color: white;">
							定位中...</span>
					</button>
					<div id='cityResult3' class="ui-alert"></div>
				</div>

				<div
					class="mui-indexed-list-search mui-input-row mui-search  mui-col-xs-5"
					style="background-color: #FF7900;">
					<input type="search"
						class="mui-input-clear mui-indexed-list-search-input" id="input"
						style="background-color: white" placeholder="搜索商家"
						onkeyup="enterSearch(event)">
				</div>
				<span id="show-search" class="mui-icon-extra"
					style="color: white;font-weight: bold;background-color: #FF7900;font-size: 18px;
					color: white;margin-top: 10px;margin-right: 25px">搜索</span>
				<span class="mui-icon-extra mui-icon-extra-sweep"
					style="margin-top: 6px;"></span>
			</div>
		</div>
	</header>
	<div class="mui-content">
		<div class="mui-card container"
			style="width: 100%; margin-top: 0px; margin-left: 0px;position: absolute; z-index: 999;">
			<ul id="ul1" class="mui-table-view mui-table-view-chevron row"
				style="width: 100%; background: transparent;">
				<li class="mui-table-view-cell mui-collapse mui-col-xs-4"><a
					id="shopleName" class="mui-navigate-right" href="#">类别</a>
					<ul class="mui-table-view mui-table-view-chevron ul2" id="shople">

					</ul></li>
				<li class="mui-table-view-cell mui-collapse mui-col-xs-4"
					style="border-left:solid 1px #CCCCCC;border-right:solid 1px #CCCCCC;"><a
					id="adressName" class="mui-navigate-right" href="#">地区</a>
					<ul class="mui-table-view mui-table-view-chevron ul2" id="adress">

					</ul></li>
				<li class="mui-table-view-cell mui-collapse mui-col-xs-4"><a
					id="distanceName" class="mui-navigate-right" href="#">距离</a>
					<ul class="mui-table-view mui-table-view-chevron ul2">

						<li class="mui-table-view-cell"><a
							class="mui-navigate-righta" href="#" onclick="distance()">距离排序</a></li>

					</ul></li>
			</ul>
		</div>
	</div>
	<div id="pullrefresh233" class="mui-content mui-scroll-wrapper"
		style="margin-top: 50px;">
		<div class="mui-scroll">
			<ul
				class="mui-table-view mui-table-view-striped mui-table-view-condensed mui-table-view-chevron"
				id="shopxq">
			</ul>
		</div>
	</div>
	<div id="allmap"></div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/wap/js/mui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/weixin/js/mui.pullToRefresh.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/weixin/js/mui.pullToRefresh.material.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/wap/js/mui.picker.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/wap/js/mui.poppicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/wap/js/city.data.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/wap/js/city.data-3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/wap/js/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/wap/js/jquery.cookie.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=m5Yqt0R1YMKTBUALRbQwvV8SAW0mhbm0"></script>
<script src="${pageContext.request.contextPath}/wap/layer/layer.js"></script>
<script type="text/javascript" type="text/javascript">
	//根据信息查商品
	var city = null;
	var shi = null;
	var qu = null;
	var shopId = null;
	var name = "";

	var id = 0;
	var page = 1;
	var size = 8;
	var julistatus = 0;

	var quanjujuli = new Array();
	var quanjulist = new Array();
	var jingdu = null;
	var weidu = null;
	var root = '${pageContext.request.contextPath}';

	$(function() {
		//$.cookie('the_cookie', 'the_value', { expires: 7 });
		//$.cookie('the_cookie');
		//$.cookie('the_cookie', null);   //通过传递null作为cookie的值即可
		var cookie_city = $.cookie('city'); //取出cookcity
		if (cookie_city)
			$("#address").html(cookie_city);
		var map = new BMap.Map("allmap");
		var geolocation = new BMap.Geolocation();
		geolocation.getCurrentPosition(function(r) {
			if (this.getStatus() == BMAP_STATUS_SUCCESS) {
				//alert('您的位置：'+r.point.lng+','+r.point.lat);
	
				jingdu = r.point.lng;
				weidu = r.point.lat;
				var gc = new BMap.Geocoder(); //Geocoder地址编码  
				gc.getLocation(r.point, function(rs) { //getLocation函数用来解析地址信息，分别返回省市区街等 r.point里有经纬度  
					var addComp = rs.addressComponents;
					province = addComp.province; //获取省份  
					city = addComp.city; //获取城市  

					//shi = city;
					district = addComp.district; //区  
					street = addComp.street; //街  
					/*                  alert(street);
					                 alert(addComp.streetNumber); */
					//console.log(province);  
					//console.log(city);  
					//console.log(district);  
					//console.log(street); 
					if (!cookie_city) {
						$("#address").html(city);
						shi = city;
						updateArea(shi);
						//getAllShop(city);
						getshop(0, "", city);
						$.cookie('city', city, {
							expires : 365
						});
					} else {
						if (cookie_city != city) {
							var btnArray = [ '是', '否' ];
							mui.confirm('当前定位的城市为:' + city, '确定要更改?', btnArray, function(e) {
								if (e.index == 0) {

									shi = city;
									qu = null;
									updateArea(shi);
									//getAllShop(city);
									getshop(0, "", city);
									$.cookie('city', city, {
										expires : 365
									});
									$("#address").html(city);
									return;
								} else {
									shi = cookie_city;
									city = shi;
									qu = null;
									updateArea(shi);
									getshop(0, "", cookie_city);
									return;
								}
							});

						} else {
							shi = city;

							qu = null;
							updateArea(shi);
							getshop(0, "", shi);
						}
						//getAllShop(city);

					}

				});
			} else {
				alert('failed' + this.getStatus());
			}
		}, {
			enableHighAccuracy : true
		})

	});

	mui.init({
		pullRefresh : {
			container : '#pullrefresh233',
			down : {
				height : 50, //可选,默认50.触发下拉刷新拖动距离,
				auto : false, //可选,默认false.首次加载自动下拉刷新一次
				contentdown : "下拉可以刷新", //可选，在下拉可刷新状态时，下拉刷新控件上显示的标题内容
				contentover : "释放立即刷新", //可选，在释放可刷新状态时，下拉刷新控件上显示的标题内容
				contentrefresh : "正在刷新...", //可选，正在刷新状态时，下拉刷新控件上显示的标题内容
				//contentrefresh: '正在刷新...',
				callback : refresh22
			},
			up : {
				height : 150, // 可选.默认50.触发上拉加载拖动距离
				auto : false, // 可选,默认false.自动上拉加载一次
				contentrefresh : "正在加载...", // 可选，正在加载状态时，上拉加载控件上显示的标题内容
				contentnomore : '没有更多数据了', // 可选，请求完毕若没有更多数据时显示的提醒内容；
				callback : refresh
			}
		}
	});

	function refresh22() {
		setTimeout(function() {
			mui('#pullrefresh233').pullRefresh().endPulldownToRefresh(false); //开启下拉刷新
			mui('#pullrefresh233').pullRefresh().endPulldownToRefresh(true); //开启下拉刷新
		}, 1500);
	}

	function refresh() {
		setTimeout(function() {
			getshop(id, name, city);
		}, 500);
	}

	
	function getshop(id, name, aderssname) {
		mui('#pullrefresh233').pullRefresh().endPullupToRefresh(false); //开启上拉加载
		mui.ajax(root + "/wapgoods.do?p=findtjshop",
			{
				type : 'post', //HTTP请求类型
				timeout : 30000, //超时时间设置为10秒；
				data : {
					id : id,
					name : name,
					aderssname : aderssname,
					shi : shi,
					qu : qu,
					page : page,
					size : size
				},
				success : function(json) {
					var map = eval("(" + json + ")");
					var list = map.list;
					mui('#pullrefresh233').pullRefresh().endPullupToRefresh(list.length<size);
					if (list.length > 0) {
						var zong = document.getElementById("shopxq").innerHTML;
						var pointA = new BMap.Point(jingdu, weidu);
						var pointB = new BMap.Point(0, 0);
						var juli = null;
						var map = new BMap.Map("allmap");
						for (var int = 0; int < list.length; int++) {
							
							//alert("店铺经度："+list[int].longitude+"店铺纬度："+list[int].latitude);
							//alert("经度："+jingdu+"纬度"+weidu);
							pointB = new BMap.Point(list[int].longitude, list[int].latitude);
							juli = (map.getDistance(pointA, pointB) / 1000).toFixed(2);
							quanjujuli[(page - 1) * size + int] = juli;
							quanjulist[(page - 1) * size + int] = list[int];
							var dianpu = "<li style='width:100%;' class='mui-table-view-cell mui-media shangxq'  id2='" + list[int].id + "'><img width='30px' height='30px' class='mui-media-object mui-pull-left' src='${pageContext.request.contextPath}/" + (list[int].shoplogo) + "'/><div class='mui-media-body'>" + list[int].shopname + "<div class='mui-ellipsis'>" + list[int].shopDesc + "</div></div><span class='distance' style='font-size:12px;'>" + juli + "km</span></li>";
							zong += dianpu;
						}
						if (julistatus == 1) {
							distance();
						} else {
							document.getElementById("shopxq").innerHTML = zong;
						}
						++page;

					} else {
						if(page==1)
						document.getElementById("shopxq").innerHTML = "";
					}

				//alert(json);
				//alert(obj[0].cimgUrl);
				},
				error : function(xhr, type, errorThrown) {
					//异常处理；
					if (type == 'timeout') {
						layer.open({
							content : '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器开了小差，请求超时了</div>',
							time : 2
						});
						//$(".hidden_div2").show();
						//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
						return;
					}
					if (type == 'abort') {
						layer.open({
							content : '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>亲，您的网络有点问题哦！</div>',
							time : 2
						});
						//$(".hidden_div2").show();
						//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
						return;
					} else {
						layer.open({
							content : '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器拒绝了连接，稍后再试吧！</div>',
							time : 2
						});
						//$(".hidden_div2").show();
						//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
						return;
					}
				}
			});
	}

	function enterSearch(e) {
		//e.keyCode==13如果点击enter键
		if (13 == e.keyCode) {
			$("#search-input").blur();
			var keyword = $("#input").val()
			mui.ajax(root + "/searchbusiness.do?p=searchbusiness",
				{
					type : 'post', //HTTP请求类型
					timeout : 30000, //超时时间设置为10秒；
					data : {
						keyword : keyword
					},
					success : function(json) {
						var map = eval("(" + json + ")");
						var list = map.businesslist;
						if (list.length > 0) {
							var zong = "";
							var pointA = new BMap.Point(jingdu, weidu);
							var pointB = new BMap.Point(0, 0);
							var juli = null;
							var map = new BMap.Map("allmap");
							for (var int = 0; int < list.length; int++) {

								pointB = new BMap.Point(list[int].longitude, list[int].latitude);
								juli = (map.getDistance(pointA, pointB) / 1000).toFixed(2);
								quanjujuli[int] = juli;
								quanjulist[int] = list[int];
								var dianpu = "<li style='width:100%;' class='mui-table-view-cell mui-media shangxq'  id2='" + list[int].id + "'><img width='30px' height='30px' class='mui-media-object mui-pull-left' src='${pageContext.request.contextPath}/" + (list[int].shoplogo) + "'/><div class='mui-media-body'>" + list[int].shopname + "<div class='mui-ellipsis'>" + list[int].shopDesc + "</div></div><span class='distance' style='font-size:12px;'>" + juli + "km</span></li>";	
							zong += dianpu;
							}

							document.getElementById("shopxq").innerHTML = zong;
						} else {
							document.getElementById("shopxq").innerHTML = "";
						}
					//alert(json);
					//alert(obj[0].cimgUrl);
					},
					error : function(xhr, type, errorThrown) {
						//异常处理；
						if (type == 'timeout') {
							layer.open({
								content : '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器开了小差，请求超时了</div>',
								time : 2
							});
							//$(".hidden_div2").show();
							//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
							return;
						}
						if (type == 'abort') {
							layer.open({
								content : '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>亲，您的网络有点问题哦！</div>',
								time : 2
							});
							//$(".hidden_div2").show();
							//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
							return;
						} else {
							layer.open({
								content : '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器拒绝了连接，稍后再试吧！</div>',
								time : 2
							});
							//$(".hidden_div2").show();
							//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
							return;
						}
					}
				});
		}
	}

	$("#show-search").click(function() {
			$("#search-input").blur();
			var keyword = $("#input").val()
			mui.ajax(root + "/searchbusiness.do?p=searchbusiness",
				{
					type : 'post', //HTTP请求类型
					timeout : 30000, //超时时间设置为10秒；
					data : {
						keyword : keyword
					},
					success : function(json) {
						var map = eval("(" + json + ")");
						var list = map.businesslist;
						if (list.length > 0) {
						var zong = "";
						var pointA = new BMap.Point(jingdu, weidu);
						var pointB = new BMap.Point(0, 0);
						var juli = null;
						var map = new BMap.Map("allmap");
						for (var int = 0; int < list.length; int++) {

							pointB = new BMap.Point(list[int].longitude, list[int].latitude);
							juli = (map.getDistance(pointA, pointB) / 1000).toFixed(2);
							quanjujuli[int] = juli;
							quanjulist[int] = list[int];
							var dianpu = "<li style='width:100%;' class='mui-table-view-cell mui-media shangxq'  id2='" + list[int].id + "'><img width='30px' height='30px' class='mui-media-object mui-pull-left' src='${pageContext.request.contextPath}/" + (list[int].shoplogo) + "'/><div class='mui-media-body'>" + list[int].shopname + "<div class='mui-ellipsis'>" + list[int].shopDesc + "</div></div><span class='distance' style='font-size:12px;'>" + juli + "km</span></li>";	
						zong += dianpu;
						}
						
						document.getElementById("shopxq").innerHTML = zong;
					} else {
						document.getElementById("shopxq").innerHTML = "";
					}
					//alert(json);
					//alert(obj[0].cimgUrl);
					},
					error : function(xhr, type, errorThrown) {
						//异常处理；
						if (type == 'timeout') {
							layer.open({
								content : '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器开了小差，请求超时了</div>',
								time : 2
							});
							//$(".hidden_div2").show();
							//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
							return;
						}
						if (type == 'abort') {
							layer.open({
								content : '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>亲，您的网络有点问题哦！</div>',
								time : 2
							});
							//$(".hidden_div2").show();
							//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
							return;
						} else {
							layer.open({
								content : '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器拒绝了连接，稍后再试吧！</div>',
								time : 2
							});
							//$(".hidden_div2").show();
							//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
							return;
						}
					}
				});
		});

	function distance() {
		if (quanjulist.length > 0) {
			julistatus = 1;
			var juli = new Array();
			juli = quanjujuli;
			var list = new Array();
			list = quanjulist;
			var zhongjuli = null;
			var zhonglist = null;
			var zong = "";
			for (var j = 0; j < list.length; j++) {
				for (var k = 1; k < juli.length - j; k++) {
					if (juli[k - 1] * 1 > juli[k] * 1) {
						zhongjuli = juli[k - 1];
						juli[k - 1] = juli[k];
						juli[k] = zhongjuli;
						zhonglist = list[k - 1];
						list[k - 1] = list[k];
						list[k] = zhonglist;
					}
				}
			}

			for (var int = 0; int < list.length; int++) {
				var dianpu = "<li style='width:100%;' class='mui-table-view-cell mui-media shangxq'  id2='" + list[int].id + "'><img width='30px' height='30px' class='mui-media-object mui-pull-left' src='${pageContext.request.contextPath}/" + (list[int].shoplogo) + "'/><div class='mui-media-body'>" + list[int].shopname + "<div class='mui-ellipsis'>" + list[int].shopDesc + "</div></div><span class='distance' style='font-size:12px;'>" + juli[int] + "km</span></li>";
				zong += dianpu;
			}
			document.getElementById("shopxq").innerHTML = zong;
		} else {
			document.getElementById("shopxq").innerHTML = "";
		}
		var c = document.getElementById("distanceName");
		c.offsetParent.className = "mui-table-view-cell mui-collapse mui-col-xs-4";

	}


	//得到工程路径
	function getRootPath() {
		//http://localhost:8083/uimcardprj/share/meun.jsp
		var curWwwPath = window.document.location.href;
		//uimcardprj/share/meun.jsp
		var pathName = window.document.location.pathname;
		var pos = curWwwPath.indexOf(pathName);
		//http://localhost:8083
		var localhostPaht = curWwwPath.substring(0, pos);
		// uimcardprj
		var projectName = pathName
			.substring(0, pathName.substr(1).indexOf('/') + 1);
		if (projectName == "/pc" || projectName == "/admin" || projectName == "/weixin" || projectName == "/wap")
			projectName = "";

		return (localhostPaht + projectName);
	}

	(function($, doc) {
		$.init();
		$.ready(function() {
			/**
			 * 获取对象属性的值
			 * 主要用于过滤三级联动中，可能出现的最低级的数据不存在的情况，实际开发中需要注意这一点；
			 * @param {Object} obj 对象
			 * @param {String} param 属性名
			 */
			var _getParam = function(obj, param) {
				return obj[param] || '';
			};
			var cityPicker3 = new $.PopPicker({
				layer : 2
			});
			cityPicker3.setData(cityData3);
			var showCityPickerButton = doc.getElementById('showCityPicker3');
			var cityResult3 = doc.getElementById('address');
			showCityPickerButton.addEventListener('tap', function(event) {
				cityPicker3.show(function(items) {

					var area = (_getParam(items[1], 'children'));
					var texts = "<li class='mui-table-view-cell dizhi' myvalue='22'><a class='mui-navigate-right' href='#'>全城</a></li>";
					for (var i = 0; i < area.length; i++) {
						text2 = "<li class='mui-table-view-cell dizhi' myvalue='" + _getParam(area[i], 'text') + "'><a class='mui-navigate-right' href='#'>" + _getParam(area[i], 'text') + "</a></li>"
						texts += text2;
					}
					city = _getParam(items[1], 'text');
					cityResult3.innerText = _getParam(items[1], 'text');
					document.getElementById("adress").innerHTML = texts;
					shi = city;
					jQuery.cookie('city', city, {
						expires : 365
					});
					//getAllShop(city);
					document.getElementById("shopxq").innerHTML = "";
					page = 1;
					getshop(0, "", shi);
					updateArea(city);
				//cityResult3.innerText = "你选择的城市是:" + _getParam(items[0], 'text') + " " + _getParam(items[1], 'text') + " " + _getParam(items[2], 'text');
				//返回 false 可以阻止选择框的关闭
				//return false
				//cityPicker3.dispose();
				//return false;
				});
			}, false);
		});
	})(mui, document);
	//查商家类别菜单
	mui.ajax(root + "/wapgoods.do?p=findAllshopcategory",
		{
			type : 'post', //HTTP请求类型
			timeout : 30000, //超时时间设置为10秒；
			success : function(json) {

				var map = eval("(" + json + ")");
				var list = map.list;
				if (list.length > 0) {
					var all = "<li class='mui-table-view-cell li' value=''><a class='mui-navigate-righta' href='javascript:void(0)'>全部类别</a></li>";
					var zong = "";
					for (var int = 0; int < list.length; int++) {
						var shangjia = "<li class='mui-table-view-cell li' value='" + list[int].id + "'><a class='mui-navigate-righta' href='javascript:void(0)'>" + list[int].name + "</a></li>"
						zong += shangjia;
					}
					document.getElementById("shople").innerHTML = all + zong;
				}

			//alert(json);
			//alert(obj[0].cimgUrl);
			},
			error : function(xhr, type, errorThrown) {
				//异常处理；
				if (type == 'timeout') {
					layer.open({
						content : '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器开了小差，请求超时了</div>',
						time : 2
					});
					//$(".hidden_div2").show();
					//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
					return;
				}
				if (type == 'abort') {
					layer.open({
						content : '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>亲，您的网络有点问题哦！</div>',
						time : 2
					});
					//$(".hidden_div2").show();
					//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
					return;
				} else {
					layer.open({
						content : '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器拒绝了连接，稍后再试吧！</div>',
						time : 2
					});
					//$(".hidden_div2").show();
					//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
					return;
				}
			}
		});


	function updateArea(cityName) {
		for (var j = 0; j < cityData3.length; j++) {
			for (var k = 0; k < cityData3[j].children.length; k++) {
				var meCity = cityData3[j].children[k].text;

				if (meCity == cityName) {

					var map = cityData3[j].children[k].children;
					var texts = "<li class='mui-table-view-cell dizhi' myvalue='全城'><a class='mui-navigate-right' href='#'>全城</a></li>";
					for (var i = 0; i < map.length; i++) {
						if (cityData3[j].children[k].children[i].text == "其它区") continue;
						text2 = "<li class='mui-table-view-cell dizhi' myvalue='" + cityData3[j].children[k].children[i].text + "'><a class='mui-navigate-right' href='#'>" + cityData3[j].children[k].children[i].text + "</a></li>"
						texts += text2;
					}
					document.getElementById("adress").innerHTML = texts;
					return;
				}
			}

		}
	}

	$(function() {
		$(document).ready(function() {});
		/* $("#input").bind("input propertychange", function(){  
			var name=$("#input").val();
			getshop(0,name,null);
		});  */

		//选类别
		$(document).on("click", ".li", function() {
			var id = $(this).val();
			shopId = id;
			var shop = document.getElementById("shople");

			var name = $("#input").val();
			document.getElementById("shopleName").innerHTML = $(this).children("a").html();
			var address = document.getElementById("adressName").innerHTML;
			getshop(id, name, address);



			shop.offsetParent.className = "mui-table-view-cell mui-collapse mui-col-xs-4";
		});
		
		$(function(){
			
			    mui("#shopxq").on("tap","li",function(){
						    var id = $(this).attr("id2");
							//alert("来了"+id);
							//跳转商品详情页面
							window.location.href = "${pageContext.request.contextPath}/wapgoods.do?p=toshopdetails&id=" + id;
							         }); 
			});
		 /* $(document).on("click", ".shangxq", function() {
			var id = $(this).attr("id2");
			//alert("来了"+id);
			//跳转商品详情页面
			window.location.href = "${pageContext.request.contextPath}/wapgoods.do?p=toshopdetails&id=" + id;
		});  */
		$(document).on("click", ".dizhi", function() {
			var c = document.getElementById("adress");
			var aderssname = $(this).attr("myvalue"); //adress
			var name = $("#input").val();

			document.getElementById("adressName").innerHTML = aderssname;
			if (aderssname == "全城") {
				qu = null;
			} else {
				qu = aderssname;
			}
			c.offsetParent.className = "mui-table-view-cell mui-collapse mui-col-xs-4"; //取消
			document.getElementById("shopxq").innerHTML = "";
			page = 1;
			getshop(shopId, name, aderssname);
		});
	});
</script>
</body>
</html>
