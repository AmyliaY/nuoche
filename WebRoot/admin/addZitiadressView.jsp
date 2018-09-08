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
<title>新增商品</title>
</head>
<body>
<div class="pd-20">
<form action="${pageContext.request.contextPath}/corp.do?p=addzitiaddress" method="post" class="form form-horizontal" id="form-article-add">
	<div class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-2">省：</label>
			<div class="formControls col-2"> <span class="select-box">
				<select class="select" onchange="findByidCity()" id="prid" name="prid">
					<option value="-1">--请选择--</option>
					<c:forEach items="${plist}" var="p">
						<option value="${p.prId}">${p.prName}</option>
					</c:forEach>
				</select>
				</span> </div>
			<label class="form-label col-2">市：</label>
			<div class="formControls col-2"> <span class="select-box">
				<select class="select" onchange="findByIdArea()" id="city" name="city">
					
				</select>
				</span> </div>
			<label class="form-label col-2">区/县：</label>
			<div class="formControls col-2"> <span class="select-box">
				<select class="select" id="area" name="area">
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>联系人：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text"  value="" placeholder="" id="zitiname" name="zitiname">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>电话号码：</label>
			<div class="formControls col-2">
				<input type="text" class="input-text"  value="" placeholder="" id="zitiphone" name="zitiphone">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2">自提地址状态：</label>
			<div class="formControls col-2"> <span class="select-box">
				<select class="select" id="zitistatus" name="zitistatus">
					<option value="1">启用</option>
					<option value="0">禁用</option>
				</select>
				</span> </div>
		</div>
		<input type="hidden" name="zititext" id="zitext"/>
		<div class="row cl">
			<label class="form-label col-2">详细地址：</label>
			<div class="formControls col-10"> 
				<script id="editor"  type="text/plain" style="width:100%;height:200px;"></script> 
			</div>
		</div>
		<div class="row cl">
			<div class="col-10 col-offset-2">
				<button onclick="return add()" id="sub" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 添加</button>
			</div>
		</div>
	</div>
</form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/jquery/jquery-1.2.6.pack.js"></script> 
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
//根据省ID 查出市级
function findByidCity()
{
	var prid=$("#prid").val();
	if(prid.trim==""){
	prid = -1;
	
	}
	var url="${pageContext.request.contextPath}/corp.do?p=findByidCity";
	var param={prid:prid};
	$.post(url,param,function(data){
		var json=eval("("+data+")");
		$("#city").empty();
		for(var i=0;i<json.length;i++)
		{
			$('#city').append("<option value=" + json[i].ctId + ">" + json[i].ctName+ "</option>");
		}
		findByIdArea();
	});
}
//根据市ID 查出区/县级
function findByIdArea()
{
    var prid=$("#prid").val();
   
	var crid=$("#city").val();
	if(prid.trim() == -1){
	  crid = -1;
	  
	}
	var url="${pageContext.request.contextPath}/corp.do?p=findByIdArea";
	var param={crid:crid};
	$.post(url,param,function(data){
		var json=eval("("+data+")");
		$("#area").empty();
		for(var i=0;i<json.length;i++)
		{
			$("#area").append("<option value=" +json[i].arId+ ">" + json[i].arName + "</option>");
		}
	});
}
//验证
var ue = UE.getEditor('editor');
function add()
{
	var area=$("#area").val();
	var zitiname=$("#zitiname").val();
	var zitiphone=$("#zitiphone").val();
	var editor=ue.getContentTxt();
	if(area==null || ""==area)
	{
		layer.msg("请选择区/县!",{icon:6,time:1000});
		return false;
	}
	if(zitiname==null || ""==zitiname)
	{
		layer.msg("请输入联系人!",{icon:6,time:1000});
		return false;
	}
	if(zitiphone==null || ""==zitiphone)
	{
		layer.msg("请输入电话号码!",{icon:6,time:1000});
		return false;
	}
	if(editor==null || ""==editor)
	{
		layer.msg("请输入详细地址!",{icon:6,time:1000});
		return false;
	}else{
		$("input[name=zititext]").attr("value",editor);
	}
}

</script>
</body>
</html>