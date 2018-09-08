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
		<title>商品管理</title>
	</head>
	<body>
		<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span> 消息中心
		<span class="c-gray en">&gt;</span> 删除系统消息
		<a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i> </a>
		</nav>
		<div class="pd-20">
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l"><a
					class="btn btn-danger radius" onclick="del10day()">
						删除10天</a> <a
					class="btn btn-danger radius" onclick="del30day()">
						删除30天</a>  <a
					class="btn btn-danger radius" onclick="delbanyear()">
						删除半年</a> <a
					class="btn btn-danger radius" onclick="delyear()">
						删除一年</a>
					<input type="text" id="day" class="input-text"
						style="width: 150px" placeholder="输入天数">
					<button type="button" onclick="return deleteday()" class="btn btn-success radius" >
						 删除
					</button>
					 </span>
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
onload=function()
{
	var i=0;
	for(var j=0;j<30;j++)
	{
		i=i+1;
		$("#day").append('<option value='+i+'>'+i+'</option>');
	}
}
function deleteday()
{
	var day=$("#day").val();
	if(day==null || ""==day)
	{
		layer.msg("请输入天数",{icon:6,time:1000});
		return false;
	}		
	if(day<0)
	{
		layer.msg("不能输入负数!",{icon:5,time:1000});
		return false;
	}
	layer.confirm('确认要删除吗？', function(index) {
			window.location.href="${pageContext.request.contextPath}/uamessages.do?p=deletemsg&type=4&status=2&day="+day;
			layer.msg('已删除!', {
				icon : 1,
				time : 1000
			});
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
/* 删除系统信息*/
/* 删除十天的消息 */
function del10day(){
	layer.confirm('确认要删除吗？', function(index) {
			window.location.href="${pageContext.request.contextPath}/uamessages.do?p=deletemsg&type=5&status=2";
			layer.msg('已删除!', {
				icon : 1,
				time : 1000
			});
		});	
}
/* 删除30天的消息 */
function del30day(){
	layer.confirm('确认要删除吗？', function(index) {
			window.location.href="${pageContext.request.contextPath}/uamessages.do?p=deletemsg&type=1&status=2";
			layer.msg('已删除!', {
				icon : 1,
				time : 1000
			});
		});	
}
/* 删除半年的消息 */
function delbanyear(){
	layer.confirm('确认要删除吗？', function(index) {
			window.location.href="${pageContext.request.contextPath}/uamessages.do?p=deletemsg&type=2&status=2";
			layer.msg('已删除!', {
				icon : 1,
				time : 1000
			});
		});	
}
/* 删除一年的消息 */
function delyear(){
	layer.confirm('确认要删除吗？', function(index) {
			window.location.href="${pageContext.request.contextPath}/uamessages.do?p=deletemsg&type=3&status=2";
			layer.msg('已删除!', {
				icon : 1,
				time : 1000
			});
		});	
}
</script>
	</body>
</html>