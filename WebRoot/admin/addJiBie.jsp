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
<title>添加级别</title>
</head>
<body>
	<div class="pd-20">
			<form
			class="form form-horizontal" id="form-article-add"
			>
			<div class="form form-horizontal" id="form-member-add">
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>级别称号：</label>
					<div class="formControls col-5">
						<input type="text" class="input-text" onblur="jb_name()" placeholder="" id="jbname" name="jbname">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>直推人数：</label>
					<div class="formControls col-5">
						<input type="text" class="input-text"
							placeholder="" id="zhibeginsum" name="zhibeginsum" style="width: 30%">-
						<input type="text" class="input-text"
							placeholder="" id="zhiendsum" name="zhiendsum" style="width: 30%">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>团队人数：</label>
					<div class="formControls col-5">
						<input type="text" class="input-text"
							placeholder="" id="duanbeginsum" name="duanbeginsum" style="width: 30%">-
						<input type="text" class="input-text"
							placeholder="" id="duanendsum" name="duanendsum" style="width: 30%">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>购买级别金额：</label>
					<div class="formControls col-5">
						<input type="text" class="input-text"
							placeholder="" id="djjine" name="djjine">
					</div>
				</div>
				
				<!-- 
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>直推奖励金额：</label>
					<div class="formControls col-5">
						<input type="text" class="input-text"
							placeholder="" id="djtuijiangli" name="djtuijiangli">
					</div>
				</div>
				 -->
				 
				 
				<div class="row cl">
					<label class="form-label col-3"><span class="c-red">*</span>等级奖励金额：</label>
					<div class="formControls col-5">
						<input type="text" class="input-text"
							placeholder="" id="djtuanjiangli" name="djtuanjiangli">
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
	var gid = ${param.gid};
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
	function tianjia() {
			
			var jbname = document.getElementById("jbname").value;
			var zhibeginsum=document.getElementById("zhibeginsum").value;
			var zhiendsum=document.getElementById("zhiendsum").value;
			var duanbeginsum=document.getElementById("duanbeginsum").value;
			var duanendsum=document.getElementById("duanendsum").value;
			var djjine=document.getElementById("djjine").value;
			var djtuijiangli= 0; //document.getElementById("djtuijiangli").value;
			var djtuanjiangli=document.getElementById("djtuanjiangli").value;
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
            if(djtuanjiangli == null || "" == djtuanjiangli){
			  layer.msg("请输入团队奖励金额",{icon:6,time:1000});
			  return false;
			}
			layer
					.confirm(
							"是否添加级别？",
							function(index) {
								$
										.post(

												"${pageContext.request.contextPath}/dianpu.do?p=addJB",
												{
													gid:gid,
													jbname : jbname,
													zhibeginsum : zhibeginsum,
													zhiendsum : zhiendsum,
													duanbeginsum : duanbeginsum,
													duanendsum : duanendsum,
													djjine : djjine,
													djtuijiangli : djtuijiangli,
													djtuanjiangli : djtuanjiangli
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
		
		
	</script>
</body>
</html>