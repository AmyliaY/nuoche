<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<input type="text" class="input-text" onchange="yzgname()" value=""
						placeholder="" id="gname" name="gname" />
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2"> <span class="c-red">*</span>商品产地：
				</label>
				<div class="formControls col-10">
					<input type="text" class="input-text" value="" placeholder=""
						id="gchandi" name="gchandi">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2"> <span class="c-red">*</span>商品品牌：
				</label>
				<div class="formControls col-10">
					<input type="text" class="input-text" value="" placeholder=""
						id="gpinpai" name="gpinpai">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2"> <span class="c-red">*</span>商品简介：
				</label>
				<div class="formControls col-10">
					<input type="text" class="input-text" value="" placeholder=""
						id="gjanjie" name="gjanjie">
				</div>
			</div>
			
			<div class="row cl">
				<label class="form-label col-2"> 普通会员价格： </label>
				<div class="formControls col-4">
					<input type="text"
						onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]"
						name="gprice" id="gprice" placeholder="" value=""
						class="input-text">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2"> VIP会员价格： </label>
				<div class="formControls col-4">
					<input type="text"
						onkeyup="this.value=(this.value.match(/\d+(\.\d{0,2})?/)||[''])[0]"
						name="gvipprice" id="gvipprice" placeholder="" value=""
						class="input-text">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2"> <span class="c-red">*</span>商品单位：
				</label>
				<div class="formControls col-4">
					<input type="text"
						onkeyup=""
						name="gdanwei" id="gdanwei" placeholder="" value=""
						class="input-text">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2"> 商品状态： </label>
				<div class="formControls col-2">
					<span class="select-box"> <select class="select"
						name="gstatus" id="gstatus">
							<option value="1">上架</option>
							<option value="0">下架</option>

					</select>
					</span>
				</div>
			</div>
			<div class="row cl" style="display: none;">
				<label class="form-label col-2"> 是否众筹： </label>
				<div class="formControls col-2">
					<span class="select-box"> <select class="select"
						name="gzhongchou" id="gzhongchou">
							<option value="0">否</option>
							<option value="1">是</option>
					</select>
					</span>
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-2"> <span class="c-red">*</span>默认图片：
				</label>
				<div class="formControls col-10" style="margin-left: -85px;">
					<div index=0 class="fimage">
						<img
							src="${pageContext.request.contextPath }/admin/images/add.png">
					</div>
				</div>
			</div>


			<div class="row cl">
				<label class="form-label col-2"> <span class="c-red">*</span>商品图片：
				</label>
				<div class="formControls col-10" style="margin-left: -85px;">
					<div id="showimage" style="">
						<div index="1" class="fimage">
							<img
								src="${pageContext.request.contextPath }/admin/images/add.png">
						</div>
						<div index="2" class="fimage">
							<img
								src="${pageContext.request.contextPath }/admin/images/add.png">
						</div>
						<div index="3" class="fimage">
							<img
								src="${pageContext.request.contextPath }/admin/images/add.png">
						</div>
						<div index="4" class="fimage">
							<img
								src="${pageContext.request.contextPath }/admin/images/add.png">
						</div>
						<div index="5" class="fimage">
							<img
								src="${pageContext.request.contextPath }/admin/images/add.png">
						</div>
					</div>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-2"> 商品详情： </label>
				<div class="formControls col-10">
					<script id="editor" type="text/plain"
						style="width:100%;height:200px;"></script>
				</div>
			</div>
			<div class="row cl">
				<div class="col-10 col-offset-2">
					<button onclick="add()" id="sub" class="btn btn-primary radius"
						type="button">
						<i class="Hui-iconfont">&#xe632;</i> 添加
					</button>
				</div>
			</div>

			<div class="row cl" style="display: none">
				<div class="formControls col-10">
					<div class="uploader-thum-container">
						<div id="fileList" class="uploader-list"></div>
						<div class="filePicker">选择图片</div>
						<button id="btn-star"
							class="btn btn-default btn-uploadstar radius ml-10">
							开始上传</button>
					</div>
				</div>
			</div>
			<div class="row cl" style="display: none">
				<div class="formControls col-10">
					<div class="uploader-thum-container">
						<div id="fileList" class="uploader-list"></div>
						<div class="default">默认图片</div>
						<button id="btn-star"
							class="btn btn-default btn-uploadstar radius ml-10">
							开始上传</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	</div>

	<script type="text/javascript">
	
		var index;
		var jsonstr = "[]";
		var jsonarray = eval("(" + jsonstr + ")");
		
		function yzgname() {
			var gname = $("#gname").val();
			var url = "${pageContext.request.contextPath}/shangjiagoods.do?p=yzgoodsname";
			var param = {
				gname : gname
			};
			$.post(url, param, function(data) {
				if (data == "true") {
					layer.msg("该商品已存在", {
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
		function add() {
			//var json = $("#form-article-add").serialize();
			var imagelist = JSON.stringify(jsonarray);

			var gname = (document.getElementById("gname").value);
			var gchandi = (document.getElementById("gchandi").value);
			var gpinpai = (document.getElementById("gpinpai").value);
			var gjanjie = (document.getElementById("gjanjie").value);
			//var gtid = $("gtid").val();
			//var gttid = $("#gttid").val();
			var gprice = $("#gprice").val();
			var gvipprice = $("#gvipprice").val();
			var gstatus = $("#gstatus").val();
			//var gzhongchou = $("#gzhongchou").val();
			var gdanwei = ($("#gdanwei").val());
			var gimages = $("#gimages").val();
			var gdelia = ((ue.getContent()));
			
			
			if (gname == null || "" == gname) {
				layer.msg("请输入商品名称", {
					icon : 6,
					time : 1000
				});
				return false;
			}
			if (gchandi == null || "" == gchandi) {
				layer.msg("请输入商品产地", {
					icon : 6,
					time : 1000
				});
				return false;
			}
			if (gpinpai == null || "" == gpinpai) {
				layer.msg("请输入商品品牌", {
					icon : 6,
					time : 1000
				});
				return false;
			}
			if (gjanjie == null || "" == gjanjie) {
				layer.msg("请输入商品简介", {
					icon : 6,
					time : 1000
				});
				return false;
			}
			
			if (gprice == null || "" == gprice) {
				layer.msg("请输入普通会员价格", {
					icon : 6,
					time : 1000
				});
				return false;
			}
			if (isNaN(gprice)) {
				layer.msg("价格只能输入数字", {
					icon : 6,
					time : 1000
				});
				return false;
			}
			if (gvipprice == null || "" == gvipprice) {
				layer.msg("请输入VIP会员价格", {
					icon : 6,
					time : 1000
				});
				return false;
			}
			if (isNaN(gvipprice)) {
				layer.msg("价格只能输入数字", {
					icon : 6,
					time : 1000
				});
				return false;
			}
			if (gdanwei == -1) {
				layer.msg("请选择商品单位", {
					icon : 6,
					time : 1000
				});
				return false;
			}
			if (!image1) {
				layer.msg("请选择默认图片", {
					icon : 6,
					time : 1000
				});
				return false;
			}
			if (gdelia == null || "" == gdelia) {
				layer.msg("请输入商品详情", {
					icon : 6,
					time : 1000
				});
				return false;
			}
			
			layer
					.confirm(
							"添加商品？",
							function(index) {
								$
										.post(

												"${pageContext.request.contextPath}/shangjiagoods.do?p=addgoods",
												{
													gname : gname,
													gchandi : gchandi,
													gpinpai : gpinpai,
													//gtid : gtid,
													//gttid : gttid,
													gjanjie : gjanjie,
													gimages : gimages,
													gstatus : gstatus,
													//gzhongchou : gzhongchou,
													gdelia : gdelia,
													gprice : gprice,
													gvipprice : gvipprice,
													gdanwei : gdanwei,
													defaultImage : image1,
													imagelist : imagelist

												},
												function() {
													layer.msg("新增成功", {
														icon : 6,
														time : 1000
													});
													//判断是否是众筹商品   
													if(gzhongchou ==0 ){
														location.replace("${pageContext.request.contextPath}/shangjiagoods.do?p=sjgoodslinting");
													}else{
														location.replace("${pageContext.request.contextPath}/shangjiagoods.do?p=sjgoodslinting");
													}
													
												}

										);

							});
		}
		//检查图片的格式是否正确,同时实现预览

		function getRootPath() {
			//http://localhost:8083/uimcardprj/share/meun.jsp
			var curWwwPath = window.document.location.href;
			//uimcardprj/share/meun.jsp
			var pathName = window.document.location.pathname;
			var pos = curWwwPath.indexOf(pathName);
			//http://localhost:8083
			var localhostPaht = curWwwPath.substring(0, pos);
			// uimcardprj
			var projectName = pathName.substring(0, pathName.substr(1).indexOf(
					'/') + 1);
			if (projectName == "/admin" || projectName=="/daili" || projectName=="/weixin" || projectName=="/wap")
				projectName = "";

			return (localhostPaht + projectName);
		}

		//------------------------------------------------------------------------------

		var image1 = null;
		$list = $("#fileList"), $btn = $("#btn-star"), thumbnailWidth = 100; //缩略图高度和宽度 （单位是像素），当宽高度是0~1的时候，是按照百分比计算
		thumbnailHeight = 100;
		state = "pending", uploader;

		var uploader = WebUploader
				.create({
					auto : true,
					swf : '${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/Uploader.swf',

					// 文件接收服务端。
					server : '${pageContext.request.contextPath }/upload.do',

					// 选择文件的按钮。可选。
					// 内部根据当前运行是创建，可能是input元素，也可能是flash.
					pick : '.filePicker',
					fileNumLimit : 15,
					//设置可以重复上传
					duplicate : true,
					// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
					resize : false,
					// 只允许选择图片文件。
					accept : {
						title : 'Images',
						extensions : 'gif,jpg,jpeg,bmp,png',
						mimeTypes : 'image/*'
					}
				});
		uploader.on('fileQueued', function(file) {
			var $li = $('<div id="' + file.id + '" class="item">'
					+ '<div class="pic-box"><img></div>' + '<div class="info">'
					+ file.name + '</div>' + '<p class="state">等待上传...</p>'
					+ '</div>'), $img = $li.find('img');
			$list.append($li);
			// 创建缩略图
			// 如果为非图片文件，可以不用调用此方法。
			// thumbnailWidth x thumbnailHeight 为 100 x 100
			uploader.makeThumb(file, function(error, src) {
				if (error) {
					$img.replaceWith('<span>不能预览</span>');
					return;
				}

				$img.attr('src', src);

			}, thumbnailWidth, thumbnailHeight);
		});
		// 文件上传过程中创建进度条实时显示。
		uploader
				.on(
						'uploadProgress',
						function(file, percentage) {
							var $li = $('#' + file.id), $percent = $li
									.find('.progress-box .sr-only');

							// 避免重复创建
							if (!$percent.length) {
								$percent = $(
										'<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>')
										.appendTo($li).find('.sr-only');
							}
							$li.find(".state").text("上传中");
							$percent.css('width', percentage * 100 + '%');
						});

		// 文件上传成功，给item添加成功class, 用样式标记上传成功。
		uploader.on('uploadSuccess', function(file, response) {
      
			image1 = response._raw;
			
			
			$("#current").find("img").attr("src",
					"${pageContext.request.contextPath}/tmp/" + image1);
			$("#current").find("img").css({
				"height" : "100%",
				"width" : "100%",
				"margin-top" : "0px"
			});

			var panduan = 1;
			$.each(jsonarray, function(n, value) {
				if (value.id == index) {
					panduan = 2;
					jsonarray[n].image = response._raw.trim();

				}

			});
			if (panduan == 1) {
				var jsonimage = {
					"id" : index,
					"image" : response._raw.trim()
				}
				jsonarray.push(jsonimage);
			}

			$('#' + file.id).addClass('upload-state-success').find(".state")
					.text("已上传");
		});

		// 文件上传失败，显示上传出错。
		uploader.on('uploadError', function(file) {
			$('#' + file.id).addClass('upload-state-error').find(".state")
					.text("上传出错");
		});

		// 完成上传完了，成功或者失败，先删除进度条。
		uploader.on('uploadComplete', function(file) {
			$('#' + file.id).find('.progress-box').fadeOut();
		});
		uploader.on('all', function(type) {
			if (type === 'startUpload') {
				state = 'uploading';
			} else if (type === 'stopUpload') {
				state = 'paused';
			} else if (type === 'uploadFinished') {
				state = 'done';
			}

			if (state === 'uploading') {
				$btn.text('暂停上传');
			} else {
				$btn.text('开始上传');
			}
		});

		$btn.on('click', function() {
			if (state === 'uploading') {
				uploader.stop();
			} else {
				uploader.upload();
			}
		});
		//----------------------------------22222222-------------------------------

		var image2 = null;
		$list = $("#fileList"), $btn = $("#btn-star"), thumbnailWidth = 100; //缩略图高度和宽度 （单位是像素），当宽高度是0~1的时候，是按照百分比计算
		thumbnailHeight = 100;
		state = "pending", uploader;

		var uploader = WebUploader
				.create({
					auto : true,
					swf : '${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/Uploader.swf',

					// 文件接收服务端。
					server : getRootPath() + '/upload.do',

					// 选择文件的按钮。可选。
					// 内部根据当前运行是创建，可能是input元素，也可能是flash.
					pick : '.default', //
					fileNumLimit : 10,
					// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
					resize : false,
					// 只允许选择图片文件。
					accept : {
						title : 'Images',
						extensions : 'gif,jpg,jpeg,bmp,png',
						mimeTypes : 'image/*'
					}
				});
		uploader.on('fileQueued', function(file) {
			var $li = $('<div id="' + file.id + '" class="item">'
					+ '<div class="pic-box"><img></div>' + '<div class="info">'
					+ file.name + '</div>' + '<p class="state">等待上传...</p>'
					+ '</div>'), $img = $li.find('img');
			$list.append($li);
			// 创建缩略图
			// 如果为非图片文件，可以不用调用此方法。
			// thumbnailWidth x thumbnailHeight 为 100 x 100
			uploader.makeThumb(file, function(error, src) {
				if (error) {
					$img.replaceWith('<span>不能预览</span>');
					return;
				}

				$img.attr('src', src);

			}, thumbnailWidth, thumbnailHeight);
		});
		// 文件上传过程中创建进度条实时显示。
		uploader
				.on(
						'uploadProgress',
						function(file, percentage) {
							var $li = $('#' + file.id), $percent = $li
									.find('.progress-box .sr-only');

							// 避免重复创建
							if (!$percent.length) {
								$percent = $(
										'<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>')
										.appendTo($li).find('.sr-only');
							}
							$li.find(".state").text("上传中");
							$percent.css('width', percentage * 100 + '%');
						});

		// 文件上传成功，给item添加成功class, 用样式标记上传成功。
		uploader.on('uploadSuccess', function(file, response) {

			image2 = response._raw;

			$("#current").find("img").attr("src",
					"${pageContext.request.contextPath}/" + image2);
			$("#current").find("img").css({
				"height" : "100%",
				"width" : "100%",
				"margin-top" : "0px"
			});
			var panduan = 1;
			$.each(jsonarray, function(n, value) {
				if (value.id == index) {
					panduan = 2;
					jsonarray[n].image = response._raw.trim();

				}

			});
			if (panduan == 1) {
				var jsonimage = {
					"id" : index,
					"image" : response._raw.trim()
				}
				jsonarray.push(jsonimage);
			}

			$('#' + file.id).addClass('upload-state-success').find(".state")
					.text("已上传");
		});

		// 文件上传失败，显示上传出错。
		uploader.on('uploadError', function(file) {
			$('#' + file.id).addClass('upload-state-error').find(".state")
					.text("上传出错");
		});

		// 完成上传完了，成功或者失败，先删除进度条。
		uploader.on('uploadComplete', function(file) {
			$('#' + file.id).find('.progress-box').fadeOut();
		});

		uploader.on('all', function(type) {
			if (type === 'startUpload') {
				state = 'uploading';
			} else if (type === 'stopUpload') {
				state = 'paused';
			} else if (type === 'uploadFinished') {
				state = 'done';
			}

			if (state === 'uploading') {
				$btn.text('暂停上传');
			} else {
				$btn.text('开始上传');
			}
		});

		$btn.on('click', function() {
			if (state === 'uploading') {
				uploader.stop();
			} else {
				uploader.upload();
			}
		});

		$(function() {

			$(".fimage").bind("click", function() {

				index = $(this).attr("index");
				$("#current").attr("id", "");
				$(this).attr("id", "current");
				$(".filePicker").find("input").click();

			})
			$(".defaultimage").bind("click", function() {

				index = $(this).attr("index");
				$("#current").attr("id", "");
				$(this).attr("id", "current");
				$(".default").find("input").click();
			})
		})
	</script>
</body>
</html>