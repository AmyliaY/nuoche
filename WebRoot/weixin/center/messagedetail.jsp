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
		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/jquery-1.9.0.min.jrl.js"></script>
	</head>
	<style>
		.message-title{
			text-align: center;
			margin-top: 55px;
			padding: 10px;
			line-height: 30px;
			font-size: 22px;
			color: #696969;
		}
		.message-content{
			    padding: 15px;
			    text-indent:2em;
				font-family: '微软雅黑';
				line-height:1.6;
				margin-bottom: 10px;
				margin-top:15px;
				font-size: 15px;
				color: #666666;
		}
		.message-bottom{
			text-align: right;
			padding: 10px;
			font-size: 18px;
			font-family: "楷体";
			color: silver;
		}
	</style>

	<body style="background: #FFFFFF;">
		<header class="mui-bar mui-bar-nav" style="background: #ff7900;">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
			<span class="mui-title" style="color: white;">系统消息</span>
		</header>
		<div id="detail">
			<!--<h3 class="message-title"> 消息标题</h3>
			<div class="message-content">消息内容正宗仙居杨梅新鲜东魁荸荠鲜杨梅正宗仙居杨梅新鲜东魁荸荠鲜杨梅正宗仙居杨梅新鲜东魁荸荠鲜杨梅容</div>
			<div class="message-bottom">
				2017-6-25
			</div>-->
		</div>
		
		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<script type="text/javascript">
			mui.init()
			var smid=null;
			var id=null;
			var noid=null;
			/*mui.plusReady(function(){
				id=plus.webview.currentWebview().mid;
				
			});*/
			
				  
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
 		    	
 		    	
 		    	id = "${param.mid}";
			    if(id==1){
					gonggao();
				}
				if(id==2){
					systemmsg();
				}
			//系统消息
			function systemmsg(){
				//smid=plus.webview.currentWebview().smid;
				 noid = '${param.noid}';
				mui.ajax("${pageContext.request.contextPath}/"+'messages.do?p=getMessageDetail&smid='+smid,{
					type:"post",
					timeout:30000,
					success:function(data){
						//alert(data);
						var map=eval("("+data+")");
						var str='<h3 class="message-title">'+map.list[0].smTitle+'</h3>'+
								'<div class="message-content">'+map.list[0].smDetail+'</div>'+
								'<div class="message-bottom">'+map.list[0].smTime+'</div>';
						var messagedetail=document.getElementById("detail");
						messagedetail.innerHTML+=str;
					}
				});
				//消息改成已读
				mui.ajax("${pageContext.request.contextPath}/"+'messages.do?p=updatemsStatus&smid='+smid,{
					type:"post",
					timeout:30000,
					success:function(data1){
						
					}
				});
			}
			//公告
			function gonggao(){
				//noid=plus.webview.currentWebview().noid;
				  noid = '${param.noid}';
				mui.ajax("${pageContext.request.contextPath}/"+'apptnotice.do?p=getByNoid&noid='+noid,{
			  		type:"post",
			  		timeout:30000,
			  		success:function(data){
			  			var map=eval("("+data+")");
						var str='<h3 class="message-title">'+map.tnotice.noTitle+'</h3>'+
								'<div class="message-content">'+map.tnotice.noContent+'</div>'+
								'<div class="message-bottom">'+map.tnotice.noTime+'</div>';
						var messagedetail=document.getElementById("detail");
						messagedetail.innerHTML+=str;
			  		}
			  	});
			}
		</script>
	</body>

</html>