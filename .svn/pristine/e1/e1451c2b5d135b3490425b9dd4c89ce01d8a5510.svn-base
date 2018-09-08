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
		<title>充值管理</title>
	</head>
	<body>
		<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span> 充值中心
		<span class="c-gray en">&gt;</span> 充值列表
		<a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i> </a>
		</nav>
		<div class="pd-20">
			<div class="text-c">
				<form
					action="${pageContext.request.contextPath}/chongzhirecord.do?p=chongzhilisting&cztype=${cztype}&czstatus=${czstatus}"
					method="post">
					日期范围：
					<input type="text" name="begindate" value="${param.begindate}"
						onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})"
						id="datemin" class="input-text Wdate" style="width: 120px;">
					-
					<input type="text" name="enddate" value="${param.enddate}"
						onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})"
						id="datemax" class="input-text Wdate" style="width: 120px;">
					<input type="text" name="keywords" class="input-text"
						style="width: 250px" value="${keywords}" placeholder="输入会员名称,充值订单号">
					<button type="submit" class="btn btn-success radius" >
						<i class="Hui-iconfont">&#xe665;</i> 搜充值记录
					</button>
				</form>
			</div>
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l">
				<c:if test="${czstatus==0}"><a
					href="javascript:void(0)" onclick="pldelete()"
					class="btn btn-danger radius">
						批量删除</a></c:if>
				</span>
				<span class="r">共有数据：<strong>${chongzhimap.sum}</strong> 条</span>
			</div>
			<div class="mt-20">
				<table id="tab"
					class="table table-border table-bordered table-hover table-bg table-sort">
					<thead>
						<tr class="text-c">
							<th width="25"><input type="checkbox" id="allcheck" name="" value=""></th>
							<th width="40">
								序号
							</th>
							<th width="100">
								会员名称
							</th>
							<th width="100">
								充值金额/赠送金额
							</th>
							<th width="60">
								充值单号
							</th>
							<th width="60">
								充值类型
							</th>
							<th width="40">
								充值时间
							</th>
							<th width="60">
								充值状态
							</th>
							<c:if test="${czstatus==0}">
							<th width="60">
								操作
							</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${chongzhimap.list}" var="cz" varStatus="i">
							<tr class="text-c">
								<td><input  name="check" type="checkbox" value="${cz.prId}"></td>
								<td>
									${i.count+(chongzhimap.page-1)*chongzhimap.size}
								</td>
								<td>
									${cz.userinfo.usersName}
								</td>
								<td>
									<span class="label label-danger radius"><fmt:formatNumber value="${cz.prMoney}" pattern="0.00"></fmt:formatNumber>/<fmt:formatNumber value="${cz.prPresent==null ? 0 :cz.prPresent}" pattern="0.00"></fmt:formatNumber>元</span>
								</td>
								<td>
									${cz.prDingdanhao}
								</td>
								<td>
									<c:if test="${cz.prType==1}"><span class="label label-success radius">支付宝 </span></c:if>
									<c:if test="${cz.prType==2}"><span class="label label-primary radius">微信</span></c:if>
									<c:if test="${cz.prType==3}"><span class="label label-danger radius">后台充值 </span></c:if>
								</td>
								<td>
									<fmt:formatDate value="${cz.prTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
								<td class="td-status">
									<c:choose>
										<c:when test="${cz.prStatus==0}">
											<span class="label label-defaunt radius">失败 </span>
										</c:when>
										<c:otherwise>
											<span class="label label-success radius">成功</span>
										</c:otherwise>
									</c:choose>
								</td>
								<c:if test="${czstatus==0}">
								<td class="td-manage">
									<a title="删除" href="javascript:void(0)"	onclick="deletelunbo(${cz.prId})"
										class="ml-5" style="text-decoration: none"> <span
										class="label label-danger radius">删除</span> </a>
								</td>
								</c:if>
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
										<span class="right-text09">${ chongzhimap.page}</span> 页 |
										共
										<span class="right-text09">${chongzhimap.count }</span> 页
									</td>
									<td width="32%" align="right">
										[
										<a
											href="${pageContext.request.contextPath}/chongzhirecord.do?p=chongzhilisting&begindate=${param.begindate}&enddate=${param.enddate}&cztype=${cztype}&czstatus=${czstatus}&keywords=${keywords}"
											class="right-font08">首页</a> |
										<a
											href="${pageContext.request.contextPath}/chongzhirecord.do?p=chongzhilisting&begindate=${param.begindate}&enddate=${param.enddate}&cztype=${cztype}&czstatus=${czstatus}&keywords=${keywords}&page=${chongzhimap.page-1}"
											class="right-font08">上一页</a> |
										<a
											href="${pageContext.request.contextPath}/chongzhirecord.do?p=chongzhilisting&begindate=${param.begindate}&enddate=${param.enddate}&cztype=${cztype}&czstatus=${czstatus}&keywords=${keywords}&page=${chongzhimap.page+1}"
											class="right-font08">下一页</a> |
										<a
											href="${pageContext.request.contextPath}/chongzhirecord.do?p=chongzhilisting&begindate=${param.begindate}&enddate=${param.enddate}&cztype=${cztype}&czstatus=${czstatus}&keywords=${keywords}&page=${chongzhimap.count}"
											class="right-font08">末页</a> ] 转至：
									</td>
									<td width="5%">
										<table width="20" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="1%">
													<input name="textfield3" type="text" id="page"
														value="${chongzhimap.page}" class="right-textfield03"
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
//批量删除
function pldelete()
{
	var checkboxNum=$("input[name=check]:checked").length;
	if(checkboxNum==0)
	{
		layer.msg("请勾选要删除的充值记录!",{icon:6,time:1000});
		return false;
	}
	var checkboxList=new Array();
	$("input[name=check]:checked").each(function(){
		checkboxList.push($(this).val());
	});
	layer.confirm("确定要删除吗？",function(index){
	$.ajax({
		url:"${pageContext.request.contextPath}/chongzhirecord.do?p=pldelete",
		type:"post",
		data:{"shanchu":checkboxList.toString(),},
		success:function()
		{
			location.replace(location.href);
		}
	});
	});
}
//删除
function deletelunbo(id)
{
	var url="${pageContext.request.contextPath}/chongzhirecord.do?p=deletechongchi";
	var param={id:id};
	$.post(url,param,function(data){
		location.replace(location.href);
	});
}
//页面跳转
function viewGo()
{
	var page=document.getElementById("page").value;
	if(page.match('^[0-9]*$'))
		{	
	window.location.href="${pageContext.request.contextPath}/chongzhirecord.do?p=chongzhilisting&begindate=${param.begindate}&enddate=${param.enddate}&cztype=${cztype}&czstatus=${czstatus}&keywords=${keywords}&page="+page;
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