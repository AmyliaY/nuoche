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
	<form id="formgo" action="${pageContext.request.contextPath}/dailiinfo.do?p=updateUserInfoByid&id=${proxy.id }" method="post">
		<table class="table table-hover table-bordered">
			<tr class="ttk">
				<td align="right">代理人姓名：</td>
				<td>${proxy.realname }</td>
			</tr>

			<tr class="ttk">
				<td align="right" style="vertical-align: middle;">出生日期：</td>
				<td>
					<input type='text' name="daili_birthday" id="choose_data" onfocus="new WdatePicker(this,null,false,'whyGreen')" value="${proxy.birthday }" style="width: 300px;height: 40px;font-size:12px;">
				</td>
			</tr>
			<tr class="ttk">
				<td align="right" style="vertical-align: middle;">所在城市：
				
				</td>
				<td>
					<select class="select" onchange="findByidCity()" id="prid" name="prid" style="width: 110px;float: left;height:30px;">
						<option value="${proxy.area.city.province.prId }">${proxy.area.city.province.prName }</option>
						<c:forEach items="${plist}" var="p">
							<option value="${p.prId}" ${proxy.area.city.province.prId==p.prId ? "selected":"" }>${p.prName}</option>
						</c:forEach>
					</select>
					<select class="select" onchange="findByIdArea()" id="city" name="city" style="width: 105px;float: left;height:30px;">
						<option value="${proxy.area.city.ctId }">${proxy.area.city.ctName }</option>
					</select>
					<select class="select" id="arid" name="arid" style="width: 100px;float: left;height:30px;">
						<option value="${proxy.area.arId}">${proxy.area.arName}</option>
					</select>
				</td>
			</tr>
			
			
			<tr class="ttk">
				<td align="right" style="vertical-align: middle;">手机号码：</td>
				<td>
					<input type="text" id="dl_tel" name="daili_tel" onchange="check(${proxy.tel })" value="${proxy.tel }" style="font-size:12px;width: 150px;float: left;"/>
					<input type="button" id="btnYzm" value="获取验证码" onclick="showYZM(60)" style="width: 125px;float: left;height:40px;margin-left: 20px;"/>			
				</td>
			</tr>
			<tr class="ttk" id="changetel" style="display:none;">
				<td align="right" style="vertical-align: middle;">请输入：</td>
				<td>
					<input id="telyzm" type="text" name="yzm" onblur = "testYZM()" placeholder="验证码" style="float: left;width:100px;text-indent: 25px;">
					<!--  -->
					<span id="testyzm" testyzmnum="0"  style="display:none;color:green;padding-top:15px;font-size:12px;margin-left:10px;float: left;">已验证</span>
				</td>
			</tr>
			
			<tr class="ttk">
				<td colspan="2" align="center">
					<button  type="button" onclick="tijiao()" id="btntijiao" style="width:100px;height:50px;margin-top: 30px;">提交修改</button>
				</td>
			</tr>
		</table>
	</form>
	</div>

<script type="text/javascript">
function check(proxytel)
{
	var tel = $("#dl_tel").val();
	if(tel!=proxytel)
	{
		$('#btntijiao').attr("disabled",true); 
	}
}

// 点击发送验证码后锁定按钮
function showYZM(t)
{	
	$('#btntijiao').attr("disabled",false); 
	var dl_tel = $("#dl_tel"); //用户名Object
	var reg = /^(13[0-9]|15[012356789]|17[0-9]|18[0-9]|14[57])[0-9]{8}$/;
	if (!reg.test(dl_tel.val())) {
			alert('抱歉，请输入正确的手机号!');
			return;
		}
	
	var url="${pageContext.request.contextPath}/dluptel.do?p=getyzm";
	var param={dl_tel:dl_tel.val()};
	$.post(url,param,function(data){
		if (data == "false") 
		{
				alert("该手机号已经被注册!");
			return;
		}
		else{
			$("#changetel").show();
			$("#btnYzm").attr("disabled",true);
			//document.myform.phone.disabled=true;
			alert("验证码发送成功！请注意查收！");
			for(i=1;i<=t;i++) 
			{
				window.setTimeout("update_p(" + i + ","+t+")", i * 1000);
			}
		}
	});
	
}
// 恢复按钮发送验证码
function update_p(num,t) {
	if(num == t) {
		$("#btnYzm").val(" 重新发送 ");
		$("#btnYzm").attr("disabled",false);
	}
	else {
		printnr = t-num;
		$("#btnYzm").val("(" + printnr +")秒后重新获取") ;
	}
}
//  验证验证码

