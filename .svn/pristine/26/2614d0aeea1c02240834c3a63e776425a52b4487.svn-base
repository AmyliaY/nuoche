<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>

	<head>
		<meta charset="UTF-8">
		<title>确认订单</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/mui.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/goodsdetail/confirm_order.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/css/public.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/css/main_style.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/weixin/js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/weixin/js/public.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/weixin/js/fontsize.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		
		<script src="${pageContext.request.contextPath}/weixin/shuaxin.js"></script>
		
	</head>
	
	<style type="text/css">
		#liuyaninput{
		 font-family: "微软雅黑";
		 font-size: 15px;
		 color: #4D4D4D;
		}
	</style>

	<body class="bg-gray-f0">
		<!-- 顶部 -->
		<header class="mui-bar mui-bar-nav" style="background: #FF7900;">
			<span class="mui-icon mui-icon-arrowleft mui-action-back" style="color: white;"></span>
			<span class="mui-title" style="color: white;">确认订单</span>
		</header>
		<div class="mui-content">
			<div class="mui-scroll">
				<div class="mui-input-group ">
					<p style="font-size:12px;color:#000000;padding: 5px;">请选择配送方式</p>
					<div id="ziti" class="mui-input-row mui-radio mui-left">
						<label>自提</label>
						<input class="songhuoClass" index="0" name="check" style="" onclick="corp(this,1)" id="ckbox" type="radio" >
					</div>
					<div id="kuaidi" class="mui-input-row mui-radio mui-left">
						<label>快递</label>
						<input class="songhuoClass" index="1" name="check" style="" onclick="corp(this,2)" id="ckbox" type="radio" >
					</div>
					<div id="songhuo" class="mui-input-row mui-radio mui-left">
						<label>送货上门</label>
						<input class="songhuoClass" index="2" name="check" style="" onclick="corp(this,3)" id="ckbox" type="radio" >
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
						<div style="background: #f6f6f6; padding-top:8px;padding-bottom: 3px; border-bottom: 1px solid white;">
							  <div class="box-b-1" id="catdiv">
								<div class="box-b-1-l" id="img"><img src="../images/0.jpg"  /></div>
								<div class="box-b-1-r"><p id="gname"></p><p style="width: 25%;text-align: right;">
								￥<span id="gmoney"></span>/<span id="gdw"></span><br />
								<br /><span style="color:#666">
								<div class="mui-numbox" style="float: right;" data-numbox-max='4368'>
								<button id="zcbtn-jian" class="mui-btn mui-btn-numbox-minus" type="button">-</button>
								<input id="num" onkeyup="setnum()"    onclick="select()"  style="color: #000000;" class="mui-input-numbox" type="number" value="1" />
								<button id="zcbtn-jia" class="mui-btn mui-btn-numbox-plus" type="button">+</button>
								</div>
								</span></p></div>
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
				<div id="liuyandiv"  style="background-color:white;width: 100%;height: 180px;">
					<ul style="padding-top: 15px;padding-left: 10px;">  
						<li style="width: 77px;float: left;font-size: 15px;">买家留言：</li>
						<li style="float: right;width: 77%;">
						<textarea  id="liuyaninput" placeholder="选填:对本次交易的说明" style="border: none;width: 100%;height: 160px;margin-left: -5%;margin-top: -2.2%;"></textarea>
						</li>
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
		<nav class="mui-bar mui-bar-tab">
			<footer class="ui-c-bottom ui-border-t">
				<div class="settlement clearfloat">
					<div class="zuo clearfloat fl box-s">
						共<span style="color: red;" id="confirm_zongjijian">1</span>件 总金额:<span style="color: red;">￥<span id="order_AllPrice"></span></span>
					</div>
					<a href="javascript:void(0)" class="fl db" id="confirm_submitorder">
						提交订单
					</a>
				</div>
			</footer>
		</nav>
	</body>
	<script>
		mui.init();
		var userid=null; //会员ID
		var gid=null; //商品ID
		var gimages=null; //商品图片
		var gname=null;	//商品名称
		var gprice=null; //商品价格
		var grebate=null; //商品折扣
		var gdanwei=null; //商品单位
		var sum=null;	//总金额
		var num=null;
		var adId=0;	//默认收货地址
		//mui.plusReady(function(){
			//userid=plus.storage.getItem("uid");
			//var self=plus.webview.currentWebview();
			//gid=self.gid;
			//gimages=self.gimages;
			//gname=self.gname;
			//gprice=self.gprice;
			//grebate=self.grebate;
			
						    // 获取url中的参数
              function getUrlParam (name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                    if (r!= null) {
        				 return unescape(r[2]);
     			 	 }else{
        			 	 return null;
      				}
 		    	} 
				  userid = '${userinfo.usersId}';
				  usertype= 'weixinuser.userinfo.usersType';
				  gid = '${param.gid}';
				  gimages = '${param.gimages}';
				  gname = '${param.gname}';
				  gprice = '${param.gprice}';
				  grebate = '${param.grebate}';
				  gdanwei = '${param.gdanwei}';
			$("#img").html('<img src="'+gimages+'"/>');
			$("#gname").html(gname);
			$("#gmoney").html(gprice);
			$("#gdw").html(gdanwei);
				num=$("#num").val();	//数量     11111111111
				sum=(gprice*1)*(num*1);
				$("#order_AllPrice").html(sum); //总金额
				
				
		var ziti = 0; //自提
		var kuaidi = 0; //快递
		var songhuo = 0; //送货上门
		
		mui.ajax({
			url:"${pageContext.request.contextPath}/"+'appcat.do?p=getAllAddressAndGoods',
			type:"post",  
			async:true, 
			success:function(data)
			{
				var map=eval("("+data+")");
				for (var key in map) {
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
			}   
			, 
			error: function(xhr, type, errorThrown) {
					//异常处理；
					if(type == 'timeout') {
						mui.toast("服务器开了小差，请求超时了");
						return;
					} 
					if(type == 'abort') {
		 				mui.toast("亲，您的网络有点问题哦！");
						return;
					} else {
						
						mui.toast("服务器拒绝了连接，稍后再试吧！");
						return;
					}
				}
		});
				
				
				
				
		//});
		//购买数量    减
		$("#zcbtn-jian").click(function(){
			var yunfei=$("#yunfei").html();//运费
			 num=$("#num").val();	//数量     11111111111
			if(num<1)
			{
				$("#num").val("1");
			     sum=(gprice*1)+(yunfei*1);
				$("#order_AllPrice").html(sum.toFixed(2)); //总金额
				mui.toast("受不了了，在减下去就没有了哦！");
				return;
			}
			 sum=(gprice*1)*(num*1)+(yunfei*1);
			$("#order_AllPrice").html(sum.toFixed(2)); //总金额
		});
		//购买数量    加
		$("#zcbtn-jia").click(function(){
			var yunfei=$("#yunfei").html();//运费
			  num=$("#num").val();	//数量     11111111111
			 sum=(gprice*1)*(num*1)+(yunfei*1);
			$("#order_AllPrice").html(sum.toFixed(2)); //总金额
		});
		//购买数量    输入
		function setnum()
		{
			var reg=/^[0-9]+(\.[0-9]{1,2})?$/;
			var yunfei=$("#yunfei").html();//运费
			 num=$("#num").val();	//数量     11111111111
			 sum=(gprice*1)*(num*1)+(yunfei*1);	
			 if(sum>10000){
			 	mui.toast("亲,此订单超出我的底线哦,如需购买请与客服联系哦");
				$("#num").val("1");
				 sum=(gprice*1)+(yunfei*1);	
				$("#order_AllPrice").html(sum.toFixed(2)); //总金额
		        return; 
			 }
			$("#order_AllPrice").html(sum.toFixed(2)); //总金额
		}
		//配送方式
		function corp(chk,type)
		{
			//自提
			if(type==1)
			{
				$("#order_dizhi").css('display','none');
				$("#yunfei-div").css('display','none');
				var ztyf =  document.getElementById("yunfei").value;
				ztyf=0;
				var num  = document.getElementById("num").value;
				
				document.getElementById("order_AllPrice").innerText=((num*1)*(gprice*1)).toFixed(2);
				
				
				$("#hideDiv").css("display","block");  //打开遮蔽背景层 
				mui.openWindow({
					url:'${pageContext.request.contextPath}/weixin/goodsdetail/zitiaddress.jsp',
					styles:{
						top:'20%',
						width:'80%',
						bottom:'20%',
						height:'60%',
						left:'10%'
					},
					 show:{
     					 aniShow:'slide-in-right',//页面显示动画
     					 duration:300,//页面动画持续时间，Android平台默认100毫秒，iOS平台默认200毫秒；
   					},
				});
				
			}
			//快递
			if(type==2 || type==3)
			{
			
				$("#order_dizhi").css('display','block');
				$("#yunfei-div").css('display','block');
				mui.post("${pageContext.request.contextPath}/"+"appcat.do?p=getAllAddress",{userid:userid},function(data){
					if(data=="null")
					{
					var lis='<li><button type="button" onclick="addAddress()"	id="addaddress" style="width:140px;margin-left: 100px;margin-top: 40px;" class="mui-btn mui-btn-success mui-icon mui-icon-plus">添加收货地址</button></li>';
					$("#order_dizhi").html(lis);
						return;
					}
					var address=eval("("+data+")");
					getAllAddress(address);	
			        
			    
			     var kdyf = $("#yunfei").html();
			
				 var kdnum  = document.getElementById("num").value;

			    document.getElementById("order_AllPrice").innerText=((kdyf*1)+(kdnum*1*gprice*1)).toFixed(2);
			     
				
				
				});
			}
			
			
			
			

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
		window.top.location="${pageContext.request.contextPath}/weixin/center/address.jsp?userid="+userid;
			
			/*mui.openWindow({
						url: '/center/address.html',
						id:'order',
						show: {
							duration: 250
						},
						extras: {
							userid: userid
						},
						 show:{
					      autoShow:false
					    }
					});*/
		}
		//添加地址
		function addAddress()
		{
		window.top.location="${pageContext.request.contextPath}/weixin/center/insert-address.jsp?userid="+userid+"&adId="+adId;
			/*mui.openWindow({
					url:'/center/insert-address.html',
					extras:{
						usersid:userid,
						adId:adId
					}
				});*/
		}
		//编辑地址
		function editAddress(adid,adname,adphone,arid,arname,ctname,prname,addetail,adstatus)
		{
			
		window.top.location="${pageContext.request.contextPath}/weixin/center/insert-address.jsp?adid="+adid+"&adId="+adId+"&adname="+adname+"&adphone="+adphone+"&arid="+arid+"&arname="+arname+"&ctname="+ctname+"&prname="+prname+"&addetail="+addetail+"&adstatus="+adstatus;		
				/*mui.openWindow({
					url:'/center/insert-address.html',
					id:'insert-address.html',
					extras:{
						adid:adid,
						adId:adId,
						adname:adname,
						adphone:adphone,
						arid:arid,
						arname:arname,
						ctname:ctname,
						prname:prname,
						addetail:addetail,
						adstatus:adstatus
					}
				});*/
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
			var corplength=$(".songhuoClass:checked").length;
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
			var xiaoshoujia=$("#gmoney").html();	//单价
			var num=$("#num").val();	//购买数量
			if(num<1)
			{
				mui.toast("请输入正确的数量!");
				$("#num").val("1");
				var sum=(gprice*1)+(yunfei*1);
				$("#order_AllPrice").html(sum.toFixed(2)); //总金额
				return;
			}
			mui.post("${pageContext.request.contextPath}/"+'apporder.do?p=submitZhongchouOrder&type=2',{
				userid:userid,
				gid:gid,
				adid:adid,
				beizhu:beizhu,
				yunfei:yunfei,
				price:price,
				xiaoshoujia:xiaoshoujia,
				rebate:grebate,
				num:num,
				index:index
			},function(data){
				if(data=="请先登录")
				{
					mui.openWindow({
						url: '${pageContext.request.contextPath}/weixin/home/login.jsp',
						show: {
							duration: 250
						}
					});
					mui.toast("请先登录");
					return;
				}
				//进入支付页面
				window.top.location="${pageContext.request.contextPath}/weixin/goodsdetail/submit-order.jsp?gid="+gid+"&num="+num+"&orderId="+data+"&id=crowdfunding-order.html";
				/*mui.openWindow({
					url:"/goodsdetail/submit-order.html",
					id:"crowdfunding-order.html",
					extras:{
						num:num,
						gid:gid,
						orderId:data
					}
				});*/
				
			});
		});
		
		
	
	

		
	</script>

</html>