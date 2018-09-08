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

		<title>子代理列表</title>
		<style>
		.mytable {  
		    table-layout: fixed;  
		}  

		.mytd {  
		    text-overflow: ellipsis; /* for IE */  
		    -moz-text-overflow: ellipsis; /* for Firefox,mozilla */  
		    overflow: hidden;  
		    white-space: nowrap;  
		} 
		</style>
	</head>
	<body>
		<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 基础参数
		<span class="c-gray en">&gt;</span> 子代理管理
		<span class="c-gray en">&gt;</span> 子代理列表
		<a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i> </a>
		</nav>
		<div class="pd-20">
			
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l"><!-- <a
					href="javascript:void(0)" onclick="plZhiding()"
					class="btn btn-success radius">
						批量置顶</a> 
					<a
					href="javascript:void(0)" onclick="plQuxiao()"
					class="btn btn-primary radius">
						批量取消</a> 
					<a
					href="javascript:void(0)" onclick="plDelete()"
					class="btn btn-danger radius">
						批量删除</a></span>-->
				<span class="r">共有数据：<strong>${zilistmap.sum}</strong> 条</span>
			</div>
			<div class="mt-20">
				<table id="tab"
					class="table table-border table-bordered table-hover table-bg table-sort mytable">
					<thead>
						<tr class="text-c">
							<th width="25"><input type="checkbox" id="allcheck" name="" value=""></th>
							<th width="40">
								序号
							</th>
							<th width="120">
								真实姓名
							</th>
							<th width="120">
								电话号码
							</th>
							<th width="80">
								区县名
							</th>
							<th width="80">
								累计领卡
							</th>
							<th width="100">
								状态
							</th>
							<th width="100">
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${zilistmap.list}" var="li" varStatus="i">
							<tr class="text-c">
								<td><input  name="check" type="checkbox" value="${li.id}"></td>
								<td>
									 ${i.count+(zilistmap.page-1)*zilistmap.size} 
								</td>
								<td>
									${li.realname }
								</td>
								<td>
									${li.tel}
								</td>
								<td>
									${li.area.arName}
								</td>
								<td>
									${li.sumCard }
								</td>
								<td class="td-status">
									<c:choose>
										<c:when test="${li.status==0}">
											<span class="label label-defaunt radius">离职 </span>
										</c:when>
										<c:otherwise>
										<span class="label label-success radius">在职</span>
										</c:otherwise>
									</c:choose>
								</td>
								
								<td class="td-manage">
									<a style="text-decoration: none"
										onclick="xiugai_zcstatus(this,${li.id})"
										href="javascript:void(0)" title="修改状态"><c:choose>
											<c:when test="${li.status==0}">
												<span class="label label-success radius">在职</span>
											</c:when>
											<c:otherwise>
												<span class="label label-defaunt radius">离职</span>
											</c:otherwise>
										</c:choose> </a>
									
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
										<span class="right-text09">${ zilistmap.page}</span> 页 |
										共
										<span class="right-text09">${zilistmap.count }</span> 页
									</td>
									<td width="32%" align="right">
										[
										<a
											href="${pageContext.request.contextPath}/dailimanage.do?p=listzidaili"
											class="right-font08">首页</a> |
										<a
											href="${pageContext.request.contextPath}/dailimanage.do?p=listzidaili&page=${zilistmap.page-1}"
											class="right-font08">上一页</a> |
										<a
											href="${pageContext.request.contextPath}/dailimanage.do?p=listzidaili&page=${zilistmap.page+1}"
											class="right-font08">下一页</a> |
										<a
											href="${pageContext.request.contextPath}/dailimanage.do?p=listzidaili&page=${zilistmap.count}"
											class="right-font08">末页</a> ] 转至：
									</td>
									<td width="5%">
										<table width="20" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="1%">
													<input name="textfield3" type="text" id="page"
														value="${zilistmap.page}" class="right-textfield03"
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
		
//修改轮播图片状态   禁用  or 启用
function xiugai_zcstatus(a,id)
{
	var url="${pageContext.request.contextPath}/dailimanage.do?p=updatestatus";
	var param={id:id};
	$.post(url,param,function(data){
		var td=$(a).parent().parent().find("td").eq(6);
		if(data=='0'){
			layer.msg("离职成功!",{icon:6,time:1000});
			td.html('<span class="label label-defaunt radius">离职</span>');
			a.innerHTML='<span class="label label-success radius">在职</span>';
		}
		else{
			layer.msg("在职成功!",{icon:6,time:1000});
			td.html('<span class="label label-success radius">在职</span>');
			a.innerHTML='<span class="label label-defaunt radius">离职</span>';
		}
	})
}
		
