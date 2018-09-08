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
<title>添加店铺类型</title>
</head>
<body>
	<div class="pd-20">
			<form class="form form-horizontal" id="form-article-add">
			<div class="form form-horizontal" id="form-member-add">
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>店铺类型名称：</label>
					<div class="formControls col-5">
						<input type="text" class="input-text" onblur="typename()"
							placeholder="" id="tname" name="tname">
					</div>
				</div>
				
				<div class="row cl">
				<div class="col-10 col-offset-2">
					<button onclick="tianjia()" id="sub" class="btn btn-primary radius"
						type="button">
						<i class="Hui-iconfont">&#xe632;</i> 添加
					</button>
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
	 function typename(){
	        var typename=$("#tname").val();
	        var url="${pageContext.request.contextPath}/dianpu.do?p=getName";
	        var param={typename:typename};
	        $.post(url,param,function(date){
	           if(date=="true"){
	              layer.msg("该店铺类型已经存在",{inco:5,time:1000});
	              document.getElementById("sub").disabled=true;
	           }else if(date=="false"){
	              document.getElementById("sub").disabled=false;
	           }
	        
	        });
	    }
	
	
	function tianjia() {
			var tname = document.getElementById("tname").value;
			if (tname == null || "" == tname) {
				layer.msg("请输入级别称号", {
					icon : 6,
					time : 1000
				});
				return false;
			}
			layer
					.confirm(
							"是否添加级别？",
							function(index) {
								$
										.post(

												"${pageContext.request.contextPath}/dianpu.do?p=addShopType",
												{
													tname : tname
												},
												function() {
													var url = "${header.referer}";
													layer.msg("添加成功", {
														icon : 6,
														time : 1000
													});
													//location.replace(location.href);
													if (url) {

														setTimeout(
																function() {
																	window.parent.location.href = url;
																	var index = parent.layer
																			.getFrameIndex(window.name);/*获取索引窗口*/
																	parent.layer
																			.close(index);/*关闭该索引窗口*/

																}, 1000);

													}
												}

										);

							});
		}
	
		//验证昵称
		function dp_uname() {
			var uname = $("#uname").val();
			if ("" == uname) {
				$("#divuname")
						.html(
								'<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 昵称不能为空! </span>');
				return false;
			} else{
				$("#divuname")
						.html(
								'<img src="${pageContext.request.contextPath }/lib/images/icon_right_s.png">');
			}
		}
		//店铺类型提交
		function dp_tijiao(){
		    var uname=document.getElementById("uname").value;
		    if("" == uname){
		        $("#divuname")
						.html(
								'<img src="${pageContext.request.contextPath }/lib/images/icon_error_s.png"><span style="color: red"> 昵称不能为空! </span>');
		    }
		    if (uname == "") {
				return false;
			}
		}
	</script>
</body>
</html>