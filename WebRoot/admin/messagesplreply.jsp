<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>回复消息</title>
</head>
<style>
.comment-main {
	width: 400px;
}

.comment-main2 {
	position: relative;
	margin-left: 278px;
	border: 1px solid #dedede;
	border-radius: 2px;
	width: 400px;
}

.comment-main2:before, .comment-main2:after {
	position: absolute;
	top: 11px;
	left: 100%;
	right: -16px;
	width: 0;
	height: 0;
	display: block;
	content: " ";
	border-color: transparent;
	border-style: solid solid outset;
	pointer-events: none
}

.comment-main2:after {
	border-width: 7px;
	border-left-color: #f8f8f8;
	margin-bottom: 1px;
	margin-right: 2px
}

.rr {
	border: 1px solid transparent;
	float: right;
}

.commentList .comment-flip .avatart {
	float: left;
}
</style>
<body
	style="background:#FFFFF;">
	<div class="pd-20">
		<div style="width: 140px; text-align: center; position: absolute;">
			<c:forEach items="${list}" var="l">
				<div
					style="margin-top: 20px; width: 140px; background-color: #73ACCA"
					id="head-div">
					<a
						href="${pageContext.request.contextPath}/uamessages.do?p=plsetmsg&id=${l.meid}&usersid=${l.userinfo.usersId}">
						<i class="avatar size-XL radius">
						<c:choose>
							<c:when test="${l.userinfo.usersHeadimg==null}">
								<img alt="" src="${pageContext.request.contextPath}/admin/images/0.jpg">
							</c:when>
							<c:otherwise> 
								<img alt="" src="${pageContext.request.contextPath}/${l.userinfo.usersHeadimg}">
				   			</c:otherwise>
						</c:choose>
					
					</i>
					</a>
				</div>
			</c:forEach>
		</div>
		<div style="margin-left: 150px; margin-top: -5px">
			<div class="form form-horizontal" id="form-article-add">
				<div id="msgdetail">
					<c:forEach items="${msglist}" var="ml">
						<c:if test="${ml.mefangxiang==1}" var="f">
							<ul class="commentList">
								<li class="item cl"><a href="#"><i
										class="avatar size-L radius">
										
										<c:choose>
											<c:when test="${ml.userinfo.usersHeadimg==null}">
												<img alt="" src="${pageContext.request.contextPath}/admin/images/0.jpg">
											</c:when>
											<c:otherwise> 
												<img alt="" src="${pageContext.request.contextPath}/${ml.userinfo.usersHeadimg}">
								   			</c:otherwise>
										</c:choose>	
											
									
									</i> </a>
									<div class="comment-main">
										<header class="comment-header">
											<div class="comment-meta">
												<a class="comment-author" href="#">${ml.userinfo.usersName}</a>
												发送于
												<time
													title="<fmt:formatDate value="${msg.metime}" pattern="yyyy年MM月dd日  HH:mm:ss"/>"
													datetime="2014-08-31T03:54:20">
													<fmt:formatDate value="${ml.metime}"
														pattern="yyyy-MM-dd HH:mm:ss" />
												</time>
											</div>
										</header>
										<div class="comment-body">
											<input type="hidden" value="${ml.smdetail}" class="smd">
											<p>
												<c:choose>
													<c:when test="${fn:substring(ml.smdetail,0,4)=='img:'}">
														<img width="250" height="250" alt=""
															src="${pageContext.request.contextPath}/messageImages/${fn:substring(ml.smdetail,4,fn:length(ml.smdetail))}">
													</c:when>
													<c:when test="${fn:substring(ml.smdetail,0,5)==':time'}">
														用户查看了一下
													</c:when>
													<c:otherwise> 
										 		  		${ml.smdetail}
										   			</c:otherwise>
												</c:choose>
												<!-- 
												<div style="float: left;">
													<img id="g-img" style="width: 100px;height: 100px;" src="${pageContext.request.contextPath }/admin/images/a.jpg">
												</div>
												<div style="margin-left: 120px;">
													<span id="g-name">葡萄葡萄葡萄葡萄葡萄葡萄葡萄葡萄葡萄葡萄葡萄葡萄葡萄葡萄葡萄葡萄葡萄葡萄</span></br>
													<span id="g-price">￥33</span></br>
													<span id="g-num">累积销售:1111</span></br>
												</div>
												 -->

											</p>
										</div>
									</div></li>
							</ul>
						</c:if>
						<c:if test="${ml.mefangxiang==0}" var="f">
							<ul class="commentList">
								<li class="item cl">
									<div style="margin-right: 220px;">
										<a href="#"><i class="avatar size-L radius"><img
												alt=""
												src="${pageContext.request.contextPath}/lib/images/admin.jpg">
										</i> </a>
									</div>
									<div class="comment-main">
										<header class="comment-header">
											<div class="comment-meta">
												<a class="comment-author" href="#">${ml.admin.adminName}</a>
												回复于
												<time
													title="<fmt:formatDate value="${msg.metime}" pattern="yyyy年MM月dd日  HH:mm:ss"/>"
													datetime="2014-08-31T03:54:20">
													<fmt:formatDate value="${ml.metime}"
														pattern="yyyy-MM-dd HH:mm:ss" />
												</time>
											</div>
										</header>
										<div class="comment-body">
											<p>
										 		  		${ml.smdetail}
											</p>
										</div>
									</div>
								</li>
							</ul>
						</c:if>
					</c:forEach>
				</div>
				<div class="row cl" style="display: none" id="detail">
					<label class="form-label col-2"> 回复内容： </label>
					<div class="formControls col-10">
						<script id="editor" type="text/plain"
							style="width:100%;height:100px;">
