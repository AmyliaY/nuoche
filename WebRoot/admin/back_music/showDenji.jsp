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

		<title>显示等级</title>

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
		<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 歌曲管理 <span class="c-gray en">&gt;</span> 歌曲等级管理</nav>
		<form action="" method="post" class="form form-horizontal">

			<div class="mt-20">
			<table align="center" class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="10%">名称</th>
						<th width="10%">折扣</th>
						<th width="10%">状态</th>
						<th width="10%">操作</th>
					</tr>
				</thead>
				
				<tbody align="center">
				      <c:if test="${not empty list}" var="f">
						<c:forEach items="${list}" var="d" varStatus="status">
						<tr align="center" class="text-c">
							<td align="center">${d.name}</td>
							<td>${d.zhekou}</td>
							<td class="td-status">
								<c:if test="${d.status==1}"><span class="label label-success radius">已启用</span></c:if>
								<c:if test="${d.status==0}"><span class="label label-defaunt radius">已禁用</span></c:if> 
							</td>
							<td class="td-manage"  id="name${d.status}">
								<c:if test="${d.status==1}">
									<a style="text-decoration:none" onClick="proxy_start(this,'${d.id}',${d.status})" href="javascript:;" title="禁用"><i class="Hui-iconfont"><span class="label label-danger radius">禁用</span></i></a>
								</c:if>
								
								<c:if test="${d.status==0 }">
									<a style="text-decoration:none" onClick="proxy_start(this,'${d.id}',${d.status})" href="javascript:;" title="启用"><i class="Hui-iconfont"><span class="label label-success radius">启用</span></i></a>
									
								</c:if>
								<a style="text-decoration:none" onClick="proxy_update(this,'${d.id}',${d.status})" href="javascript:;" title="编辑"><i class="Hui-iconfont"><span class="label label-success radius">编辑</span></i></a>
							</td>
						</tr>
						</c:forEach>
					</c:if>
					
					<c:if test="${not f}">
					   <tr align="center">
					      <td colspan="4" align="center"> 暂无数据</td>
					   </tr>
					</c:if>
					
				</tbody>
			</table>
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
		<script src="${pageContext.request.contextPath}/admin/js/upload.js"></script>
		<script type="text/javascript">



		function proxy_start(obj,id,status){
			var title = '确认要启用吗？';
			if (status==1)
				title = '确认要禁用吗？';
			layer.confirm(title,function(index){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="proxy_stop(this,\''+id+'\')" href="javascript:;" title="禁用"><i class="Hui-iconfont"><span class="label label-danger radius">禁用</span></i></a>');
				$("#status"+id).html('<span class="label label-success radius">已通过</span>');
				$(obj).remove();
				$.ajax({
					type: "post",
					data: {id:id},
					url:"${pageContext.request.contextPath}/musicBack.do?p=updateStatus",
					success:function(data){
						if(data=="1"){
							layer.msg('启用成功!',{icon: 5,time:0});
							setTimeout(function(){self.location="${pageContext.request.contextPath}/musicBack.do?p=showDenji"}, 500);
						}else{
							layer.msg('禁用成功!',{icon: 6,time:1000});
							self.location="${pageContext.request.contextPath}/musicBack.do?p=showDenji";
						}
					}
				});
				
			});
		}

		function proxy_update(obj,id,status){
			location="${pageContext.request.contextPath}/musicBack.do?p=updateview&id="+id;
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
