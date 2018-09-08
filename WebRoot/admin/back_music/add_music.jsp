<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>添加歌曲</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath }/lib/lib/static/h-ui/css/H-ui.min.css" />
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath }/lib/lib/static/h-ui.admin/css/H-ui.admin.css" />
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath }/lib/lib/Hui-iconfont/1.0.7/iconfont.css" />
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath }/lib/lib/icheck/icheck.css" />
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath }/lib/lib/static/h-ui.admin/skin/default/skin.css"
			id="skin" />
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath }/lib/lib/static/h-ui.admin/css/style.css" />
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath }/lib/lib/webupload/webuploader.css">

	</head>

	<body>
		<input id="issearch" type="hidden" value="${search }">
		<input id="searchName" type="hidden" value="${name }">
		<article class="page-container">
		<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 歌曲管理 <span class="c-gray en">&gt;</span> 新增歌曲</nav>
		<form id="f" action="" method="post" class="form form-horizontal">

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
					<span class="c-red">*</span>名称:
				</label>
				<div class="formControls col-xs-8 col-sm-7">
					<input type="text" class="input-text" value="" placeholder=""
						id="name" name="name">
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
					<span class="c-red">*</span>等级:
				</label>
				<div class="formControls col-xs-8 col-sm-7">
				    <span class="select-box" style="width: 150px;">
					<select class="select" name="denjiId" id="denjiId">
					   <c:forEach items="${list}" var="d">
					      <option value="${d.id}">${d.name}</option>
					   </c:forEach>
					</select>
					</span>
				</div>
			</div>
			
			<div class="row cl">
			              <label class="form-label col-xs-4 col-sm-3">
					          <span class="c-red">*</span>歌曲:
				          </label>
				               <div class="formControls col-xs-8 col-sm-7">
								<div class="uploader-list-container"
									style="width: 380px;height: 100px">
									<div class="queueList"  style="height: 60px">
										<div id="dndArea">
											<div id="fileList" class="uploader-list"></div>
										</div>
									</div>
									<div class="uploader-thum-container">
										<div id="filePicker" style="margin-top: 2px">选择文件</div>
										<input type="hidden" name="file" id="fileUpload" value="">
									</div>
								</div>
							</div>	
			</div>


			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">
					<span class="c-red">*</span>状态:
				</label>
				<div class="formControls col-xs-8 col-sm-7">
				    <span class="select-box" style="width: 150px;">
					<select id="status" name="status" class="select"
						style="">
						<option value="0">
							禁用
						</option>
						<option value="1">
							启用
						</option>
					</select>
					</span>
				</div>
			</div>


			<div class="row cl">
				<div class="col-xs-8 col-sm-7 col-xs-offset-4">
					<input class="btn btn-primary radius" type="button"
						value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onClick="add_lunbo()"
						style="margin-left: 30%;">
				</div>
			</div>
		</form>
		</article>

		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/layer/2.1/layer.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/icheck/jquery.icheck.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/jquery.validation/1.14.0/validate-methods.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/jquery.validation/1.14.0/messages_zh.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/static/h-ui/js/H-ui.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/static/h-ui.admin/js/H-ui.admin.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/webupload/webuploader.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/admin/js/pingtai/select_jquery.select.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/UEditor/ueditor.config.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/UEditor/ueditor.all.min.js"> </script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/UEditor/lang/zh-cn/zh-cn.js"></script>
		<script type="text/javascript">

		//得到工程路径
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

var path = getRootPath() ; 

