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
		<title>保险管理</title>
	</head>
	<body>
		<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span> 保险管理
		<span class="c-gray en">&gt;</span> 保单列表
		</nav>
		
			
			<div class="mt-20">
				<table id="tab"
					class="table table-border table-bordered table-hover table-bg table-sort">
					<thead  style="width:80px;">
						<tr class="text-c">
							<th width="40">
								序号
							</th>
							<th>
								保险名称
							</th>
							<th >
								保险金额 
							</th>
							<th >
								是否不计免赔
							</th>
							<th >
								微信昵称
							</th>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="sj" varStatus="i">
							<tr class="text-c">
								<td>
									${i.count}
								</td>
								<td>
									${sj.name }
								</td>
								<td>
									  ${sj.money }
								</td>
								
								<td>
									  ${sj.nomianpei==1 ?'不计':'-' }
								</td>
								
								<td>
										${sj.weixinUser.nickname}
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
		
		
		
		
		

 
//设置商品下架
function xiugai_xianshi(a,id)
{
	var url="${pageContext.request.contextPath}/allgoods.do?p=xiugaixianshi";
	var params={id:id};
	$.post(url,params,function(data){
		layer.msg("修改成功",{icon:6,time:1000});
		setTimeout("go()", 800);
	});
}

//设置商品下架
function xiugai_status(a,id)
{
	var url="${pageContext.request.contextPath}/allgoods.do?p=xiugaistatus";
	var params={id:id};
	$.post(url,params,function(data){
		layer.msg("修改成功",{icon:6,time:1000});
		setTimeout("go()", 800);
	});
}
function go(){
}
//批量下架
function plxiajia()
{
	var checkboxNum=$("input[name=check]:checked").length;
	if(checkboxNum==0)
	{
		layer.msg("请勾选要下架的商品",{icon:6,time:1000});
		return false;
	}
	var checkboxList=new Array();
	$("input[name=check]:checked").each(function(){
		checkboxList.push($(this).val());	//往数组里添加当前checked属性的值
	});
	layer.confirm("确定要下架吗",function(index){
		$.ajax({
		url:"${pageContext.request.contextPath}/allgoods.do?p=plxiajiagoods",
		type:"post",
		data:{'xiajia':checkboxList.toString(),},
		success:function(){
			location.replace(location.href);			
		}
	});
	});
}
//页面跳转
function viewGo()
{
	var page=document.getElementById("page").value;
	if(page.match('^[0-9]*$'))
		{	
         }
}

function baojia(a,id)
{
   
   var  tdPrice = $(a).parent().parent().children("td:eq(4)");
    var tdStatus = $(a).parent().parent().children("td:eq(5)");
   layer.open({  
        id:1,  
        type: 1,  
        title:'报价',  
        skin:'layui-layer-rim',  
        area:['450px', 'auto'],  
        content: ' <div class="row" style="width: 420px;  margin-left:7px; margin-top:10px;">'  
            +'<div class="col-sm-12">'  
            +'<div class="input-group">'  
            //+'<span class="input-group-addon"> 新 密 码   :</span>'  
            +'<input id="price" type="text" class="input-text" placeholder="请输入报价">'  
            +'</div>'  
            +'</div>' 
            +'</div>',
        btn:['保存','取消'],  
        btn1: function (index,layero) {  
           var price = $("#price").val();
           if (price=='')
           {
             alert('不能为空');
             return false;
           }
           
           if (isNaN(price))
           {
              alert('只能是数字');
              return false;
           }
           
           if (price<0)
           {
              alert('价格只能大于0');
              return false;
           }
           
           var url = '${pageContext.request.contextPath}/weixinChexian.do?p=baojia';
           var data = {id:id,price:price};
           var callback = function(data)
           {
               layer.msg("修改成功", {
														icon : 6,
														time : 1000
								});
			 
			 
			  tdPrice.html(price);					
			  tdStatus.html('已报价'); 
           };
           $.post(url,data,callback);
        },  
        btn2:function (index,layero) {  
             layer.close(index);  
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
/*用户-添加*/
function member_add(title, url, w, h) {
	layer_show(title, url, w, h);
}
/*用户-查看*/
function member_show(title, url, id, w, h) {
	layer_show(title, url, w, h);
}
/*资讯-编辑*/
function article_edit(title,url,id,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*用户-停用*/
function member_stop(obj, id) {
	layer
			.confirm(
					'确认要停用吗？',
					function(index) {
						$(obj)
								.parents("tr")
								.find(".td-manage")
								.prepend(
										'<a style="text-decoration:none" onClick="member_start(this,id)" href="${pageContext.request.contextPath}/user.do?p=xiugaistatus&id=${u.uid}" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
						$(obj)
								.parents("tr")
								.find(".td-status")
								.html(
										'<span class="label label-defaunt radius">已停用</span>');
						$(obj).remove();
						layer.msg('已停用!', {
							icon : 5,
							time : 1000
						});
					});
}

/*用户-启用*/
function member_start(obj, id) {
	layer
			.confirm(
					'确认要启用吗？',
					function(index) {
						$(obj)
								.parents("tr")
								.find(".td-manage")
								.prepend(
										'<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
						$(obj)
								.parents("tr")
								.find(".td-status")
								.html(
										'<span class="label label-success radius">已启用</span>');
						$(obj).remove();
						layer.msg('已启用!', {
							icon : 6,
							time : 1000
						});
					});
}

</script>
	</body>
</html>