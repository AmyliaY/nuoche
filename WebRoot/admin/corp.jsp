<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<title>APP版本管理</title>
	</head>
	<body>
		<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span> 配送方式
		<span class="c-gray en">&gt;</span> 启禁用配送方式
		<a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i> </a>
		</nav>
		<div class="pd-20">
			<div class="mt-20">
				<table id="tab"
					class="table table-border table-bordered table-hover table-bg table-sort">
					<thead>
						<tr class="text-c">
							<th width="40">
								序号
							</th>
							<th width="40">
								配送方式
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
							<tr class="text-c">
								<td>
									1
								</td>
								<td>
									自提
								</td>
								<td>
									<c:if test="${corpmap.ziti==0}"><span class="label label-defaunt radius">禁用 </span></c:if>
									<c:if test="${corpmap.ziti==1}"><span class="label label-success radius">启用 </span></c:if>
								</td>
								<td class="td-manage">
									<a style="text-decoration: none"
										onclick="xiugai_status(this,1)"
										href="javascript:void(0)" title="修改状态"><c:choose>
											<c:when test="${corpmap.ziti==1}">
												<span class="label label-defaunt radius">禁用</span>
											</c:when>
											<c:otherwise>
												<span class="label label-success radius">启用</span>
											</c:otherwise>
										</c:choose> </a>
								</td>
							</tr>
							<tr class="text-c">
								<td>
									2
								</td>
								<td>
									快递
								</td>
								<td>
									<c:if test="${corpmap.kuaidi==0}"><span class="label label-defaunt radius">禁用 </span></c:if>
									<c:if test="${corpmap.kuaidi==1}"><span class="label label-success radius">启用 </span></c:if>
								</td>
								<td class="td-manage">
									<a style="text-decoration: none"
										onclick="xiugai_status(this,2)"
										href="javascript:void(0)" title="修改状态"><c:choose>
											<c:when test="${corpmap.kuaidi==1}">
												<span class="label label-defaunt radius">禁用</span>
											</c:when>
											<c:otherwise>
												<span class="label label-success radius">启用</span>
											</c:otherwise>
										</c:choose> </a>
								</td>
							</tr>
							<tr class="text-c">
								<td>
									3
								</td>
								<td>
									送货上门
								</td>
								<td>
									<c:if test="${corpmap.songhuo==0}"><span class="label label-defaunt radius">禁用 </span></c:if>
									<c:if test="${corpmap.songhuo==1}"><span class="label label-success radius">启用 </span></c:if>
								</td>
								<td class="td-manage">
									<a style="text-decoration: none"
										onclick="xiugai_status(this,3)"
										href="javascript:void(0)" title="修改状态"><c:choose>
											<c:when test="${corpmap.songhuo==1}">
												<span class="label label-defaunt radius">禁用</span>
											</c:when>
											<c:otherwise>
												<span class="label label-success radius">启用</span>
											</c:otherwise>
										</c:choose> </a>
								</td>
							</tr>
					</tbody>
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
function xiugai_status(a,type)
{
	var url="${pageContext.request.contextPath}/corp.do?p=editStatus";
	var param={type:type};
	$.post(url,param,function(data){
		var td=$(a).parent().parent().find("td").eq(2);
		if(data=='0')
		{
			td.html('<span class="label label-defaunt radius">禁用</span>');
			a.innerHTML='<span class="label label-success radius">启用</span>';
		}else{
			td.html('<span class="label label-success radius">启用</span>');
			a.innerHTML='<span class="label label-defaunt radius">禁用</span>';
		}
	});
	
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