function testYZM()
{	
	var dl_tel = $("#dl_tel");
	var index = 0;
	var telyzm = $("#telyzm"); //验证码Object
	//$("#testyzm").css("display","block");
	
	//$("#testyzm").attr("testyzmnum",1);
	//alert($("#testyzm").attr("testyzmnum"));
	index+=1;
	if(index == 1)
	{
		
		var url="${pageContext.request.contextPath}/dluptel.do?p=testyzm";
		var param={yzm:telyzm.val(),dl_tel:dl_tel.val()};
		$.post(url,param,function(data){
			if (data == "yes") 
			{	//alert("验证成功");
				$("#testyzm").show();
				//  设置验证码验证状态  0：  未验证成功   1  ： 验证成功
				$("#testyzm").attr("testyzmnum",1);
			}else{
				$("#testyzm").text("验证码错误！请重新填入！");
				$("#testyzm").css("color","red");
				$("#testyzm").show();
				$("#telyzm").val("");
				$("#testyzm").attr("testyzmnum",0);
			}
			
		});
		//alert($("#testyzm").attr("testyzmnum"));
	}else{
		index=0;
		alert("验证码错误!请重新输入！");
		telyzm.val("");
	}
}
function tijiao()
{
	testYZM();
	var testyzm = $("#testyzm").attr("testyzmnum");
	if($("#changetel").is(":visible")==true)
	{
		if(testyzm==1)
			$("#formgo").submit(); 
		else{
			alert("验证码错误!请重新输入！");
		}
	}else{
		$("#formgo").submit(); 
	}
	
}
$(document).ready(function(){
	findByidCity();
	findByIdArea();
});

//根据省ID 查出市级
function findByidCity()
{
	var prid=$("#prid").val();
	var ctid="${city}";
	var arid="${arid}";
	if(prid.trim()=="")		//省ID 不能为-1
	{
		prid=-1;   
	}
	
	
	var url="${pageContext.request.contextPath}/dailiinfo.do?p=findByidCity";
	var param={prid:prid};
	$.post(url,param,function(data){
		var json=eval("("+data+")");
		//alert(json[1].ctName);
		$("#city").empty();
		for(var i=0;i<json.length;i++)
		{
			if(ctid==json[i].ctId)
			{
				$("#city").append("<option value="+json[i].ctId+" seletced>"+json[i].ctName+"</option>");
			}else{
				$("#city").append('<option value='+json[i].ctId+'>'+json[i].ctName+'</option>');
			}		
		}
		 findByIdArea();
	});
}
//根据市ID 查出区/县级
function findByIdArea()
{   var prid=$("#prid").val();
	var crid=$("#city").val();
	var arid="${arid}";
	if(prid.trim() == ""){
	  crid = -1;
	  
	}
	var url="${pageContext.request.contextPath}/dailiinfo.do?p=findByIdArea";
	var param={crid:crid};
	$.post(url,param,function(data){
		var json=eval("("+data+")");
		//alert(json);
		$("#arid").empty();
		for(var i=0;i<json.length;i++){
			if(arid==json[i].arId)
			{
				$("#arid").append('<option value='+json[i].arId+' selected>'+json[i].arName+'</option>');
			}else{
				$("#arid").append('<option value='+json[i].arId+'>'+json[i].arName+'</option>');
			}
			
		}
	});
	
	
}

</script>
</body>
</html>


