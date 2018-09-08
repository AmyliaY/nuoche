<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="${pageContext.request.contextPath}/weixin/css/mui.min.css" rel="stylesheet" />
		<script src="${pageContext.request.contextPath}/weixin/js/jquery-1.9.0.min.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		
		<script src="${pageContext.request.contextPath}/weixin/shuaxin.js"></script>

	</head>

	<style>
		.nav-header {
			background-color: #000000;
			color: white;
		}
		
		.nav-header h1 {
			text-align: left;
		}
		
		.nav-header a {
			color: white;
		}
		.box-a {
			background-color: #FFFFFF;
			margin-bottom: 10px;
			
		}
		
		.box-a-1 {
			font-size: 16px;
			line-height: 45px;
			padding: 3px 10px;
		}
		
		.box-a-1 #phone {
			float: right;
		}
		
		.box-a p {
			font-size: 14px;
			line-height: 20px;
			padding:0 10px;
			padding-bottom:3px;
		}
		
		.box-a-2 {
			line-height: 45px;
			font-size: 14px;
			overflow: hidden;
			border-top: 1px solid #F2F2F2;
		}
		
		.box-a-2-left {
			float: left;
		}
		
		.box-a-2-left input {
			background-color: #000000;
		}
		
		.box-a-2-left .choose {
			height: 10px;
			width: 10px;
		}
		
		.box-a-2-left .bottom {
			float: left;
			height: 20px;
			width: 20px;
			
			margin:12px 8px 12px 10px;
		}
		
		.box-a-2-right {
			float: right;
			text-align: center;
			margin-right: 10px;
		}
		.box-a-2-right a{
			color: #000000;
			display: inline-block;
			height:40px;
		}
		.box-a-2-right img{
			vertical-align:text-bottom;
			margin:0 6px 0 9px;
		}
		#noAddress{
			text-align: center;
			margin-top: 150px;
			display: none;
		}
	</style>

	<body>
		<header class="mui-bar mui-bar-nav" style="background-color:#FF7900;margin-top: 0px;">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
			<h1 class="mui-title" style="color: white;">我的收货地址</h1>
		</header>
		<div class="mui-content" id="address_div" style="margin-bottom: 50px;">
			<div id="noAddress">
				<img width="200px" height="200px" src="../images/fenxiao_none.png" />
			    <p  style="font-size: 30px; ">暂无收货地址</p>
			</div>
		</div>
		<nav class="mui-bar mui-bar-tab"> 
			    <a id='insert'style="background-color: #FF6700;color: white;display: inline-block;width: 100%; height: 100%;text-align: center;line-height: 50px;">
			        <span>添加新地址</span>
			    </a>
		</nav>
		<script type="text/javascript">
			mui.init();
			
			window.addEventListener('address',function(event){
				location.reload();
			});
			window.addEventListener('userinfo',function(event){
				location.reload();
				shuaxin();
			});
			var userid='${userinfo.usersId}';	//会员ID
			
			var adId=0;		//默认收货地址ID
			window.addEventListener('userinfo',function(event){
				location.reload();
				shuaxin();
			});
			//mui.plusReady( function (){
				//var user=plus.webview.currentWebview();
					//userid=plus.storage.getItem("uid");
				//得到会员地址
				mui.ajax("${pageContext.request.contextPath}/"+'appaddress.do?p=getAllAddress&id='+userid,{
					type:'post',
					timeout:30000,
					success:function(data){
					   
						if(data=="请先登录")
						{
							mui.openWindow({
								url: '${pageContext.request.contextPath}/weixin/home/login.jsp',
								show: {
									duration: 250
								}
							});
						//	plus.nativeUI.toast("请先登录");
							
							 //关闭等待框
						//    plus.nativeUI.closeWaiting();
						    //显示当前页面
						    mui.currentWebview.show();

							return;
						}
						var addressList=eval("("+data+")");	//地址list
						var addressFragment=document.createDocumentFragment();
						if(addressList.length>0)
						{	
						   
							for (var i=0;i<addressList.length;i++) {
							    
								var div=document.createElement("div");
								div.className="box-a";
								if(userid=='order')
								{
									var str='<div onclick="sss(\''+addressList[i].adId+'\',\''+addressList[i].adName+'\',\''+addressList[i].adPhone+'\',\''+addressList[i].adDetail+'\',\''+addressList[i].area.city.ctYunfei+'\',\''+addressList[i].area.city.cityYunfei+'\','+addressList[i].adStatus+')"><div class="box-a-1"><span id="name">'+addressList[i].adName+' </span><span id="phone">'+addressList[i].adPhone+'</span></div>'+
											'<p>'+addressList[i].adDetail+'</p></div>';
								}else{
									var str='<div class="box-a-1"><span id="name">'+addressList[i].adName+' </span><span id="phone">'+addressList[i].adPhone+'</span></div>'+
										'<p>'+addressList[i].adDetail+'</p>';
								}
									if(addressList[i].adStatus==0){
										str=str+'<div class="box-a-2"><div id="left'+addressList[i].adId+'" class="box-a-2-left"><div  onclick="updataStatus('+addressList[i].adId+',1,1)" class="bottom" style="background: url(../img/center/checked.png); background-size: contain ;"></div><span>设为默认</span></div>';
									}else{
										adId=addressList[i].adId;
										str=str+'<div class="box-a-2"><div id="left'+addressList[i].adId+'" class="box-a-2-left"><div  onclick="updataStatus('+addressList[i].adId+',0,2)" class="bottom" style="background: url(../img/center/checked-checked.png); background-size: contain ;"></div><span>设为默认</span></div>';
									}	
								str=str+ '<div class="box-a-2-right"><a onclick="editAddress(\''+addressList[i].adId+'\',\''+addressList[i].adName+'\',\''+addressList[i].adPhone+'\',\''+addressList[i].area.arId+'\',\''+addressList[i].area.arName+'\',\''+addressList[i].area.city.ctName+'\',\''+addressList[i].area.city.province.prName+'\',\''+addressList[i].adDetail+'\','+addressList[i].adStatus+')"><img src="../img/center/bianji.png" style="height: 20px;"/><span>编辑</span></a><a onclick="deleteAddress('+addressList[i].adId+')"><img src="../img/center/delete.png" style="height: 20px;"/><span>删除</span></a></div></div>';
							div.innerHTML=str;
							addressFragment.appendChild(div);
							}
							$("#address_div").append(addressFragment);
						}else{
							document.getElementById("noAddress").style.display="block";
						}
						 //关闭等待框
					    //plus.nativeUI.closeWaiting();
					    //显示当前页面
					    //mui.currentWebview.show();
					}
				});
			//});
			function sss(adid,adname,adphone,addetail,ctYunfei,cityYunfei,adstatus)
			{
				var address=plus.webview.currentWebview().opener();
				mui.fire(address,"qitaaddress",{adid:adid,adname:adname,adphone:adphone,addetail:addetail,ctYunfei:ctYunfei,cityYunfei:cityYunfei,adstatus:adstatus});
				mui.back();
			}
			//设置地址是否默认			
			function updataStatus(id,status,type)
			{
				//设置默认
				if(type==1){
				mui.confirm("‘设为默认吗’？",function(e){
					if(e.index==1)
					{
						mui.post("${pageContext.request.contextPath}/"+"appaddress.do?p=updataStatus&id="+id+"&adId="+adId,{
							status:status
						},function(data){
							if(data=="1")
							{
								mui.alert("已设置默认"); 
								document.getElementById("left"+id).innerHTML='<div  onclick="updataStatus('+id+',0,2)" class="bottom" style="background: url(${pageContext.request.contextPath}/weixin/img/center/checked-checked.png); background-size: contain ;"></div><span>设为默认</span>';
								if(adId!=0){
									document.getElementById("left"+adId).innerHTML='<div  onclick="updataStatus('+adId+',1,1)" class="bottom" style="background: url(${pageContext.request.contextPath}/weixin/img/center/checked.png); background-size: contain ;"></div><span>设为默认</span>';
								}
								adId=id;
							}
						});
					}
				});
				
				}
				//取消默认
				else{
					mui.confirm("‘取消默认吗’？",function(e){
					if(e.index==0)
					{
						mui.post("${pageContext.request.contextPath}/"+"appaddress.do?p=updataStatus&id="+id+"&adId=-1",{
							status:status
						},function(data){
							if(data=="0")
							{ 
								//plus.nativeUI.toast("已取消默认");
								document.getElementById("left"+id).innerHTML='<div  onclick="updataStatus('+id+',1,1)" class="bottom" style="background: url(${pageContext.request.contextPath}/weixin/img/center/checked.png); background-size: contain ;"></div><span>设为默认</span>';
								adId=0;
							}
						});
					}
				});
				
				}
			}
			//删除地址
			function deleteAddress(id)
			{ 
				mui.confirm("确定删除该地址吗？",function(e){
					if(e.index==1)
					{
						mui.ajax("${pageContext.request.contextPath}/"+"appaddress.do?p=deleteAddress&id="+id,{
							type:'post',
							timeout:30000,
							success:function(data)
							{
								if(data=="成功"){
									//plus.nativeUI.toast("删除成功");
									mui.toast("删除成功");
									location.reload();
								}else{ 
									mui.toast("删除失败");
									//plus.nativeUI.toast("删除失败");
								}
							}
						});
					}
				});
			}
			function editAddress(adid,adname,adphone,arid,arname,ctname,prname,addetail,adstatus)
			{
			
			
			window.top.location="${pageContext.request.contextPath}/weixin/center/insert-address.jsp?adid="+adid+"&adId="+adId+"&adname="+adname+"&adphone="+adphone+"&arid="+arid+"&arname="+arname+"&ctname="+ctname+"&prname="+prname+"&addetail="+addetail+"&adstatus="+adstatus;		
				/*mui.openWindow({
					url:'insert-address.html',
					id:'insert-address.html',
					extras:{
						adid:adid,
						adId:adId,//默认收货地址
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
			//添加新地址
			$("#insert").click(function(){
				//mui.plusReady(function(){
					//var user=plus.webview.currentWebview();
					  window.top.location="${pageContext.request.contextPath}/weixin/center/insert-address.jsp?userid="+userid+"&adId="+adId;
					/*mui.openWindow({
					url:'insert-address.html',
					extras:{
						adId:adId,//默认收货地址
						usersid:usersid
					}*/
				//});
				//});
			});
			$(".bottom").bind("click",function(){
				$(".bottom").each(function(i,obj){
					$(obj).css("background-image","url(${pageContext.request.contextPath}/weixin/img/center/checked.png)");
					$(obj).parent().css("color","#000000");
				});
				$(this).css("background-image","url(${pageContext.request.contextPath}/weixin/img/center/checked-checked.png)");
				$(this).parent().css("color","#ff6700");
			});
			
		</script>
	</body>

</html>