<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>极客学院-Java无限级分销管理系统</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/daili/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/daili/css/bootstrap.min.css"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/My97DatePicker/WdatePicker.js"></script> 
<style type="text/css">
body {
	padding: 70px;
}
table {
	width: 50%;
	margin: 0px auto;
	margin-top: -40px;
}
.ttk {
	height: 50px;
	font-size: 12px;
}
input[type='text'],select {
	width: 250px;
	border: 1px solid #eee;
	height: 40px;
	line-height: 40px;
	border-radius: 3px;
	padding-left: 10px;
}
</style>
</head>
<body>
	<div class="container-fluid ">
	<form id="formgo" action="${pageContext.request.contextPath}/admin_erweima.do?p=kaikago" method="post">
		<table class="table table-hover table-bordered">
			<tr class="ttk">
				<td align="right">起始编号：</td>
				<td>${beginnum+1 }</td>
			</tr>
			<tr class="ttk">
				<td align="right" style="vertical-align: middle;">请选择开卡数量：
				</td>
				<td>
					<select class="select" id="num" name="num" style="width: 110px;float: left;height:30px;">
						<option value="20">&nbsp;20&nbsp;</option>
						<option value="100">&nbsp;100&nbsp;</option>
						<option value="500">&nbsp;500&nbsp;</option>
						<option value="1000">&nbsp;1000&nbsp;</option>
						<option value="2000">&nbsp;2000&nbsp;</option>
						<option value="5000">&nbsp;5000&nbsp;</option>
						<option value="10000">&nbsp;10000&nbsp;</option>
						<option value="20000">&nbsp;20000&nbsp;</option>
						<option value="30000">&nbsp;30000&nbsp;</option>
					</select>
				</td>
			</tr>
			<tr class="ttk">
				<td colspan="2" align="center">
					<button  type="button" onclick="tego(this)" style="width:80px;height:40px;margin-top: 30px;">开卡</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
<script>
function tego(btn)
{
	btn.disabled=true;
	var num =$("#num").val()*1;
	var url="${pageContext.request.contextPath}/admin_erweima.do?p=kaikago";
	var param={num:num};
	$.post(url,param,function(data){
		if (data == "yes") 
		{
			alert("开卡成功！");
			window.location.href="${pageContext.request.contextPath}/admin_erweima.do?p=kaika";
		}
	});
}
</script>
</body>
</html>


