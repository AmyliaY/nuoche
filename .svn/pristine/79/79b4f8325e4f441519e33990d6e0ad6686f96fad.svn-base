<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>


<!DOCTYPE html>
<html lang="zh-CN">
<head>

<!--<base href="/static_files/"/>
-->
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<!--<meta content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;" name="viewport">-->
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<meta charset="utf-8">
<meta name="description" content="" /><!--网站描述-->
<meta name="keywords" content="" /><!--网站关键字-->
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0,maximum-scale=1.0"/>
<!--width - viewport的宽度 height - viewport的高度
initial-scale - 初始的缩放比例
minimum-scale - 允许用户缩放到的最小比例
maximum-scale - 允许用户缩放到的最大比例
user-scalable - 用户是否可以手动缩放-->
<link href="${pageContext.request.contextPath }/weixin/css/css.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/weixin/css/style.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/weixin/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/weixin/css/font-awesome.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/jquery.form.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/weixin/js/popwin.js"></script>

<style>
	body{ padding:0; height: 100%; box-sizing: border-box; overflow: visible;}
	.topA{ position: fixed; top: 0; left: 0;}
	.footA{ position: fixed; bottom: 0; left: 0;}
	.wrapperX{ width: 100%;}
	.aboutNew{ width: 100%; height: 35px; margin-top: 15px; line-height: 35px; background-color: #ebeff2; overflow: hidden; border-radius:3px;}
	.aboutNew a{ width: 50%; display: block; line-height: 35px; float: left;}
	.aboutNewA{ background-color: #008dde; color: #fff;}
	.aboutNewB{ color: #999;}
</style>
         
<title>卡卡挪车</title>

</head>
<body>

<form id="form" accept-charset="utf-8" enctype="multipart/form-data">
	<input type="hidden" name="orderNo" value="512018040720402168428"/>
	
	<div id="wrapperX">
		
		<ul>
			<!--<li><img src="images/pay_banner.jpg" style="width: 100%; display: block;"></li>-->
			<li>
				<ul class="fillList lineHeightA" style="margin-top: 0; border-top: none;">
					<li>
						<span class="fill_inA">服务名称：</span>
						<span class="fill_inB"><input type="text" value="${editservice.title }" name="title"></span>
					</li>
					<li>
						<span class="fill_inA">市场价格：</span>
						<span class="fill_inB"><input type="text" value="${editservice.shichangPrice }" name="shichangPrice"></span>
					</li>
					<li>
						<span class="fill_inA">预约价格：</span>
						<span class="fill_inB"><input type="text" value="${editservice.yuyuePrice }" name="yuyuePrice"></span>
					</li>
					<li>
						<span class="fill_inA">服务时间：</span>
						<span class="fill_inB"><input type="text" value="${editservice.time }" name="time"></span>
					</li>
					<li>
						<span class="fill_inA">服务详情：</span>
						<span class="fill_inB"></span>
					</li>
					<li>
						<span class="fill_inB"><textarea rows="10" cols="40" name="describe">${editservice.serviceDesc }</textarea></span>
					</li>
					<li>
						<span class="fill_inA">服务图片：</span>
						<input type="file" id="cimages" name="cimages" runat="server" onchange="javascript:setImagePreview(this,localImag,preview);" />
						<div id="localImag">
							<input type="hidden" name="oldLunboimages" id="oldLunboimages" />
							<input type="hidden" name="delLunboimages" id="delLunboimages" />
							<input type="hidden" name="serviceid" id="serviceid" value="${editservice.id}"/>
					     	<img id="preview" src="${pageContext.request.contextPath}/${editservice.image}"
								style="width: 120px; height: 120px;" />
						</div>
					</li>
				</ul>
				<ul class="fillList lineHeightA">
					<li>
						<span class="fill_inA">服务类型：</span>
						<span class="fill_inB">
							<select name="servicetype" id="stp">
								<option value="${editservice.serviceType.id }">${editservice.serviceType.name }</option>
								<c:forEach items="${servicetypelisting}" var="p">
									<option value="${p.id}" >${p.name}</option>
								</c:forEach>
							</select>
						</span>
					</li>
				</ul>
			</li>
			<li>
				<div class="con_a">
					<a onclick="subEdit()" class="butA butRed" style="margin-top: 0;">确认修改</a>
				</div>
			</li>
		</ul>
	</div>
</form>

<!-- 确认 弹窗 -->
<div class="pop" id="checkWin" style="display: none;">
	<div class="popC">
		<div class="pop_tit">操作确认</div>
		<div class="popCC"><strong id="checkMsgTip"></strong></div>
		<div class="popBut">
			<a onclick="hidePopWin()">取 消</a>
			<a id="btnCheck" class="butRed">确 认</a>
		</div>
	</div>
</div>

<!-- 提示 弹窗 -->
<div class="pop" id="msgWin" style="display: none;">
	<div class="popC">
		<div class="pop_tit">操作提示</div>
		<div class="popCC"><strong id="msgTip">提示语</strong></div>
		<div class="popBut">
			<a onclick="hidePopWin()" class="butRed">确 定</a>
		</div>
	</div>
</div>

<!-- loading 弹窗 -->
<div class="pop" id="loadingWin" style="display: none;">
	<div class="popC">
		<div class="popCC"><strong id="loadingMsg"></strong></div>	
	</div>
</div>

<div>
	<input type="hidden" id="noncestr" value="2b37024582544440b13746516d73fada"/>
	<input type="hidden" id="timestamp" value="1523104821"/>
	<input type="hidden" id="sign" value="381b1452ea2cadf52a658bb879bd9da625a74ef5"/>
	<input type="hidden" id="openid" value="${openid }"/>	
	<input type="hidden" id="host"  value=""/>
</div>

<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

<script type="text/javascript">
var host = "http://kknc.wang";
var link = host+"/attend.jsp";
var title="卡卡扫码隐号挪车贴";
var desc = "保护隐私远离骚扰，千万车主都在用，速抢！";
var sharepic =host+"/static_files/images/logo.jpg";
var shareParams={
	title:title,
	desc:desc,
	link:link,
	sharepic:sharepic
};
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/weixin/js/wxshare.js"></script>

<script src="${pageContext.request.contextPath }/weixin/js/pop.js"></script>

<script type="text/javascript">

	window.onload = function() {
		var img = $("#preview")[0].src;
		var arr = img.split("/");
		var len = arr.length;
		var imgName = arr[len - 1];
		$("#delLunboimages").attr("value", imgName);
	}

	function subEdit(){
		var fileImg = $("#img").val();
		//如果文件为空
		if (fileImg == null || "" == fileImg) {
			var img = $("#preview")[0].src;
			var arr = img.split("/");
			var len = arr.length;
			var imgName = arr[len - 1];
			if (img == null || "" == img) {
				layer.msg("请选择图片!", {
					icon : 6,
					time : 1000
				});
				return false;
			}
			$("#oldLunboimages").attr("value", imgName);
		}
		var form = document.getElementById("form");
		var title = form.title.value;
		var shichangPrice = form.shichangPrice.value;
		var yuyuePrice = form.yuyuePrice.value;
		var time = form.time.value;
		var servicetype = form.servicetype.value;
		var describe = form.describe.value;
		
		if(title.trim()==""){
			showPopWin(1,"服务名称不能为空！");
			return;
		}
		if(shichangPrice.trim()==""){
			showPopWin(1,"市场价格不能为空！");
			return;
		}
		if(yuyuePrice.trim()==""){
			showPopWin(1,"预约价格不能为空！");
			return;
		}
		if(time.trim()==""){
			showPopWin(1,"时间不能为空！");
			return;
		}
		if(describe==null || ""==describe)
		{
			showPopWin(1,"请输入详细描述！");
			return;
		}
		
		var p = $(form).serialize();
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/sjyuyueservice.do?p=editorservice",
			cache: false,  
		    data: new FormData($("#form")[0]),  
		    processData: false,  
		    contentType: false,
			success:function(data){
				if(data != null)
				{
					showPopWin(0,"修改成功！");
					window.location.href="${pageContext.request.contextPath}/sjyuyuerecord.do?p=index&openid="+data;			
				}
			},
			error:function(){
				showPopWin(1,"修改失败，请稍后重试！");
			}
		});
	}
	
	//检查图片的格式是否正确,同时实现预览
		function setImagePreview(obj, localImagId, imgObjPreview) {
			var array = new Array('gif', 'jpeg', 'png', 'jpg', 'bmp'); //可以上传的文件类型 
			if (obj.value == '') {
				$.messager.alert("提示", "请选择要上传的图片!");
				flag = false;
				return false;
			} else {
				var fileContentType = obj.value.match(/^(.*)(\.)(.{1,8})$/)[3]; //这个文件类型正则很有用 
				////布尔型变量 
				var isExists = false;
				var objValue = obj.value;
				try {
					//对于IE判断要上传的文件的大小 
					var fso = new ActiveXObject("Scripting.FileSystemObject");
					fileLenth = parseInt(fso.getFile(objValue).size);
				} catch (e) {
					try {
						//对于非IE获得要上传文件的大小 
						fileLenth = parseInt(obj.files[0].size);
					} catch (e) {
						flag = false;
						return false;
					}
				}
				//循环判断图片的格式是否正确 
				for ( var i in array) {
					if (fileContentType.toLowerCase() == array[i].toLowerCase()) {
						//图片格式正确之后，根据浏览器的不同设置图片的大小 
						if (obj.files && obj.files[0]) {
							//火狐下，直接设img属性 
							imgObjPreview.style.display = 'block';
							imgObjPreview.style.width = '180px';
							imgObjPreview.style.height = '200px';
							//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式 
							imgObjPreview.src = window.URL
									.createObjectURL(obj.files[0]);
							if (fileLenth > 102400) {
								$.messager.alert("提示", "请选择小于100k的图片!");
								flag = false;
								return false;
							}
						} else {
							//IE下，使用滤镜 
							obj.select();
							var imgSrc = document.selection.createRange().text;
							//必须设置初始大小 
							localImagId.style.width = "180px";
							localImagId.style.height = "200px";
							//图片异常的捕捉，防止用户修改后缀来伪造图片 
							try {
								localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
								localImagId.filters
										.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
							} catch (e) {
								alert("laile");
								$.messager.alert("提示", "您上传的图片格式不正确，请重新选择!");
								flag = false;
								return false;
							}
							imgObjPreview.style.display = 'none';
							document.selection.empty();
						}
						isExists = true;
						flag = true;
						return true;
					}
				}
				if (isExists == false) {
					$.messager.alert("提示", "上传图片类型不正确!");
					flag = false;
					return false;
				}
				flag = false;
				return false;
			}
		}
		$(function() {
			$('.skin-minimal input').iCheck({
				checkboxClass : 'icheckbox-blue',
				radioClass : 'iradio-blue',
				increaseArea : '20%'
			});

		});
</script>

</body>

</html>
