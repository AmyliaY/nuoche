<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.getSession().setAttribute("page", 0);

String neiro = request.getParameter("neiro");
if (neiro!=null)
   neiro = new String(neiro.getBytes("iso8859-1"),"utf-8");
 pageContext.setAttribute("neiro",neiro);
 
 String title = request.getParameter("title");
if (title!=null)
   title = new String(title.getBytes("iso8859-1"),"utf-8");
 pageContext.setAttribute("title",title);
 
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>轮播图详情</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="../css/mui.min.css" rel="stylesheet" />
		<script src="../js/jquery-1.9.0.min.js"></script>
		
		<style>
			.title_text {
				width: 100%;
				margin-top: 10%;
				margin-bottom: 20px;
				font-size: 28px;
				color: #666666;
			}
			.neiro_text {
			    width: 100%;
				margin-top: 4px;
				margin-bottom: 40px;
				font-size: 17px;
				color: #666666;
				margin-left: 5%;
				
			}
			.lunboimg img{
				width: 90%;
				height: 150px;
				margin-bottom: 40px;
				margin-top: 10%;
			}
		</style>
	</head>
	    <header class="mui-bar mui-bar-nav"style="background-color:#FF7900;margin-top: 0px;">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
			<h1 class="mui-title" style="color: white;">图文详情</h1>
		</header>
	
	<div class="mui-scroll-wrapper mui-content" style="background: white;">
		<div class="title_text" id="til" align="center">
		    
		</div>
		<!--分割线-->
		<div style="background: whitesmoke; padding-top:8px;padding-bottom: 3px;">
						
		</div>

		
		<div class="lunboimg" align="center">
			<img id="lbimg" width="200" height="200" src=""/>
		</div>
		
		
		<div class="neiro_text" id="neiro">
	
		</div>
	</div>
	
	<body>
		<script src="../js/mui.min.js"></script>
		<script type="text/javascript">
			mui.init();
			window.onload = function (){
				var til=document.getElementById("til");
				til.innerHTML='${title}';
				var nei=document.getElementById("neiro");
				nei.innerHTML='${neiro}';
				var img = document.getElementById("lbimg");
				img.src = "${param.img}";
			}
		</script>
	</body>
</html>