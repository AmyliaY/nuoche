<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
		<title>店铺类型</title>
	</head>
	<body>
		<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span> 联盟管理
		<span class="c-gray en">&gt;</span> 店铺类型
		<a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i> </a>
		</nav>
		<div class="pd-20">
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l"><a
					href="javascript:void(0)"
					onclick="member_add('添加类型','${pageContext.request.contextPath}/admin/addShopType.jsp','','400')"
					class="btn btn-danger radius"><i class="Hui-iconfont">&#xe600;</i>
						添加类型</a> </span>
				<span class="r">共有数据：<strong>${shoptypemap.sum}</strong> 条</span>
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
								类别名称
							</th>
							
							<th width="40">
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${shoptypemap.list}" var="a" varStatus="i">
							<tr class="text-c">
								<td>
									${i.count+(shoptypemap.page-1)*shoptypemap.size}
								</td>
								
								<td>
									${a.typename}
								</td>
								
								<td class="td-manage">
								        <a title="删除" onclick="deltype(this,'${a.typeid}')" href="javascript:void(0)"
										class="ml-5" style="text-decoration: none"> <span
										class="label label-danger radius">删除</span> </a>
										<a style="text-decoration: none" onclick="article_edit('编辑','dianpu.do?p=updateone&typeid=${a.typeid}','10001')"
									    href="javascript:void(0)" title="编辑">
										<span class="label label-success radius">编辑 </span>
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
										<span class="right-text09">${shoptypemap.page}</span> 页 |
										共
										<span class="right-text09">${shoptypemap.count }</span> 页
									</td>
									<td width="32%" align="right" id="xiugaitype">
										[
										<a
											href="${pageContext.request.contextPath}/dianpu.do?p=getShopType"
											class="right-font08">首页</a> |
										<a
											href="${pageContext.request.contextPath}/dianpu.do?p=getShopType&page=${shoptypemap.page-1}"
											class="right-font08">上一页</a> |
										<a
											href="${pageContext.request.contextPath}/dianpu.do?p=getShopType&page=${shoptypemap.page+1}"
											class="right-font08">下一页</a> |
										<a
											href="${pageContext.request.contextPath}/dianpu.do?p=getShopType&page=${shoptypemap.count}"
											class="right-font08">末页</a> ] 转至：
									</td>
									<td width="5%">
										<table width="20" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="1%" style="width:22px; ">
													<input name="textfield3" type="text" id="page"
														value="${shoptypemap.page}" class="right-textfield03"
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
/*用户-添加*/
function member_add(title, url, w, h) {
	layer_show(title, url, w, h);
}		

/*删除*/
function deltype(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'dianpu.do?p=delType&id='+id,
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
			    layer.msg('该类型在使用不能删除!',{icon:2,time:1000});
				console.log(data.msg);
			},
		});		
	});
}
//页数跳转
function viewGo()
{
		var page=document.getElementById("page").value;
		if(page.match('^[0-9]*$'))
		{	
			window.location.href="${pageContext.request.contextPath}/dianpu.do?p=getShopType&page="+page;
		}
}
//编辑
function article_edit(title,url,id,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
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