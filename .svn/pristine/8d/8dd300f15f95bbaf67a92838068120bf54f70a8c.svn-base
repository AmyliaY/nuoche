<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String gname = request.getParameter("gname");
if (gname!=null)
{
  gname = new String(gname.getBytes("iso8859-1"),"utf-8");
  pageContext.setAttribute("gname",gname);
}

String gdanwei = request.getParameter("gdanwei");
if (gdanwei!=null)
{
  gdanwei = new String(gdanwei.getBytes("iso8859-1"),"utf-8");
  pageContext.setAttribute("gdanwei",gdanwei);
}

String zitiName = request.getParameter("zitiName");
if (zitiName!=null)
{
  zitiName = new String(zitiName.getBytes("iso8859-1"),"utf-8");
  pageContext.setAttribute("zitiName",zitiName);
}

String zitiText = request.getParameter("zitiText");
if (zitiText!=null)
{
  zitiText = new String(zitiText.getBytes("iso8859-1"),"utf-8");
  pageContext.setAttribute("zitiText",zitiText);
}

%>
<!DOCTYPE html>
<html>
	<head>
		<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title></title>
		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<link href="${pageContext.request.contextPath}/weixin/css/mui.min.css" rel="stylesheet" />
	
	<style>
			.nav-header {
			background-color: #FF7900;
			color: white;
		}
		
		.nav-header h1 {
			text-align: left;
			color: white;
		}
		
		.nav-header a {
			color: white;
		}
		#noZitiaddress{
			text-align: center;
			margin-top: 50px;
			display: none;
		}
	</style>
	<body>
		<header class="mui-bar mui-bar-nav nav-header">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">选择自提地址</h1>
		

		</header>		
		<div class="mui-content">
			<!--
            	<div class="mui-input-row mui-search">
					<input type="search" class="mui-input-clear" placeholder="请输入城市名称">
				</div>
			<div class="title" style="height:34px;">
				自动定位：株洲 
			</div>
            -->
			<ul class="mui-table-view" id="cityList">
				
			</ul>
		</div>
		<div id="noZitiaddress">
				<p  style="font-size: 30px; margin-top: 150px;">暂无自提地址</p>
		</div>
	</body>
	<script src="citys.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/weixin/js/mui.js" type="text/javascript" charset="utf-8"></script>
	
	<script src="${pageContext.request.contextPath}/weixin/js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript">
	
	
		catid='${param.catid}';
		goodid='${param.goodid}';
		gnum='${param.gnum}';
		
		
		gid   = '${param.gid}';
		gname = '${gname}';
		gdanwei = '${gdanwei}';
		gimages = '${param.gimages}';
		gprice = '${param.gprice}';
		
		
		mui.init();
			mui.ajax("${pageContext.request.contextPath}/"+"appcat.do?p=getAllZitiAddress",{
				type:'post',
				timeout:30000,
				success:function(data)
				{
					var zitiaddress=eval("("+data+")");
					if(zitiaddress.length>0){
					var ListUl = document.getElementById("cityList");
					zitiaddress.forEach(function(zitiaddress){
						var ListEl = document.createElement("li");
						ListEl.classList.add("mui-table-view-cell");
						ListEl.innerHTML=zitiaddress.area.arName;
						ListUl.appendChild(ListEl);
						ListEl.addEventListener("click",function(){
							if($.trim(catid).length>0){
								window.top.location = "${pageContext.request.contextPath}/weixin/goodsdetail/confirm_order.jsp?catid=${param.catid}&goodid=${param.goodid}&gnum=${param.gnum}&zitiName="+zitiaddress.zitiName+"&zitiId="+zitiaddress.zitiId+"&zitiPhone="+zitiaddress.zitiPhone+"&zitiText="+zitiaddress.zitiText;
							}else{
								window.top.location = "${pageContext.request.contextPath}/weixin/goodsdetail/ljgm-order.jsp?gid=${param.gid}&gname=${gname}&gdanwei=${gdanwei}&gimages=${param.gimages}&gprice=${param.gprice}&zitiName="+zitiaddress.zitiName+"&zitiId="+zitiaddress.zitiId+"&zitiPhone="+zitiaddress.zitiPhone+"&zitiText="+zitiaddress.zitiText;
							}
						});
					});
					}else{
						$("#noZitiaddress").css('display','block');
					}
				}
			});
	</script>
</html>
