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
		<title>退货管理</title>
	</head>
	<body>
		<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span> 退货中心
		<span class="c-gray en">&gt;</span> 退货列表
		<a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i> </a>
		</nav>
		<div class="pd-20">
			<div class="text-c">
				<form
					action="${pageContext.request.contextPath}/returngoods.do?p=returngoodsing"
					method="post">
					退货状态:
					<span class="select-box" style="width: 150px;"> <select
							var="1" class="select" size="1" id="grstatus" name="grstatus">
							<option value="">
							
							</option>
							<option value="0"<c:if test="${grstatus==0}">selected</c:if>>申请</option>
							<option value="1"<c:if test="${grstatus==1}">selected</c:if>>申请同意</option>
							<option value="2"<c:if test="${grstatus==2}">selected</c:if>>申请不同意</option>
							<option value="3"<c:if test="${grstatus==3}">selected</c:if>>客户已发货</option>
							<option value="4"<c:if test="${grstatus==4}">selected</c:if>>公司已收货</option>
							<option value="5"<c:if test="${grstatus==5}">selected</c:if>>同意退款</option>
							<option value="6"<c:if test="${grstatus==6}">selected</c:if>>不同意退款</option>
						</select> </span>
					退货日期范围：
					<input type="text" name="begindate" value="${param.begindate}"
						onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})"
						id="datemin" class="input-text Wdate" style="width: 120px;">
					-
					<input type="text" name="enddate" value="${param.enddate}"
						onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})"
						id="datemax" class="input-text Wdate" style="width: 120px;">
					<input type="text" name="keywords" class="input-text"
						style="width: 250px" value="${keywords}" placeholder="输入会员名称">
					<button type="submit" class="btn btn-success radius" >
						<i class="Hui-iconfont">&#xe665;</i> 搜退货订单
					</button>
				</form>
			</div>
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l"></span>
				<span class="r">共有数据：<strong>${rgmap.sum}</strong> 条</span>
			</div>
			<div class="mt-20">
				<table id="tab"
					class="table table-border table-bordered table-hover table-bg table-sort">
					<thead>
						<tr class="text-c">
							<th width="40">
								序号
							</th>
							<th width="32">
								订单编号
							</th>
							<th width="32">
								退货会员
							</th>
							<th width="50">
								申请退货时间
							</th>
							<th width="20">
								状态
							</th>
							<th width="50">
								退货完成时间
							</th>
							<th width="100">
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${rgmap.list}" var="rg" varStatus="i">
							<tr class="text-c">
								<td>
									${i.count+(rgmap.page-1)*rgmap.size}
								</td>
								<td>
									${rg.goodsorders.orOrdernumber}
								</td>
								<td>
									${rg.goodsorders.userinfo.usersName}
								</td>
								<td>
									<fmt:formatDate value="${rg.grTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
								<td class="td-status">
								<c:if test="${rg.grStatus==0}"><span class="label label-success radius">申请 </span></c:if>
								<c:if test="${rg.grStatus==1}"><span class="label label-success radius">申请同意 </span></c:if>
								<c:if test="${rg.grStatus==2}"><span class="label label-success radius">申请不同意 </span></c:if>
								<c:if test="${rg.grStatus==3}"><span class="label label-success radius">客户已发货 </span></c:if>
								<c:if test="${rg.grStatus==4}"><span class="label label-success radius">公司已收货 </span></c:if>
								<c:if test="${rg.grStatus==5}"><span class="label label-success radius">同意退款 </span></c:if>
								<c:if test="${rg.grStatus==6}"><span class="label label-success radius">不同意退款 </span></c:if>
								</td>
								<td>
									<c:if test="${rg.grStatus==2 || rg.grStatus==5 || rg.grStatus==6}" var="f">
										<fmt:formatDate value="${rg.grEndtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
									</c:if>
									<c:if test="${not f}">
										暂未完成退货
									</c:if>
								</td>
								<td class="td-manage">
									<c:if test="${rg.grStatus==0}">
									<a style="text-decoration: none"
										onclick="xiugai_status(${rg.grId},type=1)"
										href="javascript:void(0)" title="申请同意"><span class="label label-success radius">申请同意 </span></a>
									<a style="text-decoration: none"
										onclick="article_edit('申请不同意','returngoods.do?p=tuihuobutongyi&id=${rg.grId}&type=1','0')"
										href="javascript:void(0)" title="申请不同意"><span class="label label-danger radius">申请不同意 </span></a>
									</c:if>
									<c:if test="${rg.grStatus==1}">
										<a style="text-decoration: none"
										onclick="dendai()"
										href="javascript:void(0)" title="等待客户发货"><span class="label label-primary radius">等待客户发货 </span></a>
									</c:if>
									<c:if test="${rg.grStatus==2 || rg.grStatus==5 || rg.grStatus==6}">
										<a style="text-decoration: none"
										href="javascript:void(0)" title="退货已结束"><span class="label label-primary radius">退货已结束 </span></a>
									</c:if>
									<c:if test="${rg.grStatus==3}">
										<a style="text-decoration: none"
										onclick="xiugai_status(${rg.grId},type=3)"
										href="javascript:void(0)" title="确认收货"><span class="label label-primary radius">确认收货 </span></a>
									</c:if>
									<c:if test="${rg.grStatus==4}">
										<a style="text-decoration: none"
										onclick="xiugai_status(${rg.grId},type=4)"
										href="javascript:void(0)" title="同意退款"><span class="label label-success radius">同意退款 </span></a>
									<a style="text-decoration: none"
										onclick="article_edit('不同意退款','returngoods.do?p=tuihuobutongyi&id=${rg.grId}&type=2','0')"
										href="javascript:void(0)" title="不同意退款"><span class="label label-danger radius">不同意退款 </span></a>
									</c:if>
									<a style="text-decoration: none"
										onclick="member_edit('退货详情','returngoods.do?p=rgdetail&id=${rg.grId}','0','','400')"
										href="javascript:void(0)" title="退货详情"><span class="label label-primary radius">退货详情 </span></a>
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
										<span class="right-text09">${ rgmap.page}</span> 页 |
										共
										<span class="right-text09">${rgmap.count }</span> 页
									</td>
									<td width="32%" align="right">
										[
										<a
											href="${pageContext.request.contextPath}/returngoods.do?p=returngoodsing&grstatus=${grstatus}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}"
											class="right-font08">首页</a> |
										<a
											href="${pageContext.request.contextPath}/returngoods.do?p=returngoodsing&grstatus=${grstatus}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}&page=${rgmap.page-1}"
											class="right-font08">上一页</a> |
										<a
											href="${pageContext.request.contextPath}/returngoods.do?p=returngoodsing&grstatus=${grstatus}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}&page=${rgmap.page+1}"
											class="right-font08">下一页</a> |
										<a
											href="${pageContext.request.contextPath}/returngoods.do?p=returngoodsing&grstatus=${grstatus}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}&page=${rgmap.count}"
											class="right-font08">末页</a> ] 转至：
									</td>
									<td width="5%">
										<table width="20" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="1%">
													<input name="textfield3" type="text" id="page"
														value="${rgmap.page}" class="right-textfield03"
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
//等待客户发货
function dendai()
{
	layer.msg("客户目前还没有发货",{icon:6,time:1000});
}
//申请同意  or 不同意
function xiugai_status(id,type)
{
	$.ajax({
		url:"${pageContext.request.contextPath}/returngoods.do?p=updatestatus&type="+type,
		type:"post",
		data:{id:id},
		success:function(){
			location.replace(location.href);
		}
	});
}
//页面跳转
function viewGo()
{
	var page=document.getElementById("page").value;
	if(page.match('^[0-9]*$'))
		{	
	window.location.href="${pageContext.request.contextPath}/returngoods.do?p=returngoodsing&grstatus=${grstatus}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}&page="+page;
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
/*资讯-编辑*/
function article_edit(title,url,id,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
</script>
	</body>
</html>