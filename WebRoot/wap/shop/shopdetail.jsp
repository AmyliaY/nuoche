<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="${pageContext.request.contextPath}/wap/css/mui.min.css" rel="stylesheet" />
		<script src="${pageContext.request.contextPath}/wap/js/gcoord.js"></script>
		<style>
		   a
		   {
		    text-decoration: none;
		   }
		   #shopDesc {
			width:100%;
			height:200px;
			overflow-y:hidden;
			margin:20px auto;
			}
			#btndesc{
			width:100%;
			margin:10px auto;
			text-align: center;
			display: none;
			}
		</style>
	</head>

	<body>
		<script src="${pageContext.request.contextPath}/wap/js/mui.min.js"></script>
		<script type="text/javascript">
			mui.init()
		</script>
		
		
		<header class="mui-bar mui-bar-nav" id="toubu" style="background: white;">
			<a class="mui-icon mui-icon-back mui-action-back mui-pull-left" id="" index="" style="color: #555555;"></a>
			<span class="mui-title" id="shopname" index="1" style="color: #000000; font-family: '微软雅黑';">${shop.shopname}</span>
		</header>
		<div id="divtp">
			<a href="#">
				<img src="${pageContext.request.contextPath}/${shop.shoplogo}" style="width: 100%;height: 200px;">
			</a>
		</div>
		
		<div id="divxx1" style="background: white;margin-top: -4px;">
			<p style="text-indent:1.4em; font-size: 14px;color: #000000; font-family: '黑体';">
				
			</p>
		</div>
			
		<div id="" style="background: white; margin-top: 10px;height: 80px;">
			<div style="height: 40px;">
				<p style="line-height:40px;color: #000000; font-family: '黑体';font-size: 12px;">
					<span class="mui-icon mui-icon-location" style="font-size: 14px;">
					  &nbsp;${shop.shopaddr}
					  <a href="javascript:go()">去这里</a>
				    </span>
				</p>
			</div>
			<div style="height: 30px;border-top:1px solid #DDDDDD">
					<span  style="font-size: 14px;" class="mui-icon mui-icon-phone" style="color: red;line-height:40px; margin-top: -20px;">&nbsp;${shop.tel}</span>
			</div>
			
		</div>
		<!--<div id="">
			<a href="#">
				<img src="abc.png" style="width: 100%;height: 140px;">
			</a>
		</div>-->
		
		<style type="text/css">
		
		#container{
		    min-width:;
		    min-height:200px;
		}
		</style>
		<script charset="utf-8" src="http://map.qq.com/api/js?v=2.exp"></script>
		<script>
		window.onload = function(){

		//直接加载地图
		
		    //初始化地图函数  自定义函数名init
		    function init() {
				var jingdu='${shop.longitude}';
				var weidu='${shop.latitude}';
				
		        //定义map变量 调用 qq.maps.Map() 构造函数   获取地图显示容器
		         var map = new qq.maps.Map(document.getElementById("container"), {
		            center: new qq.maps.LatLng(weidu,jingdu),      // 地图的中心地理坐标。
		            zoom:15                                                // 地图的中心地理坐标。
		        });
		    }
		
		    //调用初始化函数地图
		    init();
		
		
		}
		</script>
		
		<div id="container"></div>
		
		<div style="display: none;">
			<p style="text-align: left;">
				⭐⭐⭐⭐⭐
			</p>
			<p style="font-size: 10px;text-align: right;margin-top: -30px;display: none;">
				0人评价
			</p>
		</div>
		<div style="height: 40px;background-color: white;text-align: center;line-height: 40px;font-size: 14px;margin-top: 1px;">
			店铺简介
		</div>
		<div id="shopDesc" style=";">
			  ${shop.shopDesc }
		</div>
		<button id="btndesc">查看更多……</button>
		<div class="mui-content" style="background-color: white;">
			
			<div class="title" style="background-color: white;font-size: 14px;margin-top: -5px;">
				商家服务
			</div>
			<ul class="mui-table-view">
			<c:forEach items="${services }" var="list">
				<li class="mui-table-view-cell mui-media" onclick="ligo(${shop.id},${list.id })" style="color: blue;">
					<span style="color:black;font-size: 12px ; width: 60%;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
						${list.title }
					</span>
					<button type="button" class="mui-btn mui-btn-primary"style="float: right;" onclick="btngo(${shop.id},${list.id })">
						立即预约
					</button>
				</li>
			</c:forEach>
			</ul>
			<!-- 这里注意要修改openID -->
			<input type="hidden" id="openid" name="openid" value="${openid }"/>
		</div>
		
		<div style="height: 180px;">&nbsp;</div>
		<div id="allmap"></div>
	</body>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/wap/js/jquery-3.2.1.js" ></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=m5Yqt0R1YMKTBUALRbQwvV8SAW0mhbm0"></script>
	
	<script>
	var btn = document.getElementById('btndesc');
	var obj = document.getElementById('shopDesc');
    var total_height =  obj.scrollHeight;//文章总高度
    var show_height = 200;//定义原始显示高度
    if(total_height>show_height){
    btn.style.display = 'block';
    btn.onclick = function(){
    obj.style.height = total_height + 'px';
    btn.style.display = 'none';
    }
    
    }
	   
	    var meLocation = null;
	    //  查看服务详情
	    function ligo(shopid,fuwuid)
		{
			//   跳转服务详情界面
			var openid = $("#openid").val();
			//alert("openid:"+openid);
			window.location="${pageContext.request.contextPath}/fuwuyuyue.do?p=fuwudetailbyid&fuwuid="+fuwuid+"&shopid="+shopid+"&openid="+openid;
		}
		//  预约按钮
		function btngo(shopid,fuwuid)
		{
			//  跳转预约界面  
			event.stopPropagation();//  阻止冒泡
			var openid = $("#openid").val();
			window.location="${pageContext.request.contextPath}/fuwuyuyue.do?p=fuwuyuyuebyid&fuwuid="+fuwuid+"&shopid="+shopid+"&openid="+openid;
		}
	    
	    
	    
	    
	    
	    $(function(){
	        var map = new BMap.Map("allmap");
		var geolocation = new BMap.Geolocation();
		geolocation.getCurrentPosition(function(r){
			if(this.getStatus() == BMAP_STATUS_SUCCESS){
				//alert('您的位置：'+r.point.lng+','+r.point.lat);
				meLocation = gcoord.transform(
			    [ r.point.lng, r.point.lat ],    // 经纬度坐标
			    gcoord.BD09,
			    gcoord.GCJ02
			    );
			   
				//var pointA = new BMap.Point(113.068998,27.82345); // 创建点坐标A–宁波市宁海县
				//var pointB = new BMap.Point(113.071441,27.822236); // 创建点坐标B–北京市朝阳区 
				//alert("距离是："+(map.getDistance(pointA,pointB)).toFixed(2)+" 米。"); 
			}
			else {
				alert('failed'+this.getStatus());
			}        
		},{enableHighAccuracy: true})
	    });
	    
	    
	    function go()
	    {
	       if (meLocation!=null)
	       {
	         top.location = "http://map.qq.com/nav/drive#routes/page?start="
									+  meLocation
									+ "&dest=${shop.longitude},${shop.latitude}&sword=start&eword=end&showSimunavi=1&roadtest=1&ref=mobilemap&referer=wxmp";
	         
	         return;
	       }
	       
	       
	    }
	</script>

</html>