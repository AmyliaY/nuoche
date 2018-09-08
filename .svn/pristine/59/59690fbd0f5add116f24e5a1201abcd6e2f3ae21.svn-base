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
		<title>店铺管理</title>
	</head>
	<body>
		<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span> 联盟管理
		<span class="c-gray en">&gt;</span> 店铺所有列表
		<a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i> </a>
		</nav>
		<div class="pd-20">
			<div class="text-c">
				<form
					action="${pageContext.request.contextPath}/dianpu.do?p=shopMoHu"
					method="post">
					
					
				 	状态:
					<span class="select-box" style="width: 150px;"> <select
							var="1" class="select" size="1" id="shopstate" name="shopstate">
							<option value="">
							</option>
							<option value="0">
								休息
							</option>
							<option value="1">
								营业
							</option>
							
							
					</select> </span>
					<script type="text/javascript">
						var state = '${param.shopstate}';
						document.getElementById("shopstate").value = state;
					</script>
			
					店铺类型:
					<span class="select-box" style="width: 150px;"> <select
							var="1" class="select" size="1" id="shoptype" name="shoptype">
							<option value="">
							</option>
							<c:forEach items="${shopmap.typelist }" var="t">
							<option value="${t.typeid }">
								${t.typename }
							</option>
						    </c:forEach>
					</select> </span>
					<script>
					     var type='${param.typename}';
					     document.getElementById("shoptype").value=type;
					</script>	
					<input type="text" name="shopname" class="input-text"
						style="width: 250px" value="${shopname}" placeholder="店铺名称">
					<button type="submit" class="btn btn-success radius" >
						<i class="Hui-iconfont">&#xe665;</i> 搜商品
					</button>
				</form>
				
			</div>
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="r">共有数据：<strong>${shopmap.sum}</strong> 条</span>
			</div>
			<div class="mt-20">
				<table id="tab"
					class="table table-border table-bordered table-hover table-bg table-sort">
					<thead  style="width:80px;">
						<tr class="text-c">
							<th width="40">
								序号
							</th>
							<th >
								店铺照片
							</th>
							<th>
								店铺名称
							</th>
							<th >
								开店人
							</th>
							<th >
								联系方式
							</th>
							<th>
							          地址
							</th>
							<th >
								店铺类型
							</th>
							
							<th >
								店铺状态
							</th>
							<th >
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${shopmap.shoplist}" var="s" varStatus="i">
							<tr class="text-c">
								<td>
									${i.count+(shopmap.page-1)*shopmap.size}
								</td>
								<td>
									<a style="text-decoration: none" href="javascript:void(0)" title="店铺图片">
										<img style="width: 50px; height: 50px;" src="${pageContext.request.contextPath}/${s.shoppicture}"/>
									</a>
								</td>
								<td>
									${s.shopname}
								</td>
								<td>
								   ${s.userinfo.usersName }
								</td>
								<td>
								   ${s.shoptel }
								</td>
								<td>
								   ${s.area.city.provice.prName }${s.area.city.ctName }${s.area.arName }${s.shopaddress }
								</td>
								<td>
								  ${s.shoptype.typename }
								</td>
								<td>
									<c:if test="${s.shopstate==1}"><span class="label label-success radius">营业</span></c:if>
									<c:if test="${s.shopstate==0}"><span class="label label-defaunt radius">休息</span></c:if>
								</td>
								<td class="td-manage">
									<a style="text-decoration: none" onclick="article_edit('详情','dianpu.do?p=getShopById&shopid=${s.shopid}','10001')"
									href="javascript:void(0)" title="详情">
										<span class="label label-success radius">详情 </span>
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
										<span class="right-text09">${ shopmap.page}</span> 页 |
										共
										<span class="right-text09">${shopmap.count }</span> 页
									</td>
									<td width="32%" align="right" id="xiugaitype">
										[
										<a
											href="${pageContext.request.contextPath}/dianpu.do?p=getshopAll"
											class="right-font08">首页</a> |
										<a
											href="${pageContext.request.contextPath}/dianpu.do?p=getshopAll&page=${shopmap.page-1}"
											class="right-font08">上一页</a> |
										<a
											href="${pageContext.request.contextPath}/dianpu.do?p=getshopAll&page=${shopmap.page+1}"
											class="right-font08">下一页</a> |
										<a
											href="${pageContext.request.contextPath}/dianpu.do?p=getshopAll&page=${shopmap.count}"
											class="right-font08">末页</a> ] 转至：
									</td>
									<td width="5%">
										<table width="20" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="1%">
													<input name="textfield3" type="text" id="page"
														value="${shopmap.page}" class="right-textfield03"
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
		
		window.onload = function (){
					
			getOneList();
		}
		function getOneList(){
			$.ajax({
				url:"${pageContext.request.contextPath }/allgoods.do?p=getOneList",
				type:"post",
				success:function (data){
					var json  = eval('('+data+')');
					var dom   = $("#gtid");
					for(var i =0;i<json.length;i++){
						dom.append("<option value="+json[i].gtId+">"+json[i].gtName+"</option>");
					}
				}
			});
		
		
		}		
		function getTwoList(event){
		
			var id = event.value;
			
			$.ajax({
				url:"${pageContext.request.contextPath }/allgoods.do?p=getTwoList",
				type:"post",
				data:{
					id:id
				},
				success:function (data){
					var json  = eval('('+data+')');
					var dom   = $("#gttid");
					dom.html("");
					for(var i =0;i<json.length;i++){
						dom.append("<option value="+json[i].gttId+">"+json[i].gttName+"</option>");
					}
				}
			});
		}
		
		
		
