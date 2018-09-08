<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>新增用户信息</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/daili/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/daili/css/bootstrap.min.css"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/lib/lib/My97DatePicker/WdatePicker.js"></script>

<!-- 
张嘉雄    3月25
 -->


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
}

input[type='text'], select {
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
		<form
			action="${pageContext.request.contextPath}/users.do?p=xiugai&uid=${user.id}"
			method="post">
			<table class="table table-hover table-bordered">

				<tr class="ttk">
					<td align="right" style="vertical-align: middle;">车牌号：</td>
					<td>${user.plateNumber }</td>
				</tr>
				<tr class="ttk">
					<td align="right" style="vertical-align: middle;">车牌二维码编号：</td>
					<td>${user.qrcode }</td>
				</tr>
				<tr class="ttk">
					<td align="right" style="vertical-align: middle;">用户微信号：</td>
					<td>${user.openid }</td>
				</tr>

				<tr class="ttk">
					<td align="right" style="vertical-align: middle;">姓名：</td>
					<td>${user.name }</td>
				</tr>
				<tr class="ttk">
					<td align="right" style="vertical-align: middle;">性别：</td>
					<td>
						<!-- 性别   1代表男     0代表女 --> <c:if test="${user.sex==1}">男</c:if> <c:if
							test="${user.sex==0}">女</c:if>
					</td>
				</tr>
				<tr class="ttk">
					<td align="right" style="vertical-align: middle;">用户状态：</td>
					<td><select name="user_overdue" id="user_overdue">
							<option class="0" value="0">未付款</option>
							<option class="1" value="1">已付款未绑定</option>
							<option class="2" value="2">已付款已绑定</option>
							<option class="3" value="3">过期</option>
					</select></td>
				</tr>
				<tr class="ttk">
					<td align="right" style="vertical-align: middle;">是否关注公众号：</td>
					<td><select name="user_role" id="user_role">
							<option class="0" value="0">未关注</option>
							<option class="1" value="1">已关注</option>
					</select></td>
				</tr>
				<tr class="ttk">
					<td align="right" style="vertical-align: middle;">到期时间：</td>
					<td><input type='text' name="user_overdue_time"
						id="choose_data"
						onfocus="new WdatePicker(this,null,false,'whyGreen')"
						placeholder="${guoqishijian}" style="width: 100%;height: 100%;"></input></td>
				</tr>
				<tr class="ttk">
					<td align="right" style="vertical-align: middle;">地址：</td>
					<td><input type="text" name="user_address"
						value="${user.address }" /></td>
				</tr>

				<tr class="ttk">
					<td align="right" style="vertical-align: middle;">电话号码：</td>
					<td><input type="text" name="user_tel" value="${user.tel }" /></td>
				</tr>

				<tr class="ttk">
					<td colspan="2" align="center">
						<button class="btn  btn-primary" type="submit"
							style="width:100px;height:50px;">提交</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
<script type="text/javascript">
$(document).ready(function(){
	$("#user_overdue").children("option."+${user.overdue}).attr("selected",true);
	
	$("#user_role").children("option."+${user.role}).attr("selected",true);
	
}
);
</script>

