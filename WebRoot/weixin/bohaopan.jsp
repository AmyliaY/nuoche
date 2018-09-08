<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>拨号盘</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" />
    
    <script src="${pageContext.request.contextPath }/weixin/js/mui.min.js"></script>
	<link href="${pageContext.request.contextPath }/weixin/css/mui.min.css" rel="stylesheet" />
		
    
    
</head>
<style>
.keyboard{
	line-height:70px;
	margin:0 auto;
	background-color:white;
}
span{
	font-size:24px;
	margin-left:50px;
}
.number-area{
	height:100px;
	line-height:80px;
}
</style>

<body class="body" style="height:100%; background:wheat">
<div class="layui-container" style="height:100%;">  
	  <div class="number-area " style="background-color:; height:30%;margin-bottom:4%;">
			<span style="font-size: 14px;margin:0 0 0 0;">请输入您的电话：</span><div style="background-color:white; width:100%;border:1px solid #a1a1a1;border-radius:25px;"> <span>&nbsp;</span><span class="numbers" style="width: 50%;"></span></div>
	  </div>
	  <div class="numbers-container" style="height:60%; border:;margin-top:2px;" >
		  <div class="layui-row layui-col-space1" style="height:25%;">
			<div class="layui-col-xs4 keyboard pushed1" style="border:1px solid #a1a1a1;border-radius:25px;">
			  <span class="">1</span>
			</div>
			<div class="layui-col-xs4 keyboard pushed2"  style="border:1px solid #a1a1a1;border-radius:25px;">
			  <span class="">2</span>
			</div>
			<div class="layui-col-xs4 keyboard pushed3"  style="border:1px solid #a1a1a1;border-radius:25px;">
			  <span class="">3</span>
			</div>
		  </div>
		  <div class="layui-row layui-col-space1" style="height:25%;">
			<div class="layui-col-xs4 keyboard pushed4" style="border:1px solid #a1a1a1;border-radius:25px;">
			  <span class="">4</span>
			</div>
			<div class="layui-col-xs4 keyboard pushed5" style="border:1px solid #a1a1a1;border-radius:25px;">
			  <span class="">5</span>
			</div>
			<div class="layui-col-xs4 keyboard pushed6" style="border:1px solid #a1a1a1;border-radius:25px;">
			  <span class="">6</span>
			</div>
		  </div>
		  <div class="layui-row layui-col-space1" style="height:25%;">
			<div class="layui-col-xs4 keyboard pushed7" style="border:1px solid #a1a1a1;border-radius:25px;">
			  <span class="">7</span>
			</div>
			<div class="layui-col-xs4 keyboard pushed8" style="border:1px solid #a1a1a1;border-radius:25px;">
			  <span class="">8</span>
			</div>
			<div class="layui-col-xs4 keyboard pushed9" style="border:1px solid #a1a1a1;border-radius:25px;">
			  <span class="">9</span>
			</div>
		  </div>
		  <div class="layui-row layui-col-space1" style="height:25%;">
			<div class="layui-col-xs4 keyboard pushed0" style="border:1px solid #a1a1a1;border-radius:25px;">
			  <span class="">0</span>
			</div>
			<div class="layui-col-xs4 keyboard delete-btn" style="border:1px solid #a1a1a1;border-radius:25px;">
			  <span><a class=""><i class="layui-icon">&#xe65c;</i></a></span>
			</div>
			<div class="layui-col-xs4 keyboard layui-icon" onclick="show(this)" style="border:1px solid #a1a1a1;border-radius:25px;">
			  <span ><a ><i class="layui-icon">&#xe605;</i></a></span>
			</div>
		  </div>
	  </div>
</div>


<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script> --%>
<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/jquery.form.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/popwin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/script.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/layui/layui.js"></script>
<script type="text/javascript">
function show(div){
	var str=$(".numbers").html();
	var re = /^134[0-8]\d{7}$|^13[^4]\d{8}$|^14[5-9]\d{8}$|^15[^4]\d{8}$|^16[6]\d{8}$|^17[0-8]\d{8}$|^18[\d]{9}$|^19[8,9]\d{8}$ /;
	
	div.className = "layui-col-xs4 keyboard layui-icon mui-disabled";
	div.disabled = true;
	var url="${pageContext.request.contextPath}/move.do?p=bohaopan&bhpwxh=${bhpwxh}&str="+str;
	param = "";
	if(re.test(str)){
	$.post(url,param,function(data){
			if(data == "yes") 
			{
				mui.toast("正在转接电话，请您稍等接听免费电话");	
				
			}
			if(data == "no") 
			{
				mui.toast("余额不足");
				div.disalbed = false;
				div.className = "layui-col-xs4 keyboard layui-icon";
			}
		});
		}else{
  				alert("请您填写正确的手机号码！");
  					return false;
 				}
		
		
		
		
}
</script>
</body>
</html>
