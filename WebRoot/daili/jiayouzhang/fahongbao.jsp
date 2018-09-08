<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/BackstageWebsite/lib/html5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/BackstageWebsite/lib/respond.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/BackstageWebsite/lib/PIE_IE678.js"></script>
<![endif]-->
<link href="${pageContext.request.contextPath}/lib/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/lib/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/lib/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/lib/lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/lib/css/hDate.css" type="text/css"></link>
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>资讯列表</title>
<style>
   #show2 {
	display: none;
	position: absolute;
	top: 20%;
	left: 33%;
	width: 33%;
	height: 300px;
	padding: 8px;
	border: 8px solid #E7F1FE;
	background-color: white;
	z-index: 1002;
	overflow: auto;
  }
  
  #bg2 {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 2.5;
	opacity: .25;
	filter: alpha(opacity = 0);
}
</style>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 加油站管理 <span class="c-gray en">&gt;</span> 一键招回</nav>
    <div id="bg2"></div>
	<div id="show2" style="text-align: center;">
		<form id="addForm"
			action=""
			method="post">
			<table id="addTable"
				style=" width:90%;margin:auto;border-collapse:separate; border-spacing:11px;">

				<tr>
					<td width="50%" style="text-align:left;">没来加油天数：</td>
					<td><input type="text" id="date" class="input-text"
						name="date" ></td>
				</tr>
				<tr>
					<td width="50%" style="text-align:left;">红包金额：</td>
					<td><input type="text" name="money" class="input-text"
						id="money" /><span id="msg" style="font-size:12px;"></span></td>
				</tr>
				
				<tr>
					<td width="50%" style="text-align:left;">加油金额 ：</td>

					<td><input type="text" name="money2" class="input-text"
						id="money2" /><span id="msg" style="font-size:12px;"></span></td>
				</tr>
				
				<tr>
					<td width="50%" style="text-align:left;">到期天数 ：</td>

					<td><input type="text" name="date2" class="input-text"
						id="date2" /><span id="msg" style="font-size:12px;"></span></td>
				</tr>
				
				<tr>
					<td width="50%" style="text-align:left;">红包类型  ：</td>

					<td><input type="radio" name="type" checked="checked"
						value="2" />汽油
						
						<input type="radio" name="type" 
						value="1" />柴油
						</td>
				</tr>
				
				
				<tr>
					<td width="50%" style="text-align:left;">所属加油站：</td>
					<td><select id="gasstation2" name="gid">
                              <option>所有加油站</option>
					    </select></td>
				</tr>
				<tr>
					<td style="text-align:left;"><input type="button"
						class='btn btn-primary radius'
						onclick="go()"
						style="width:100px;height:30px;line-height:30px;" id="" value="提交" /></td>
					<td style="text-align:right;"><input id=""
						class='btn btn-danger radius'
						style="width:100px;height:30px;line-height:30px;" type="button"
						value="取消" onclick="hidediv2(2);" /></td>
				</tr>
			</table>
		</form>
	</div>
	
<div class="pd-20" sytle="height:150px;">
	<div class="text-c"> 
	 
                                         <select id="jiaYouZhan" style="border:1px #cccccc solid;color:gray;height:30px;width:150px" >
                                            <option >请选择加油站</option>
                                        	 <c:forEach items="${map.listStation}" var="station">
	                                         	<option value="${station.gid}">${station.gname}</option>
	                                         </c:forEach>
                                        </select>
                                        
                                                                      
                                      
                                          <span class="dingdanbianhao">输入没来加油天数:</span>
                                        <input  id="date"  type="text" value="${param.date}" style="border:1px #cccccc solid;color:gray;height:30px;" />
                                        <button id="chaxun11" class="btn btn-success" ><i class="Hui-iconfont">&#xe665;</i>查询</button>  
                                        <button id="chaxun12" class="btn btn-success" ><i class="Hui-iconfont">&#xe665;</i>发红包</button>    
                                        </h3>
		
	</div>
	
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					
                                                        <th>微信号</th>
                                                        <th>昵称</th>
                                                        <th>所属加油站</th>
                                                        <th>最近加油时间</th>
                                                        
				</tr>
			</thead>
			<tbody>
			 <c:if test="${empty map.list }">
                                                <tr  align="center" class="d"><td colspan="9">无相应的查询记录</td></tr>
                                                </c:if>
                                                <c:forEach items="${map.list}" var="order">
                                                    <tr align="center" class="d">
                                                       
                                                        <td style="text-align: center;">${order.openid}</td>
                                                        <td style="text-align: center;">${order.nickname}</td>
                                                        <td style="text-align: center;">
                                                           ${order.jiayouStation.gname }
                                                        </td>
                                                        <td style="text-align: center;">
                                                           ${order.lastJiayouTime}
                                                        </td>
                                                  <td>      
                                                        
                                                                                                                                                     
                                                       
                                                        
                                                    </tr>                                                
                                             </c:forEach>  
		 
			</tbody>
		</table>
	</div>
		
