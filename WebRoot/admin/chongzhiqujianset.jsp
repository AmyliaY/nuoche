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
		<title>设置充值价格区间</title>
	</head>
	<body>
		<div class="pd-20">
				<div class="form form-horizontal" id="form-member-add">
						
						<div class="row cl">
								<label class="form-label col-2"><span class="c-red">*</span>区间-小：</label>
							<div class="formControls col-3">
								<input type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" class="input-text" value=""  placeholder="" id="ppmin" name="">
							</div>
						</div>
						<div class="row cl">
								<label class="form-label col-2"><span class="c-red">*</span>区间-大：</label>
							<div class="formControls col-3">
								<input type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" class="input-text" value=""  placeholder="" id="ppmax" name="">
							</div>
						</div>
						<div class="row cl">
								<label class="form-label col-2"><span class="c-red">*</span>赠送积分数：</label>
							<div class="formControls col-3">
								<input type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" class="input-text" value=""  placeholder="" id="ppPresent" name="">
							</div>
						</div>
						<div class="row cl">
								<label class="form-label col-2">商品状态：</label>
							<div class="formControls col-3"> <span class="select-box">
								<select class="select" id="ppstatus">
									<option value="1">启用</option>
									<option value="0">禁用</option>
								</select>
							</span> </div>
							<div class="col-9 col-offset-6" style="margin-top: -30px;">
								<input class="btn btn-primary radius" id="sub"
								onclick="return setqujian()" type="submit"
								value="&nbsp;&nbsp;新增&nbsp;&nbsp;">
							</div>
						</div>
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
//设置充值价格区间
function setqujian()
{
	var ppmin=$("#ppmin").val();
	var ppmax=$("#ppmax").val();
	if(ppmin=="" || ppmax=="")
	{
		layer.msg("请输入区间!",{icon:6,time:1000});
		return false;
	}
	var ppPresent=$("#ppPresent").val();
	if(ppPresent==null || ppPresent=="")
	{
		layer.msg("请输入赠送积分数!",{icon:6,time:1000});
		return false;
	}
	var ppstatus=$("#ppstatus").val();
	$.ajax({
		url:"${pageContext.request.contextPath}/chongzhirecord.do?p=setqujian",
		type:"post",
		data:{ppmin:ppmin,ppmax:ppmax,ppPresent:ppPresent,ppstatus:ppstatus},
		success:function(){
			window.parent.location.reload();
		}
	});
}

//页面跳转
function viewGo() {
	var page = $("#page").val();
	if (page.match('^[0-9]*$')) {
		window.location.href = "shangjiagoods.do?p=checkgoodsrebate&&id=${id}&type=${type}&page="
				+ page;
	}
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