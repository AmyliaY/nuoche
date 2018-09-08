<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
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
		<link
			href="${pageContext.request.contextPath }/lib/css/H-ui.admin.css"
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
			src="${pageContext.request.contextPath }/lib/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
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
					<label class="form-label col-2">
						<span class="c-red">*</span>代理姓名：
					</label>
					<div class="formControls col-10">
						<input type="text" class="input-text" 
							value="" placeholder="" id="gname" name="gname" />
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-2">
						<span class="c-red">*</span>代理电话：
					</label>
					<div class="formControls col-10">
						<input type="text" class="input-text" value="" placeholder=""
							id="gchandi" name="gchandi">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-2">
						<span class="c-red">*</span>上一级代理人：
					</label>
					<div class="formControls col-10">
						<input type="text" class="input-text" value="" placeholder=""
							id="gpinpai" name="gpinpai">
					</div>
				</div>

				<div class="row cl">
					<label class="form-label col-2">
						<span class="c-red">*</span>所在区县：
					</label>
					<div class="formControls col-10">
<%-- 						<input type="text" class="input-text" value="${b.area }" placeholder=""
							id="gjanjie" name="gpinpai"> --%>
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
					<select class="select" id="arid" name="gjanjie" style="width: 100px;float: left;height:30px;">
						<option value="${proxy.area.arId}">${proxy.area.arName}</option>
					</select>
				</td>
					</div>
								
				</div>
				
				
				<div class="row cl">
					<label class="form-label col-2">
						代理微信：
					</label>
					<div class="formControls col-4">
						<input type="text"
							name="gprice" id="gprice" placeholder="" value=""
							class="input-text">
					</div>
				</div>

				<div class="row cl">
					<label class="form-label col-2">
						审核状态：
					</label>
					<div class="formControls col-2">
						<span class="select-box"> <select class="select"
								name="gzhongchou" id="gzhongchou">
								<option value="0" ${b.status==0?"selected":""}>
									在职
								</option>
								<option value="1" ${b.status==1?"selected":""}>
									离职
								</option>
							
							</select> </span>
					</div>
				</div>



				<div class="row cl">
					<label class="form-label col-2">
					</label>
					<div class="formControls col-10">
						<script id="editor" type="text/plain"
							style="width:100%;height:200px;"></script>
					</div>
				</div>
				<div class="row cl">
					<div class="col-10 col-offset-2">
						<button onclick="add()" id="sub" class="btn btn-primary radius"
							type="button">
							<i class="Hui-iconfont">&#xe632;</i> 修改
						</button>
					</div>
				</div>

				<div class="row cl" style="display: none">
					<div class="formControls col-10">
						<div class="uploader-thum-container">
							<div id="fileList" class="uploader-list"></div>
							<div class="filePicker">
								选择图片
							</div>
							<button id="btn-star"
								class="btn btn-default btn-uploadstar radius ml-10">
								开始上传
							</button>
						</div>
					</div>
				</div>
				<div class="row cl" style="display: none">
					<div class="formControls col-10">
						<div class="uploader-thum-container">
							<div id="fileList" class="uploader-list"></div>
							<div class="default">
								默认图片
							</div>
							<button id="btn-star"
								class="btn btn-default btn-uploadstar radius ml-10">
								开始上传
							</button>
						</div>
					</div>
				</div>
			</form>
		</div>

		<script type="text/javascript">
		
		$(function(){
		    $("#gzhongchou").val(${g.gzhongchou}); //是否众凑
		    $("#gstatus").val(${g.gstatus}); //是否上下架
		    $("#gdanwei").val("${g.gdanwei}");//单位
		});
		
		function findonetype(){
			var gtid = $("#gtid").val();
			if (gtid.trim == "") {
				gtid = -1;
			}
			var url = "${pageContext.request.contextPath}/shangjiagoods.do?p=yzfindtwotype";
			var param={gtid:gtid};
			$.post(url,param,function(data){
			    
				var json=eval("("+data+")");
				$("#gttid").empty();
				for(var i=0;i<json.length;i++)
				{
				    var option = new Option(json[i].gttName,json[i].gttId);
					document.getElementById("gttid").add(option);
				}
			});
		}

