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
<script type="text/javascript" src="${pageContext.request.contextPath}/BackstageWebsite/lib/html5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/BackstageWebsite/lib/respond.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/BackstageWebsite/lib/PIE_IE678.js"></script>
<![endif]-->
		<link href="${pageContext.request.contextPath}/lib/css/H-ui.min.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/lib/css/H-ui.admin.css"
			rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/lib/css/style.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath}/lib/lib/Hui-iconfont/1.0.7/iconfont.css"
			rel="stylesheet" type="text/css" />
		<link rel="stylesheet"
			href="${pageContext.request.contextPath}/lib/css/hDate.css"
			type="text/css"></link>
		<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
		<title>资讯列表</title>
	</head>
	<body>
		<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span> 订单管理
		<span class="c-gray en">&gt;</span> 订单列表
		
		</nav>
		<div class="pd-20" sytle="height:150px;">
			<div class="text-c">
				<span class="order_search_txt">订单日期:</span>
				<input id="Text1" value="${param.start_date }" class="Wdate"
					style="border: 1px #cccccc solid; color: gray; height: 30px;"
					onfocus="new WdatePicker(this)" type="text" />
				<span>—</span>
				<input id="Text2" value="${param.end_date }" class="Wdate"
					style="border: 1px #cccccc solid; color: gray; height: 30px;"
					onfocus="new WdatePicker(this)" type="text" />
				<select id="jiaYouZhan"
					style="border: 1px #cccccc solid; color: gray; height: 30px; width: 150px">
					<option>
						请选择加油站
					</option>
					<c:forEach items="${map.listStation}" var="station">
						<option value="${station.gid}"  ${station.gid==param.station ? "selected":""}>
							${station.gname}
						</option>
					</c:forEach>
				</select>
				<select id="yuaGong"
					style="border: 1px #cccccc solid; color: gray; height: 30px; width: 150px">
				</select>


				<span class="dingdanbianhao">支付订单编号:</span>
				<input id="orderhao" type="text" value="${param.orderId}"
					style="border: 1px #cccccc solid; color: gray; height: 30px;" />
				<button id="chaxun11" class="btn btn-success">
					<i class="Hui-iconfont">&#xe665;</i>查询
				</button>
				</h3>

			</div>

			<div class="mt-20">
				<table
					class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
						<tr class="text-c">

							<th>
								加油站
							</th>
							<th>
								支付订单
							</th>
							<th>
								下单时间
							</th>
							<th>
								客户姓名
							</th>
							<th>
								订单总额
							</th>
							<th>
								应付金额
							</th>
							<th>
								实付金额
							</th>
							<th>
								支付方式
							</th>
							<th>
								折扣支付
							</th>
							<th>
								余额支付
							</th>
							<th>
								红包支付
							</th>
							<th style="display: none;">
								返余额
							</th>
							<th>
								订单状态
							</th>
							<th>
								加油人员
							</th>
							<th>
								操作
							</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty map.list }">
							<tr align="center" class="d">
								<td colspan="9">
									无相应的查询记录
								</td>
							</tr>
						</c:if>
						<c:forEach items="${map.list}" var="order">
							<tr align="center" class="d">

								<td style="text-align: center;">
									${order.jiayouZhekou.jiayouStation.gname}/${order.jiayouZhekou.oname}
								</td>
								<td>
									${order.orderid}
								</td>
								<td style="text-align: center;">
									${order.time}
								</td>

								<td style="text-align: center;">
									${order.weixinUser.nickname}
								</td>
								<td style="text-align: center;">
									${order.price}
								</td>
								<td style="text-align: center;">
									${order.yinfu}
								</td>

								<td style="text-align: center;">


									<c:if test="${order.status==0}">
                                         /
                                                           </c:if>
									<c:if test="${order.status==1}">
                                           ${order.shifu}  
                                                           </c:if>
								</td>
								<td style="text-align: center;">
									<c:if test="${order.payType==1}">
									         折扣支付
                                                           </c:if>
									<c:if test="${order.payType==2}">
									       余额支付     
                                                           </c:if>
                                                           <c:if test="${order.payType==1}">
									      红包支付
                                                           </c:if>
								</td>
								
								<td style="text-align: center;">
								     <c:if test="${order.payType==1}" var="f">
								          ${order.zhekou*100}%
								     </c:if>
								     
								     <c:if test="${not f}">
								          /
								     </c:if>
								</td>
								
								
								<td style="text-align: center;">
								     <c:if test="${order.payType==2}" var="f">
								          ${order.yuer}%
								     </c:if>
								     
								     <c:if test="${not f}">
								          /
								     </c:if>
								</td>
								
								
								<td style="text-align: center;">
								     <c:if test="${order.payType==3}" var="f">
								          ${order.youhuijuan_money}%
								     </c:if>
								     
								     <c:if test="${not f}">
								          /
								     </c:if>
								</td>
								
								<td style="text-align: center;">
									<c:if test="${order.status==0}">
                                                                                                                                                                                                              未完成
                                                           </c:if>
									<c:if test="${order.status==1}">
                                                                                                                                                                                                             已完成
                                                           </c:if>
								</td>
								
								
								
								<td style="text-align: center;">
									${order.emp.gename}
								</td>
								
								
                                <td style="text-align: center;">
									<c:if test="${order.status==0}">
                                             <button class="btn btn-success">删除</button>
                                                           </c:if>
									<c:if test="${order.status==1}">
                                              / 
                                                           </c:if>
								</td>

							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>

		</div>
		<div style="width: 100%; text-align: center;">

			<a class="btn btn-primary radius"
				href="${pageContext.request.contextPath}/daili_jiayouzhang.do?p=order&page=1&size=10&start_date=${param.start_date}&end_date=${param.end_date}&station=${param.station}&orderId=${param.orderId}&empid=${param.empid}">首页</a>
			<a class="btn btn-primary radius"
				href="${pageContext.request.contextPath}/daili_jiayouzhang.do?p=order&page=${map.page-1}&size=${map.size}&start_date=${param.start_date}&end_date=${param.end_date}&station=${param.station}&orderId=${param.orderId}&empid=${param.empid}">上一页</a>
			<a class="btn btn-danger radius">共<span>${map.count}</span>页</a>
			<a class="btn btn-primary radius"
				href="${pageContext.request.contextPath}/daili_jiayouzhang.do?p=order&page=${map.page+1}&size=${map.size}&start_date=${param.start_date}&end_date=${param.end_date}&station=${param.station}&orderId=${param.orderId}&empid=${param.empid}">下一页</a>
			<a class="btn btn-primary radius"
				href="${pageContext.request.contextPath}/daili_jiayouzhang.do?p=order&page=${map.count}&size=${map.size}&start_date=${param.start_date}&end_date=${param.end_date}&station=${param.station}&orderId=${param.orderId}&empid=${param.empid}">尾页</a>

		</div>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/lib/lib/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/lib/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript">

 jQuery("#jiaYouZhan").change(function(){
                                        	//清空之前的所有员工  
                                        	 jQuery("#yuaGong").html("<option>请选择员工</option>");  
                                        	 if(jQuery("#jiaYouZhan").val()!="请选择加油站"){
                                        	 	jQuery.post("${pageContext.request.contextPath}/daili_jiayouzhang.do?p=getAllEmp" ,{"gid" : jQuery("#jiaYouZhan").val() , "x" : Math.random()} ,
												function(data){	
												     //alert(data);										
													 var json2 = eval("("+data+")");
												     var json = json2[0].geList;
													for(var i = 0 ; i<json.length; i++){
														jQuery("#yuaGong").append("<option value='"+json[i].geid+"'>"+json[i].gename+"</option>");
													}	
												}	
											
											); 
                                        	 }                                  
											 
										}
									
									);
                                         jQuery('#chaxun11').click(function(){
                                         //var path=path;
                                            //获取用户选择的查询开始时间
                                            //alert(111);
                                           
                                            var start_date = jQuery('#Text1').val();
                                            //获取用户选择的查询结束时间
                                            var end_date = jQuery('#Text2').val();
                                            
                                             var orderhao = jQuery('#orderhao').val();
                                             //获得加油站工作人员的名字
                                             
                                             var empName=jQuery('#yuaGong').val();    
                                             
                                             
                                             var jiaYouZhan = $("#jiaYouZhan").val();                                          
                                               //向服务器发送请求
                                             location ="${pageContext.request.contextPath}/daili_jiayouzhang.do?p=order&start_date="+start_date+"&end_date="+end_date+"&orderId="+orderhao+"&empid="+empName+"&station="+jiaYouZhan;
                                            
                                          }); 
                                          
                                          jQuery('#dingdanhao').click(function(){
                                             var orderhao = jQuery('#orderhao').val();
                                             if(orderhao == "")
                                             {
                                               alert("请输入您要查询的订单号");
                                               return;
                                             }else
                                             {
                                             location = "${pageContext.request.contextPath}/order.do?method=findorder_id&orderhao="+orderhao;
                                             }
                                          });

</script>
	</body>
</html>
