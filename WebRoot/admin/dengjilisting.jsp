<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<title>会员管理</title>
	</head>
	<body>
		<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span> 会员中心
		<span class="c-gray en">&gt;</span> 会员等级管理
		<a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i> </a>
		</nav>
		<div class="pd-20">
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l"><a
					href="javascript:void(0)"
					class="btn btn-primary radius"
					onclick="dengji_add('新增会员等级','${pageContext.request.contextPath}/admin/dengji_add.jsp','','510')">
						新增等级</a></span>
				<span class="r">共有数据：<strong>${map.sum}</strong> 条</span>
			</div>
			<div class="mt-20">
				<table id="tab"
					class="table table-border table-bordered table-hover table-bg table-sort">
					<thead>
						<tr class="text-c">
							<th width="30">
								序号
							</th>
							<th width="40">
								等级称号
							</th>
							<th width="50">
								直推起始人数
							</th>
							<th width="50">
								直推结束人数
							</th>
							<th width="70">
								团队起始人数
							</th>
							<th width="50">
								团队结束人数
							</th>
							<th width="60">
								购买等级金额
							</th>
							
							
							<th width="100">
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${map.list}" var="u" varStatus="i">
							<tr class="text-c">
								<td>
									${i.count+(map.page-1)*map.size}
								</td>
								<td>
									${u.djname}
								</td>
								<td>
									<span class="label label-danger radius">${u.djbegintui}</span>
								</td>
								<td>
									<span class="label label-danger radius">${u.djendtui}</span>
								</td>
								<td>
									<span class="label label-danger radius">${u.djbegintuan}</span>
								</td>
								<td>
									<span class="label label-danger radius">${u.djendtuan}</span>
								</td>
								<td>
									<span class="label label-danger radius">${u.djjine}</span>
								</td>
								
								
								<td class="td-manage">
									<a style="text-decoration: none" onclick="dengji_edit('编辑会员等级','dianpu.do?p=getByJBId&id=${u.djid}','10001')"
									href="javascript:void(0)" title="编辑">
										<span class="label label-success radius">编辑 </span>
									</a>
									<a style="text-decoration: none"
									href="javascript:void(0)" onclick="member_del(this,${u.djid})">
										<span class="label label-danger radius">删除</span>
									</a>
								</td>
							</tr>
						</c:forEach>
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
function dengji_edit(title,url,id,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}


function viewGo()
{
	var page=document.getElementById("page").value;
	if(page.match('^[0-9]*$'))
		{	
	window.location.href="${pageContext.request.contextPath}/users.do?p=userlisting&type=${usersmap.type}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}&page="+page;
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
function dengji_add(title, url, w, h) {
	layer_show(title, url, w, h);
}
/*用户-查看*/
function member_show(title, url, id, w, h) {
	layer_show(title, url, w, h);
}


/*用户-编辑*/
function article_edit(title, url, id, w, h) {
	layer_show(title, url, w, h);
}
/*密码-修改*/
function change_password(title, url, id, w, h) {
	layer_show(title, url, w, h);
}
/*用户-删除*/
function member_del(obj,id) {
	layer.confirm('确认要删除吗？', function(index) {
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/dengji.do?p=dengjiDel",
			data:{djid:id},	
			success:function(){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
				setTimeout(1000);
			},
			error: function(XmlHttpRequest, textStatus, errorThrown){
				layer.msg('error!',{icon:2,time:1000});
			}
		});
	});
}
</script>
	</body>
</html>