</div>
<div style="width:100%;text-align: center;">

 <a  class="btn btn-primary radius" href="${pageContext.request.contextPath}/order.do?method=showorder&page=1&size=5&start_date=${map.start_date}&end_date=${map.end_date}">首页</a> 
                                         <a class="btn btn-primary radius" href="${pageContext.request.contextPath}/order.do?method=showorder&page=${map.page-1}&size=${map.size}&start_date=${map.start_date}&end_date=${map.end_date}">上一页</a>
                                          <a class="btn btn-danger radius">共<span>${map.count}</span>页</a>
                                         <a class="btn btn-primary radius" href="${pageContext.request.contextPath}/order.do?method=showorder&page=${map.page+1}&size=${map.size}&start_date=${map.start_date}&end_date=${map.end_date}">下一页</a>
                                        <a class="btn btn-primary radius" href="${pageContext.request.contextPath}/order.do?method=showorder&page=${map.total}&size=${map.size}&start_date=${map.start_date}&end_date=${map.end_date}">尾页</a> 
                                       
                                        </div>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/lib/My97DatePicker/WdatePicker.js"></script>                                       
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/lib/jquery/1.9.1/jquery.min.js"></script>
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
                                           
                                            var jiaYouZhan = jQuery('#jiaYouZhan').val();
                                            if (jiaYouZhan=="请选择加油站")
                                                jiaYouZhan="";
                                            var date = jQuery('#date').val();
                                                                               
                                               //向服务器发送请求
                                             location ="${pageContext.request.contextPath}/daili_jiayouzhang.do?p=getUser&gid="+jiaYouZhan+"&date="+date;
                                            
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
                                          
                                          if ('${param.gid}')
                                          jQuery('#jiaYouZhan').val('${param.gid}');
                                          
                                          
                                          
                                      //新增
		var a = null;
		function addDiv(i) {
			a = i;
			var bg2 = document.getElementById("bg2");
			var show2 = document.getElementById("show" + i);
			bg2.style.display = "block";
			show2.style.display = "block";
			var request = new XMLHttpRequest();
			request.open("post",
					"${pageContext.request.contextPath}/daili_jiayouzhang.do?method=getAllGs&x="
							+ Math.random());
			request.send(null);
			request.onreadystatechange = function(){
				if (request.readyState == 4 && request.status == 200) {
					var ret = request.responseText;
					var json = eval(ret);
					var sel = document.getElementById("gasstation"+a);
					//sel.innerHTML="";
					for (var i = 0; i < json.length; i++) {
						var op = new Option(json[i].gname, json[i].gid);
						sel.add(op);
					}
				}
			}
		}
		
		
		$("#chaxun12").click(function(){
		    addDiv(2);
		   
		});
		
		
		$("#addSubmit").click(
				function() {
				
				});
		    
        function hidediv2(i) {
			document.getElementById("bg2").style.display = 'none';
			document.getElementById("show" + i).style.display = 'none';
			document.getElementById("msg").innerHTML = "";
		}
		
		
		function go()
		{
		 
		  var date1  = $("#date").val();
		  var date2  = $("#date2").val();
		  var money1 = $("#money").val();
		  var money2 = $("#money2").val();
		  var gid    = $("#gasstation2").val();
		  var type   = $(":radio:checked").val();
		  
		  if (isNaN(date1) || isNaN(date2))
		  {
		      alert('日期只能是数字');
		      return false;
		  }
		  
		  if (date1<0 || date2<0)
		  {
		     alert('日期不能负数');
		     return false;
		  }
		  
		  
		  
		  
		  if (isNaN(money1) || isNaN(money2))
		  {
		      alert('金额只能是数字');
		      return false;
		  }
		  
		  if (money1<0 || money2<0)
		  {
		     alert('金额不能负数');
		     return false;
		  }
		  
		  var url  = '${pageContext.request.contextPath}/daili_jiayouzhang.do?p=fahongbao';
		  var data = {date1:date1,date2:date2,money1:money1,money2:money2,type:type,gid:gid};
		  var callback = function(d)
		  {
		    
		     hidediv2(2);
		     if(d=="success")
		         alert('发红包成功');
		     else
		         alert(d);
		  }
		  
		  $.post(url,data,callback);
		  
		  
		
		}
</script> 
</body>
</html>
