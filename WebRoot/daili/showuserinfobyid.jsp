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
<title></title>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/daili/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/daili/css/bootstrap.min.css"></script>


<style type="text/css">
/* 表格  */
.info{
	width: 100%;
	margin-top: 20px;
	
}
#dailiinfotable{
	width: 98%;
	height: auto;
	border-collapse: collapse;/* 边框合并属性  */
	margin: 10px;
	
}
#dailiinfotable tr{
	width: 100%;
	height: 30px;
	font-size: 12px;
	border-collapse: collapse;/* 边框合并属性  */
	border: 1px gainsboro solid;
}

.colname{
	width: 20%;
	padding: 6px;
	border: 1px gainsboro solid;
}
.colinfo{
	width:30%;
	border: 1px gainsboro solid;
}
#btnupdate{
width:80px;
height:40px;
margin-top: 20px;
margin-right: 40px;
float: right;
}
</style>
</head>
<body>
	<!-- 引入我们的头部文件
		 静态包含，用指令实现，费空间省时间 -->
	<div class="info">
				<table id="dailiinfotable" border="1">
					<tr>
						<td colspan="4" class="colname" style="font-size: 18px;">我的信息</td>
					</tr>
					<tr>
						<td class="colname">姓名：</td>
						<td class="colinfo">${proxy.realname }</td>
						<td class="colname">联系电话：</td>
						<td class="colinfo">${proxy.tel }</td>
					</tr>
					<tr>
						<td class="colname">代理人状态：</td>
						<c:if test="${proxy.status ==0 }">
							<td class="colinfo">在&nbsp;职</td>	
						</c:if>
						<c:if test="${proxy.status ==1 }">
							<td class="colinfo">离&nbsp;职</td>	
						</c:if>
						<td class="colname">代理人微信号：</td>
						<td class="colinfo">${proxy.openid }</td>
					</tr>
					<tr>
						<td class="colname">出生日期：</td>
						<td class="colinfo">${proxy.birthday }</td>
						<td class="colname">区域：</td>
						<td class="colinfo">${proxy.area.city.province.prName }${proxy.area.city.ctName }${proxy.area.arName}</td>
					</tr>
					<tr>
						<td class="colname">代理人创建时间：</td>
						<td class="colinfo">${proxy.createdTime }</td>
						<td class="colname">上一级代理人：</td>
						<td class="colinfo">${parenproxyname }</td>
					</tr>
					<tr>
						<td class="colname">累计领卡：</td>
						<c:if test="${proxy.sumCard==null }">
							<td colspan="3" class="colinfo">0<span>&nbsp;张</span></td>	
						</c:if>
						<c:if test="${proxy.sumCard !=null }">
							<td colspan="3" class="colinfo">${proxy.sumCard }<span>&nbsp;张</span></td>
						</c:if>
					</tr>
					<tr>
						<td class="colname">已激活：</td>
						<c:if test="${proxy.sumActive==null }">
							<td class="colinfo">0<span>&nbsp;张</span></td>	
						</c:if>
						<c:if test="${proxy.sumActive!=null }">
							<td class="colinfo">${proxy.sumActive }<span>&nbsp;张</span></td>	
						</c:if>
						<td class="colname">未激活：</td>
						<c:if test="${proxy.noActive==null }">
							<td class="colinfo">0<span>&nbsp;张</span></td>	
						</c:if>
						<c:if test="${proxy.noActive!=null }">
							<td class="colinfo">${proxy.noActive }<span>&nbsp;张</span></td>	
						</c:if>
					</tr>
					<tr>
						<td class="colname">总金额：</td>
						<c:if test="${proxy.totalAmount==null }">
							<td colspan="3" class="colinfo">0<span>&nbsp;元</span></td>	
						</c:if>
						<c:if test="${proxy.totalAmount !=null }">
							<td colspan="3" class="colinfo">${proxy.totalAmount }<span>&nbsp;元</span></td>
						</c:if>
					</tr>
					<tr>
						<td class="colname">已提现金额：</td>
						<c:if test="${proxy.yiCash==null }">
							<td class="colinfo">0<span>&nbsp;元</span></td>	
						</c:if>
						<c:if test="${proxy.yiCash!=null }">
							<td class="colinfo">${proxy.yiCash }<span>&nbsp;元</span></td>	
						</c:if>
						<td class="colname">可提现金额：</td>
						<c:if test="${proxy.keCash==null }">
							<td class="colinfo">0<span>&nbsp;元</span></td>	
						</c:if>
						<c:if test="${proxy.keCash!=null }">
							<td class="colinfo">${proxy.keCash }<span>&nbsp;元</span></td>	
						</c:if>
					</tr>
				</table>
				<button id="btnupdate" onclick="window.location.href='${pageContext.request.contextPath}/dailiinfo.do?p=findUserInfoByid&update=1&id=${proxy.id}'" >修改信息</button>
			</div>
</body>
</html>


