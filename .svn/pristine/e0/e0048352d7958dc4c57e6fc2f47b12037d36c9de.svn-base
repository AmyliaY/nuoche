<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
			href="${pageContext.request.contextPath }/lib/lib/Hui-iconfont/1.0.7/iconfont.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/lib/css/css.css"
			rel="stylesheet" type="text/css" />
		<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
		<title>会员管理</title>
	</head>
	<body>
		<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span> 会员中心
		<span class="c-gray en">&gt;</span> 会员等级管理
		<a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i> </a>
		</nav>
		<div class="pd-20">
			<div class="mt-20">
				<table id="tab"
					class="table table-border table-bordered table-hover table-bg table-sort">
					<thead>
						<tr class="text-c">
							<th width="30">
								序号
							</th>
							<th width="40">
								等级称号
							</th>
							<th width="50">
								直推起止人数
							</th>
							
							<th width="70">
								团队起止人数
							</th>
							
							<th width="60">
								团队奖励
							</th>
							
							
							<th width="100">
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="u" varStatus="i">
							<tr class="text-c">
								<td>
									${i.count+(map.page-1)*map.size}
								</td>
								<td>
									${u.djname}
								</td>
								<td>
									<span class="label label-danger radius">${u.djbegintui}-${u.djendtui}</span>
								</td>
								
								<td>
									<span class="label label-danger radius">${u.djbegintuan}-${u.djendtuan}</span>
								</td>
								
								<td>
									<input style="text-align: center;"  align="middle"   class="input-text" type=text name="money"  id="money${u.djid}" value="${u.djtuanjiangli}"/>
								</td>
								
								
								<td class="td-manage">
									<a style="text-decoration: none" onclick="go(${u.djid})"
									href="javascript:void(0)" title="保存">
										<span style="width: 100px;height: 20px;" class="label label-success radius">保存 </span>
									</a>
									
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/layer/2.1/layer.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/laypage/1.2/laypage.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/My97DatePicker/WdatePicker.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/datatables/1.10.0/jquery.dataTables.min.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/js/H-ui.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/js/H-ui.admin.js">
</script>
		<script type="text/javascript">


function go(id)
{
   var money = $.trim($("#money"+id).val());
   if (isNaN(money))
   {
       layer.msg("金额只能是数字", {
					icon : 6,
					time : 1000
				});
	  return;	
   }
   if (money<=0)
   {
      layer.msg("金额不能小于0", {
					icon : 6,
					time : 1000
				});
	  return;			
   }
   var url = "${pageContext.request.contextPath}/dengji.do?p=updateDenjiTanduiJiangli";
   $.ajax({
      url:url,
      data:{
                money:money,
                id:id,
                gid:'${param.gid}'
                },
      async:true,
      type:"post",
      success: 
      function(data){
                       layer.msg("修改成功", {
					    icon : 6,
					     time : 1000
				         });
				  }           
   
   });
  
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