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
		<span class="c-gray en">&gt;</span> 商品中心
		<span class="c-gray en">&gt;</span> 商品众筹列表
		<a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i> </a>
		</nav>
		<div class="pd-20">
			<div class="text-c">
				<form
					action="${pageContext.request.contextPath}/zhongchougoods.do?p=zcgoodslisting"
					method="post">
					价格区间：
					<input type="text" name="minprice" value="${param.minprice}" onkeydown="minnumber()"
						class="input-text"	 style="width: 120px;">
					-
					<input type="text" name="maxprice" value="${param.maxprice}"
						class="input-text"	 style="width: 120px;">
					<input type="text" name="keywords" class="input-text"
						style="width: 250px" value="${keywords}" placeholder="商品名称">
					<button type="submit" class="btn btn-success radius" >
						<i class="Hui-iconfont">&#xe665;</i> 搜商品
					</button>
				</form>
			</div>
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l"></span>
				<span class="r">共有数据：<strong>${zcgoodsMap.sum}</strong> 条</span>
			</div>
			<div class="mt-20">
				<table id="tab"
					class="table table-border table-bordered table-hover table-bg table-sort">
					<thead>
						<tr class="text-c">
							<th width="40">
								序号
							</th>
							<th width="120">
								商品图片
							</th>
							<th width="40">
								商品名称
							</th>
							<th width="60">
								普通会员价格
							</th>
							<th width="60">
								VIP会员价格
							</th>
							<th width="40">
								商品单位
							</th>
							<th width="40">
								开始时间
							</th>
							<th width="40">
								结束时间
							</th>
							<th width="100">
								倒计时
							</th>
							<th width="100">
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${zcgoodsMap.list}" var="sj" varStatus="i">
							<tr class="text-c">
								<td>
									${i.count+(zcgoodsMap.page-1)*zcgoodsMap.size}
								</td>
								<td>
									<img style="width:50px; height:50px;" src="${pageContext.request.contextPath}/${sj.gimages}"/>
								</td>
								<td>
									${sj.gname}
								</td>
								<td>
									<span class="label label-danger radius"><fmt:formatNumber value="${sj.gprice}" pattern="0.00"></fmt:formatNumber>元</span>
								</td>
								<td>
									<span class="label label-danger radius"><fmt:formatNumber value="${sj.gvipprice}" pattern="0.00"></fmt:formatNumber>元</span>
								</td>
								<td id="dan">
									${sj.gdanwei}
								</td>
								<td>
									<c:if test="${sj.gbegintime==null}"><span class="label label-defaunt radius">no time</span></c:if>
									<c:if test="${sj.gbegintime!=null}"><fmt:formatDate value="${sj.gbegintime}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>
								</td>
								<td>
									<c:if test="${sj.gendtime==null}"><span class="label label-defaunt radius">no time</span></c:if>
									<c:if test="${sj.gendtime!=null}"><fmt:formatDate value="${sj.gendtime}" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>
								</td>
								<td class="djs">
									<a style="text-decoration: none" onclick="daojishi(this,${sj.gid})"
									href="javascript:void(0)" title="添加商品折扣">
										<span class="label label-danger radius">显示倒计时 </span>
									</a>
								</td>
								<td class="td-manage">
									<a style="text-decoration: none" onclick="member_edit('设置时间','zhongchougoods.do?p=zcgoodssettimeview&id=${sj.gid}&type=1','0','','400')"
									href="javascript:void(0)" title="设置时间">
										<span class="label label-success radius">设置时间 </span>
									</a>
									<a style="text-decoration: none" onclick="member_edit('设置商品折扣','zhongchougoods.do?p=zcgoodssettimeview&id=${sj.gid}&type=2','0','','400')"
									href="javascript:void(0)" title="添加商品折扣">
										<span class="label label-danger radius">设置商品折扣 </span>
									</a>
									<a style="text-decoration: none" onclick="member_show('${sj.gname}二维码','zhongchougoods.do?p=checkGoodsCoder&id=${sj.gid}','10001','300','300')"
									href="javascript:void(0)" title="二维码">
										<span class="label label-warning radius">二维码 </span>
									</a>
									<a style="text-decoration: none" onclick="member_show('${sj.gname}','zhongchougoods.do?p=checkgoodsrebate&id=${sj.gid}','10001','1000','500')"
									href="javascript:void(0)" title="查看商品折扣">
										<span class="label label-primary radius">查看商品折扣 </span>
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
										<span class="right-text09">${ zcgoodsMap.page}</span> 页 |
										共
										<span class="right-text09">${zcgoodsMap.count }</span> 页
									</td>
									<td width="32%" align="right">
										[
										<a
											href="${pageContext.request.contextPath}/zhongchougoods.do?p=zcgoodslisting&minprice=${param.minprice}&maxprice=${param.maxprice}&keywords=${keywords}"
											class="right-font08">首页</a> |
										<a
											href="${pageContext.request.contextPath}/zhongchougoods.do?p=zcgoodslisting&minprice=${param.minprice}&maxprice=${param.maxprice}&keywords=${keywords}&page=${zcgoodsMap.page-1}"
											class="right-font08">上一页</a> |
										<a
											href="${pageContext.request.contextPath}/zhongchougoods.do?p=zcgoodslisting&minprice=${param.minprice}&maxprice=${param.maxprice}&keywords=${keywords}&page=${zcgoodsMap.page+1}"
											class="right-font08">下一页</a> |
										<a
											href="${pageContext.request.contextPath}/zhongchougoods.do?p=zcgoodslisting&minprice=${param.minprice}&maxprice=${param.maxprice}&keywords=${keywords}&page=${zcgoodsMap.count}"
											class="right-font08">末页</a> ] 转至：
									</td>
									<td width="5%">
										<table width="20" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="1%">
													<input name="textfield3" type="text" id="page"
														value="${zcgoodsMap.page}" class="right-textfield03"
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
//倒计时
function daojishi(a,gid)
{
	var url="${pageContext.request.contextPath}/zhongchougoods.do?p=findByIdGoods";
	var param={gid:gid};
	$.post(url,param,function(data){
		var endtime=data;
		window.setInterval(function(){
			var date=new Date();
			$(".djs").each(function(){
			var td=$(a).parent().parent().find("td").eq(8);
			if(endtime=="null")
			{
				td.html("未设置时间!");
				return false;
			}
			var nms=endtime-date.getTime();
			var day=Math.floor(nms/(1000 * 60 * 60 *24));//天
			var h=Math.floor(nms/(1000 * 60 * 60))% 24;//小时
			var m=Math.floor(nms/(1000*60))% 60;//分钟
			var s=Math.floor(nms/1000)%60;//秒
			var ms=Math.floor(nms/100)%10;//拆分秒
			if(day>=0)
			{
				var str=day+"天"+h+"小时"+m+"分"+s+"."+ms+"秒";
			}else{
				var str="已结束!";
			}
			td.html(str);
			});
		},100);
	});
}
//页面跳转
function viewGo()
{
	var page=document.getElementById("page").value;
	if(page.match('^[0-9]*$'))
		{	
	window.location.href="${pageContext.request.contextPath}/zhongchougoods.do?p=zcgoodslisting&gttid=${param.gttid}&minprice=${param.minprice}&maxprice=${param.maxprice}&keywords=${keywords}&page="+page;
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