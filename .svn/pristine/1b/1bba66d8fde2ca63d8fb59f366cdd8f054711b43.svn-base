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
		<title>创客列表</title>
	</head>
	<body>
		<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span> 联盟管理
		<span class="c-gray en">&gt;</span> 创客列表
		<a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i> </a>
		</nav>
		<div class="pd-20">
			<div class="text-c">
				<form
					action="${pageContext.request.contextPath}/dianpu.do?p=chuangkeMH"
					method="post">
					创客等级：
					<span class="select-box" style="width: 150px;"> <select
							var="1" class="select" size="1" id="djname" name="djname">
							<option value="">
							</option>
							<c:forEach items="${ckmap.djlist }" var="dj">
							     <option value="${dj.djid }">${dj.djname }</option>
							</c:forEach>
					</select> </span>
					<script>
					    var djname='${param.djname}';
					    document.getElementById("djname").value=djname;
					    
					</script>
					<input type="text" name="username" class="input-text"
						style="width: 250px" value="${param.usersName}" placeholder="输入会员名称、用户名">
					<button type="submit" class="btn btn-success radius" >
						<i class="Hui-iconfont">&#xe665;</i> 搜创客
					</button>
				</form>
			</div>
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="r">共有数据：<strong>${ckmap.sum}</strong> 条</span>
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
								头像
							</th>
							<th width="40">
								会员名称
							</th>
							<th width="40">
								手机号
							</th>
							<th width="70">
								用户所在区/县
							</th>
							<th width="150">
							          创建时间
							</th>
							<th width="40">
								推荐人
							</th>
							<th width="60">
								直推人数
							</th>
							<th width="60">
								团队人数
							</th>
							<th width="80">
								级别
							</th>
							<th width="80">
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ckmap.list}" var="ck" varStatus="i">
							<tr class="text-c">
								<td>
									${i.count+(ckmap.page-1)*ckmap.size}
								</td>
								<td>
									<c:choose>
										<c:when test="${ck.usersHeadimg==null}">
											<img alt="" style="width: 40px; height: 40px;" src="${pageContext.request.contextPath}/admin/images/0.jpg">
										</c:when>
										<c:otherwise> 
											<img alt="" style="width: 40px; height: 40px;" src="${pageContext.request.contextPath}/${u.usersHeadimg}">
							   			</c:otherwise>
									</c:choose>
								</td>
								<td>
									${ck.usersName}
								</td>
								<td>
									${ck.usersPhone}
								</td>
								<td>
								    ${ck.usersArea}
								</td>
								<td>
								    <fmt:formatDate value="${ck.usersCreatetime }" pattern="yyyy-MM-dd hh:mm:ss"/>
								</td>
								<td>
									<c:if test="${ck.userinfo.usersName==null}">无</c:if>
									<c:if test="${ck.userinfo.usersName!=null}"><span class="label label-success radius">${ck.userinfo.usersName}</span></c:if>
								</td>
								<td>
								    ${ck.userstuinumber }
								</td>
								<td>
								    ${ck.userstuannumber }
								</td>
								<td class="td-status">
									${ck.dengji.djname }
								</td>
								<td class="td-manage">
									<a title="移除" onclick="upuserinfo123(this,'${ck.usersId}')" href="javascript:void(0)"
										class="ml-5" style="text-decoration: none">
										 <span class="label label-danger radius">移除</span>
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
										<span class="right-text09">${ckmap.page}</span> 页 |
										共
										<span class="right-text09">${ckmap.count }</span> 页
									</td>
									<td width="32%" align="right">
										[
										<a
											href="${pageContext.request.contextPath}/dianpu.do?p=getChuangKe"
											class="right-font08">首页</a> |
										<a
											href="${pageContext.request.contextPath}/dianpu.do?p=getChuangKe&page=${ckmap.page-1}"
											class="right-font08">上一页</a> |
										<a
											href="${pageContext.request.contextPath}/dianpu.do?p=getChuangKe&page=${ckmap.page+1}"
											class="right-font08">下一页</a> |
										<a
											href="${pageContext.request.contextPath}/dianpu.do?p=getChuangKe&page=${ckmap.count}"
											class="right-font08">末页</a> ] 转至：
									</td>
									<td width="5%">
										<table width="20" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="1%">
													<input name="textfield3" type="text" id="page"
														value="${ckmap.page}" class="right-textfield03"
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
//移除
function upuserinfo123(obj,id){
	layer.confirm('确认要移除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'dianpu.do?p=updateUserinfo&id='+id,
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已移除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
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

</script>
	</body>
</html>