//修改置顶状态   取消  or 置顶
/* function xiugai_zhiding(a,id)
{
	var url="${pageContext.request.contextPath}/dailimanage.do?p=updateIsZhiding";
	var param={id:id};
	$.post(url,param,function(data){
		var td=$(a).parent().parent().find("td").eq(7);
		var status=$(a).parent().parent().find("td").eq(4);
		if(data=='0'){
			layer.msg("取消成功!",{icon:6,time:1000});
			td.html('<span class="label label-defaunt radius">取消</span>');
			a.innerHTML='<span class="label label-success radius">置顶</span>';
			status.html('未置顶');
		}
		else{
			layer.msg("置顶成功!",{icon:6,time:1000});
			td.html('<span class="label label-success radius">置顶</span>');
			a.innerHTML='<span class="label label-defaunt radius">取消</span>';
			status.html('已置顶');
		}
	})
}

 */


//删除代理
function deletezidaili(id)
{	
	var url="${pageContext.request.contextPath}/dailimanage.do?p=deletezidaili";
	var param={id:id};
	$.post(url,param,function(data){
		 layer.confirm("确定要删除这个代理么？",function(index){
	   window.location.href="${pageContext.request.contextPath}/dailimanage.do?p=listzidaili&page=${zilistmap.page}";
	   
	 });
	}) 
}


/* 
//批量删除
function plDelete()
{
	 var checkboxNum=$("input[name=check]:checked").length;
	 if(checkboxNum==0)
	 {
		 layer.msg("请选择要删除的代理",{icon:6,time:1000});
		 return false;
	 }
	 var checkboxList=new Array();
	 $("input[name=check]:checked").each(function(){
		checkboxList.push($(this).val()); 
	 });
	 layer.confirm("确定要删除吗？",function(index){
	 $.ajax({
		url:"${pageContext.request.contextPath}/dailimanage.do?p=plDeleteDl",
		type:"post",
		data:{'delete':checkboxList.toString(),},
		success:function()
		{
			window.location.href="${pageContext.request.contextPath}/dailimanage.do?p=listzidaili&page=${zilistmap.page}";
		}
	 });
	 });
} */
//页面跳转
 function viewGo()
{
	var page=document.getElementById("page").value;
	if(page.match('^[0-9]*$'))
		{	
	window.location.href="${pageContext.request.contextPath}/dailimanage.do?p=listzidaili&page="+page;
}
}
//批量置顶
/* function plZhiding()
{
	var checkboxNum=$("input[name=check]:checked").length;
	if(checkboxNum==0)
	{
		layer.msg("请选择要置顶的服务",{icon:6,time:1000});
		return false;
	}
	var checkboxList=new Array();
	$("input[name=check]:checked").each(function(){
		checkboxList.push($(this).val());	//循环把 选中的checked属性的值放进数组里面
	});
	layer.confirm("确定要置顶吗？",function(index){
	$.ajax(
		url:"${pageContext.request.contextPath}/dailimanage.do?p=plupdateIsZhiding&type=1",
		type:"post",
		data:{'zhiding':checkboxList.toString(),},
		success:function(){
			window.location.href="${pageContext.request.contextPath}/dailimanage.do?p=zhidinglisting&page=${yizhidingServiceMap.page}";			
		}
	});
	});
} */
//批量取消置顶
/* function plQuxiao()
{
	var checkboxNum=$("input[name=check]:checked").length;
	if(checkboxNum==0)
	{
		layer.msg('请选择要取消置顶的服务',{icon:6,time:1000});
		return false;
	}
	var checkboxList=new Array();
	$("input[name=check]:checked").each(function(){
		checkboxList.push($(this).val());
	});
	layer.confirm("确定要取消置顶吗？",function(index){
	$.ajax({
		url:"${pageContext.request.contextPath}/dailimanage.do?p=plupdateIsZhiding&type=2",
		type:"post",
		data:{'quxiao':checkboxList.toString(),},
		success:function()
		{
			window.location.href="${pageContext.request.contextPath}/dailimanage.do?p=zhidinglisting&page=${yizhidingServiceMap.page}";
		}
	});
	});
} */

/*
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
/* function member_add(title, url, w, h) {
	layer_show(title, url, w, h);
} */
/*用户-查看*/
/* function member_show(title, url, id, w, h) {
	layer_show(title, url, w, h);
} */
/*用户-停用*/
/* function member_stop(obj, id) {
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
} */

/*用户-启用*/
/* function member_start(obj, id) {
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
} */
/*用户-编辑*/
/* function member_edit(title, url, id, w, h) {
	layer_show(title, url, w, h);
} */
/*密码-修改*/
/* function change_password(title, url, id, w, h) {
	layer_show(title, url, w, h);
} */
/*用户-删除*/
/* function member_del(obj, id) {
	layer.confirm('确认要删除吗？', function(index) {
		$(obj).parents("tr").remove();
		layer.msg('已删除!', {
			icon : 1,
			time : 1000
		});
	});
} */
</script>
	</body>
</html>