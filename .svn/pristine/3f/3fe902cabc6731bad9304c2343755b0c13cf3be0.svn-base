<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="smvc" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${smvc }/BackstageWebsite/lib/html5.js"></script>
<script type="text/javascript" src="${smvc }/BackstageWebsite/lib/respond.min.js"></script>
<script type="text/javascript" src="${smvc }/BackstageWebsite/lib/PIE_IE678.js"></script>
<![endif]-->
<link href="${smvc }/lib/css/H-ui.min.css" rel="stylesheet"
	type="text/css" />
<link href="${smvc }/lib/css/H-ui.admin.css"
	rel="stylesheet" type="text/css" />
<link href="${smvc }/lib/css/style.css" rel="stylesheet"
	type="text/css" />
<link
	href="${smvc }/lib/lib/Hui-iconfont/1.0.7/iconfont.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
#bg {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 2.5;
	opacity: .25;
	filter: alpha(opacity = 0);
}

#show {
	display: none;
	position: absolute;
	top: 15%;
	left: 33%;
	width: 33%;
	height: 72%;
	padding: 8px;
	border: 8px solid #E7F1FE;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}

#bg2 {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 2.5;
	opacity: .25;
	filter: alpha(opacity = 0);
}

#bg3 {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.0;
	opacity: .00;
	filter: alpha(opacity = 0);
}

#bg4 {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.0;
	opacity: .00;
	filter: alpha(opacity = 0);
}

#show2 {
	display: none;
	position: absolute;
	top: 20%;
	left: 33%;
	width: 33%;
	height: 44%;
	padding: 8px;
	border: 8px solid #E7F1FE;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}

#show3 {
	display: none;
	position: absolute;
	top: 20%;
	left: 33%;
	width: 33%;
	height: 44%;
	padding: 8px;
	border: 8px solid #E7F1FE;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
#show4 {
	display: none;
	position: absolute;
	top: 20%;
	left: 33%;
	width: 33%;
	height: 30%;
	padding: 8px;
	border: 8px solid #E7F1FE;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
#wait {
	display: none;
	position: absolute;
	top: 45%;
	left: 44%;
	width: 5%;
	height: 9%;
	padding: 8px;
	z-index: 1002;
	overflow: auto;
}

select {
	width: 200px;
	height: 31px;
}

td {
	overflow: hidden;
}

