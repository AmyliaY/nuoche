<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="${pageContext.request.contextPath }/lib/css/H-ui.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/lib/css/H-ui.admin.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/lib/lib/icheck/icheck.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/lib/lib/Hui-iconfont/1.0.7/iconfont.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/webuploader.css"
	rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>修改个人信息</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		管理员中心 <span class="c-gray en">&gt;</span> 修改个人信息 <a
			class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i> </a>
	</nav>
	<div class="pd-20">
			<form
			action="${pageContext.request.contextPath}/admin.do?p=updatepwd&id=${admin.adminId}"
			method="post" class="form form-horizontal" id="form-article-add"
			enctype="multipart/form-data">
			<div class="form form-horizontal" id="form-member-add">
				<div class="row cl">
				<input name="oldImage" value="${admin.image }" style="display:none"/>
					<label class="form-label col-3"><span class="c-red">*</span>修改头像：</label>
					<input type="file" id="gttlogo" name="gttlogo" width="150px"
						runat="server"
						onchange="javascript:setImagePreview(this,localImag,preview);" />
					<div id="localImag">
						<img id="preview" src="${pageContext.request.contextPath }/admin/images/${admin.image}" style="width: 120px; height: 120px;" />
					</div>
				</div>
				<div class="col-4"></div>
				
				<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>昵称：</label>
				<div class="formControls col-5">
					<input type="text" class="input-text" value="${admin.adminName }"
						placeholder="" id="adminNicheng" name="adminNicheng">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>旧密码：</label>
				<div class="formControls col-5">
					<input type="text" class="input-text" placeholder="" id="oldpwd"
						name=oldpwd>
				</div>
				<div class="col-4" id="divoldpwd"></div>
			</div>

			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>密码：</label>
				<div class="formControls col-5">
					<input type="text" class="input-text" onblur="yz_pwd()"
						placeholder="" id="passwords" name="passwords">
				</div>
				<div class="col-4" id="divpasswords"></div>
			</div>
			<div class="row cl">
				<label class="form-label col-3"><span class="c-red">*</span>确认密码：</label>
				<div class="formControls col-5">
					<input type="text" class="input-text" onblur="yz_pwdtwo()"
						placeholder="" id="passwordstwo" name="passwordstwo">
				</div>
				<div class="col-4" id="divpasswordstwo"></div>
			</div>
				<div class="row cl">
				<div class="col-9 col-offset-3">
					<input class="btn btn-primary radius" onclick="return tijiao()"
						type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
				</div>
			</div>
			</div>
		</form>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/icheck/jquery.icheck.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/Validform/5.3.2/Validform.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/layer/2.1/layer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/js/H-ui.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/js/H-ui.admin.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/webuploader.min.js"></script>
	<script type="text/javascript">
		//检查图片的格式是否正确,同时实现预览
		function setImagePreview(obj, localImagId, imgObjPreview) {
			var array = new Array('gif', 'jpeg', 'png', 'jpg', 'bmp'); //可以上传的文件类型 
			if (obj.value == '') {
				$.messager.alert("提示", "让选择要上传的图片!");
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
							imgObjPreview.style.width = '120px';
							imgObjPreview.style.height = '120px';
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
		
		//验证密码
function yz_pwd(){
	var passwords=$("#passwords").val();
	if(passwords=="")
	{
		$("#divpasswords").html('<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 密码不能为空! </span>');
		return false;
	}
	else if(passwords.length<6 || passwords>20)
	{
		$("#divpasswords").html('<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 密码长度由6-20位字符组成! </span>');
		return false;
	}
	else{
		$("#divpasswords").html('<img src="${pageContext.request.contextPath }/lib/images/icon_right_s.png">');
	}
}
//确认密码
function yz_pwdtwo(){
	var passwords=$("#passwords").val();
	var passwordstwo=$("#passwordstwo").val();
	if(passwordstwo=="")
	{
		$("#divpasswordstwo").html('<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 确认密码不能为空! </span>');
		return false;
	}else if(passwordstwo!=passwords)
	{
		$("#divpasswordstwo").html('<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 俩次输入密码不相同! </span>');
		return false;
	}
	else{
		$("#divpasswordstwo").html('<img src="${pageContext.request.contextPath }/lib/images/icon_right_s.png">');
	}
}
function tijiao(){
	var pwd=${admin.adminPassword};
	var oldpwd=$("#oldpwd").val();
	if(oldpwd==null || ""==oldpwd)
	{
		$("#divoldpwd").html('<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 旧密码不能为空! </span>');
		return false;
	}
	else if(oldpwd!=pwd)
	{
		$("#divoldpwd").html('<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 旧密码输入错误! </span>');
		return false;
	}else
	{
		$("#divoldpwd").html('<img src="${pageContext.request.contextPath }/lib/images/icon_right_s.png">');
	}
	var passwords=$("#passwords").val();
	var passwordstwo=$("#passwordstwo").val();
	if(passwords=="")
	{
		$("#divpasswords").html('<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 密码不能为空! </span>');
	}
	if(passwordstwo=="")
	{
		$("#divpasswordstwo").html('<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 确认密码不能为空! </span>');
	}
	if(passwords=="" || passwordstwo=="" || passwordstwo!=passwords || passwords.length<6 || passwords.length>20)
	{
		return false;
	}
	
		
	
	
}
		$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
});
		
		
	</script>
</body>
</html>