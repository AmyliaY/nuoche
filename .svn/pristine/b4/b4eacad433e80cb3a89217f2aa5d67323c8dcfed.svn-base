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
<title>编辑置顶</title>
</head>
<body>
<div class="pd-20">
<form id="formGo" action="${pageContext.request.contextPath}/dailiTop.do?p=editZhiding" method="post" class="form form-horizontal" id="form-article-add" >
	<input name="serviceId" id="serviceId" value="${service.id}" style="display: none;" />
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
				<label class="form-label col-2"> <span class="c-red">*</span>商家名称：
				</label>
				<div class="formControls col-2">
					<span class="select-box"> <select name="bid" id="bid"
						class="select" onchange="findservice()">
							<%-- <option value="${service.business.id }">${service.business.shopname }</option> --%>
							<c:forEach items="${business }" var="l">
								<option value="${l.id }">${l.shopname }</option>
							</c:forEach>
					</select>
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2"> <span class="c-red">*</span>服务类型：
				</label>
				<div class="formControls col-2">
					<span class="select-box"> <select name="sid" id="sid"
						class="select">
							<!-- <option value="-1">--请选择--</option> -->
							<option value="${service.id}">${service.title }</option>
					</select>
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2"> <span class="c-red">*</span>是否置顶：
				</label>
				<div class="formControls col-2">
					<span class="select-box"> <select name="isZhiding" id="zdid"
						class="select">
							<option  value="1">是</option>
							<option  value="0">否</option>
					</select>
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2"> <span class="c-red">*</span>截止日期：
				</label>
				<div class="formControls col-2">
					<span class="select-box"> 
					<!-- <select name="gid" id="gid"
						class="select">
							<option value="-1">--请选择--</option>
							<option value=""></option>
					</select> -->
<!-- 					<input style="width: 100%;height: 100%;border: none;" name="gid" type="date" value="2018-03-19">
 -->					
 						<input onchange="yanzheng()" name="overtime" type='text' id="choose_data"
 						 onfocus="new WdatePicker(this,null,false,'whyGreen')"  value='${strovertime }' style="width: 100%;height: 100%;border: none;">
					</span>
				</div>
			</div>
		</div>
		<!-- <input type="hidden" name="cimgdescribe" id="cimgcescribe"/>
		 <div class="row cl" id="detail" style="margin-top: 8%">
			
		</div> -->
		
		<div class="row cl">
			<div class="col-10 col-offset-2">
				<button id="sub" onclick="update()" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 修改</button>
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

$(document).ready(function(){
	findservice();
});

function update(){
	var overtimeVal = $('#choose_data').val()+" 00:00:00";
	var overtime = new Date(overtimeVal).getTime();
	var nowtime = new Date().getTime();
	var service = $("#sid").text();
	//alert(service);
	//alert(overtimeVal+"---------"+overtime+"-------"+nowtime);
	if(service == "" || service == null){
		layer.msg("请选择服务",{icon:6,time:1000});
		return;
	}
	else if(overtime <= nowtime){
		layer.msg("截止日期必须大于当前时间！",{icon:6,time:1000});
		return;
	}else{
		$("#formGo").submit();
	}
	//alert(timestamp+"-----------"+overtime.getTime()+"------"+overtimeVal);	
}

function findservice() {
	var bid = $("#bid").val();
	if(bid.trim == ""){
		bid=-1;
	}
	var sid = $("#sid").find("option").eq(0).val();
	//alert("原ID:"+sid);
	var url = "${pageContext.request.contextPath}/dailiTop.do?p=getService&newserviceId="+sid;
	var param = {bid:bid};
	$.post(url,param,function(data){
		var json=eval("("+data+")");
		var sid = $("#sid").find("option").eq(0).val();

		var sname = $("#sid").find("option").eq(0).text();
		//alert(sname);
		//var option1 = new Option(sname,sid);
		//var option1 = new Option("请选择");
		$("#sid").empty(); 
		var options=document.getElementById("sid");
		//options.add(option1);
		if(json.length==0){
			layer.msg("该商家没有可选择的服务",{icon:6,time:1000});
		}else{
			for(var i=0;i<json.length;i++)
			{
				
			    var option = new Option(json[i].title,json[i].id);
				options.add(option);
			}
		}
		
	});
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
/* var ue = UE.getEditor('editor');
function add()
{
	var editor=(ue.getContent());
	$("input[name=cimgdescribe]").attr("value",editor);
	var cimgtitle=$("#cimgtitle").val();
	if(cimgtitle==null || ""==cimgtitle)
	{
		layer.msg("请输入轮播图片标题",{icon:6,time:1000});
		return false;
	}
	var cimages=$("#cimages").val();
	if(cimages==null || ""==cimages)
	{
		layer.msg("请选择图片",{icon:6,time:1000});
		return false;
	}
	var cimgtype=$("#cimgtype").val();
	var cimgurl=$("#gid").val();
	if(cimgtype==0){
		if(editor==null || ""==editor)
		{
		layer.msg("请输入图片内容",{icon:6,time:1000});
		return false;
		}
	}else if(cimgtype == 1){
		if(cimgurl==-1 || ""==cimgurl || cimgurl==null)
		{
			layer.msg("请选择商品",{icon:6,time:1000});
			return false;
		}
	}else{
		var url=$("#desc_url").val();
		var reg=/^([hH][tT]{2}[pP]:\/\/|[hH][tT]{2}[pP][sS]:\/\/)(([A-Za-z0-9-~]+)\.)+([A-Za-z0-9-~\/])+$/;
		if(!reg.test(url)){
 			layer.msg("这网址不是以http://https://开头，或者不是网址！",{icon:6,time:1000});
 			return false;
 		}
		
	}
} */

</script>
</body>
</html>