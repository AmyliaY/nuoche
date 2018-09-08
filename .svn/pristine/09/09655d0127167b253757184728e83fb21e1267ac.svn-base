<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>客户认证</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/css/mui.min.css"/>
	</head>

	<body>
		
		
		<header class="mui-bar mui-bar-nav">
		    <h1 class="mui-title">客户认证</h1>
		</header>
		<style type="text/css">
			*{
				font-family: "微软雅黑";
				font-size: 17px;
				color: gray;
			}
				.mui-btn {
						font-size: 16px;
						padding: 8px;
						margin: 3px;
					}
		</style>
		<div class="mui-content">
			<div class="mui-content-padded">
				<form action="" method="post">
				    
				    	<label>&nbsp;&nbsp;&nbsp;客户姓名</label><input type="text"  id="username" value="${username }" readonly="readonly"/>
				    <br />
					
						<label>&nbsp;&nbsp;&nbsp;公司名称</label><input type="text"   id="companyname" placeholder="请输入公司名称"/>

					<br />
					
						<label>&nbsp;&nbsp;&nbsp;选择油类</label>
						<select  id="ostyle" class="mui-btn mui-btn-block" onchange="show();">
						<option value="o2" >
				                             汽油
						</option>
						<option value="o1" >
				                             柴油
						</option>
                        </select>
					<br />
					
						<label>&nbsp;&nbsp;&nbsp;选择等级</label>
							<select  class="mui-btn mui-btn-block" id="vgrade"  onchange="showspan();">
						
				
				
						</select>
					<br />
					<div style="widht:100%;text-align: center;margin-bottom: 10px;">
					<span id = "showsm">优惠详情请进站咨询</span>
					</div>
					
					
					<input style="width: 100%;position: relative;" type="button" onclick="tijiao();" value="提交审核"/>
					
				</form>
			</div>
		</div>
	</body>
	<script type="text/javascript">
	var gradere = eval("("+'${jsonObject2 }' +")");
	onload = function(){
		show();
	}
	
	 function show (){
		var ostyle = document.getElementById("ostyle");
		var vgrade = document.getElementById("vgrade");
		var vipgrades = eval("("+'${jsonObject }' +")"); 
		vgrade.innerHTML="";
		for (var key in vipgrades) {

			if(key.substring(0,2)==ostyle.value){
			var op= new Option(key.substring(2,3)+"级客户", vipgrades[key]+"-"+key );
			vgrade.add(op);		
			} 
	
			
		} 
		
	  var showsm = document.getElementById("showsm");
	 /* showsm.innerHTML = "每月消费满"+vgrade.value.split("-")[0]+"元即可获得"+gradere[vgrade.value.split("-")[1]+"rt"]+"%优惠<br />提交后请主动联系当地加油站面商通过"; */

	}
	 
	function showspan(){
		
		 var showsm = document.getElementById("showsm");
		 var str = "o11rt";
		/*  showsm.innerHTML = "每月消费满"+vgrade.value.split("-")[0]+"元即可获得"+gradere[vgrade.value.split("-")[1]+"rt"]+"%优惠<br />提交后请主动联系当地加油站面商通过"; */
	 }
	
	function tijiao(){

		var companyname = document.getElementById("companyname").value;
		var ostyle = document.getElementById("ostyle").value.substring(1,2);
		var vgrade = document.getElementById("vgrade").value.split("-")[1].substring(1,3);
        var vlimit  = document.getElementById("vgrade").value.split("-")[0];
		if(companyname=="")
			{
			alert("请填写公司名称");
			return;
			}
		
		var dizhi = "${pageContext.request.contextPath}/weixin_jiayou.do?method=vipAccess&uid=${uid }&companyname="+companyname+"&ostyle="+ostyle+"&vipgrade="+vgrade+"&vlimit="+vlimit;
	    location.replace(dizhi);
	}
	
	</script>

</html>
