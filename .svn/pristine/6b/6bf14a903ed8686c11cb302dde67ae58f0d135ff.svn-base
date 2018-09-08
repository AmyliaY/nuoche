<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.getSession().setAttribute("page", 0);
%>
<!doctype html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="../css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="../homrl.js"></script>
		<style>
			.erji {
				list-style: none;
				float: left;
				margin-right: 10px;
				margin-top: 10px;
			}
			.list_div1 {
				/*background-color: aquamarine;*/
				width: 90px;
				height: 80px;
				float: left;
				/*margin-left: -10px;*/
				/*margin-left: 3%;*/
				/*border-radius: 50%;*/
				/*text-align: center;*/
			}
			.list_div1_div {
				width: 60%;
				height: 60%;
				margin: auto;
				background-color: white;
			}
			.erji_img{
				width: 54px;
				height: 54px;
			}
		</style>
	</head>

	<body style="background-color: white;">
		<header class="mui-bar mui-bar-nav" style="background-color: #FF7900;">
			<a style="color: white;" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left jiantou"></a>
			<h1 id="one" class="mui-title"></h1>
		</header>

		<div class="mui-content">
			<ul id="erji" style="width: 100%;">
				<!--<li class="erji">
					<a href="#">
						<div class="list_div1">
							<div class="list_div1_div">
								<img class="erji_img" src="../images/0.jpg"/>
							</div>
							<span class="mui-ellipsis" style="color: #666;line-height: 40px;font-size: 80%;text-align: center;width: 54px;padding: 0px 18px;">
								二级分
							</span>
						</div>
					</a>
				</li>-->
				
			</ul>
		</div>
		
		<script src="../js/mui.min.js"></script>
		<script type="text/javascript">
			mui.init()
			var gtid=null;
			mui.plusReady(function(){
				gtid=plus.webview.currentWebview().gtId;
				mui.ajax(SERVER_URL+'goodstype.do?p=getAllGoodsTwoType&gtid='+gtid,{
					type:"post",
					timeout:30000,
					success:function(data){
						var map=eval("("+data+")");
						document.getElementById("one").innerText=map.list[0].goodsonetype.gtName;
						for(var i=0;i<map.list.length;i++){
							var str='<li class="erji" onclick="goods('+map.list[i].gttId+')">'+
										'<a href="#">'+
											'<div class="list_div1">'+
												'<div class="list_div1_div">'+
													'<img class="erji_img" src="../images/0.jpg"/>'+
												'</div>'+
												'<span class="mui-ellipsis" style="color: #666;line-height: 40px;font-size: 80%;text-align: center;width: 54px;padding: 0px 18px;">'+
													map.list[i].gttName+
												'</span></div></a></li>';
							var erji=document.getElementById("erji");
							erji.innerHTML+=str;
						}
					}
				});
			});
			function goods(gttId){
				mui.openWindow({
					url: '/home/goods.html',
					extras: {
						gttId:gttId				
					}
				});
			}
		</script>
	</body>

</html>