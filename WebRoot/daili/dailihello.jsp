<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dailihello.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 代理欢迎界面-唐仁鑫 2018/3/25 -->
<link href="${pageContext.request.contextPath }/lib/css/dailihello.css"
			rel="stylesheet" type="text/css" />	

  </head>
  <body>
    <div class="inner">
			<div class="top">
				<div class="ming">
					<div class="mindiv" id="mindiv1">
					
						<div class="min-left" style="background-image: url('${pageContext.request.contextPath }/daili/images/hello/n1.png');">
							
						</div>
						<div class="min-right">
							<p class="tit">挪车卡统计</p>
							<p class="titp">卡片共<c:if test="${proxy.sumCard!=null}">${proxy.sumCard}</c:if><c:if test="${proxy.sumCard==null }">0</c:if>张</p>
							<p class="titp">已激活<c:if test="${!empty proxy.sumActive }">${proxy.sumActive}</c:if><c:if test="${empty proxy.sumActive }">0</c:if>张</p>
							<p class="titp">未激活<c:if test="${!empty proxy.noActive }">${proxy.noActive}</c:if><c:if test="${empty proxy.noActive }">0</c:if>张</p>
						</div>
					</div>
					<div class="mindiv" id="mindiv2">
						
						<div class="min-left" style="background-image: url('${pageContext.request.contextPath }/daili/images/hello/n2.png');">
							
						</div>
						<div class="min-right" >
							<p class="tit" style="color: orange;">账户收益</p>
							<p class="titp">余额<c:if test="${!empty proxy.totalAmount }">${proxy.totalAmount }</c:if><c:if test="${empty proxy.totalAmount }">0.0</c:if>元</p>
							<p class="titp">已提现<c:if test="${!empty proxy.yiCash }">${proxy.yiCash }</c:if><c:if test="${empty proxy.yiCash }">0.0</c:if>元</p>
							<p class="titp"><button class="gongneng" onclick="window.location.href='${pageContext.request.contextPath}/daili_tixian.do?p=tixianlisting&proxyid=${proxy.id }'" style="background-color: orange;">提现</button></p>
						</div>
					</div>
					<div class="mindiv" id="mindiv3">
						<div class="min-left" style="background-image: url(${pageContext.request.contextPath }/daili/images/hello/n3.png);">
							
						</div>
						<div class="min-right">
							<p class="tit" style="color: greenyellow;">代理信息</p>
							<p class="titp">代理<c:if test="${!empty ziproxynum }">${ziproxynum }人</c:if> <c:if test="${empty ziproxynum }">0人</c:if></p>
							<p class="titp"><button class="gongneng" onclick="window.location.href='${pageContext.request.contextPath}/dailimanage.do?p=listzidaili'" style="background-color: greenyellow;margin-top: 20px;">查看</button></p>
						</div>
					</div>
					<div class="mindiv" id="mindiv4">
						<div class="min-left" style="background-image: url(${pageContext.request.contextPath }/daili/images/hello/n4.png);">
							
						</div>
						<div class="min-right">
							<p class="tit" style="color: blueviolet;">用户统计</p>
							<p class="titp">已绑卡<c:if test="${!empty proxy.sumActive }">${proxy.sumActive}</c:if><c:if test="${empty proxy.sumActive }">0</c:if>人</p>
							<p class="titp">未绑卡<c:if test="${!empty proxy.noActive }">${proxy.noActive}</c:if><c:if test="${empty proxy.noActive }">0</c:if>人</p>
							<p class="titp"></p>
						</div>
					</div>
					
				</div>
				
				
			</div>
			<div class="info">
				<table id="dailiinfotable" border="1">
					<tr>
						<td colspan="4" class="colname" style="font-size: 18px;">我的信息</td>
					</tr>
					<tr>
						<td class="colname">姓名：</td>
						<td class="colinfo"  >${proxy.realname }</td>
					</tr>
					<tr>
						<td class="colname">联系电话：</td>
						<td class="colinfo"  >${proxy.tel }</td>
					</tr>
					
					<tr>
						<td class="colname" >区域：</td>
						<td class="colinfo" >${proxy.area.city.province.prName }${proxy.area.city.ctName }${proxy.area.arName}</td>
					</tr>
					
				</table>
				
			</div>
	
	</div>
  </body>
</html>
