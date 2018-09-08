<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/mui.min.css">
		<link href="${pageContext.request.contextPath}/weixin/css/ectouch.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/weixin/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/weixin/css/mui.min.css" rel="stylesheet" />
				<script src="${pageContext.request.contextPath}/weixin/shuaxin.js"></script>
		
		<script src="${pageContext.request.contextPath}/weixin/js/jquery-1.9.0.min.js"></script>
		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
	</head>
	<style>
	*{margin: 0;padding:0}
		body {
			background: white;
		}
		
		.mui-action-back {
			width: 26px;
			height: 26px;
			float: left;
			margin-top: 12px;
			margin-left: 10px;
		}
		
		#header h1 {
			margin: 0px auto;
		}
		
		#xiaxian {
			width: 100%;
			height: 300px;
			/*background: white;*/
			margin-top: 50px;
		}
		
		.xiaxian_count {
			width: 45%;
			height: 50px;
			margin-top: 10px;
			float: right;
			text-align: center;
			line-height: 50px;
		}
		
		.xiaxian_num {
			display: inline-block;
			width: 60%;
			background: #F7E1B5;
			height: 100%;
			float: right;
			border-radius: 30px 0px 0px 30px;
			color: #ff7900;
			font-weight: bold;
			font-size: 24px;
		}
		
		.xiaxian_text {
			font-size: 14px;
			width: 38%;
			display: block;
		}
		
		#xianxian_detail {
			width: 90%;
			margin: 0px auto;
			margin-top: 20px;
		}
		
		.xiaxian_table {
			border: 2px solid #FF7900;
			width: 100%;
			text-align: center;
		}
		
		.xiaxian_trinfo {
			background: #F7E1B5;
			height: 30px;
			line-height: 30px;
			color: #ff7900;
			font-weight: bold;
		}
		
		.xiaxian_info {
			height: 30px;
			font-size: 14px;
			line-height: 30px;
		}
		
		.xiaxian_tdname {
			width: 35%;
		}
		
		.xiaxian_tdid {
			width: 35%;
		}
		
		.xiaxian_tdcount {
			width: 25%;
		}
		
		.xiaxian_span {
			display: block;
			width: 100%;
			height: 30px;
			line-height: 30px;
			overflow: hidden;
			text-overflow: ellipsis;
		}
		.noxiaxian{
			width: 100%;
			margin-top: 200px;
			text-align: center;
			
		}
	</style>

	<body>
		<!--顶部通用样式-->
		<header id="header">
			<div class="header_l">
			   <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
			</div>
			<h1>已推荐的会员</h1>
		</header>
		
		<div id="xiaxian">
			<!--<div class="noxiaxian">亲，您还没有推荐过会员！</div>-->
			<div style="width: 100%; height:70px;display: block;">
				<div class="xiaxian_count">
					<span id="count" class="xiaxian_num"></span>
					<span class="xiaxian_text">下线人数</span>
				</div>
			</div>
			<div id="xianxian_detail"style="display: block;">
				<table class="xiaxian_table" border="1" id="xiaxian_tab">
					<tr class="xiaxian_trinfo">
						<td class="xiaxian_tdname">昵称 </td>
						<td class="xiaxian_tdid">用户ID</td>
						<td class="xiaxian_tdcount">贡献积分</td>
					</tr>
					<!--<tr class="xiaxian_info">
						<td class="xiaxian_tdname"><span class="xiaxian_span">卖女孩的小火柴卖女孩的小火柴</span></td>
						<td class="xiaxian_tdid"><span class="xiaxian_span">45639573891</span></td>
						<td class="xiaxian_tdcount">40</td>
					</tr>-->
				</table>
			<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		<script type="text/javascript">
			mui.init();
			var userid='${userinfo.usersId}';
			
				mui.ajax("${pageContext.request.contextPath}/"+'appuserinfo.do?p=getXiaxian&userid='+userid,{
					type:'post',
					timeout:30000,
					success:function(data){
						var map=eval("("+data+")");
						document.getElementById("count").innerText=map.count;
						if(map.count==0){
							document.getElementById("xiaxian").innerHTML='<div class="noxiaxian">亲，您还没有发展下线！</div>';
						}
						for(var i=0;i<map.count;i++){
							var str='<tr class="xiaxian_info">'+
										'<td class="xiaxian_tdname"><span class="xiaxian_span">'+map.list[i].usersName+'</span></td>'+
										'<td class="xiaxian_tdid"><span class="xiaxian_span">'+map.list[i].usersId+'</span></td>'+
										'<td class="xiaxian_tdcount">'+map.list[i].usersIntegral+'</td>'+
									'</tr>';
							console.log(str)
							document.getElementById("xiaxian_tab").innerHTML+=str;
						}
					},error: function(XMLHttpRequest, textStatus, errorThrown) {
               	 	}
				});
			//});
		</script>
	</body>
</html>