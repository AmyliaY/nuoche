<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			href="${pageContext.request.contextPath }/lib/lib/icheck/icheck.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath }/lib/lib/Hui-iconfont/1.0.7/iconfont.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/webuploader.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/lib/css/css.css"
			rel="stylesheet" type="text/css" />
		<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
		<title>设置众筹商品</title>
	</head>
	<body>
		<div class="pd-20">
					<c:if test="${type==1}">
					<div class="row cl">
						<label class="form-label col-3">
							<h3 id="setbu"><span class="c-red">*</span>第一步：设置时间</h3>
						</label>
					</div>
					</c:if>
					<c:if test="${type==2}">
					<div class="row cl">
						<label class="form-label col-3">
							<h3 id="setbu"><span class="c-red">*</span>第二步：设置商品折扣</h3>
						</label>
					</div>
					</c:if>
				<div class="form form-horizontal" id="form-member-add">
				<c:if test="${type==1}">
					<div id="one"> 
					<div class="row cl">
						<label class="form-label col-3">
							<span class="c-red">*</span>开始时间：
						</label>
						<div class="formControls col-5">
							<input type="text" name="begin"	value="<fmt:formatDate value="${goods.gbegintime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
								id="begin" class="input-text Wdate" style="width: 220px;">
								
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row cl">
						<label class="form-label col-3">
							<span class="c-red">*</span>结束时间：
						</label>
						<input type="text" name="end"	value="<fmt:formatDate value="${goods.gendtime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
								id="end" class="input-text Wdate" style="width: 220px;">
					</div>
					<div class="row cl">
					<div class="col-9 col-offset-3">
						<input class="btn btn-primary radius" id="sub"
							onclick="return tijiao()" type="submit"
							value="&nbsp;&nbsp;下一步 &nbsp;&nbsp;">
					</div>
				</div>
				</div>
				</c:if>
					<c:if test="${type==2}">
						<div class="row cl">
								<label class="form-label col-2"><span class="c-red">*</span>商品名称：</label>
							<div class="formControls col-10">
								${goods.gname}
							</div>
						</div>
						<div class="row cl">
								<label class="form-label col-2"><span class="c-red">*</span>商品折扣：</label>
							<div class="formControls col-3">
								<input type="text" onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]" class="input-text" value=""  placeholder="" id="gcfrRebate" name="">
							</div>
						</div>
						<div class="row cl">
								<label class="form-label col-2"><span class="c-red">*</span>开始重量：</label>
							<div class="formControls col-3">
								<input type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" class="input-text" value=""  placeholder="" id="gcfrBeginkg" name="">
							</div>
						</div>
						<div class="row cl">
								<label class="form-label col-2"><span class="c-red">*</span>结束重量：</label>
							<div class="formControls col-3">
								<input type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" class="input-text" value=""  placeholder="" id="gcfrEndkg" name="">
							</div>
						</div>
						<div class="row cl">
								<label class="form-label col-2">商品状态：</label>
							<div class="formControls col-3"> <span class="select-box">
								<select class="select" id="gcfrStatus">
									<option value="1">启用</option>
									<option value="0">禁用</option>
								</select>
							</span> </div>
							<div class="col-9 col-offset-6" style="margin-top: -30px;">
								<input class="btn btn-primary radius" id="sub"
								onclick="return setrebate()" type="submit"
								value="&nbsp;&nbsp;新增&nbsp;&nbsp;">
							</div>
							<div class="col-9 col-offset-8" style="margin-top: -30px;">
								<input class="btn btn-primary radius" id="sub"
								onclick="return end()" type="submit"
								value="&nbsp;&nbsp;完成&nbsp;&nbsp;">
							</div>
						</div>
		<span class="r">共有数据：<strong>${rebateMap.sum}</strong> 条</span>
		<div class="mt-20">
			<table id="tab"
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="40">
							序号
						</th>
						<th width="40">
							折扣
						</th>
						<th width="40">
							起始重量
						</th>
						<th width="40">
							结束重量
						</th>
						<th width="40">
							状态
						</th>
						<th width="40">
							操作
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rebateMap.list}" var="r" varStatus="i">
						<tr class="text-c">
							<td>
								${i.count+(rebateMap.page-1)*rebateMap.size}
							</td>
							<td>
								<span class="label label-danger radius">${r.gcfrRebate}</span>
							</td>
							<td>
								<span class="label label-primary radius">${r.gcfrBeginkg} </span>
							</td>
							<td>
								<span class="label label-success radius">${r.gcfrEndkg} </span>
							</td>
							<td>
								<c:choose>
									<c:when test="${r.gcfrStatus==0}"><span class="label label-defaunt radius">禁用</span></c:when>
									<c:otherwise><span class="label label-success radius">启用 </span></c:otherwise>
								</c:choose>
							</td>
							<td class="td-manage">
								<a style="text-decoration: none"
										onclick="xiugai_status(this,${r.gcfrId})"
										href="javascript:void(0)" title="修改状态"><c:choose>
											<c:when test="${r.gcfrStatus==0}">
												<span class="label label-success radius">启用</span>
											</c:when>
											<c:otherwise>
												<span class="label label-defaunt radius">禁用</span>
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
									<span class="right-text09">${ rebateMap.page}</span> 页 | 共
									<span class="right-text09">${rebateMap.count }</span> 页
								</td>
								<td width="49%" align="right" id="xiugaitype">
									[
									<a
										href="${pageContext.request.contextPath}/shangjiagoods.do?p=checkgoodsrebate&&id=${id}&type=${type}"
										class="right-font08">首页</a> |
									<a
										href="${pageContext.request.contextPath}/shangjiagoods.do?p=checkgoodsrebate&&id=${id}&type=${type}&page=${rebateMap.page-1}"
										class="right-font08">上一页</a> |
									<a
										href="${pageContext.request.contextPath}/shangjiagoods.do?p=checkgoodsrebate&&id=${id}&type=${type}&page=${rebateMap.page+1}"
										class="right-font08">下一页</a> |
									<a
										href="${pageContext.request.contextPath}/shangjiagoods.do?p=checkgoodsrebate&&id=${id}&type=${type}&page=${rebateMap.count}"
										class="right-font08">末页</a> ] 转至：
								</td>
								<td width="1%">
									<table width="20" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="1%">
												<input name="textfield3" type="text" id="page"
													value="${rebateMap.page}" class="right-textfield03"
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
						</c:if>
					</div>
				</div>
				
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/icheck/jquery.icheck.min.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/Validform/5.3.2/Validform.min.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/My97DatePicker/WdatePicker.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/datatables/1.10.0/jquery.dataTables.min.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/layer/2.1/layer.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/js/H-ui.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/js/H-ui.admin.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/webuploader.min.js">
</script>
		<script type="text/javascript">
