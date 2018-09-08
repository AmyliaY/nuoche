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
		<link
			href="${pageContext.request.contextPath }/lib/css/H-ui.admin.css"
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
		<title>查看众筹商品折扣</title>
	</head>
	<body>
		
				<span class="r">共有数据：<strong>${rebateMap.sum}</strong> 条</span>
		<div class="mt-20">
			<table id="tab"
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="40">
							序号
						</th>
						<th width="40">
							折扣
						</th>
						<th width="40">
							起始重量
						</th>
						<th width="40">
							结束重量
						</th>
						<th width="40">
							状态
						</th>
						<th width="40">
							操作
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rebateMap.list}" var="r" varStatus="i">
						<tr class="text-c">
							<td>
								${i.count+(rebateMap.page-1)*rebateMap.size}
							</td>
							<td>
								<span class="label label-danger radius">${r.gcfrRebate}</span>
							</td>
							<td>
								<span class="label label-primary radius">${r.gcfrBeginkg} </span>
							</td>
							<td>
								<span class="label label-success radius">${r.gcfrEndkg} </span>
							</td>
							<td>
								<c:choose>
									<c:when test="${r.gcfrStatus==0}"><span class="label label-defaunt radius">禁用</span></c:when>
									<c:otherwise><span class="label label-success radius">启用 </span></c:otherwise>
								</c:choose>
							</td>
							<td class="td-manage">
								<a style="text-decoration: none"
										onclick="xiugai_status(this,${r.gcfrId})"
										href="javascript:void(0)" title="修改状态"><c:choose>
											<c:when test="${r.gcfrStatus==0}">
												<span class="label label-success radius">启用</span>
											</c:when>
											<c:otherwise>
												<span class="label label-defaunt radius">禁用</span>
											</c:otherwise>
										</c:choose> </a>
										<a style="text-decoration: none" onclick="member_edit('修改','zhongchougoods.do?p=updategoodssettimeview&id=${r.gcfrId}&type=2','0','','400')"
									href="javascript:void(0)" title="修改商品折扣">
										<span class="label label-danger radius">修改 </span>
									</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<table width="95%" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="6">
						<img src="../images/spacer.gif" width="1" height="1" />
					</td>
				</tr>
				<tr>
					<td height="33">
						<table width="100%" border="0" align="center" cellpadding="0"
							cellspacing="0" class="right-font08">
							<tr>
								<td width="50%">
									第
									<span class="right-text09">${ rebateMap.page}</span> 页 | 共
									<span class="right-text09">${rebateMap.count }</span> 页
								</td>
								<td width="32%" align="right" id="xiugaitype">
									[
									<a
										href="${pageContext.request.contextPath}/zhongchougoods.do?p=checkgoodsrebate&id=${id}"
										class="right-font08">首页</a> |
									<a
										href="${pageContext.request.contextPath}/zhongchougoods.do?p=checkgoodsrebate&id=${id}&page=${rebateMap.page-1}"
										class="right-font08">上一页</a> |
									<a
										href="${pageContext.request.contextPath}/zhongchougoods.do?p=checkgoodsrebate&id=${id}&page=${rebateMap.page+1}"
										class="right-font08">下一页</a> |
									<a
										href="${pageContext.request.contextPath}/zhongchougoods.do?p=checkgoodsrebate&id=${id}&page=${rebateMap.count}"
										class="right-font08">末页</a> ] 转至：
								</td>
								<td width="5%">
									<table width="20" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="1%">
												<input name="textfield3" type="text" id="page"
													value="${rebateMap.page}" class="right-textfield03"
													size="3" />
											</td>
											<td width="87%"></td>
											<td width="87%">
												<input name="Submit23222" type="submit" value="GO"
													onclick="viewGo()" />
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/js/jquery.min.js">
</script>
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
//修改商品折扣状态  禁用 or 启用
function xiugai_status(a,id)
{
	var url="${pageContext.request.contextPath}/zhongchougoods.do?p=updatestatusrebate";
	var param={id:id};
	$.post(url,param,function(data){
		var td=$(a).parent().parent().find("td").eq(4);
		if(data=="0")
		{
			td.html('<span class="label label-defaunt radius">禁用</span>');
			a.innerHTML='<span class="label label-success radius">启用</span>';
		}else{
			td.html('<span class="label label-success radius">启用</span>');
			a.innerHTML='<span class="label label-defaunt radius">禁用</span>';
		}
	});
}
//页面跳转
function viewGo() {
	var page = $("#page").val();
	if (page.match('^[0-9]*$')) {
		window.location.href = "zhongchougoods.do?p=checkgoodsrebate&id=${id}&page="
				+ page;
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
/*用户-添加*/
function member_add(title, url, w, h) {
	layer_show(title, url, w, h);
}
/*用户-查看*/
function member_show(title, url, id, w, h) {
	layer_show(title, url, w, h);
}
/*用户-停用*/
function member_stop(obj, id) {
	layer
			.confirm(
					'确认要停用吗？',
					function(index) {
						$(obj)
								.parents("tr")
								.find(".td-manage")
								.prepend(
										'<a style="text-decoration:none" onClick="member_start(this,id)" href="${pageContext.request.contextPath}/user.do?p=xiugaistatus&id=${u.uid}" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
						$(obj)
								.parents("tr")
								.find(".td-status")
								.html(
										'<span class="label label-defaunt radius">已停用</span>');
						$(obj).remove();
						layer.msg('已停用!', {
							icon : 5,
							time : 1000
						});
					});
}

/*用户-启用*/
function member_start(obj, id) {
	layer
			.confirm(
					'确认要启用吗？',
					function(index) {
						$(obj)
								.parents("tr")
								.find(".td-manage")
								.prepend(
										'<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
						$(obj)
								.parents("tr")
								.find(".td-status")
								.html(
										'<span class="label label-success radius">已启用</span>');
						$(obj).remove();
						layer.msg('已启用!', {
							icon : 6,
							time : 1000
						});
					});
}
/*用户-编辑*/
function member_edit(title, url, id, w, h) {
	layer_show(title, url, w, h);
}
/*密码-修改*/
function change_password(title, url, id, w, h) {
	layer_show(title, url, w, h);
}
/*用户-删除*/
function member_del(obj, id) {
	layer.confirm('确认要删除吗？', function(index) {
		$(obj).parents("tr").remove();
		layer.msg('已删除!', {
			icon : 1,
			time : 1000
		});
	});
}
</script>
	</body>
</html>