</script>
					</div>
				</div>
				<div class="row cl">
					<div class="col-10 col-offset-9">
						<button onclick="return add()" id="sub"
							class="btn btn-primary radius" type="submit">
							<i class="Hui-iconfont">&#xe632;</i> 回复
						</button>
					</div>
				</div>
				<div class="row cl">
					<div class="col-10 col-offset-9">
						<button onclick="return quxiao()" id="sub"
							class="btn btn-primary radius" type="submit">
							<i class="Hui-iconfont">&#xe632;</i> 取消
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/layer/2.1/layer.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/My97DatePicker/WdatePicker.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/icheck/jquery.icheck.min.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/Validform/5.3.2/Validform.min.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/webuploader.min.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/ueditor/1.4.3/ueditor.config.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/ueditor/1.4.3/ueditor.all.min.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/js/H-ui.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/js/H-ui.admin.js">
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/lib/js/ajaxfileupload.js">
</script>
	<script type="text/javascript">
$(document).ready(function(){
	
	$(".smd").each(function(){
		var smd=$(this).val();
		var http=smd.substring(0,smd.lastIndexOf("=")+1);
		var gid=smd.substring(smd.lastIndexOf("=")+1);
		if(http=="http://myshop.com/kufu.htm?id=")
		{
			var dl=$(this).parent().find("p");
			dl.html("");
			$
			.ajax( {
				url : "${pageContext.request.contextPath}/uamessages.do?p=getAllGoods",
				type : "post",
				data : {
					gid : gid
				},
				success : function(data) {
					var goods = eval("(" + data + ")");
					var str='<div style="float: left;">'+
							'<img id="g-img" style="width: 100px;height: 100px;" src="${pageContext.request.contextPath }/'+goods[0].gimages+'">'+
							'</div>'+
					'<div  style="margin-left: 120px;">'+
						'<span id="g-name">'+goods[0].gname+'</span></br>'+
						'<span id="g-price">￥'+goods[0].gprice+'</span></br>'+
						'<span id="g-num">累积销售:'+goods[0].gcollectionsnum+'</span></br>'+
					'</div>';
					dl.html(""+str+"");
				}
			});
		}
	});
});
var ue = UE.getEditor('editor');
function add() {
	document.getElementById("detail").style.display = 'block';
	var editor = ue.getContentTxt();
	$("#smdetail").attr("value", editor);
	if (editor == null || "" == editor || " "==editor) {
		layer.msg("请输入内容", {
			icon : 6,
			time : 1000
		});
		return false;
	}
	$
			.ajax( {
				url : "${pageContext.request.contextPath}/uamessages.do?p=replymessages&usersid=${msg.userinfo.usersId}&meid=${msg.meid}&type=2",
				type : "post",
				data : {
					smdetail : editor
				},
				success : function(data) {
					var msg = eval("(" + data + ")");
					var str = '<ul class="commentList"><li class="item cl">'
							+ '<div style="margin-right: 220px;"><a href="#"><i class="avatar size-L radius" style="float: right;"><img alt=""src="${pageContext.request.contextPath}/lib/images/admin.jpg"></i></a></div>'
							+ '<div class="comment-main2">'
							+ '<header class="comment-header">'
							+ '<div class="comment-meta">'
							+ '<a class="comment-author" href="#">'+msg[0].admin.adminName+'</a> 回复于'
							+ '<time title="" datetime="2014-08-31T03:54:20">'
							+ '  '+msg[0].metime+''
							+ '</time>' + '</div>' + '</header>'
							+ '<div class="comment-body">'
							+ '<p>'+msg[0].smdetail+'</p></div></div>'
							+ '</li></ul>';
					var xx = document.getElementById("msgdetail");
					xx.innerHTML += str;
					ue.setContent("");
					document.getElementById("detail").style.display = 'none';
					//layer.msg("回复成功",{icon:6,time:1000},function(){
					//window.location.href="${pageContext.request.contextPath}/uamessages.do?p=plreplymessagesview";
					//})
				}
			});
}
function quxiao() {
	window.location.href = "${pageContext.request.contextPath}/uamessages.do?p=messageslisting";
}
$(function() {
	$('.table-sort tbody').on('click', 'tr', function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});
});
</script>
</body>
</html>