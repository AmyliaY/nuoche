<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weixin/css/mui.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/weixin/css/mydianpu.css" />
	<link href="${pageContext.request.contextPath }/lib/lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
	<style type="text/css">
		.fimage {
			height: 100px;
			width: 100px;
	   }
	   .fimage img {
		height: 100px;
		width: 100px;
       }
	</style>
	</head>
	<body>
		<header class="mui-bar mui-bar-nav" style="background-color:#FF7900;margin-top: 0px;">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
			<h1 class="mui-title" style="color: white;">我的店铺</h1>
			<a href="javascript:void(0)" class="xiugai" onclick="updianpu()">完成</a>
		</header>
		<div class="mui-content">
			<div class="hang" style="height: 58px;">
				<span class="zi">店铺名称：</span>
				<input type="text" style="height: 38px;line-height: 19px;font-size: 12px;width: 60%;border:0px;" class="shuchu zi" value="${shop.shopname }" id="shopname"/>
			</div>
			<div class="hang" style="height: 58px;">
				<span class="zi">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：</span>
	            <input type="text" style="height: 38px;line-height: 19px;font-size: 12px;width: 60%;border:0px;" class="shuchu zi" value="${shop.shoptel }" id="shoptel"/>
			</div>
			<div class="hang3" style="height: 58px;">
				<span class="zi">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</span>
				<select  class="xiala zi" onchange="getShi()" id="sheng" style="width: 25%;background-color: #ffffff;">
					<option value="${shop.area.city.provice.prId}">${shop.area.city.provice.prName}</option>
				</select>
				<select  class="xiala zi" id="shi" onchange="getXian()" style="width: 25%;background-color: #ffffff;">
				    <option value="${shop.area.city.ctId}">${shop.area.city.ctName}</option>
				</select>
				<select  class="xiala zi" id="xian" style="width: 25%;background-color: #ffffff;" >
					<option value="${shop.area.arId}">${shop.area.arName}</option> 
				</select>
			</div>
			<div class="hang" style="height: 58px;">
				<span class="zi">详细地址：</span>
	            <input type="text" style="height: 38px;line-height: 19px;font-size: 12px;width: 60%;border:0px;" class="shuchu zi" value="${shop.shopaddress }" id="address"/>
			</div>
			<div class="hang3" style="height: 58px;">
				<span class="zi">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</span>
				<select  class="xiala zi" id="shoptype" style="width: 25%;background-color: #ffffff;">
				    <option value="${shop.shoptype.typeid }">${shop.shoptype.typename}</option>
	                <c:forEach items="${typelist }" var="t">
					<option value="${t.typeid }">${t.typename }</option>
					</c:forEach>
				</select>
			</div>
			<div class="hang3" style="height: 58px;">
				<span class="zi">店铺状态：</span>
				 <select class="xiala zi" id="shopstate" style="width: 25%;background-color: #ffffff;">
	                <option value="1">营业</option>
	                <option value="0">休息</option>
	            </select>
	            <!-- <input class="shuchu zi" value="${shop.shopstate==1 ? '营业' : '休息'}" id="shopstate"/> -->
			</div>
			<div class="hang" style="height: 58px;">
				<span class="zi">店铺介绍：</span>
	            <input type="text" style="height: 38px;line-height: 19px;font-size: 12px;width: 60%;border:0px;" class="shuchu zi" value="${shop.shopjieshao }" id="jieshao"/>
			</div>
			<div class="hang2" style="height: 58px;">
				<span class="zi">店铺详情：</span>
	            <textarea style="border: 0px;" class="zi" id="xiangqing">${shop.shopxiangqing }</textarea>
			</div>
			<div class="hang2">
				<span class="zi2">店铺照片：</span>
				<div index=0 class="fimage">
					 <img src="${pageContext.request.contextPath }${shop.shoppicture }" id="img"/>
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
		</div>
		
	</body>
	<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/webuploader.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/layer/2.1/layer.js"></script> 
	<script type="text/javascript">
     function getXian()
       {
       var cityID=document.getElementById("shi").value;
       var request=new XMLHttpRequest();
       document.getElementById("xian").length=0;
       
       request.onreadystatechange=function()
       {
         var xian=document.getElementById("xian");
         if(request.readyState==4 && request.status==200)
         {
            var str=request.responseText;
            var arry=eval(str);
            for(var i=0;i<arry.length;i++)
            {
               var op=new Option(arry[i].arName,arry[i].arId);
               xian.add(op);
            }
            xian.value = ${shop.area.arId};
         }
       }
       request.open("get", "${pageContext.request.contextPath}/wapUser.do?p=getXian&cityID="+cityID, true);
       request.send(null);
     }


     function getShi()
     {
          var provinceID=  document.getElementById("sheng").value;
          var request = new XMLHttpRequest();
          //删除所有市
          document.getElementById("shi").length = 0;
          
	       request.onreadystatechange = function()
	       {
	          var shi =document.getElementById("shi");
	          if (request.readyState==4 && request.status==200)
	          {
	              var str = request.responseText; 
	              var arry = eval(str);
	              for (var i=0;i<arry.length;i++)
	              {
	                 var op = new Option(arry[i].ctName,arry[i].ctId);
	                 shi.add(op);
	              }
	              shi.value = ${shop.area.city.ctId}
	              getXian();
	          }
	       }
       request.open("get", "${pageContext.request.contextPath}/wapUser.do?p=getShi&provinceID="+provinceID,true);
       request.send(null);
     }

    onload = function()
    {
       var request = new XMLHttpRequest();
       
       request.onreadystatechange = function()
       {
          var sheng =  document.getElementById("sheng");
          if (request.readyState==4 && request.status==200)
          {
              var str = request.responseText;
              var arry = eval(str);
              for (var i=0;i<arry.length;i++)
              {
                 var op = new Option(arry[i].prName,arry[i].prId);
                 sheng.add(op);
              }
              getShi();
          }
       }
       request.open("get", "${pageContext.request.contextPath}/wapUser.do?p=getSheng",true);
       request.send(null);
    }
    
	
	    /*文件上传*/
        var index;
		var jsonstr = "[]";
		var jsonarray = eval("(" + jsonstr + ")");
	    
	    function updianpu(){
	        var shopname=document.getElementById("shopname").value;
		    var shoptel=document.getElementById("shoptel").value;
		    var xianid=document.getElementById("xian").value;
		    var address=document.getElementById("address").value;
		    var shoptype=document.getElementById("shoptype").value;
		    var shopstate=document.getElementById("shopstate").value;
		    var jieshao=document.getElementById("jieshao").value;
		    var xiangqing=document.getElementById("xiangqing").value;
		    var IDimage;//店铺图片
		    var userid=${param.userid};
		    var shopid=${shop.shopid};
		    if(shopname==null || ""==shopname){
		       layer.msg("请输入店铺名称",{icon:6,time:1000});
		    }
		    if(shoptel==null || ""==shoptel){
		       layer.msg("请输入联系方式",{icon:6,time:1000});
		    }
		    if(xianid==null || ""==xianid){
		       layer.msg("请选择地址",{icon:6,time:1000});
		    }
		    if(address==null || ""==address){
		       layer.msg("请输入详情地址",{icon:6,time:1000});
		    }
		    if(shoptype==null || ""==shoptype){
		       layer.msg("请选择店铺类别",{icon:6,time:1000});
		    }
		    if(shopstate==null || ""==shopstate){
		       layer.msg("请选择店铺状态",{icon:6,time:1000});
		    }
		    if(jsonarray.length>0){
		        IDimage=jsonarray[0]['image'];//图片的名称
		    }
		    if(jsonarray.length<=0){
		        var dizhi=$("#img").attr("src");
		        IDimage=dizhi.substring(22);
		    }
		    layer.confirm("修改店铺？",function(index){
	         $.post("${pageContext.request.contextPath}/wapUser.do?p=updianpu",
	         {
	           shopname:shopname,
	           shoptel:shoptel,
	           IDimage:IDimage,
	           xianid:xianid,
	           address:address,
	           shoptype:shoptype,
	           shopstate:shopstate,
	           jieshao:jieshao,
	           xiangqing:xiangqing,
	           userid:userid,
	           shopid:shopid
	         },
	         function(){
               layer.msg('修改成功',{inco:1,time:1000},function(){
                  //location.reload();
                  window.top.location="${pageContext.request.contextPath}/wapUser.do?p=getById&userid="+userid;
               });	
	         });
	     });
	    }
	   
	    
	    
	    
	    
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
		var uploader = WebUploader.create({
			auto : true,
			swf : '${path }/lib/webuploader/0.1.5/Uploader.swf',

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
					swf : '${pageContext.request.contextPath }/lib/webuploader/0.1.5/Uploader.swf',

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

			});
		});
	</script>
</html>
