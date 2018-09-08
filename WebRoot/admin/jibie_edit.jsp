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
<title>修改级别</title>
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
				<label class="form-label col-3"> <span class="c-red">*</span>级别称号：
				</label>
				<div class="formControls col-5">
					<input type="text" class="input-text" onblur="jb_name()"
						value="${dj.djname }" placeholder="" id="jbname" name="jbname" />
				</div>
			</div>
			
			<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>直推人数：</label>
					<div class="formControls col-5">
						<input type="text" class="input-text"
							placeholder="" value="${dj.djbegintui }" id="zhibeginsum" name="zhibeginsum" style="width: 30%">-
						<input type="text" class="input-text"
							placeholder="" value="${dj.djendtui }" id="zhiendsum" name="zhiendsum" style="width: 30%">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>团队人数：</label>
					<div class="formControls col-5">
						<input type="text" class="input-text"
							placeholder="" value="${dj.djbegintuan }" id="duanbeginsum" name="duanbeginsum" style="width: 30%">-
						<input type="text" class="input-text"
							placeholder="" value="${dj.djendtuan }" id="duanendsum" name="duanendsum" style="width: 30%">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>购买级别金额：</label>
					<div class="formControls col-5">
						<input type="text" class="input-text"
							placeholder="" value="${dj.djjine }" id="djjine" name="djjine">
					</div>
				</div>
				<div class="row cl" style="display: none;">
					<label class="form-label col-3"><span class="c-red">*</span>直推奖励金额：</label>
					<div class="formControls col-5">
						<input type="text" class="input-text"
							placeholder="" value="${dj.djtuijiangli}" id="djtuijiangli" name="djtuijiangli">
					</div>
				</div>
				

			<div class="row cl">
				<div class="col-10 col-offset-2">
					<button onclick="add(${dj.djid})" id="sub" class="btn btn-primary radius"
						type="button">
						<i class="Hui-iconfont">&#xe632;</i> 修改
					</button>
				</div>
			</div>

		</form>
	</div>
	</div>

	<script type="text/javascript">
	    function jb_name() {
			var jbname = $("#jbname").val();
			var url = "${pageContext.request.contextPath}/dianpu.do?p=getJBname";
			var param = {
				jbname : jbname
			};
			$.post(url, param, function(data) {
				if (data == "true") {
					layer.msg("该级别已存在", {
						icon : 5,
						time : 1000
					});
					document.getElementById("sub").disabled = true;
				} else if (data == "false") {
					//layer.msg("该商品不存在!",{icon:6,time:1000});
					document.getElementById("sub").disabled = false;
				}
			});
		}
	
	
		var ue = UE.getEditor('editor');
		function add(id) {
			var jbname = document.getElementById("jbname").value;
			var zhibeginsum=document.getElementById("zhibeginsum").value;
			var zhiendsum=document.getElementById("zhiendsum").value;
			var duanbeginsum=document.getElementById("duanbeginsum").value;
			var duanendsum=document.getElementById("duanendsum").value;
			var djjine=document.getElementById("djjine").value;
			var djtuijiangli=0;//document.getElementById("djtuijiangli").value;
			//var djtuanjiangli=document.getElementById("djtuanjiangli").value;
			if (jbname == null || "" == jbname) {
				layer.msg("请输入级别称号", {
					icon : 6,
					time : 1000
				});
				return false;
			}
			if(zhibeginsum == null || "" == zhibeginsum || zhiendsum == null || "" == zhiendsum){
			   layer.msg("请输入直推人数",{icon:6,time:1000});
			   return false;
			}
			if(duanbeginsum == null || "" == duanbeginsum || duanendsum == null || "" == duanendsum){
			   layer.msg("请输入团队人数",{icon:6,time:1000});
			   return false;
			}
			if(djjine == null || "" == djjine){
			  layer.msg("请输入购买金额",{icon:6,time:1000});
			  return false;
			}
			
		    /*
			if(djtuijiangli == null || "" == djtuijiangli){
			  layer.msg("请输入直推奖励金额",{icon:6,time:1000});
			  return false;
			}
			*/
			
           

			layer
					.confirm(
							"修改级别？",
							function(index) {
								$
										.post(

												"${pageContext.request.contextPath}/dianpu.do?p=updateJB",
												{
												    id:id,
													jbname : jbname,
													zhibeginsum : zhibeginsum,
													zhiendsum : zhiendsum,
													duanbeginsum : duanbeginsum,
													duanendsum : duanendsum,
													djjine : djjine,
													djtuijiangli : djtuijiangli,
													djtuanjiangli : 0
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