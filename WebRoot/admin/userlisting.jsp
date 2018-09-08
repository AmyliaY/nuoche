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
		<span class="c-gray en">&gt;</span> 会员列表
		<a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i> </a>
		</nav>
		<div class="pd-20">
			<div class="text-c">
				<form
					action="${pageContext.request.contextPath}/users.do?p=userlisting&type=${usersmap.type}"
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
						style="width: 250px" value="${keywords}" placeholder="输入会员名称、用户名、手机号码">
					<button type="submit" class="btn btn-success radius" >
						<i class="Hui-iconfont">&#xe665;</i> 搜会员
					</button>
				</form>
			</div>
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l"><a
					href="${pageContext.request.contextPath}/users.do?p=userlisting&type=2"
					class="btn btn-primary radius">
						普通会员</a> <a
					href="${pageContext.request.contextPath}/users.do?p=userlisting&type=3"
					class="btn btn-danger radius">
						VIP会员</a> </span>
				<span class="r">共有数据：<strong>${usersmap.sum}</strong> 条</span>
			</div>
			<div class="mt-20">
				<table id="tab"
					class="table table-border table-bordered table-hover table-bg table-sort">
					<thead>
						<tr class="text-c">
							<th width="40">
								序号
							</th>
							<th width="40">
								等级
							</th>
							<th width="40">
								会员名称
							</th>
							<th width="40">
								手机号
							</th>
							<th width="40">
								积分
							</th>
							<th width="70">
								用户所在区/县
							</th>
							<th width="40">
								推荐人
							</th>
							<th width="60">
								创建时间
							</th>
							<th width="60">
								用户类型
							</th>
							<th width="20">
								状态
							</th>
							<th width="100">
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${usersmap.list}" var="u" varStatus="i">
							<tr class="text-c">
								<td>
									${i.count+(usersmap.page-1)*usersmap.size}
								</td>
								<td>
									${u.dengji.djname }
								
								
								</td>
								<td>
									${u.usersName}
								</td>
								<td>
									${u.usersPhone}
								</td>
								<td>
									<span class="label label-danger radius">${u.usersIntegral}</span>
								</td>
								<td>
									${u.usersArea}
								</td>
								<td>
									<c:if test="${u.usersReferrer==null}">无</c:if>
									<c:if test="${u.usersReferrer!=null}"><span class="label label-success radius">${u.usersReferrer}</span></c:if>
								</td>
								<td>
									<fmt:formatDate value="${u.usersCreatetime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								</td>
								<td class="td-status">
									<c:choose>
										<c:when test="${u.usersType==0}">
											<span class="label label-primary radius">普通用户 </span>
										</c:when>
										<c:otherwise>
										<span class="label label-danger radius">VIP用户 </span>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="td-status">
									<c:choose>
										<c:when test="${u.usersStatus==0}">
											<span class="label label-defaunt radius">已禁用 </span>
										</c:when>
										<c:otherwise>
										<span class="label label-success radius">已启用 </span>
										</c:otherwise>
									</c:choose>
								</td>
								<td class="td-manage">
									<a style="text-decoration: none"
										onclick="xiugai_status(this,${u.usersId})"
										href="javascript:void(0)" title="修改状态"><c:choose>
											<c:when test="${u.usersStatus==1}">
												<span class="label label-defaunt radius">可禁用</span>
											</c:when>
											<c:otherwise>
												<span class="label label-success radius">可启用</span>
											</c:otherwise>
										</c:choose> </a>
									<a style="text-decoration: none" onclick="xiugai_type(this,${u.usersId})"
									href="javascript:void(0)" title="修改会员类型">
										<c:choose>
											<c:when test="${u.usersType==0}"><span class="label label-danger radius">VIP用户 </span></c:when>
											<c:otherwise><span class="label label-primary radius">普通用户 </span></c:otherwise>
										</c:choose>
									</a>
									<a style="text-decoration: none" onclick="member_show('${u.usersName}','users.do?p=jifencord&id=${u.usersId}','10001','1000','500')"
									href="javascript:void(0)" title="会员积分记录">
										<span class="label label-success radius">积分记录</span>
									</a>
									<a style="text-decoration: none" onclick="member_edit('充值','users.do?p=userschongzhiview&id=${u.usersId}','0','','400')"
									href="javascript:void(0)" title="充值">
										<span class="label label-success radius">充值</span>
									</a>
									
									<a style="text-decoration: none" onclick="member_edit('购买等级','dengji.do?p=toBuyDenji&id=${u.usersId}','0','','400')"
									href="javascript:void(0)" title="购买等级">
										<span class="label label-success radius">购买等级</span>
									</a>
									
									<a href="javascript:void(0)" onclick="quxiaoDenji(this,${u.usersId})"><span class="label label-success radius">取消等级</span></a>
									
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
										<span class="right-text09">${ usersmap.page}</span> 页 |
										共
										<span class="right-text09">${usersmap.count }</span> 页
									</td>
									<td width="32%" align="right">
										[
										<a
											href="${pageContext.request.contextPath}/users.do?p=userlisting&type=${usersmap.type}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}"
											class="right-font08">首页</a> |
										<a
											href="${pageContext.request.contextPath}/users.do?p=userlisting&type=${usersmap.type}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}&page=${usersmap.page-1}"
											class="right-font08">上一页</a> |
										<a
											href="${pageContext.request.contextPath}/users.do?p=userlisting&type=${usersmap.type}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}&page=${usersmap.page+1}"
											class="right-font08">下一页</a> |
										<a
											href="${pageContext.request.contextPath}/users.do?p=userlisting&type=${usersmap.type}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}&page=${usersmap.count}"
											class="right-font08">末页</a> ] 转至：
									</td>
									<td width="5%">
										<table width="20" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="1%">
													<input name="textfield3" type="text" id="page"
														value="${usersmap.page}" class="right-textfield03"
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
		
