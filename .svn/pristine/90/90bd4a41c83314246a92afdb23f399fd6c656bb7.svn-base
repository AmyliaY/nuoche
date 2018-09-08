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
		<title>用户查看</title>
	</head>
	<body>
		<div class="cl pd-20" style="background-color: #5bacb6">
			<img class="avatar size-XL l"
				src="${pageContext.request.contextPath }/${users.usersHeadimg}">
			<dl style="margin-left: 80px; color: #fff">
				<dt>
					<span class="f-18">${users.usersName }</span>
					<span class="pl-10 f-12">积分：${users.usersIntegral }</span>
				</dt>
				<dd class="pt-10 f-12" style="margin-left: 0">
					${users.usersRemark}
				</dd>
			</dl>
		</div>
		<!-- 
		<c:if test="${type==2}">
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l">二级代理反水总金额：<strong>${twoMoney}</strong> 元</span>
			</div>
		</c:if>
		 -->
				<span class="r">共有数据：<strong>${jifenMap.sum}</strong> 条</span>
		<div class="mt-20">
			<table id="tab"
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="40">
							序号
						</th>
						<th width="40">
							赠送积分数
						</th>
						<th width="40">
							赠送积分数类型
						</th>
						<th width="60">
							赠送时间
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${jifenMap.list}" var="jf" varStatus="i">
						<tr class="text-c">
							<td>
								${i.count+(jifenMap.page-1)*jifenMap.size}
							</td>
							<td>
								<span class="label label-danger radius">${jf.prPresent}</span>
							</td>
							<td>
									<c:if test="${jf.prType==1}"><span class="label label-success radius">下线购买 </span></c:if>
									<c:if test="${jf.prType==2}"><span class="label label-primary radius">众筹返</span></c:if>
									<c:if test="${jf.prType==3}"><span class="label label-danger radius">充值 </span></c:if>
							</td>
							<td>
								<fmt:formatDate value="${jf.prTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
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
									<span class="right-text09">${ jifenMap.page}</span> 页 | 共
									<span class="right-text09">${jifenMap.count }</span> 页
								</td>
								<td width="49%" align="right" id="xiugaitype">
									[
									<a
										href="${pageContext.request.contextPath}/users.do?p=jifencord&id=${id}"
										class="right-font08">首页</a> |
									<a
										href="${pageContext.request.contextPath}/users.do?p=jifencord&id=${id}&page=${jifenMap.page-1}"
										class="right-font08">上一页</a> |
									<a
										href="${pageContext.request.contextPath}/users.do?p=jifencord&id=${id}&page=${jifenMap.page+1}"
										class="right-font08">下一页</a> |
									<a
										href="${pageContext.request.contextPath}/users.do?p=jifencord&id=${id}&page=${jifenMap.count}"
										class="right-font08">末页</a> ] 转至：
								</td>
								<td width="1%">
									<table width="20" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="1%">
												<input name="textfield3" type="text" id="page"
													value="${jifenMap.page}" class="right-textfield03"
													size="3" />
											</td>
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
function viewGo() {
	var page = $("#page").val();
	if (page.match('^[0-9]*$')) {
		window.location.href = "users.do?p=jifencord&id=${id}&page="
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