//设置众筹商品折扣
function setrebate()
{
	var gcfrRebate=$("#gcfrRebate").val();
	if(gcfrRebate==null || gcfrRebate=="")
	{
		layer.msg("请输入商品折扣",{icon:6,time:1000});
		return false;
	}
	var gcfrBeginkg=$("#gcfrBeginkg").val();
	if(gcfrBeginkg==null || gcfrBeginkg=="")
	{
		layer.msg("请输入开始重量",{icon:6,time:1000});
		return false;
	}
	var gcfrEndkg=$("#gcfrEndkg").val();
	if(gcfrEndkg==null || gcfrEndkg=="")
	{
		layer.msg("请输入结束重量",{icon:6,time:1000});
		return false;
	}
	var gcfrStatus=$("#gcfrStatus").val();
	$.ajax({
		url:"${pageContext.request.contextPath}/shangjiagoods.do?p=setrebate&id=${goods.gid}",
		type:"post",
		data:{gcfrRebate:gcfrRebate,gcfrBeginkg:gcfrBeginkg,gcfrEndkg:gcfrEndkg,gcfrStatus:gcfrStatus},
		success:function(){
			window.location.href="${pageContext.request.contextPath}/shangjiagoods.do?p=checkgoodsrebate&id=${goods.gid}&type="+${type};
		}
	});
}
//设置众筹商品时间
function tijiao()
{
	var begin=$("#begin").val();
	var end=$("#end").val();
	if(begin==null || ""==begin)
	{
		layer.msg("请选择开始时间!",{icon:6,time:1000});
		return false;
	}
	if(end==null || ""==end)
	{
		layer.msg("请选择结束时间!",{icon:6,time:1000});
		return false;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/zhongchougoods.do?p=settime&id=${goods.gid}",
		type:"post",
		data:{begin:begin,end:end},
		success:function()
		{
			window.location.href="${pageContext.request.contextPath}/shangjiagoods.do?p=gzhongchouset&id=${goods.gid}&type=2";
		}
	});
}
//修改商品折扣状态  禁用 or 启用
function xiugai_status(a,id)
{
	var url="${pageContext.request.contextPath}/zhongchougoods.do?p=updatestatusrebate";
	var param={id:id};
	$.post(url,param,function(data){
		var td=$(a).parent().parent().find("td").eq(4);
		if(data=="0")
		{
			td.html('<span class="label label-defaunt radius">禁用</span>');
			a.innerHTML='<span class="label label-success radius">启用</span>';
			layer.msg("禁用成功",{icon:6,time:1000});
		}else{
			td.html('<span class="label label-success radius">启用</span>');
			a.innerHTML='<span class="label label-defaunt radius">禁用</span>';
			layer.msg("启用成功",{icon:6,time:1000});
		}
	});
}
//关闭当前窗口  刷新父级
function end()
{
	var gid="${goods.gid}";
	var param={gid:gid};
	var sum="${rebateMap.sum}";
	if(sum=="0")
	{
		layer.confirm("未设置众筹商品折扣，确定退出吗?",function(e){
			var url="${pageContext.request.contextPath}/zhongchougoods.do?p=quXiaoZhongChou";
			$.post(url,param,function(data){
				window.parent.location.reload();
			});
		});
		return;
	}
	var url="${pageContext.request.contextPath}/zhongchougoods.do?p=setReturnMoney";
	$.post(url,param,function(data){
		alert(data);
	});
	window.parent.location.reload();
}
//页面跳转
function viewGo() {
	var page = $("#page").val();
	if (page.match('^[0-9]*$')) {
		window.location.href = "${pageContext.request.contextPath}/shangjiagoods.do?p=checkgoodsrebate&&id=${id}&type=${type}&page="
				+ page;
	}
}
$(function() {
	$('.skin-minimal input').iCheck( {
		checkboxClass : 'icheckbox-blue',
		radioClass : 'iradio-blue',
		increaseArea : '20%'
	});

})
</script>
	</body>
</html>