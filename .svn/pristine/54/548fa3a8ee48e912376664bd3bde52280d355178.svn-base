<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="smvc" value="${pageContext.request.contextPath}" /> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${smvc }/BackstageWebsite/lib/html5.js"></script>
<script type="text/javascript" src="${smvc }/BackstageWebsite/lib/respond.min.js"></script>
<script type="text/javascript" src="${smvc }/BackstageWebsite/lib/PIE_IE678.js"></script>
<![endif]-->
<link href="${smvc }/lib/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${smvc }/lib/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="${smvc }/lib/css/style.css" rel="stylesheet" type="text/css" />
<link href="${smvc }/lib/lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css" />
  <style type="text/css">
  	.menuDetail{
  	   display: none;
  	}
  </style>
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>资讯列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>客户管理<span class="c-gray en">&gt;</span>vip设置</nav>
<div class="pd-20">

<div style="margin-bottom: 10px;">
柴油<br /><br />
一级客户&nbsp;&nbsp;
消费满足金额&nbsp;
<input type="text" id="o11" class="input-text" style="width:100px;"placeholder="${o11 }" oninput="ExistsData(this)"/>&nbsp;
微信支付返现比例&nbsp;
<input type="text" id="o11rt" class="input-text" style="width:100px;"placeholder="${o11rt }" oninput="ExistsData2(this)"/>%&nbsp;
充值返现比例&nbsp;
<input type="text" id="o11cz" class="input-text" style="width:100px;"placeholder="${o11cz }" oninput="ExistsData2(this)"/>%
<a class="btn btn-success radius mr-20" onclick="updatesetting(11)" >修改</a><br /><br />


二级客户&nbsp;&nbsp;
消费满足金额&nbsp;
<input type="text" id="o12" class="input-text" style="width:100px;"placeholder="${o12 }" oninput="ExistsData(this)"/>&nbsp;
微信支付返现比例&nbsp;
<input type="text" id="o12rt" class="input-text" style="width:100px;"placeholder="${o12rt }" oninput="ExistsData2(this)"/>%&nbsp;
充值返现比例&nbsp;
<input type="text" id="o12cz" class="input-text" style="width:100px;"placeholder="${o12cz }" oninput="ExistsData2(this)"/>%
<a class="btn btn-success radius mr-20"  onclick="updatesetting(12)">修改</a><br /><br />

   三级客户&nbsp;&nbsp;
消费满足金额&nbsp;
<input type="text" id="o13" class="input-text" style="width:100px;"placeholder="${o13 }" oninput="ExistsData(this)"/>&nbsp;
微信支付返现比例&nbsp;
<input type="text" id="o13rt" class="input-text" style="width:100px;"placeholder="${o13rt }" oninput="ExistsData2(this)"/>%&nbsp;
充值返现比例&nbsp;
<input type="text" id="o13cz" class="input-text" style="width:100px;"placeholder="${o13cz }" oninput="ExistsData2(this)"/>%
<a class="btn btn-success radius mr-20"  onclick="updatesetting(13)">修改</a><br /><br />

汽油<br /><br />
   一级客户&nbsp;&nbsp;
 消费满足金额&nbsp;
<input type="text" id="o21" class="input-text" style="width:100px;"placeholder="${o21 }" oninput="ExistsData(this)"/>&nbsp;
微信支付返现比例&nbsp;
<input type="text" id="o21rt" class="input-text" style="width:100px;"placeholder="${o21rt }" oninput="ExistsData2(this)"/>%&nbsp;
充值返现比例&nbsp;
<input type="text" id="o21cz" class="input-text" style="width:100px;"placeholder="${o21cz }" oninput="ExistsData2(this)"/>%
<a class="btn btn-success radius mr-20"  onclick="updatesetting(21)">修改</a><br /><br />
 
   二级客户&nbsp;&nbsp;
 消费满足金额&nbsp;
<input type="text" id="o22" class="input-text" style="width:100px;"placeholder="${o22 }" oninput="ExistsData(this)"/>&nbsp;
微信支付返现比例&nbsp;
<input type="text" id="o22rt" class="input-text" style="width:100px;"placeholder="${o22rt }" oninput="ExistsData2(this)"/>%&nbsp;
充值返现比例&nbsp;
<input type="text" id="o22cz" class="input-text" style="width:100px;"placeholder="${o22cz }" oninput="ExistsData2(this)"/>%
<a class="btn btn-success radius mr-20"  onclick="updatesetting(22)">修改</a><br /><br />
   
   三级客户&nbsp;&nbsp;
 消费满足金额&nbsp;
<input type="text" id="o23" class="input-text" style="width:100px;"placeholder="${o23 }" oninput="ExistsData(this)"/>&nbsp;
微信支付返现比例&nbsp;
<input type="text" id="o23rt" class="input-text" style="width:100px;"placeholder="${o23rt }" oninput="ExistsData2(this)"/>%&nbsp;
充值返现比例&nbsp;
<input type="text" id="o23cz" class="input-text" style="width:100px;"placeholder="${o23cz }" oninput="ExistsData2(this)"/>%
<a class="btn btn-success radius mr-20"  onclick="updatesetting(23)">修改</a><br /><br />

</div>

</div>




<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js" type="text/javascript" language="javascript"></script>

   <script type="text/javascript">       

	   function ExistsData(obj){		 
           obj.value = obj.value.replace(/[^0-9]/g,'');
 		 
          } 
	   function ExistsData2(obj){
   
           obj.value = obj.value.replace(/[^0-9]/g,'');
           if(obj.value >100)
        	   obj.value = obj.value.substring(0,2);
  
          }
   
         function updatesetting(index){

          		 var vipgrade  = document.getElementById("o"+index);
          		var remo  = document.getElementById("o"+index+"rt");
          		var recz  = document.getElementById("o"+index+"cz");

          		if(vipgrade.value==""&&remo.value==""&&recz.value==""){
                    alert("输入值为空");
                    return;
                    }

          		if(vipgrade.value=="")
          			vipgrade.value=vipgrade.getAttribute("placeholder");
                if(remo.value=="")
                	remo.value=remo.getAttribute("placeholder");
                if(recz.value=="")
                	recz.value=recz.getAttribute("placeholder");
                

                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/daili_jiayouzhang.do?method=updatvipsetting&ran="+new Date().getTime(),  
                    dataType:"json",  
                    data: { 
                    	index:index,
                    	vipgrade : vipgrade.value ,
                    	remo : remo.value ,
                    	recz : recz.value   },  
                    success: function(data) {
                       if(data.flag==1){
                        alert("修改成功！"); 
                        vipgrade.setAttribute("placeholder",data.vipgrade);
                        remo.setAttribute("placeholder",data.remo);
                        recz.setAttribute("placeholder",data.recz);

   			 		}else
   			 		alert("修改失败");			
                                           
                    },
                    error: function(data) {
                        alert("网络异常，提交失败");
                    }
                })
                
            
          		}
				
			
		
          </script>
</body>
</html>
