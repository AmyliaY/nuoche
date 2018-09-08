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
<title>预约管理</title>
<!-- 
 查仕龙   3月25
 -->


</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		预约中心 <span class="c-gray en">&gt;</span> 预约列表 <a
			class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i> </a>
	</nav>
	<div class="pd-20">
		<div class="text-c">
			<form
				action="${pageContext.request.contextPath}/admin_moban.do?p=xiaoxilisting&status=${status}"
				method="post">
				日期范围： <input type="text" name="begindate" value="${param.begindate}"
					onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})"
					id="datemin" class="input-text Wdate" style="width: 120px;">
				- <input type="text" name="enddate" value="${param.enddate}"
					onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})"
					id="datemax" class="input-text Wdate" style="width: 120px;">
				<input type="text" name="keywords" class="input-text"
					style="width: 250px" value="${keywords}" placeholder="输入会员名称">
				<button type="submit" class="btn btn-success radius">
					<i class="Hui-iconfont">&#xe665;</i> 搜订单
				</button>
			</form>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"></span> <span class="r">共有数据：<strong>${mobanmap.sum}</strong>
				条
			</span>
		</div>
		<div class="mt-20">
			<table id="tab"
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="40">序号</th>
						<th width="40">模板标题</th>
						<th width="40">模板开头</th>
						<th width="40">模板结尾</th>

						<th width="40">模板链接</th>

						<th width="60">模板参数</th>
						<th width="70">参数含义</th>
						<th width="40">创建时间</th>
						<th width="40">操作</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${mobanmap.list}" var="o" varStatus="i">
						<tr class="text-c">
							<td>${i.count+(mobanmap.page-1)*mobanmap.size}</td>
							<td>${o.tptitle}</td>
							<td>${o.tpstart}</td>
							<td>${o.tpending}</td>
							<td>${o.tplink}</td>
							<td>${o.tpparameters}</td>
							<td>${o.tpmeaning}</td>
							<td><fmt:formatDate value="${o.tpcreatetime}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td class="td-manage"><a style="text-decoration: none"
								onclick="xiugai_status(this,${o.id})" href="javascript:void(0)"
								title="修改状态"><c:choose>
										<c:when test="${o.tpstatus==1}">
											<span class="label label-defaunt radius">可禁用</span>
										</c:when>
										<c:otherwise>
											<span class="label label-success radius">可启用</span>
										</c:otherwise>
									</c:choose> </a> <a
								href="${pageContext.request.contextPath}/admin_moban.do?p=findbyid&update=1&id=${o.id}"><span
									class="label label-primary  radius">编辑</span></a></td>

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
								<td width="50%">第 <span class="right-text09">${mobanmap.page}</span>
									页 | 共 <span class="right-text09">${mobanmap.count }</span> 页
								</td>
								<td width="32%" align="right">[ <a
									href="${pageContext.request.contextPath}/admin_moban.do?p=xiaoxilisting&status=${status}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}"
									class="right-font08">首页</a> | <a
									href="${pageContext.request.contextPath}/admin_moban.do?p=xiaoxilisting&status=${status}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}&page=${mobanmap.page-1}"
									class="right-font08">上一页</a> | <a
									href="${pageContext.request.contextPath}/admin_moban.do?p=xiaoxilisting&status=${status}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}&page=${mobanmap.page+1}"
									class="right-font08">下一页</a> | <a
									href="${pageContext.request.contextPath}/admin_moban.do?p=xiaoxilisting&status=${status}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}&page=${mobanmap.count}"
									class="right-font08">末页</a> ] 转至：
								</td>
								<td width="5%">
									<table width="20" byuyueorder="0" cellspacing="0"
										cellpadding="0">
										<tr>
											<td width="1%"><input name="textfield3" type="text"
												id="page" value="${mobanmap.page}" class="right-textfield03"
												size="3" /></td>
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
				window.location.href = "${pageContext.request.contextPath}/admin_moban.do?p=xiaoxilisting&status=${status}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}&page=" + page;
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
	
	
	
		//修改用户状态 
		function xiugai_status(a, id) {
			var url = "${pageContext.request.contextPath}/admin_moban.do?p=xiugaistatus";
			var param = {
				id : id
			};
			$.post(url, param, function(data) {
				var td = $(a).parent().parent().find("td").eq(9);
				if (data == "0") {
					td.html('<span class="label label-defaunt radius">已禁用</span>');
					a.innerHTML = '<span class="label label-success radius">可启用</span>';
				} else {
					td.html('<span class="label label-success radius">已启用</span>');
					a.innerHTML = '<span class="label label-defaunt radius">可禁用</span>';
				}
				layer.msg('修改成功', {
					icon : 6,
					time : 1000
				});
			});
		}
	</script>
</body>
</html>