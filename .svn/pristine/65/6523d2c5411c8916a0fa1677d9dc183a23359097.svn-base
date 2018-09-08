<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="${pageContext.request.contextPath }/lib/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/lib/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/lib/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/lib/lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>新增子代理</title>
</head>
<body>
<div class="pd-20">

<form action="${pageContext.request.contextPath}/dailimanage.do?p=doaddzidaili" method="post" id="addzidaili">
	<div class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>代理人姓名：</label>
			<div class="formControls col-10">
				<input type="text" class="input-text"  value="" placeholder="" id="proxyname" name="proxyname" style="width: 250px; ">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>代理人电话号码：</label>
			<div class="formControls col-10">
				<input type="text" class="input-text"  value="" placeholder="" id="proxytel" name="proxytel" style="width: 250px; ">
				<span class="c-red">*(默认密码：123456)</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2"> <span class="c-red">*</span>所在区县：
			</label>
			<div class="formControls col-2">
				<span class="select-box"> 
					<select name="area" id="area" onchange="findproxynum()"
						class="select" style="width: 250px; ">
							<option value="-1">--请选择--</option>
							<c:forEach items="${areaList}" var="p">
								<option value="${p.arId}"}>${p.arName}</option>
							</c:forEach>
					</select>
				</span>
			</div>
			<span class="c-red" style="margin-left:80px">该地区在职的代理人数：
				<span class="on_proxy">0</span>
			</span>
		</div>
		<div class="row cl">
			<div class="col-10 col-offset-2">
				<button onclick="return add()" id="sub" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 添加</button>
			</div>
		</div>
	</div>
</form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/Validform/5.3.2/Validform.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/js/H-ui.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/js/ajaxfileupload.js"></script> 
<script type="text/javascript">


function add()
{
	var proxyname=$("#proxyname").val();
	if(proxyname==null || ""==proxyname)
	{
		layer.msg("请输入代理人姓名",{icon:6,time:1000});
		return false;
	}
	var proxytel=$("#proxytel").val();
	if(proxytel==null || ""==proxytel){
		layer.msg("请输入电话号码",{icon:6,time:1000});
		return false;
	}
	var reg=/^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$/;
	if(!reg.test(proxytel)){
		layer.msg("手机格式不正确！",{icon:6,time:1000});
		return false;
	}
	var prid=$("#prid").val();
	var arid=$("#area").val();
	if(arid==-1)
	{
		layer.msg("请选择代理人所在区县！",{icon:6,time:1000});
		return false;
	}
	
	var tel = $("#proxytel").val();
	 $.ajax({
		url:"${pageContext.request.contextPath}/dailimanage.do?p=cheaktel",
		type:"post",
		data:{'tel':tel},
		success:function(result)
		{
			if(result=="yes"){
				alert("手机号码已存在");
				$("#tel").val("");
				return false;
			}else{
				 $("#addzidaili")[0].submit();
			}
		}
	 });
	 
}		

function findproxynum() {
	
	var area = $("#area").val();
	if (area.trim == "") {
		area = -1;
	}
	var param={area:area};
	
	var url2 = "${pageContext.request.contextPath}/dailimanage.do?p=findonproxy";
	$.post(url2,param,function(data){
	    
		var json=eval("("+data+")");
		$(".on_proxy").empty();
		$(".on_proxy").text(json[0].num);
	});
}	

</script>
</body>
</html>