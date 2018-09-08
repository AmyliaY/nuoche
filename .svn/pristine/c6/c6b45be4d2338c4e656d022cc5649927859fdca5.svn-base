<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
<form action="${pageContext.request.contextPath}/corp.do?p=editcorplinsting&id=${corplisting.pscId}" method="post" class="form form-horizontal" id="form-article-add">
	<div class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>公司中文名字：</label>
			<div class="formControls col-10">
				<input type="text" class="input-text"  value="${corplisting.pscChinesename}" placeholder="" id="chinesename" name="chinesename">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>公司英文名字：</label>
			<div class="formControls col-10">
				<input type="text" class="input-text"  value="${corplisting.pscEnglishname}" placeholder="" id="englishname" name="englishname">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-2">公司网址：</label>
			<div class="formControls col-10">
				<input type="text" class="input-text" value="${corplisting.pscUrl}" placeholder="" id="pscurl" name="pscurl">
			</div>
		</div>
		<input type="hidden" name="pscdetail" id="pscdetail"/>
		<div class="row cl">
			<label class="form-label col-2">公司简介：</label>
			<div class="formControls col-10"> 
				<script id="editor"  type="text/plain" style="width:100%;height:200px;">${corplisting.pscDetail}</script> 
				
			</div>
		</div>
		<div class="row cl">
			<div class="col-10 col-offset-2">
				<button onclick="return add()" id="sub" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i>编辑</button>
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
var ue = UE.getEditor('editor');

function add()
{
	var chinesename=$("#chinesename").val();
	var englishname=$("#englishname").val();
	var pscurl=$("#pscurl").val();
	var editor=ue.getContentTxt();
	if(chinesename==null || ""==chinesename)
	{
		layer.msg("请输入公司中文名!",{icon:6,time:1000});
		return false;
	}
	else{
	var a= /^[\u4e00-\u9fa5]{1,}$/
	if(!a.test(chinesename))
	{
		layer.msg("公司中文名只能输入中文!",{icon:6,time:1000});
		$("#chinesename").val("");
		return false;
	}
	
	$("#chinesename").attr("value",chinesename);
	}
	
	
	
	if(englishname==null || ""==englishname)
	{
		layer.msg("请输入公司英文名!",{icon:6,time:1000});
		return false;
		}
	else{
	var b= /^[A-Za-z]{1,}$/
	if(!b.test(englishname))
	{
		layer.msg("公司英文名只能输入英文!",{icon:6,time:1000});
		$("#englishname").val("");
		return false;
	}
	
		$("#englishname").attr("value",englishname);
	}
	
	if(pscurl==null || ""==pscurl)
	{
		layer.msg("请输入公司网址!",{icon:6,time:1000});
		return false;
    }
	
	if(editor==null || ""==editor)
	{
		layer.msg("请输入公司简介!",{icon:6,time:1000});
		return false;
	}
		$("input[name=pscdetail]").attr("value",editor);
	
}

</script>
  </body>
</html>
