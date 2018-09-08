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
<title>生成二维码图片</title>
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
	<form id="formgo" action="${pageContext.request.contextPath}/admin_erweima.do?p=createimagego" method="post">
		<table class="table table-hover table-bordered">
			<tr class="ttk">
				<td align="right">当前二维码编号数量：</td>
				<td>${kcnum }&nbsp;张</td>
			</tr>
			<tr class="ttk">
				<td align="right" >请输入起始编号：</td>
				<td><input type="text" id ="beginid" value="" /></td>
			</tr>
			<tr class="ttk">
				<td align="right" style="vertical-align: middle;">请选择生成二维码数量：
				</td>
				<td>
					<select class="select" id="num" name="num" style="width: 110px;float: left;height:30px;">
						<option value="1">&nbsp;1&nbsp;</option>
						<option value="10">&nbsp;10&nbsp;</option>
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
					<button  type="button" onclick="tego(${kcnum })" style="width:80px;height:40px;margin-top: 30px;">生成</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
<script>
function tego(kcnum)
{
	//  输入的起始id
	var beginid = $("#beginid").val();
	//  选择生成的数量
	var num = $("#num").val();
	//  起始编号加数量大于数据库中的数据数量
	if(beginid > 0 && (beginid*1+num*1-1) > kcnum)
	{
		alert("你输入的起始编号错误！已超出已有数据量！");
		return;
	}else if(beginid <=0)
	{
		alert("你输入的起始编号错误！起始编号请大于零！");
		return;
	}else{
		if(num>=10000)
		{
			alert("请求数量较多，可能需要一定的时间...请点击【确定】继续");
		}
		var url="${pageContext.request.contextPath}/admin_erweima.do?p=createqrcodeimagego";
		var param={num:num,beginid:$("#beginid").val()};
		$.post(url,param,function(data){
			if (data == "yes") 
			{
				alert("二维码生成成功！");
				window.location.href="${pageContext.request.contextPath}/admin_erweima.do?p=createqrcodeimage";
			}
		});
	}
	
	
	
	
	
}
</script>
</body>
</html>


