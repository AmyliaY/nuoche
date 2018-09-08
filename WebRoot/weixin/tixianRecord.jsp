<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html class="no-js">

	<head>

		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport"
			content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no">
		<title>卡卡挪车</title>

		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/weixin/css/amazeui.min.css" />
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/weixin/css/style.css" />

		<script type="text/javascript"
			src="${pageContext.request.contextPath}/weixin/js/jquery.min.js"></script>

		<script type="text/javascript"
			src="${pageContext.request.contextPath}/weixin/js/amazeui.min.js"></script>

		<!--<![endif]-->
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/weixin/css/mui.min.css" />
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/weixin/css/font5.css" />
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/weixin/css/nb-withdraw.css" />
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/weixin/css/page.css" />
		<style>
#cash_log tbody tr td {
	vertical-align: middle !important;
}
</style>
	</head>

	<body>





		<header class="mui-bar mui-bar-nav"
			style="background-color: cornflowerblue;">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"
				style="color: white;"></a>
			<h1 class="mui-title" style="color: white;">
				提现记录
			</h1>
		</header>


		<div class="mui-content mui-scroll-wrapper">


			



			<div class="fq-record-message fq-background-white">
				<table
					class="fq-background-white am-table am-table-striped am-text-sm am-text-center"
					id="cash_log">
					<thead>
						<tr class="text-c">

							<th class="am-text-center">
								时间
							</th>
							<th class="am-text-center">
								金额
							</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${txmap.list}" var="o" varStatus="i">
							<tr class="text-c">

								<td title="${o.time}" class="mytd">
									<fmt:formatDate value="${o.time}" pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td title="${o.cash}" class="mytd">
									${o.cash}
								</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
				<ul class="am-pagination am-pagination-centered am-text-xs"
					id="page">
				</ul>

			</div>

		</div>
         <script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
         <script>mui.init();</script>
	</body>
</html>
