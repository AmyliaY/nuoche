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

		<title>显示歌曲</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath }/weixin/css/mui.min.css">
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
				  <form class="form" id="form" action="${pageContext.request.contextPath}/musicBack.do?p=search" method="post">
						<ul class="mui-table-view">
						   <li class="mui-table-view-cell mui-table">
						          <span class="mui-table-cell mui-col-xs-1">等级</span> 
								  <span class="mui-table-cell mui-col-xs-2">
									  <span class="select-box" style="width: 150px;height: 30px">
										  <select style="margin-top: -10px" size="1" class="select"  name="denjiId" id="denjiId">
										      <option value="">所有级别</option>
										   <c:forEach items="${list}" var="d">
										      <option ${d.id==param.denjiId?"selected":"" } value="${d.id}">${d.name}</option>
										   </c:forEach>
										 </select>
									 </span>
								 </span>	
								<input type=hidden name="page" id="page"/>
							     <div  class="mui-table-cell mui-col-xs-2">
								     <button style="margin-top: -20px;width: 100px;" class="mui-btn mui-btn-success" type=submit>搜索</button>
					             </div>
					      </li>
					    </ul>
				 </form>
				 
		<article class="page-container">
		<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 歌曲管理 <span class="c-gray en">&gt;</span> 歌曲管理</nav>
		<form action="" method="post" class="form form-horizontal">

			<div class="mt-20">
				<table align="center" class="table table-border table-bordered table-bg table-hover table-sort">
		
				<thead>
					<tr class="text-c">
						<th width="10%">名称</th>
						<th width="10%">级别</th>
						<th width="10%">状态</th>
						<th width="10%">操作</th>
					</tr>
				</thead>
				
				<tbody align="center">
				      <c:if test="${not empty map.list}" var="f">
						<c:forEach items="${map.list}" var="d" varStatus="status">
						<tr align="center" class="text-c">
							<td align="center">${d.name}</td>
							<td>${d.MLevel.name}</td>
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
						
						<tr align="center">
						   <td colspan="4">
						       <c:set var="x" value="${(map.page-5>0)? (map.page-5) : 1}"></c:set>
						       <c:set var="y" value="${(map.page+4>map.count)? (map.count) : (map.page+4)}"></c:set>
						       
						       <ul class="mui-pagination">
						           <li class="mui-disabled" >
						              <a href="javascript:void(0)"> 
						                                   当前${map.page}/${map.count}页,共${map.sum}条
						              </a>
						           </li>
						           <c:if test="${map.page<=1}" var="f">
						               <li class="mui-previous mui-disabled" style="margin-left: 10px">
												<a href="javascript:void(0)">
													&laquo;
												</a>
					                   </li>
						           </c:if>
						           
						           <c:if test="${not f}">
						                <li class="mui-previous" style="margin-left: 10px">
												<a href="javascript:fenye(${map.page-1})">
													&laquo;
												</a>
					                   </li>
						           </c:if>
						           
						           <c:forEach begin="${x}" end="${y}" var="i">
						               <li>
											<a href="javascript:fenye(${i})">
												${i}
											</a>
									  </li>
						           </c:forEach>
						           
						           
						           <c:if test="${map.page>=map.count}" var="f">
						                   <li class="mui-next mui-disabled">
												<a href="javascript:void(0)">
													&raquo;
												</a>
											</li>
						           </c:if>
						           
						           
						           <c:if test="${not f}">
						                <li class="mui-previous">
												<a href="javascript:fenye(${map.page+1})">
													&raquo;
												</a>
					                   </li>
						           </c:if>
						   </td>
						</tr>
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
		
		function fenye(p)
		{
		   $("#page").val(p);
		   $("#form").submit();
		}



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
					url:"${pageContext.request.contextPath}/musicBack.do?p=updateStatusByMusic",
					success:function(data){
						if(data=="1"){
							layer.msg('启用成功!',{icon: 5,time:0});
							setTimeout(function(){self.location="${pageContext.request.contextPath}/musicBack.do?p=search"}, 500);
						}else{
							layer.msg('禁用成功!',{icon: 6,time:1000});
							self.location="${pageContext.request.contextPath}/musicBack.do?p=search";
						}
					}
				});
				
			});
		}

		function proxy_update(obj,id,status){
			location="${pageContext.request.contextPath}/musicBack.do?p=updateviewByMusic&id="+id;
		}


</script>
	</body>
</html>
