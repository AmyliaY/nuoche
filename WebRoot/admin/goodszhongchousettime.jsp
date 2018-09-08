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
		<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
		<title>设置众筹商品结束时间</title>
	</head>
	<body>
		<div class="pd-20">
				<div class="form form-horizontal" id="form-member-add">
				<c:if test="${type==1}">
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
							value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
					</div>
				</div>
					</c:if>
					<c:if test="${type==2}">
						<div class="row cl">
								<label class="form-label col-2"><span class="c-red">*</span>商品名称：</label>
							<div class="formControls col-10">
								<input type="text" class="input-text" value="${goods.gname}" readonly="readonly" placeholder="" id="gname" name="">
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
						</div>
						<div class="row cl">
							<div class="col-9 col-offset-3">
								<input class="btn btn-primary radius" id="sub"
								onclick="return setrebate()" type="submit"
								value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
							</div>
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
	var gcfrBeginkg=$("#gcfrBeginkg").val();
	var gcfrEndkg=$("#gcfrEndkg").val();
	var gcfrStatus=$("#gcfrStatus").val();
	$.ajax({
		url:"${pageContext.request.contextPath}/zhongchougoods.do?p=setrebate&id=${goods.gid}",
		type:"post",
		data:{gcfrRebate:gcfrRebate,gcfrBeginkg:gcfrBeginkg,gcfrEndkg:gcfrEndkg,gcfrStatus:gcfrStatus},
		success:function(){
			window.parent.location.reload();
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
			window.parent.location.reload();
		}
	});
}
$(function() {
	$('.skin-minimal input').iCheck( {
		checkboxClass : 'icheckbox-blue',
		radioClass : 'iradio-blue',
		increaseArea : '20%'
	});

});
</script>
	</body>
</html>