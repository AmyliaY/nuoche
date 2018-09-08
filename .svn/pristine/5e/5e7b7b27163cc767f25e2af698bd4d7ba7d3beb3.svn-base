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
<title>新增置顶</title>
</head>
<body>
<div class="pd-20">
<form id="formgo" action="${pageContext.request.contextPath}/dailiTop.do?p=addZhiding" method="post" class="form form-horizontal" id="form-article-add" >
	<div class="form form-horizontal" id="form-article-add">
		<!-- <div class="row cl">
			<label class="form-label col-2">轮播类型：</label>
			<div class="formControls col-2"> <span class="select-box">
				<select class="select" onchange="genhuan()" id="cimgtype" name="cimgtype">
					<option value="0">内容</option>
					<option value="1">链接到服务</option>
					<option value="2">链接到商家</option>
					
				</select>
				</span> </div>
		</div> -->
		</div>
		<div class="row cl" style="display: block;" id="url">
			<div class="row cl">
				<label class="form-label col-2"> <span class="c-red">*</span>商家列表：
				</label>
				<div class="formControls col-2">
					<span class="select-box"> <select name="bid" id="bid"
						class="select" onchange="findservice()">
							<option value="-1">--请选择--</option>
							<c:forEach items="${business }" var="l">
								<option value="${l.id }">${l.shopname }</option>
							</c:forEach>
					</select>
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2"> <span class="c-red">*</span>服务列表：
				</label>
				<div class="formControls col-2">
					<span class="select-box"> <select name="sid" id="sid"
						class="select">
							<option value="-1">--请选择--</option>
							<option value=""></option>
					</select>
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2"> <span class="c-red">*</span>截止日期：
				</label>
				<div class="formControls col-2">
					<span class="select-box"> 
<!-- 					<input style="width: 100%;height: 100%;border: none;" name="gid" type="date" value="2018-03-19">
 -->					<input name="overtime" type='text' id="choose_data" onfocus="new WdatePicker(this,null,false,'whyGreen')" placeholder="点击选择日期" style="width: 100%;height: 100%;border: none;">
					</span>
				</div>
			</div>
		</div>
		<!-- <input type="hidden" name="cimgdescribe" id="cimgcescribe"/>
		 <div class="row cl" id="detail" style="margin-top: 8%">
			
		</div> -->
		
		<div class="row cl">
			<div class="col-10 col-offset-2">
				<button id="sub" class="btn btn-primary radius" type="button" onclick="tijiao()" ><i class="Hui-iconfont">&#xe632;</i> 添加</button>
			</div>
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

function findservice() {
	var bid = $("#bid").val();
	if(bid.trim == ""){
		bid=-1;
	}
	
	var url = "${pageContext.request.contextPath}/dailiTop.do?p=getService";
	var param = {bid:bid};
	$.post(url,param,function(data){
	    
		var json=eval("("+data+")");
		$("#sid").empty();
		var options=document.getElementById("sid");
		for(var i=0;i<json.length;i++)
		{
			
		    var option = new Option(json[i].title,json[i].id);
			options.add(option);
		}
		
	});
	
}
function tijiao(){
	var overtimeVal = $('#choose_data').val()+" 00:00:00";
	var overtime = new Date(overtimeVal).getTime();
	var nowtime = new Date().getTime();
	var bid = $("#bid").val();
	if(bid == -1){
		layer.msg("请选择置顶的商家！",{icon:6,time:1000});	
		return;
	}else if($("#sid").children().val()==null)
	{
		layer.msg("没有可置顶的服务！",{icon:6,time:1000});	
		return;
	}else if(overtime <= nowtime){
		layer.msg("截止日期必须大于当前时间一天！",{icon:6,time:1000});
		return;
	}else if(overtime > nowtime){
		$("#formgo").submit();
		return;
	}else{
		layer.msg("请填写正确的截止日期！",{icon:6,time:1000});	
		return;
	}

}


/* function findGname(){
	var gttid = $("#gttid").val();
	if (gttid.trim == "") {
		gttid = -1;
	}
	var url = "${pageContext.request.contextPath}/lunboimg.do?p=getGname";
	var param={id:gttid};
	$.post(url,param,function(data){
		var json=eval("("+data+")");
		$("#gid").empty();
		for(var i=0;i<json.length;i++)
		{
		   var option = new Option(json[i].gname,json[i].gid);
			document.getElementById("gid").add(option);
		}
	});

} */


/* function genhuan()
{

	var cimgtype=$("#cimgtype").val();
	if(cimgtype==1)
	{
		document.getElementById("url").style.display='block';
		document.getElementById("detail").style.display='none';
		document.getElementById("desc").style.display='none';
	}else if(cimgtype==0){
		document.getElementById("url").style.display='none';
		document.getElementById("desc").style.display='none';
		document.getElementById("detail").style.display='block';
	}else{
		document.getElementById("url").style.display='none';
		document.getElementById("desc").style.display='block';
		document.getElementById("detail").style.display='none';
	
	}
} */

</script>
</body>
</html>