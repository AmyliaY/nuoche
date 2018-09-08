<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

	<head>
		<meta charset="UTF-8">
		<title>确认订单</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/mui.min.css" />
		<link rel="stylesheet" type="text/css" href="confirm_order.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/css/public.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/css/main_style.css">
			<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/css/common.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/weixin/js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/weixin/js/public.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/weixin/js/fontsize.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		
	</head>
	<style>
		#hideDiv{
			position: fixed;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			z-index: 998;
			background-color: rgba(0,0,0,.3);
			display:none;
		}
	</style>
	<body class="bg-gray-f0">
		<div id="hideDiv"></div>
		<!-- 顶部 -->
		<header class="mui-bar mui-bar-nav" style="background: #FF7900;">
			<span class="mui-icon mui-icon-arrowleft mui-action-back" style="color: white;"></span>
			<span class="mui-title" style="color: white;">确认订单</span>
		</header>
		
		<div class="mui-scroll-wrapper mui-content">
			<div class="mui-scroll">
				
				<div class="mui-input-group ">
					<p style="font-size:12px;color:#000000;padding: 5px;">请选择配送方式</p>
					<div id="ziti" class="mui-input-row mui-radio mui-left" style="display: none;">
						<label>自提</label>
						<input index="0" name="check" style="" onclick="corp(this,1)" id="ckbox" type="radio" >
					</div>
					<div id="kuaidi" class="mui-input-row mui-radio mui-left">
						<label>快递</label>
						<input index="1" checked="checked" name="check" style="" id="ckbox" type="radio" >
					</div>
					<div id="songhuo" class="mui-input-row mui-radio mui-left" style="display: none;">
						<label>送货上门</label>
						<input index="2" name="check" style="" onclick="corp(this,3)" id="ckbox" type="radio" >
					</div>
				</div>
				<!--地址-->
				<ul id="order_dizhi" style="height: 110px;display: none;">
					<li>
						<a id="icon-location"><span class="mui-icon mui-icon-location"></span></a>
					</li>
					<li style="padding: 10px;width: 80%;">
						<p style="line-height: 30px;color: #000000;">收货人：<span>姓名</span><span style="float: right;">手机号码</span></p>
						<p style="line-height: 20px;color: #000000;">收货地址：<span>湖南省株洲市天元区湖南工业大学</span></p>
					</li>
					<li style="float: right;">
						<span class="mui-icon mui-icon-forward" style="color: #8F8F94;"></span>
					</li>
				</ul>
				<div class="box-b">
					<p style="padding-left: 5px;">商品信息</p>
					<div style="background: #f6f6f6; padding-top:8px;padding-bottom: 3px;">
						<div class="box-b-1" id="catdiv">
							
						</div>
					</div>
				</div>
				<div class="order_extra">此商品性质不支持7天退货</div>
				<div class="order_extra" id="yunfei-div" style="display: none;">
					运费<span><span>元</span><span id="yunfei">0</span></span>
				</div>

				<!--
					<div class="order_extra">
					可用10积分抵扣<span>￥0.1元<input type="checkbox" style="margin-left: 1px;" /></span>
				</div>
                -->
				<!--留言-->
				<div id="liuyandiv" style="background-color: white;width: 100%;height: 60px;">
					<ul style="padding-top: 15px;padding-left: 10px;">  
						<li style="width: 77px;float: left;font-size: 15px;">买家留言：</li>
						<li style="float: right;width: 77%;"><input id="liuyaninput" placeholder="选填:对本次交易的说明" style="border: none;margin-top: 3px;width: 100%;padding-right: 10px;"/></li>
					</ul>
				</div>
				<div class="move_box">
					<div class="move">
						<!--未使用的优惠券-->
						<div class="coupon_box" id="youhuijuan"> 
						 
					    </div>
					</div>
				</div>
				<br />
				<br />
			</div>
		</div>
		
		<!-- 页脚导航 -->
		<nav  class="mui-bar mui-bar-tab">
			<footer class="ui-c-bottom ui-border-t">
				<div class="settlement clearfloat">
					<div class="zuo clearfloat fl box-s">
						共<span style="color: red;" id="confirm_zongjijian">0</span>件 总金额：<span style="color: red;">￥<span id="order_AllPrice"></span></span>
					</div>
					<a href="javascript:void(0)" class="fl db" id="confirm_submitorder">
						提交订单
					</a>
				</div>
			</footer>
		</nav>
	</body>
	<script>
		var userid='${userinfo.usersId}'; //会员ID
		var catid=[]; //购物车ID
		var goodid=[];
		var gnum=[];
		var adId=0;
		var sum=null;		//总金额
		//mui.plusReady(function(){
		window.onload = function (){
			catid='${param.catid}';
			goodid='${param.goodid}';
			gnum='${param.gnum}';
			zitiName='${zitiName}';
			zitiId='${param.zitiId}';
			zitiPhone='${param.zitiPhone}';
			zitiText='${zitiText}';
			
			$("#order_dizhi").css('display','block');
			$("#yunfei-div").css('display','block');			
			$.post("${pageContext.request.contextPath}/appcat.do?p=getAllAddress",function(data){
					if(data=="null")
					{
						var lis='<li><button type="button" onclick="addAddress()"	id="addaddress" style="width:140px;margin-left: 100px;margin-top: 40px;" class="mui-btn mui-btn-success mui-icon mui-icon-plus">添加收货地址</button></li>';
						$("#order_dizhi").html(lis);
						return;
					}
					var address=eval("("+data+")");
					getAllAddress(address);	
					var yunfei=$("#yunfei").html();
					$("#order_AllPrice").html(((sum*1)+(yunfei*1)).toFixed(2)); //总金额
				});
				
			catid=catid.split(",");
			var catlist=null;	//购物车list
			var address=null;	//收货地址
			var ziti=0;		//自提
			var kuaidi=1; 	//快递
			var songhuo=0;	//送货上门
			
			
			mui.post("${pageContext.request.contextPath}/appcat.do?p=getAllAddressAndGoods",{
				userid:userid,
				catid:catid
			},function(data){
				var map=eval("("+data+")");
				for (var key in map) {
					if(key=="catlist")
					{
						catlist=map[key];
						getAllCat(catlist);
					}
					
					if(key=="sum")
					{
						sum=map[key];
						$("#order_AllPrice").html((sum.toFixed(2)*1)); //总金额
					}
					if(key=="ziti")
					{	
						ziti=map[key];
					}
					if(key=="kuaidi")
					{
						kuaidi=map[key];
					}
					if(key=="songhuo")
					{
						songhuo=map[key];
					}
				}
				if(ziti==0)
				{
					$("#ziti").css('display','none');
				}
				if(kuaidi==0)
				{
					$("#kuaidi").css('display','none');
				}
				if(songhuo==0)
				{
					$("#songhuo").css('display','none');
				}
			});
		}
	   
		
		window.addEventListener('showZiti',function(e){
			getAllZiti(e.detail.zitiaddress);
		});
		//自提地址
		function getAllZiti(ziti)
		{
			var lis='<li><a id="icon-location"><span class="mui-icon mui-icon-location"></span></a></li>'+
					'<input type="hidden" value="'+ziti.zitiId+'" id="order_id" />'+
					'<li style="padding: 10px;width: 80%;">'+
					'<p style="line-height: 30px;color: #000000;">收货人：<span>'+ziti.zitiName+'</span><span style="float: right;">'+ziti.zitiPhone+'</span></p>'+
					'<p style="line-height: 20px;color: #000000;">收货地址：<span><span style="color: red;">[默认]</span>'+ziti.zitiText+'</span></p>'+
					'</li>';
			$("#order_dizhi").html(lis);
			$("#order_dizhi").css('display','block'); 
		}
		//购物车信息
		function getAllCat(catlist)
		{
		
			for (var i=0;i<catlist.length;i++) {
				var str='<div class="box-b-1" gid="'+catlist[i].goods.gid+'" id="catdiv"><div class="box-b-1-l"><img src="'+"${pageContext.request.contextPath}"+catlist[i].goods.gimages+'" /></div>'+
						'<div class="box-b-1-r"><p>'+catlist[i].goods.gname+'</p><p style="width: 25%;text-align: right;">';
						if(catlist[i].userinfo.usersType==1){
							str=str+'<span>￥'+(catlist[i].goods.gvipprice*catlist[i].zhekou).toFixed(2)+'</span>/'+catlist[i].goods.gdanwei+'<br />';
						}else{
							str=str+'<span>￥'+(catlist[i].goods.gprice*catlist[i].zhekou).toFixed(2)+'</span>/'+catlist[i].goods.gdanwei+'<br />';
						}
					str=str+'<br /><span style="color:#666">×'+catlist[i].scatNum+'</span></p></div></div>';
					var cathtml=document.getElementById("catdiv");
					cathtml.innerHTML+=str;
			}
			$("#confirm_zongjijian").html(catlist.length);
		}
		
		//收货地址信息
		function getAllAddress(address)
		{
			if(address.adStatus==1){
			var lis='<li><a id="icon-location"><span class="mui-icon mui-icon-location"></span></a></li>'+
					'<input type="hidden" value="'+address.adId+'" id="order_id" />'+
					'<li style="padding: 10px;width: 80%;">'+
					'<p style="line-height: 30px;color: #000000;">收货人：<span>'+address.adName+'</span><span style="float: right;">'+address.adPhone+'</span></p>'+
					'<p style="line-height: 20px;color: #000000;">收货地址：<span><span style="color: red;">[默认]</span>'+address.adDetail+'</span></p>'+
					'</li>'+
					'<li onclick="qitaaddress()" id="qita" style="float: right;margin-top: -40px;">其他地址<span class="mui-icon mui-icon-forward" style="color: #8F8F94;"></span></li>';
					//'<button type="button" onclick="addAddress()"	id="addaddress" style="position: absolute;width:140px;margin-left: 100px;margin-top: 77px; display:none;" class="mui-btn mui-btn-success mui-icon mui-icon-plus">添加收货地址</button>'+
					//'<li onclick="editAddress(\''+address.adId+'\',\''+address.adName+'\',\''+address.adPhone+'\',\''+address.area.arId+'\',\''+address.area.arName+'\',\''+address.area.city.ctName+'\',\''+address.area.city.provice.prName+'\',\''+address.adDetail+'\','+address.adStatus+')" id="bianji" style="position: absolute;margin-left: 280px;float: right;margin-top: 50px;display:none;">编辑<span class="mui-icon mui-icon-forward" style="color: #8F8F94;"></span></li>';
					$("#order_dizhi").html(lis);
			if(address.area.city.cityYunfei==0){
				$("#yunfei").html(address.area.city.ctYunfei);
			}else{
				$("#yunfei").html(address.area.city.cityYunfei);
			}
			//$("#order_AllPrice").html((jine*1).toFixed(2)+(yunfei*1).toFixed(2)); //总金额
			adId=address.adId;
			}else{
				var lis='<li><a id="icon-location"><span class="mui-icon mui-icon-location"></span></a></li>'+
					'<input type="hidden" value="'+address.adId+'" id="order_id" />'+
					'<li style="padding: 10px;width: 80%;">'+
					'<p style="line-height: 30px;color: #000000;">收货人：<span>'+address.adName+'</span><span style="float: right;">'+address.adPhone+'</span></p>'+
					'<p style="line-height: 20px;color: #000000;">收货地址：<span>'+address.adDetail+'</span></p>'+
					'</li>'+
					'<li onclick="qitaaddress()" id="qita" style="float: right;margin-top: -40px;">其他地址<span class="mui-icon mui-icon-forward" style="color: #8F8F94;"></span></li>';
					//'<button type="button" onclick="addAddress()"	id="addaddress" style="position: absolute;width:140px;margin-left: 100px;margin-top: 77px; display:none;" class="mui-btn mui-btn-success mui-icon mui-icon-plus">添加收货地址</button>'+
					//'<li onclick="editAddress(\''+address.adId+'\',\''+address.adName+'\',\''+address.adPhone+'\',\''+address.area.arId+'\',\''+address.area.arName+'\',\''+address.area.city.ctName+'\',\''+address.area.city.provice.prName+'\',\''+address.adDetail+'\','+address.adStatus+')" id="bianji" style="position: absolute;margin-left: 280px;float: right;margin-top: 50px;display:none;">编辑<span class="mui-icon mui-icon-forward" style="color: #8F8F94;"></span></li>';
					$("#order_dizhi").html(lis);
			if(address.area.city.cityYunfei==0){
				$("#yunfei").html(address.area.city.ctYunfei);
			}else{
				$("#yunfei").html(address.area.city.cityYunfei);
			}
			}
		}
		window.addEventListener('qitaaddress',function(e){
			getAllQitaAddress(e.detail.adid,e.detail.adname,e.detail.adphone,e.detail.addetail,e.detail.ctYunfei,e.detail.cityYunfei,e.detail.adstatus);
		});
		function getAllQitaAddress(adid,adname,adphone,addetail,ctYunfei,cityYunfei,adstatus)
		{
			var lis='<li><a id="icon-location"><span class="mui-icon mui-icon-location"></span></a></li>'+
					'<input type="hidden" value="'+adid+'" id="order_id" />'+
					'<li style="padding: 10px;width: 80%;">'+
					'<p style="line-height: 30px;color: #000000;">收货人：<span>'+adname+'</span><span style="float: right;">'+adphone+'</span></p>'+
					'<p style="line-height: 20px;color: #000000;">收货地址：<span>';
					if(adstatus==1)
					{
						lis=lis+'<span style="color: red;">[默认]</span>'+addetail+'</span></p>';
					}else{
						lis=lis+''+addetail+'</span></p>';
					}
					lis=lis+'</li>'+
					'<li onclick="qitaaddress()" id="qita" style="float: right;margin-top: -40px;">其他地址<span class="mui-icon mui-icon-forward" style="color: #8F8F94;"></span></li>';
					//'<button type="button" onclick="addAddress()"	id="addaddress" style="position: absolute;width:140px;margin-left: 100px;margin-top: 77px; display:none;" class="mui-btn mui-btn-success mui-icon mui-icon-plus">添加收货地址</button>';
				$("#order_dizhi").html(lis);
				$("#order_dizhi").css('display','block');
				if(cityYunfei==0){
					$("#yunfei").html(ctYunfei);
				}else{
					$("#yunfei").html(cityYunfei);
				}
		}
		function qitaaddress()
		{
			$("#qita").css('display','none');
			$("#bianji").css('display','block');
			$("#addaddress").css('display','block');
			
			window.location = "${pageContext.request.contextPath}/weixin/center/address.jsp";
		}
		//添加地址
		function addAddress()
		{
			window.location = "${pageContext.request.contextPath}/weixin/center/insert-address.jsp";

			/*mui.openWindow({
					url:'/center/insert-address.html',
					extras:{
						usersid:userid,
						adId:adId
					}
				});
			*/
		}
		//编辑地址
		function editAddress(adid,adname,adphone,arid,arname,ctname,prname,addetail,adstatus)
		{
			window.location = "${pageContext.request.contextPath}/weixin/center/insert-address.jsp";

		}
		window.addEventListener('address',function(e){
			location.reload();
		});
		window.addEventListener('userinfo',function(event){
			location.reload();
			userid='${userinfo.usersId}';
			shuaxin();
		});
		//下订单
		$("#confirm_submitorder").click(function(){
			var corplength=$("input[name=check]:checked").length;
			if(corplength==0)
			{
				mui.toast("请选择配送方式");
				return;
			}
			var index=$("input[name=check]:checked").attr('index');
			if(index==0)
			{ 
				var adid=$("#order_id").val();	//自提地址ID
			}
			if(index==1 || index==2)
			{
				var adid=$("#order_id").val();	//地址ID
			}
			if(adid==null)
			{
				mui.toast("请添加收货地址");
				return;
			}
			var beizhu=$("#liuyaninput").val(); //订单备注
			var yunfei=$("#yunfei").html();	//运费
			var price=$("#order_AllPrice").html();	//实际总金额
			mui.post("${pageContext.request.contextPath}/"+'apporder.do?p=submitOrder',{
				userid:userid,
				catid:catid,
				adid:adid,
				beizhu:beizhu,
				yunfei:yunfei,
				price:price,
				index:index	
			},function(data){
				if(data=="请先登录")
				{
					window.location = "${pageContext.request.contextPath}/weixin/home/login.jsp";
					/*mui.openWindow({
						url: '/home/login.jsp',
						show: {
							duration: 250
						}
					});*/
					mui.toast("请先登录");
					return;
				}
				//提交订单成功后  删除购物车
				mui.post("${pageContext.request.contextPath}/"+'apporder.do?p=deleteCat',{
					catid:catid
				},function(data){
					//plus.webview.getWebviewById("shopingcart/cart.html").reload();
				});
				$("#catdiv").each(function(){
					//alert($(this).attr("gid"));
				});
				window.location = "${pageContext.request.contextPath}/weixin/goodsdetail/submit-order.jsp?catid="+catid + "&gnum="+gnum+"&goodid="+goodid+"&orderId="+data+"&id=submit-order";
				
				
			});
		});
		
		(function($){
			$(".mui-scroll-wrapper").scroll({
			bounce: true,//滚动条是否有弹力默认是true
			indicators: true, //是否显示滚动条,默认是true
			});
			
			})(mui);
	</script>

</html>