$list = $("#fileList"),
	$btn = $("#btn-star"),
	state = "pending",
	uploader;
	var fileName ;   
    //初始化上传组件
    var uploader = WebUploader.create({
		auto:true,
		swf: getRootPath()+'/lib/lib/webuploader/0.1.5/Uploader.swf',
	
		// 文件接收服务端。
		server: getRootPath()+'/upload.do',
	
		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick: '#filePicker',
	
		// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		resize: false,
		// 只允许选择图片文件。
		method: 'POST'
		/**accept: {
			title: 'Images',
			extensions: 'gif,jpg,jpeg,bmp,png',
			mimeTypes: 'image/*'
		}**/
	});
    uploader.on( 'fileQueued', function( file ) {
		var $li = $(
			'<div id="' + file.id + '" class="item">' +
				'<div class="info">' + file.name + '</div>' +
				'<p class="state">等待上传...</p>'+
			'</div>'
		),
		$img = $li.find('img');
		$list.append( $li );
	
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
	uploader.on( 'uploadSuccess', function( file , response) {
		fileName = response._raw ; 
		$("#fileUpload").val(fileName);
		
		
		$( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
	});
	
	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
		$( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
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

/*轮播-添加*/
function add_lunbo(){
	
	var name =$("#name").val();
	var denjiId = $("#denjiId").val() ;
	var status = $("#status").val() ;
	

	if (name=="" || $.trim(name).length==0) {
		layer.msg('名称不能为空！',{icon: 5,time:2000});
		return;
	}
	
	
	$.ajax({
		url: '${pageContext.request.contextPath }/musicBack.do?p=addMusic',
		type:'POST',
		data: $('#f').serialize(),
		success: function(data){
			layer.msg('添加成功！',{icon: 6,time:2000});
			window.location.href="${pageContext.request.contextPath }/musicBack.do?p=search&x="+Math.random();
			//var index = parent.layer.getFrameIndex(window.name);/*获取索引窗口*/
			//parent.layer.close(index);/*关闭该索引窗口*/
		}
	});
}

/**修改类型0作品1自行编辑2商品**/
function change_edit_type(obj){
	var type = $(obj).val() ; 
	if(type == 0){
		$("#workscontainer").css("display" , "block") ; 
		$("#editcontainer").css("display" , "none");
		$("#shopscontainer").css("display" , "none");
		document.getElementById("shopsid").length=0; 
		
	}
	if(type == 1){
		$("#workscontainer").css("display" , "none") ; 
		$("#editcontainer").css("display" , "block");
		$("#shopscontainer").css("display" , "none");
		document.getElementById("worksid").length=0; 
		document.getElementById("wshopsid").length=0; 
		
	}
	if(type ==2){
		$("#shopscontainer").css("display" , "block") ; 
		$("#editcontainer").css("display" , "none");
		$("#workscontainer").css("display" , "none");
		document.getElementById("worksid").length=0; 
		
	} 
	if(type ==""){
		$("#shopscontainer").css("display" , "none") ; 
		$("#editcontainer").css("display" , "none");
		$("#workscontainer").css("display" , "none");
		document.getElementById("worksid").length=0; 
		document.getElementById("wshopsid").length=0;
	} 
}

$("#shopstype").change(function(){
document.getElementById("worksid").length=0; 
var type = $("#shopstype").val();
		if(type!=0){
			getShopByStype();
		}else
		document.getElementById("shopsid").length=0; 
       });
function getShopByStype(){
	var type = $("#shopstype").val();
	document.getElementById("shopsid").length=0; 
	 var url ="${pageContext.request.contextPath }/daililunboManager.do?p=getShopsBytype";
       $.post(url,{type:type }, function(data){   
       		var json2 = eval("("+data+")");
       		for(var i=0;i<json2.length;i++){
				var op2 = new Option(json2[i].name,json2[i].id);
             document.getElementById("shopsid").add(op2);
			}
       });
}
$("#workstype").change(function(){
document.getElementById("shopsid").length=0; 
var type = $("#workstype").val();
		if(type!=0){
			getWorkByStype();
		}else
		document.getElementById("worksid").length=0; 
       });
function getWorkByStype(){
	var type = $("#workstype").val();
	document.getElementById("worksid").length=0; 
	 var url ="${pageContext.request.contextPath }/daililunboManager.do?p=getWorksBytype";
       $.post(url,{type:type }, function(data){   
       		var json2 = eval("("+data+")");
       		for(var i=0;i<json2.length;i++){
				var op2 = new Option(json2[i].name,json2[i].id);
             document.getElementById("worksid").add(op2);
			}
       });
}
</script>
	</body>
</html>