//取消等级
function quxiaoDenji(obj,id)
{
  
 
   var url = "${pageContext.request.contextPath}/users.do?p=quxiaoDenji";
	var param = {
		id : id
	};
	$.post(url, param, function(data) {
	    layer.msg('取消成功',{icon:6,time:1000});
	    $(obj).parent().parent().children("td:eq(1)").html("");
	});
}		
		
		
//修改用户状态 
function xiugai_status(a,id) {
	var url = "${pageContext.request.contextPath}/users.do?p=xiugaistatus";
	var param = {
		id : id
	};
	$.post(url, param, function(data) {
		var td=$(a).parent().parent().find("td").eq(9);
		if(data=="0")
		{
			td.html('<span class="label label-defaunt radius">已禁用</span>');
			a.innerHTML='<span class="label label-success radius">可启用</span>';
		}else{
			td.html('<span class="label label-success radius">已启用</span>');
			a.innerHTML='<span class="label label-defaunt radius">可禁用</span>';
		}
		layer.msg('修改成功',{icon:6,time:1000});
	});
}
//修改会员类型
function xiugai_type(a,id)
{
	var type=${usersmap.type};
	var url="${pageContext.request.contextPath}/users.do?p=xiugaitype";
	var params={id:id};
	$.post(url,params,function(data){
		var td=$(a).parent().parent().find("td").eq(8);
		if(type==2)
		{
			if(data==1)
			{
					window.location.href="${pageContext.request.contextPath}/users.do?p=userlisting&type=${usersmap.type}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${keywords}&page=${usersmap.page}"
			}
		}
		if(type==3)
		{
			if(data==0)
			{
				window.location.href="${pageContext.request.contextPath}/users.do?p=userlisting&type=${usersmap.type}&begindate=${param.begindate}&enddate=${param.enddate}&keywords=${param.keywords}&page=${usersmap.page}"
			}
		}
		if(data==1){
			td.html('<span class="label label-danger radius">VIP用户 </span>');
			a.innerHTML='<span class="label label-primary radius">普通用户 </span>';
		}else{
			td.html('<span class="label label-primary radius">普通用户 </span>');
			a.innerHTML='<span class="label label-danger radius">VIP用户 </span>';
		}
		layer.msg("修改成功",{icon:6,time:1000});
	});
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