//设置商品是否为自营
function xiugai_zystatus(id) {
	var url = "${pageContext.request.contextPath}/allgoods.do?p=xiugaizystatus";
	var param = {
		id : id
	};
	$.post(url, param, function(data) {
		if(data=="0")
		{
			layer.confirm("确定取消该自营商品？",{btn:['确定']},function(){
				location.replace(location.href);
			});
		}
		if(data=="1")
		{
			layer.confirm("确认设为自营商品吗？",{btn:['确认']},function(){
				location.replace(location.href);
			});
		}
	});
}

 
//设置商品下架
function xiugai_xianshi(a,id)
{
	var url="${pageContext.request.contextPath}/allgoods.do?p=xiugaixianshi";
	var params={id:id};
	$.post(url,params,function(data){
		layer.msg("修改成功",{icon:6,time:1000});
		setTimeout("go()", 800);
	});
}

//设置商品下架
function xiugai_status(a,id)
{
	var url="${pageContext.request.contextPath}/allgoods.do?p=xiugaistatus";
	var params={id:id};
	$.post(url,params,function(data){
		layer.msg("修改成功",{icon:6,time:1000});
		setTimeout("go()", 800);
	});
}
function go(){
	window.location.href="${pageContext.request.contextPath}/allgoods.do?p=sjgoodslinting&gttid=${param.gttid}&minprice=${param.minprice}&maxprice=${param.maxprice}&keywords=${keywords}&gstate=${param.gstate}&keywords=${param.keywords}";
}
//批量下架
function plxiajia()
{
	var checkboxNum=$("input[name=check]:checked").length;
	if(checkboxNum==0)
	{
		layer.msg("请勾选要下架的商品",{icon:6,time:1000});
		return false;
	}
	var checkboxList=new Array();
	$("input[name=check]:checked").each(function(){
		checkboxList.push($(this).val());	//往数组里添加当前checked属性的值
	});
	layer.confirm("确定要下架吗",function(index){
		$.ajax({
		url:"${pageContext.request.contextPath}/allgoods.do?p=plxiajiagoods",
		type:"post",
		data:{'xiajia':checkboxList.toString(),},
		success:function(){
			location.replace(location.href);			
		}
	});
	});
}
//页面跳转
function viewGo()
{
	var page=document.getElementById("page").value;
	if(page.match('^[0-9]*$'))
		{	
	window.location.href="${pageContext.request.contextPath}/allgoods.do?p=sjgoodslinting&gttid=${param.gttid}&minprice=${param.minprice}&maxprice=${param.maxprice}&keywords=${keywords}&page="+page;
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
/*资讯-编辑*/
function article_edit(title,url,id,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
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