#showImg {
	display: none;
	position: absolute;
	padding: 8px;
	border: 8px solid #E7F1FE;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>资讯列表</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		系统管理<span class="c-gray en">&gt;</span> 打印机管理<a
			class="btn btn-success radius r mr-20"
			style="line-height:1.6em;margin-top:3px"
			href="javascript:location.replace('<%=request.getContextPath()%>/printercfgback.do?method=getAllPrinter');"
			title="刷新"><i class="Hui-iconfont">&#xe68f;</i></a> <a
			class="btn btn-success radius r mr-20"
			style="line-height:1.6em;margin-top:3px" id="add" onclick="addDiv(2)">新增</a>
		<a class="btn btn-success radius r mr-20"
			style="line-height:1.6em;margin-top:3px" id="add" onclick="changeCfg()">修改总配置</a>

	</nav>
	<div class="pd-20">



		<div class="mt-20">
			<table
				class="table table-border table-bordered table-bg table-hover table-sort"
				id="showInfo">
				<thead>
					<tr class="text-c">
						<th>编号</th>
						<th>打印机号</th>
						<th>打印机名</th>
						<th>所属加油站</th>
						<th>打印机密钥</th>
						<th style="width:20%">打印机签名</th>
						<th>当前状态</th>
						<th colspan="2" width="15%">操作</th>
					</tr>
				</thead>
				<c:forEach items="${map.list}" var="g">
					<tr>
						<th style="text-align: center ">${g.pid }</th>
						<th style="text-align: center ">${g.mcode }</th>
						<th style="text-align: center ">${g.pname }</th>
						<th style="text-align: center ">${g.gasStation.gname }</th>
						<th style="text-align: center ">${g.msign }</th>
						<th style="text-align: center ">${g.psign }</th>
						<th style="text-align: center " id="status${g.pid }"><c:if
								test="${g.pstatus==false }">未启用</c:if> <c:if
								test="${g.pstatus==true }">启用</c:if></th>
						<th style="text-align: center ;width: 20% "><input
							class='btn btn-success radius' type='button' value='启用/禁用'
							class='btName' id='${g.pid }' onclick='changestatus(${g.pid })' />
							<input
							class='btn btn-success radius' type='button' value='修改参数'
							class='btName' id='${g.mcode }' onclick='changest(${g.mcode })' />
							</th>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div id="bg"></div>
	<div id="show" style="text-align: center;">
		
	</div>

	<div id="bg2"></div>
	<div id="show2" style="text-align: center;">
		<form id="addForm"
			action="${pageContext.request.contextPath}/printercfgback.do?method=addNewPrinter"
			method="post">
			<table id="addTable"
				style=" width:90%;margin:auto;border-collapse:separate; border-spacing:11px;">

				<tr>
					<td width="50%" style="text-align:left;">打印机编号：</td>
					<td><input type="text" id="mcode" class="input-text"
						name="mcode" ></td>
				</tr>
				<tr>
					<td width="50%" style="text-align:left;">打印机名：</td>
					<td><input type="text" name="pname" class="input-text"
						id="pname" /><span id="msg" style="font-size:12px;"></span></td>
				</tr>
				<tr>
					<td width="50%" style="text-align:left;">所属加油站：</td>
					<td><select id="gasstation2" name="gid">

					</select></td>
				</tr>
				<tr>
					<td width="50%" style="text-align:left;">打印机密钥：</td>

					<td><input type="text" name="msign" class="input-text"
						id="msign" /><span id="msg" style="font-size:12px;"></span></td>
				</tr>
				<tr>
					<td style="text-align:left;"><input type="submit"
						class='btn btn-primary radius'
						style="width:100px;height:30px;line-height:30px;" id="" value="增加" /></td>
					<td style="text-align:right;"><input id=""
						class='btn btn-danger radius'
						style="width:100px;height:30px;line-height:30px;" type="button"
						value="取消" onclick="hidediv2(2);" /></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="show3" style="text-align: center;">
		<form id="addForm" action="${pageContext.request.contextPath}/printercfgback.do?method=addNewUserCfg"
			method="post">
			<table id="addTable"
				style=" width:90%;margin:auto;border-collapse:separate; border-spacing:11px;">

				<tr>
					<td width="50%" style="text-align:left;">用户ID：</td>
					<td><input type="text" id="partner" class="input-text"
						name="partner" ></td>
				</tr>
				<tr>
					<td width="50%" style="text-align:left;">API密钥：</td>
					<td><input type="text" id="apikey" class="input-text"
						name="apikey" ></td>
				</tr>
				<tr>
					<td width="50%" style="text-align:left;">用户名：</td>
					<td><input type="text" id="username" class="input-text"
						name="username" ></td>
				</tr>
				<tr>
					<td width="50%" style="text-align:left;">手机号：</td>
					<td><input type="text" name="mobilephone" class="input-text"
						id="mobilephone" /><span
						id="msg" style="font-size:12px;"></span></td>
				</tr>
				
				<tr>
					<td style="text-align:left;"><input type="submit"
						class='btn btn-primary radius'
						style="width:100px;height:30px;line-height:30px;" id=""
						value="提交" /></td>
					<td style="text-align:right;"><input id="btnclose"
						class='btn btn-danger radius'
						style="width:100px;height:30px;line-height:30px;" type="button"
						value="取消" onclick="hidediv2(3);" /></td>
				</tr>
			</table>

		</form>
	</div>
	
	<div id="show4" style="text-align: center;">
		<form id="addForm" action="${pageContext.request.contextPath}/printercfgback.do?method=changest"
			method="post">
			<table id="addTable"
				style=" width:90%;margin:auto;border-collapse:separate; border-spacing:11px;">
				<tr>
					<td width="50%" style="text-align:left;">当前打印机号：</td>
					<td>
						<input type="text" id="printercode" name="printercode" readonly="readonly" style="width: 200px;height: 31px">
					</td>
				</tr>
				<tr>
					<td width="50%" style="text-align:left;">所属加油站：</td>
					<td><select id="gasstation3" name="gid">

					</select></td>
				</tr>
				
				<tr>
					<td style="text-align:left;"><input type="submit"
						class='btn btn-primary radius'
						style="width:100px;height:30px;line-height:30px;" id=""
						value="提交" /></td>
					<td style="text-align:right;"><input id="btnclose"
						class='btn btn-danger radius'
						style="width:100px;height:30px;line-height:30px;" type="button"
						value="取消" onclick="hidediv2(4);" /></td>
				</tr>
			</table>

		</form>
	</div>
	<div id="bg3"></div>
	<div id="showImg">
		<img id="img" src="#"> <img id="img2" src="#">
	</div>
	<div id="bg4"></div>

	<img id="wait"
		src="${pageContext.request.contextPath}/BackstageWebsite/Images/006.gif">
	<script src="${smvc}/jquery/jquery-1.2.6.pack.js"
		type="text/javascript" language="javascript"></script>
	<script language="javascript" type="text/javascript">
		var page = 1;
		var maxPage = 0;
		var gid = 0;
		var json = null;
		onload = function showAll() {

			//getAjax();	
		}
		var index ;
		function changestatus(i){
			index = i;
			var request = new XMLHttpRequest();
			request.open("post", "${pageContext.request.contextPath}/printercfgback.do?method=changePrinterStatus&x="
					+ Math.random()+"&id="+i);
			request.send(null);
			
			request.onreadystatechange = function() {
				if (request.readyState == 4 && request.status == 200) {
					var ret = request.responseText;
					var status = document.getElementById("status"+index);
					ret==0?status.innerHTML = "未启用":status.innerHTML = "启用";
				}
		}
		}
		function showGS() {
			var request = new XMLHttpRequest();
			request.open("post", "../gasempback.do?method=getAllGs&x="
					+ Math.random());
			request.send(null);

			request.onreadystatechange = function() {
				if (request.readyState == 4 && request.status == 200) {

					var ret = request.responseText;
					var json = eval(ret);
					var sel = document.getElementById("jiaYouZhan");
					sel.innerHTML = "";
					var op = new Option("请选择加油站", "0");
					sel.add(op);
					for (var i = 0; i < json.length; i++) {
						var op1 = new Option(json[i].gname, json[i].gid);
						sel.add(op1);
					}
				}

			}
			document.getElementById("jiaYouZhan").style.display = "block";
			document.getElementById("showGS").style.display = "none";
		}

		//上一页
		$("#lastPage").click(function() {
			if (page * 1 > 1) {
				page = page * 1 - 1;
				$("#showInfo tr:gt(0)").html("");
				getAjax();
			}
		});
		//下一页
		$("#nextPage").click(function() {

			if (page * 1 >= maxPage * 1) {
				page = maxPage * 1;
			} else {
				page = page * 1 + 1 * 1;
			}
			$("#showInfo tr:gt(0)").html("");
			getAjax();

		});

		var i = 2;
		function hidediv() {
			document.getElementById("bg").style.display = 'none';
			document.getElementById("show").style.display = 'none';
			document.getElementById("msg0").innerHTML = "";
		}
		//修改所属加油站
		function changest(i){
			var bg2 = document.getElementById("bg2");
			var show2 = document.getElementById("show4");
			var code = document.getElementById("printercode");
			code.setAttribute("value", i);
			bg2.style.display = "block";
			show2.style.display = "block";
			var request = new XMLHttpRequest();
			request.open("post", "${pageContext.request.contextPath}/gasempback.do?method=getAllGs&x="
					+ Math.random());
			request.send(null);
			request.onreadystatechange = function(){
				if (request.readyState == 4 && request.status == 200) {
					var ret = request.responseText;
					var json = eval(ret);
					var sel = document.getElementById("gasstation3");
					sel.innerHTML = "";
					var op = new Option("请选择加油站", "0");
					sel.add(op);
					for (var i = 0; i < json.length; i++) {
						var op1 = new Option(json[i].gname, json[i].gid);
						sel.add(op1);
				}
			}
		}
		}
		//修改打印机配置	
		function changeCfg(){
			var bg2 = document.getElementById("bg2");
			var show2 = document.getElementById("show3");
			bg2.style.display = "block";
			show2.style.display = "block";
			var request = new XMLHttpRequest();
			request.open("post",
					"${pageContext.request.contextPath}/printercfgback.do?method=getPrinterUserCfg&x="
							+ Math.random());
			request.send(null);
			request.onreadystatechange = function(){
				if (request.readyState == 4 && request.status == 200) {
					var ret = request.responseText;
					var json = eval(ret);
					var partner = document.getElementById("partner");
					partner.setAttribute("value", json[0].partner);
					var apikey = document.getElementById("apikey");
					apikey.setAttribute("value", json[0].apikey);
					var username = document.getElementById("username");
					username.setAttribute("value", json[0].username);
					var mobilephone = document.getElementById("mobilephone");
					mobilephone.setAttribute("value", json[0].mobilephone);
				}
			}
		}
		//新增
		var a = null;
		function addDiv(i) {
			a = i;
			var bg2 = document.getElementById("bg2");
			var show2 = document.getElementById("show" + i);
			bg2.style.display = "block";
			show2.style.display = "block";
			var request = new XMLHttpRequest();
			request.open("post",
					"${pageContext.request.contextPath}/daili_jiayouzhang.do?method=getAllGs&x="
							+ Math.random());
			request.send(null);
			request.onreadystatechange = function(){
				if (request.readyState == 4 && request.status == 200) {
					var ret = request.responseText;
					var json = eval(ret);
					var sel = document.getElementById("gasstation"+a);
					sel.innerHTML="";
					for (var i = 0; i < json.length; i++) {
						var op = new Option(json[i].gname, json[i].gid);
						sel.add(op);
					}
				}
			}
		}
		

		function hidediv2(i) {
			document.getElementById("bg2").style.display = 'none';
			document.getElementById("show" + i).style.display = 'none';
			document.getElementById("msg").innerHTML = "";
		}

		$("#updateSubmit")
				.click(
						function() {
							if (window.confirm('确定要修改？')) {
								$
										.ajax({
											type : "post",
											url : "${pageContext.request.contextPath}/daili_jiayouzhang.do?method=updateGasEmp&ran="
													+ new Date().getTime(),
											dataType : "json",
											data : $("#GasEmpForm").serialize(),
											success : function(data) {
												if (data.flag == 1) {
													$("#bg").css("display",
															"none");
													$("#show").css("display",
															"none");
													alert("修改成功！");
													var tr = document
															.getElementById("tr"
																	+ data.geid);
													var index = parseInt(tr.childNodes[0].innerHTML) - 1;
													tr.childNodes[2].innerHTML = data.gename;

													tr.childNodes[6].innerHTML = "<a onclick='showdiv(\""
															+ json[0].geList[index].geid
															+ "\",\""
															+ data.gename
															+ "\",\""
															+ data.gecard
															+ "\",\""
															+ data.geaddress
															+ "\",\""
															+ json[0].geList[index].getime2
															+ "\",\""
															+ data.genumber
															+ "\",\""
															+ json[0].geList[index].geover
															+ "\",\""
															+ json[0].geList[index].gestatus
															+ "\");'>详情/修改</a> ";

												} else
													alert("内部错误，修改失败");
											},
											error : function(data) {
												alert("网络异常，提交失败");
											}
										})
							}
							return false;
						});

		$("#addSubmit").click(
				function() {

					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/daili_jiayouzhang.do?method=addGasEmp&ran="
								+ new Date().getTime(),
						data : $("#addForm").serialize(),
						success : function(data) {
							alert("新增成功！");
							location.replace('emp_guanli.jsp');
						},
						error : function(data) {
							alert("内部错误，提交失败");
						}
					})
					return false;
				});

		//格式控制
		function ExistsData(length, obj) {
			var t1 = document.getElementById("gename");
			var t2 = document.getElementById("gecard");

			obj.value = obj.value.substring(0, length);

			if (obj == t2)
				obj.value = obj.value.replace(/[^\d]/g, '');

			if (t1.value != "" && t2.value != "" && t2.value.length == 18)
				document.getElementById("updateSubmit").disabled = "";
			else
				document.getElementById("updateSubmit").disabled = "disabled";
		}

		function ExistsData2(length, obj) {
			var t1 = document.getElementById("newname");
			var t2 = document.getElementById("newcard");

			obj.value = obj.value.substring(0, length);

			if (obj == t2)
				obj.value = obj.value.replace(/[^\d]/g, '');

			if (t1.value != "" && t2.value != "" && t2.value.length == 18)

				document.getElementById("addSubmit").disabled = "";
			else
				document.getElementById("addSubmit").disabled = "disabled";
		}

		function check(obj) {
			if (obj.value.length != 18)
				document.getElementById("msg").innerHTML = "长度不足";
			else
				document.getElementById("msg").innerHTML = "";
		}

		function check0(obj) {
			if (obj.value.length != 18)
				document.getElementById("msg0").innerHTML = "长度不足";
			else
				document.getElementById("msg0").innerHTML = "";
		}

		function showGS() {
			var request = new XMLHttpRequest();
			request.open("post", "${pageContext.request.contextPath}/sdaili_jiayouzhang.do?method=getAllGs&x="
					+ Math.random());
			request.send(null);

			request.onreadystatechange = function() {
				if (request.readyState == 4 && request.status == 200) {

					var ret = request.responseText;
					var json = eval(ret);
					var sel = document.getElementById("jiaYouZhan");
					sel.innerHTML = "";
					var op = new Option("请选择加油站", "0");
					sel.add(op);
					for (var i = 0; i < json.length; i++) {
						var op1 = new Option(json[i].gname, json[i].gid);
						sel.add(op1);
					}
				}
			}
			document.getElementById("jiaYouZhan").style.display = "block";
			document.getElementById("showGS").style.display = "none";
		}
	</script>
</body>
</html>