var index;
var jsonstr="[]";
var jsonarray = eval("("+jsonstr+")");
function yzgname(){
	var gname=$("#gname").val();
	var url="${pageContext.request.contextPath}/shangjiagoods.do?p=yzgoodsname";
	var param={gname:gname};
	$.post(url,param,function(data){
		if(data=="true")
		{
			layer.msg("该商品已存在",{icon:5,time:1000});
			document.getElementById("sub").disabled=true;
		}else if(data=="false")
		{
			//layer.msg("该商品不存在!",{icon:6,time:1000});
			document.getElementById("sub").disabled=false;
		}
	});
}
var ue = UE.getEditor('editor');
function add()
{	
    //var json = $("#form-article-add").serialize();
    var imagelist=JSON.stringify(jsonarray);
   
/* 	var gname=(document.getElementById("gname").value);
	var gchandi=(document.getElementById("gchandi").value);
	var gpinpai=(document.getElementById("gpinpai").value);
	var gjanjie = (document.getElementById("gjanjie").value); */
	var gname=$("#gname").val();
	var gchandi=$("#gchandi").val();
	var gpinpai=$("#gpinpai").val();
	var gjanjie=$("#arid").val();
	var gprice=$("#gprice").val();
	var cimages=$("#cimages").val();
	var gvipprice=$("#gvipprice").val();
	var gstatus=$("#gstatus").val();
	var gzhongchou=$("#gzhongchou").val();
	var gimages=$("#gimages").val();
	var gdelia=((ue.getContent()));
	if(gname==null || ""==gname)
	{
		layer.msg("请输入代理姓名",{icon:6,time:1000});
		return false;
	}
	if(gchandi==null || ""==gchandi)
	{
		layer.msg("请输入代理电话",{icon:6,time:1000});
		return false;
	}

	if(gjanjie==null || ""==gjanjie)
	{
		layer.msg("请输入代理所在区县",{icon:6,time:1000});
		return false;
	}

	if(gprice==null || ""==gprice)
	{
		layer.msg("请输入代理微信",{icon:6,time:1000});
		return false;
	}

	
	layer.confirm("修改商品？",function(index){
	   $.post(
	   
	      "${pageContext.request.contextPath}/admin_daili.do?p=insertproxy",
	       {
	           gid:"${b.id}",
	           gname:gname,
	           gchandi:gchandi,
	           gpinpai:gpinpai,
	           gjanjie:gjanjie,
	           cimages:cimages,
	           gimages:gimages,
	           gstatus:gstatus,
	           gzhongchou:gzhongchou,
	           gdelia:gdelia,
	           gprice:gprice,
	           gvipprice:gvipprice,
	           defaultImage:image1,
	           imagelist:imagelist
	           
	       }
	       ,
	      function()
	      {
	         var url = "${header.referer}";
	         layer.msg("新增成功",{icon:6,time:1000});
	         //location.replace(location.href);
	        
	         if (url)
	         {
	         
	          setTimeout(function(){
	              window.parent.location.href= url;
			      var index = parent.layer.getFrameIndex(window.name);/*获取索引窗口*/
			      parent.layer.close(index);/*关闭该索引窗口*/
	          
	          },1000);
	           
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
	var projectName = pathName
			.substring(0, pathName.substr(1).indexOf('/') + 1);
	if (projectName == "/admin")
		projectName = "";

	return (localhostPaht + projectName);
}

//------------------------------------------------------------------------------

var image1=null;
	$list = $("#fileList"),
	$btn = $("#btn-star"),
	thumbnailWidth = 100;   //缩略图高度和宽度 （单位是像素），当宽高度是0~1的时候，是按照百分比计算
   	thumbnailHeight = 100;  
	state = "pending",
	uploader;
   
	var uploader = WebUploader.create({
		auto: true,
		swf: '${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/Uploader.swf',
	
		// 文件接收服务端。
		server: '${pageContext.request.contextPath }/upload.do',
	
		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick: '.filePicker',
		fileNumLimit: 15,
		//设置可以重复上传
		duplicate :true,
		// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		resize: false,
		// 只允许选择图片文件。
		accept: {
			title: 'Images',
			extensions: 'gif,jpg,jpeg,bmp,png',
			mimeTypes: 'image/*'
		}
	});
	uploader.on( 'fileQueued', function( file ) {
		var $li = $(
			'<div id="' + file.id + '" class="item">' +
				'<div class="pic-box"><img></div>'+
				'<div class="info">' + file.name + '</div>' +
				'<p class="state">等待上传...</p>'+
			'</div>'
		),
		$img = $li.find('img');
		$list.append( $li );
		// 创建缩略图
		// 如果为非图片文件，可以不用调用此方法。
		// thumbnailWidth x thumbnailHeight 为 100 x 100
		uploader.makeThumb( file, function( error, src ) {
			if ( error ) {
				$img.replaceWith('<span>不能预览</span>');
				return;
			}
	
			$img.attr( 'src', src );
			
		}, thumbnailWidth, thumbnailHeight );
	});
	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
		var $li = $( '#'+file.id ),
			$percent = $li.find('.progress-box .sr-only');
	
		// 避免重复创建
		if ( !$percent.length ) {
			$percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo( $li ).find('.sr-only');
		}
		$li.find(".state").text("上传中");
		$percent.css( 'width', percentage * 100 + '%' );
	});
	
	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file ,response) {
		
		image1=response._raw;
		$("#current").find("img").attr("src","${pageContext.request.contextPath}/tmp/"+image1);
		$("#current").find("img").css({"height":"100%","width":"100%","margin-top":"0px"});
		
		var panduan=1;
		 $.each(jsonarray, function (n, value) {  
              if(value.id==index)
              {
               	panduan=2;
               	jsonarray[n].image=response._raw.trim();
               	
              }
              	 
          });
          if(panduan==1)
          {  
				var jsonimage={
					"id":index,
					"image":response._raw.trim()
				}
				jsonarray.push(jsonimage);
		  }
		
		$( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
	});
	
	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
		$( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
	});
	
	// 完成上传完了，成功或者失败，先删除进度条。
	uploader.on( 'uploadComplete', function( file ) {
		$( '#'+file.id ).find('.progress-box').fadeOut();
	});
	uploader.on('all', function (type) {
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

    $btn.on('click', function () {
        if (state === 'uploading') {
            uploader.stop();
        } else {
            uploader.upload();
        }
    });
//----------------------------------22222222-------------------------------


	var image2=null;
	$list = $("#fileList"),
	$btn = $("#btn-star"),
	thumbnailWidth = 100;   //缩略图高度和宽度 （单位是像素），当宽高度是0~1的时候，是按照百分比计算
   	thumbnailHeight = 100;  
	state = "pending",
	uploader;

	var uploader = WebUploader.create({
		auto: true,
		swf: '${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/Uploader.swf',
	
		// 文件接收服务端。
		server: getRootPath()+'/upload.do',
	
		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick: '.default',  //
		fileNumLimit: 10,
		// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		resize: false,
		// 只允许选择图片文件。
		accept: {
			title: 'Images',
			extensions: 'gif,jpg,jpeg,bmp,png',
			mimeTypes: 'image/*'
		}
	});
	uploader.on( 'fileQueued', function( file ) {
		var $li = $(
			'<div id="' + file.id + '" class="item">' +
				'<div class="pic-box"><img></div>'+
				'<div class="info">' + file.name + '</div>' +
				'<p class="state">等待上传...</p>'+
			'</div>'
		),
		$img = $li.find('img');
		$list.append( $li );
		// 创建缩略图
		// 如果为非图片文件，可以不用调用此方法。
		// thumbnailWidth x thumbnailHeight 为 100 x 100
		uploader.makeThumb( file, function( error, src ) {
			if ( error ) {
				$img.replaceWith('<span>不能预览</span>');
				return;
			}
	
			$img.attr( 'src', src );
			
		}, thumbnailWidth, thumbnailHeight );
	});
	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
		var $li = $( '#'+file.id ),
			$percent = $li.find('.progress-box .sr-only');
	
		// 避免重复创建
		if ( !$percent.length ) {
			$percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo( $li ).find('.sr-only');
		}
		$li.find(".state").text("上传中");
		$percent.css( 'width', percentage * 100 + '%' );
	});
	
	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file ,response) {
		
		image2=response._raw;
		
		$("#current").find("img").attr("src","${pageContext.request.contextPath}/"+image2);
		$("#current").find("img").css({"height":"100%","width":"100%","margin-top":"0px"});
		
		
		$( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
	});
	
	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
		$( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
	});
	
	// 完成上传完了，成功或者失败，先删除进度条。
	uploader.on( 'uploadComplete', function( file ) {
		$( '#'+file.id ).find('.progress-box').fadeOut();
	});
	
	uploader.on('all', function (type) {
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
    
    $btn.on('click', function () {
        if (state === 'uploading') {
            uploader.stop();
        } else {
            uploader.upload();
        }
    });
    
    
    $(function(){
   
	$(".fimage").bind("click",function(){
	
		index=$(this).attr("index");
		$("#current").attr("id","");
		$(this).attr("id","current");
		$(".filePicker").find("input").click();
		
	})
	$(".defaultimage").bind("click",function(){
	
		index=$(this).attr("index");
		$("#current").attr("id","");
		$(this).attr("id","current");
		$(".default").find("input").click();
		
	})
})

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
$(document).ready(function(){
	findByidCity();
	findByIdArea();
});
function findByidCity()
{
	var prid=$("#prid").val();
	var ctid="${city}";
	var arid="${arid}";
	if(prid.trim()=="")		//省ID 不能为-1
	{
		prid=-1;   
	}
	
	
	var url="${pageContext.request.contextPath}/admin_daili.do?p=findByidCity";
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
	var url="${pageContext.request.contextPath}/admin_daili.do?p=findByIdArea";
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