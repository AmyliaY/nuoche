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
<title>代理领卡</title>
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
	<form id="formgo" action="${pageContext.request.contextPath}/admin_erweima.do?p=dailitakeqrcodego" method="post">
		<table class="table table-hover table-bordered">
			<tr class="ttk">
				<td align="right">当前可供领卡的二维码图片库存数量：</td>
				<td>${kcnum }&nbsp;张</td>
				<input type="hidden" id="kcnum"  value="${kcnum }"/>
			</tr>
			<tr class="ttk">
				<td align="right" style="vertical-align: middle;">请选择领卡代理人：
				</td>
				<td>
					<select class="select" id="proxyid" name="proxyid" style="width: 110px;float: left;height:30px;">
						<c:forEach items="${proxys }" var="proxy">
							<option value="${proxy.id}">${proxy.realname }</option>
						</c:forEach>
						
					</select>
				</td>
			</tr>
			
			<tr class="ttk">
				<td align="right" name="beginid">请输入领卡起始编号：</td>
				<td><input type="text" id ="beginid" value="${beginnum }" />
					<input type="hidden" id="beginnum"  value="${beginnum }"/>
				</td>
			</tr>
			<tr class="ttk">
				<td align="right" style="vertical-align: middle;">请选择代理领卡数量：
				</td>
				<td>
					<select class="select" id="num" name="num" style="width: 110px;float: left;height:30px;">
						<option value="1">&nbsp;1&nbsp;</option>
						<option value="10">&nbsp;10&nbsp;</option>
						<option value="20">&nbsp;20&nbsp;</option>
						<option value="30">&nbsp;30&nbsp;</option>
						<option value="50">&nbsp;50&nbsp;</option>
						<option value="80">&nbsp;80&nbsp;</option>
						<option value="100">&nbsp;100&nbsp;</option>
						<option value="150">&nbsp;150&nbsp;</option>
						<option value="200">&nbsp;200&nbsp;</option>
						
						
					</select>
				</td>
			</tr>
			<tr class="ttk">
				<td colspan="2" align="center">
					<button  type="button" onclick="tego(this)" style="width:80px;height:40px;margin-top: 30px;">提交</button>
				</td>
			</tr>
		</table>
		<input type="hidden" id ="endnumid" name="endnumid" value="${endnumid }" />
	</form>
	</div>
<script>
function tego(btn)
{
	
	// 可领卡数量
	var kcnum = $("#kcnum").val()*1;
	//  领卡数量
	var num = $("#num").val()*1;
	//  输入的起始id
	var beginid = $("#beginid").val();
	//  最后一条状态in(0,1,2,3)  的id   用来判断二维码图片库存编号是否连续
	var endnumid = $("#endnumid").val();
	
	//  起始编号加数量大于数据库中的数据数量
	if(beginid > 0 && (beginid*1+num*1-1) > endnumid)
	{
		alert("你输入的起始编号错误！已超出已有数据量！请参考默认起始编号操作！");
		return false;
	}else if(beginid <=0)
	{
		alert("你输入的起始编号错误！起始编号请大于零！");
		return false;
	}
	if(kcnum < num){
		alert("当前可领二维码数为："+kcnum+"，您请求的数量已超数，请重新输入或手动生成二维码...");
		return false;
	}
	else{
		
		var beginid = $("#beginid").val()*1;
		var proxyid = $("#proxyid").val();
		//  推荐起始编号
		var beginnum = $("#beginnum").val()*1;
		if(beginid < beginnum)
		{
			if(window.confirm("您输入的起始编号:"+beginid+"小于推荐起始编号："+beginnum+"表明部分二维码已被其他代理领取，是否继续？？"))
			{btn.disabled=true;
				var url="${pageContext.request.contextPath}/admin_erweima.do?p=dailitakeqrcodego&beginid="+beginid+"&proxyid="+proxyid;
				var param={num:num};
				$.post(url,param,function(data){
					if (data == "yes") 
					{
						alert("操作成功！");
						window.location.href="${pageContext.request.contextPath}/admin_erweima.do?p=dailitakeqrcode";
					}
				});
			}else{
				return ;
			}
		}else{
			var url="${pageContext.request.contextPath}/admin_erweima.do?p=dailitakeqrcodego&beginid="+beginid+"&proxyid="+proxyid;
			var param={num:num};
			$.post(url,param,function(data){
				if (data == "yes") 
				{
					alert("操作成功！");
					window.location.href="${pageContext.request.contextPath}/admin_erweima.do?p=dailitakeqrcode";
				}
			});
		}
	}	
}
</script>
</body>
</html>


