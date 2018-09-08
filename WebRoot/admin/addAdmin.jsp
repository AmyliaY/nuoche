<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>添加商品二级分类</title>
</head>
<body>
	<div class="pd-20">
			<form
			action="${pageContext.request.contextPath}/admin.do?p=addAdmin"
			method="post" class="form form-horizontal" id="form-article-add"
			enctype="multipart/form-data">
			<div class="form form-horizontal" id="form-member-add">
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>昵称：</label>
					<div class="formControls col-5">
						<input type="text" class="input-text" onblur="yz_uname()" value=""
							placeholder="" id="uname" name="uname">
					</div>
					<div class="col-4" id="divuname"></div>
				</div>
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>管理员账号：</label>
					<div class="formControls col-5" id="zzzz">
						<input type="text" class="input-text" onblur="yz_name()" value=""
							placeholder="" id="usersname" name="usersname" datatype="*2-16"
							nullmsg="用户名不能为空">
					</div>
					<div class="col-4" id="nono"></div>
				</div>
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>管理员密码：</label>
					<div class="formControls col-5">
						<input type="text" class="input-text" onblur="yz_pwd()" value=""
							placeholder="" id="userspwd" name="passwords" datatype="*2-16"
							nullmsg="密码不能为空">
					</div>
					<div class="col-4" id="divpwd"></div>
				</div>
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>确认密码：</label>
					<div class="formControls col-5">
						<input type="text" class="input-text" onblur="yz_pwdtwo()"
							value="" placeholder="" id="userspwdtwo" name="userspwdtwo"
							datatype="*2-16" reck="两次输入的内容不一致！">
					</div>
				</div>
				<div class="row cl">
					<label style="margin-left:60px" class="form-label col-2"> <span
						class="c-red">*</span>默认头像：
					</label>

					<div id="morenImage">
						<input style="display:none;" id="morenImageName" name="moren" value="a.jpg" />
						<img id="moren"
							src="${pageContext.request.contextPath }/admin/images/a.jpg"
							style="width: 120px; height: 120px;" />
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>头像选择：</label>
					<input type="file" id="gttlogo" name="gttlogo" width="150px"
						runat="server"
						onchange="javascript:setImagePreview(this,localImag,preview);" />
					<div id="localImag">
						<img id="preview" src="" style="width: 120px; height: 120px;" />
					</div>
				</div>
				<div class="col-4"></div>

				<div class="row cl">
					<div class="col-9 col-offset-3">
						<input class="btn btn-primary radius" id="sub"
							onclick="return yz_tiaojiao()" type="submit"
							value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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
		
		
		//验证昵称
		function yz_uname() {
			var uname = $("#uname").val();
			if ("" == uname) {
				$("#divuname")
						.html(
								'<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 昵称不能为空! </span>');
				return false;
			} else {
				$("#divuname")
						.html(
								'<img src="${pageContext.request.contextPath }/lib/images/icon_right_s.png">');
			}
		}
		//验证用户名
		function yz_name() {
			var usersname = $("#usersname").val();
			if (usersname.length<6 || usersname.length>18) {
				$("#nono")
						.html(
								'<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 账号由6-18位数字字母组成! </span>');
				return false;
			} else {
				$("#nono")
						.html(
								'<img src="${pageContext.request.contextPath }/lib/images/icon_right_s.png">')
			}
			if (usersname == "") {
				$("#nono")
						.html(
								'<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 账号不能为空! </span>');
				return false;
			} else {
				$("#nono")
						.html(
								'<img src="${pageContext.request.contextPath }/lib/images/icon_right_s.png">')
			}
			var url = "${pageContext.request.contextPath}/admin.do?p=yzaname";
			var params = {
				usersname : usersname
			}
			if ("" != usersname) {
				$
						.post(
								url,
								params,
								function(date) {
									if (date == "true") {
										$("#nono")
												.html(
														'<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 该账号已被注册已被注册! </span>');
										$("#sub").attr('disabled', true);
										return false;
									} else {
										$("#nono")
												.html(
														'<img src="${pageContext.request.contextPath }/lib/images/icon_right_s.png">')
										$("#sub").attr('disabled', false);
									}
								});
			}
		}
		//验证密码
		function yz_pwd() {
			var userspwd = $("#userspwd").val();
			var sum = 0;
			var shuzi = 1;
			var zimu = 1;
			var qita = 1;
			if (userspwd.length<6 || userspwd.length>18) {
				$("#divpwd")
						.html(
								'<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 密码由6-18位字符组成! </span>');
				return false;
			}
			if ("" == userspwd) {
				$("#divpwd")
						.html(
								'<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 密码不能为空! </span>');
				return false;
			} else {
				$("#divpwd")
						.html(
								'<img src="${pageContext.request.contextPath }/lib/images/icon_right_s.png">');
			}
		}
		//判断俩次密码是否一致
		function yz_pwdtwo() {
			var userspwdtwo = $("#userspwdtwo").val();
			var userspwd = $("#userspwd").val();
			if ("" == userspwdtwo) {
				$("#divpwdtwo")
						.html(
								'<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 确认密码不能为空 !</span>');
				return false;
			} else {
				if (userspwd != userspwdtwo) {
					$("#divpwdtwo")
							.html(
									'<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 俩次密码不一致! </span>');
					return false;
				} else {
					$("#divpwdtwo")
							.html(
									'<img src="${pageContext.request.contextPath }/lib/images/icon_right_s.png">');
				}
			}

		}


		//提交时验证是否为null
		function yz_tiaojiao() {
			var uname = document.getElementById("uname").value;
			var usersname = document.getElementById("usersname").value;
			var userspwd = document.getElementById("userspwd").value;
			var userspwdtwo = document.getElementById("userspwdtwo").value;
			var moren = document.getElementById("morenImageName").value;
			var gimages = document.getElementById("gttlogo").value;
			var Images;
			if ("" == gimages) {
				Images = moren;
			} else {
				Images = gimages;
			}
			if ("" == uname) {
				$("#divuname")
						.html(
								'<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 昵称不能为空! </span>');
			}
			if ("" == usersname) {
				$("#nono")
						.html(
								'<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 用户名不能为空! </span>');
			}
			if ("" == userspwd) {
				$("#divpwd")
						.html(
								'<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 密码不能为空! </span>');
			}
			if ("" == userspwdtwo) {
				$("#divpwdtwo")
						.html(
								'<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 确认密码不能为空! </span>');
			}
			if (uname == "" || usersname == "" || userspwd == ""
					|| userspwdtwo != userspwd) {
				return false;
			}
		}
		$(function() {
			$('.skin-minimal input').iCheck({
				checkboxClass : 'icheckbox-blue',
				radioClass : 'iradio-blue',
				increaseArea : '20%'
			});

			$("#form-member-add").Validform({
				tiptype : 2,
				callback : function(form) {
					form[0].submit();
					var index = parent.layer.getFrameIndex(window.name);
					parent.$('.btn-refresh').click();
					parent.layer.close(index);
				}
			});
		});
	</script>
</body>
</html>