<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="${pageContext.request.contextPath }/lib/css/H-ui.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/lib/css/H-ui.admin.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/lib/lib/Hui-iconfont/1.0.7/iconfont.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/lib/css/css.css"
	rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->

<title>轮播费用详情</title>
<!-- 
 张嘉雄  3月27
 -->


</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		财务管理 <span class="c-gray en">&gt;</span> 对账<a
			class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i> </a>
	</nav>
	<div class="pd-20">
		<div class="text-c">
			<form
				action="${pageContext.request.contextPath}/admin_zhiding.do?p=zhiding&status=${status }&id=${id}"
				method="post">
				日期范围： <input type="text" name="begindate" value="${param.begindate}"
					onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})"
					id="datemin" class="input-text Wdate" style="width: 120px;">
				- <input type="text" name="enddate" value="${param.enddate}"
					onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})"
					id="datemax" class="input-text Wdate" style="width: 120px;">
				<input type="text" name="keywords" class="input-text"
					style="width: 250px" value="${keywords}" placeholder="输入服务名称">
				<button type="submit" class="btn btn-success radius">
					<i class="Hui-iconfont">&#xe665;</i> 查找记录
				</button>
			</form> 
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"></span> <span class="r">共有数据：<strong>${zhidingmap.sum}</strong>
				条
			</span>
		</div>
		<div class="mt-20">
			<table id="tab"
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="25px;">序号</th>
						<th width="40">置顶服务名</th>
						<th width="40">置顶天数</th>
						<th width="40">创建时间</th>
						<th width="40">单价</th>
						<th width="40">总价</th>

					
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${zhidingmap.list}" var="o" varStatus="i">
						<tr class="text-c">
							<td>${i.count+(zhidingmap.page-1)*zhidingmap.size}</td>
							<td>${o.service.title}</td>
							<td>${o.days}</td>
							<td><fmt:formatDate value="${o.created}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>${o.danjia}</td>
							
							<td>${o.totalprice}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<table width="95%" byuyueorder="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="6"><img src="../images/spacer.gif" width="1"
						height="1" /></td>
				</tr>
				<tr>
					<td height="33">
						<table width="100%" byuyueorder="0" align="center" cellpadding="0"
							cellspacing="0" class="right-font08">
							<tr>
								<td width="50%">第 <span class="right-text09">${zhidingmap.page}</span>
									页 | 共 <span class="right-text09">${zhidingmap.count }</span> 页
								</td>
								<td width="32%" align="right">[ <a
									href="${pageContext.request.contextPath}/admin_zhiding.do?p=zhiding&status=${status }&id=${id}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}"
									class="right-font08">首页</a> | <a
									href="${pageContext.request.contextPath}/admin_zhiding.do?p=zhiding&status=${status }&id=${id}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}&page=${zhidingmap.page-1}"
									class="right-font08">上一页</a> | <a
									href="${pageContext.request.contextPath}/admin_zhiding.do?p=zhiding&status=${status }&id=${id}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}&page=${zhidingmap.page+1}"
									class="right-font08">下一页</a> | <a
									href="${pageContext.request.contextPath}/admin_zhiding.do?p=zhiding&status=${status }&id=${id}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}&page=${zhidingmap.count}"
									class="right-font08">末页</a> ] 转至：
								</td>
								<td width="5%">
									<table width="20" byuyueorder="0" cellspacing="0"
										cellpadding="0">
										<tr>
											<td width="1%"><input name="textfield3" type="text"
												id="page" value="${zhidingmap.page}"
												class="right-textfield03" size="3" /></td>
											<td width="87%"></td>
											<td width="87%"><input name="Submit23222" type="submit"
												value="GO" onclick="viewGo()" /></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/layer/2.1/layer.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/laypage/1.2/laypage.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/My97DatePicker/WdatePicker.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/datatables/1.10.0/jquery.dataTables.min.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/js/H-ui.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/js/H-ui.admin.js">
</script>
	<script type="text/javascript">
		//页面跳转
		function viewGo() {
			var page = document.getElementById("page").value;
			if (page.match('^[0-9]*$')) {
				window.location.href = "${pageContext.request.contextPath}/admin_zhiding.do?p=zhiding&status=${status }&id=${id}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}&page=" + page;
			}
		}
		$(function() {
			$('.table-sort tbody').on('click', 'tr', function() {
				if ($(this).hasClass('selected')) {
					$(this).removeClass('selected');
				} else {
					table.$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
			});
		});
	</script>
</body>
</html>