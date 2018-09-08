<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/lib/lib/layer/2.1/layer.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/lib/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/lib/lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/lib/lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/lib/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/lib/lib/ueditor/1.4.3/ueditor.all.min.js">
	
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/lib/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/lib/js/H-ui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/lib/js/H-ui.admin.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/lib/js/ajaxfileupload.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>新增商品</title>
<style>
#showimage {
	margin-top: 40px;
	height: 20%;
	padding-bottom: 20px;
}

.defaultimage,.fimage {
	margin-left: 1%;
	float: left;
	border: 1px solid #cccccc;
	height: 100px;
	width: 100px;
	line-height: 100px;
	text-align: center;
	cursor: pointer;
	background: #f2f2f2;
}

.fimage:first-child {
	margin-left: 16.5%;
}

.defaultimage img,.fimage img {
	height: 50px;
	width: 50px;
	margin-top: 25%;
}

.ui-droplist-wrap {
	margin-top: 31px;
	background: #fff;
	border: 1px solid #2ca1b3;
	z-index: 500;
	max-height: 340px;
	overflow: auto;
	margin-left: 13.4%;
}

.ui-droplist-wrap .droplist {
	background-color: #fff;
	position: relative;
}

.select {
	width: 91%;
}
</style>
</head>
<body>
	<div class="pd-20">
		<form class="form form-horizontal" id="form-article-add">

			<div class="row cl">
				<label class="form-label col-2"> <span class="c-red">*</span>商品名称：
				</label>
				<div class="formControls col-10">
					<input type="text" class="input-text" onchange="typename()"
						value="${st.typename }" placeholder="" id="tname" name="tname" />
				</div>
			</div>

			<div class="row cl">
				<div class="col-10 col-offset-2">
					<button onclick="add(${st.typeid})" id="sub" class="btn btn-primary radius"
						type="button">
						<i class="Hui-iconfont">&#xe632;</i> 修改
					</button>
				</div>
			</div>

		</form>
	</div>
	</div>

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
	
	
		var ue = UE.getEditor('editor');
		function add(id) {
			var typename = document.getElementById("tname").value;
			if (typename == null || "" == typename) {
				layer.msg("请输入商品名称", {
					icon : 6,
					time : 1000
				});
				return false;
			}

			layer
					.confirm(
							"修改店铺类型？",
							function(index) {
								$
										.post(

												"${pageContext.request.contextPath}/dianpu.do?p=updateType",
												{
													typeid : id,
													typename : typename,
												},
												function() {
													var url = "${header.referer}";
													layer.msg("修改成功", {
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
		
	</script>
</body>
</html>