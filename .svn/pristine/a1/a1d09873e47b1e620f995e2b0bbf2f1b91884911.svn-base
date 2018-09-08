<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


String adname = request.getParameter("adname");
if (adname!=null)
{
   adname = new String(adname.getBytes("iso8859-1"),"utf-8");
   pageContext.setAttribute("adname",adname);
} 


String addetail = request.getParameter("addetail");
if (addetail!=null)
{
   addetail = new String(addetail.getBytes("iso8859-1"),"utf-8");
   pageContext.setAttribute("addetail",addetail);
}

String prname = request.getParameter("prname");
if (prname!=null)
{
   prname = new String(prname.getBytes("iso8859-1"),"utf-8");
   pageContext.setAttribute("prname",prname);
}

String ctname = request.getParameter("ctname");
if (ctname!=null)
{
   ctname = new String(ctname.getBytes("iso8859-1"),"utf-8");
   pageContext.setAttribute("ctname",ctname);
}

String arname = request.getParameter("arname");
if (arname!=null)
{
   arname = new String(arname.getBytes("iso8859-1"),"utf-8");
   pageContext.setAttribute("arname",arname);
}
	
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
		
		.info{
			height:50px;
			font-size: 14px;
			line-height: 50px;
			border-bottom: 1px solid #f6f6f6;
			background-color: #fff;
			padding-left:10px;
		}
		.info input{
			width: 75%;
			float: right;
			height: 50px;
			font-size: 14px;
			margin: 0;
			padding: 0 15px 0 0;
			border: 0;
			border-bottom: 1px solid #f6f6f6;
		}
		textarea{
			padding: 10px 10px;
			font-size: 14px;
			height: 85px;
			line-height: 18px;
			width: 100%;
			border: 0;
			margin-bottom: 6px
		}
		.bottom {
			float: right;
			height: 20px;
			width: 20px;
			margin-top: 15px;
			margin-right: 10px;
		}
		
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
	<body>
		
		<div id="hideDiv"></div>
		
	       <header class="mui-bar mui-bar-nav" style="background-color:#FF7900;margin-top: 0px;">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
			<h1 class="mui-title" style="color: white;">我的收货地址</h1>
			<a class="mui-pull-right" id="addAddress" style="line-height:45px;font-size: 16px;color: white;">保存</a>
		</header>
			


		
		<div class="mui-content">
		    <form action="" method="">
		    	<div class="info">收货人<input type="text" placeholder="请输入收货人姓名" id="adname"/></div>
		    	<div class="info">联系号码<input type="text" placeholder="请输入手机号码" id="adphone"/></div>
		    	<div class="info" id="provices">所在省份<input type="text" id="provice" placeholder="请选择   >" disabled="disabled" style="text-align: right;"/></div>
		    	<div class="info" id="citys">所在城市<input type="text" id="city" placeholder="请选择   >" disabled="disabled" style="text-align: right;"/></div>
		    	<div class="info" id="areas">所在街道<input type="text" id="area" placeholder="请选择   >" disabled="disabled" style="text-align: right;"/></div>
		    	<textarea placeholder="详细地址" id="addetail"></textarea>
		    	<div class="info" style="text-align: center;" align="">
		    		<div class="bottom" id="adstatus" style="background: url(${pageContext.request.contextPath}/weixin/img/center/checked.png); background-size: contain ;">
		    			<input type="checkbox" id="ckbox" name="check" style="height:22px;width: 22px;opacity: 0;">
		    		</div>
		    		<span>设为默认地址</span>
		    	</div>
		    </form>
		</div>
		
		<script type="text/javascript">
			mui.init();
			var prid='${param.prid}';	//省份ID
			var ctid='${param.ctid}';  //城市ID
			var arid='${param.arid}';  //区or县ID
			var adid='${param.adid}';	//地址ID  编辑时用
			
			
			var usersid='${userinfo.usersId}';	//会员ID
			adid = '${param.adid}';
			adId = '${param.adId}';
			adname = '${adname}';
			adphone = '${param.adphone}';
			addetail = '${addetail}';
			adstatus = '${param.adstatus}';
			prname = '${prname}';
			ctname = '${ctname}';	
			arname = '${arname}';			
			arid = '${param.arid}';
			_if = '${param["if"]}';
			if(!(_if*1 == 1)){
				if(ctid.trim().length > 0){
					$("#citys").children().val(ctname);
			 		$("#areas").children().val("");
					window.location = "${pageContext.request.contextPath}/weixin/center/area.jsp?adid="+adid+"&adId="+adId+"&adname="+adname+"&adphone="+adphone+"&arid="+arid+"&arname="+arname+"&ctname="+ctname+"&prname="+prname+"&addetail="+addetail+"&adstatus="+adstatus+"&prid="+prid+"&ctid="+ctid;	
	
				}else if(prid.trim().length > 0){
					$("#provices").children().val(prname);//--------
					$("#citys").children().val("");
					$("#areas").children().val("");
					window.location = "${pageContext.request.contextPath}/weixin/center/city.jsp?adid="+adid+"&adId="+adId+"&adname="+adname+"&adphone="+adphone+"&arid="+arid+"&arname="+arname+"&ctname="+ctname+"&prname="+prname+"&addetail="+addetail+"&adstatus="+adstatus+"&prid="+prid;	
				}
			}
			window.addEventListener('showCity',function(event){
		 		$("#citys").children().val(event.detail.city.ctName);
		 		$("#areas").children().val("");
		 		ctid=event.detail.city.ctId;
		 		mui.openWindow({
		 			url:'area.jsp?ctid='+ctid,
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
   					}
		 		});
			});
		
			//mui.plusReady(function(){
				//var user=plus.webview.currentWebview();
					//usersid=user.usersid;	//得到父页面传过来的会员ID
				    //adid=user.adid;		//地址ID
				    //adId=user.adId		//默认收货地址ID
			
				//var adname=user.adname;	 //收货人
				//var adphone=user.adphone;	//联系号码
				//var addetail=user.addetail;	//详细地址
				//var adstatus=user.adstatus;	//状态
				//var prname=user.prname;		//省份
				//var ctname=user.ctname;		//城市
				//var arname=user.arname;		//街道
				//arid=user.arid;				//街道ID
				
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
				
			     if (${not empty adname})
				    $("#adname").val(adname);
				 else
				    adname=  $("#adname").val();
				    
				$("#adphone").val(adphone);
				$("#addetail").val(addetail);
				if(adid==adId){//如果默认收货地址ID与地址ID相同则打钩
					$("#adstatus").css("background-image","url(${pageContext.request.contextPath}/weixin/img/center/checked-checked.png)");
					$("#ckbox").attr('checked',true);
				}
				$("#provices").children().val(prname);
				$("#citys").children().val(ctname);
				$("#areas").children().val(arname);
			//});
			//保存
			$("#addAddress").click(function(){
				
				var nowTime = new Date().getTime();
			    var clickTime = $(this).attr("ctime");
			    if( clickTime != 'undefined' && (nowTime - clickTime < 3000)){
			        alert('操作过于频繁，稍后再试');
			        return false;
			     }else{
			        $(this).attr("ctime",nowTime);
				
				var reg=/^1[3|4|5|7|8][0-9]\d{8}$/;//验证手机号码格式
				var uid=usersid;	//会员ID
				var adname=$("#adname").val();	//收货人
				
				if(adname==null || adname=="")
				{
					mui.toast("收货人不能为空");
					return;
				}
				var adphone=$("#adphone").val();//联系电话
				if(adphone==null || adphone=="")
				{
					mui.toast("联系电话不能为空");
					return;
				}
				if(!reg.test(adphone))
				{
					mui.toast("联系号码格式不对");
					return;
				}
				var provies=$("#provices").children().val();
				if(provies==null || provies=="")
				{
					mui.toast("请选择省份");
					return;
				}
				var citys=$("#citys").children().val();
				if(citys==null || citys=="")
				{
					mui.toast("请选择城市");
					return;
				}
				var areas=$("#areas").children().val();
				var adarea=arid;	//县 or区 id
				if(areas==null || areas=="")
				{
					mui.toast("请选择街道");
					return;
				}
				var addetail=$("#addetail").val();	//详细地址
				if(addetail==null || addetail=="")
				{
					mui.toast("请填写您的详细地址");
					return;
				}
				var check=$("input[name=check]:checked").length;
				var adstatus=check;	//状态 是否默认
				if(adid.trim().length == 0){
				//新增收货地址
				mui.ajax("${pageContext.request.contextPath}/"+"appaddress.do?p=addAddress"+"&adId="+adId,{
					data:{
						uid:uid,
						adname:adname,
						adphone:adphone,
						adarea:adarea,
						addetail:addetail,
						adstatus:adstatus
					},
					type:'post',
					timeout:30000,
					success:function(data){
						mui.toast("新增收货地址成功");
						window.location = "${pageContext.request.contextPath}/weixin/center/address.jsp";
					},
					error:function(xhr,type,errorThrown){
						//异常处理；
						mui.toast("请求异常，请稍后再试！");
					}

				})
				}else{
					//编辑收货地址
					mui.ajax("${pageContext.request.contextPath}/"+"appaddress.do?p=editAddress&id="+adid+"&adId="+adId,{
						data:{
						adname:adname,
						adphone:adphone,
						adarea:adarea,
						addetail:addetail,
						adstatus:adstatus
						},
						type:'post',
						timeout:30000,
						success:function(data)
						{
							mui.toast("编辑成功");
							window.location = "${pageContext.request.contextPath}/weixin/center/address.jsp";
						}
					})
				}
				} 
			});
			
			
			var i=0;
			$(".bottom").bind("click",function(){
				if(i==1){
				$(this).css("background-image","url(${pageContext.request.contextPath}/weixin/img/center/checked.png)");
				$("input[name=check]").attr('checked',false);
				i--;
				}
				else{
				$(this).css("background-image","url(${pageContext.request.contextPath}/weixin/img/center/checked-checked.png)");
				$("input[name=check]").attr('checked',true);
				i++;
			}
	
			});
	
			$("#provices").click(function(event){ 
			
				adname = document.getElementById("adname").value;
				adphone = document.getElementById("adphone").value;
				addetail = document.getElementById("addetail").value;
				$("#hideDiv").css("display","block");  //打开遮蔽背景层
				window.location = "${pageContext.request.contextPath}/weixin/center/provice.jsp?adid="+adid+"&adId="+adId+"&adname="+adname+"&adphone="+adphone+"&arid="+arid+"&arname="+arname+"&ctname="+ctname+"&prname="+prname+"&addetail="+addetail+"&adstatus="+adstatus;	
			});
			
			$("#citys").click(function(){
				
				adname = document.getElementById("adname").value;
				adphone = document.getElementById("adphone").value;
				addetail = document.getElementById("addetail").value;
				$("#hideDiv").css("display","block");  //打开遮蔽背景层
				window.location = "${pageContext.request.contextPath}/weixin/center/provice.jsp?adid="+adid+"&adId="+adId+"&adname="+adname+"&adphone="+adphone+"&arid="+arid+"&arname="+arname+"&ctname="+ctname+"&prname="+prname+"&addetail="+addetail+"&adstatus="+adstatus;	
			});
			$("#areas").click(function(){
				adname = document.getElementById("adname").value;
				adphone = document.getElementById("adphone").value;
				addetail = document.getElementById("addetail").value;
				$("#hideDiv").css("display","block");  //打开遮蔽背景层
				window.location = "${pageContext.request.contextPath}/weixin/center/provice.jsp?adid="+adid+"&adId="+adId+"&adname="+adname+"&adphone="+adphone+"&arid="+arid+"&arname="+arname+"&ctname="+ctname+"&prname="+prname+"&addetail="+addetail+"&adstatus="+adstatus;	
			});
		</script>
	</body>

</html>