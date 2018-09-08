<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>查看新闻</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">

		<link rel="stylesheet" href="${pageContext.request.contextPath }/weixin/mui/css/mui.min.css">
		
		<style>
			
			html,body,.mui-content {
				background-color: #fff;
			}
			
			
	 		img{
 				width:100%;
 				height:auto;
 			}
 			#content{
 				clear: both;
 			    display: block;
  				margin:auto;
  				width:95%;

 			}
		</style>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav">
			
			<h1 class="mui-title">${news.newsTitle }</h1>
		</header> 
		<div class="mui-content">
				
				<div id="content">
				 <div class="mui-table" style="margin-top:10px;margin-bottom:10px;">
					<div class="mui-table-cell mui-col-xs-6 mui-text-left" >
					<font size="2">作者：${news.newsAuthor }	</font>
					</div>
					<div class="mui-table-cell mui-col-xs-6 mui-text-left">
					<font size="2">时间：  <fmt:formatDate value="${news.newsTime }" pattern="yyyy-MM-dd  HH:mm" />	 </font>
					</div>
				</div>
				${news.newsText }
				<p>浏览次数&nbsp;&nbsp;${news.newsReadNum}</p>
			</div>
		</div>
		
	</body>
</html>



