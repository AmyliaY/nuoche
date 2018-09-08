<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="smvc" value="${pageContext.request.contextPath}" /> 

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
 <style>
    #main td{
    overflow: hidden;
    height:50px;
    }
    #detail{
   
    word-break:break-all;
    }
    </style>
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>资讯列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 油类管理 <span class="c-gray en">&gt;</span> 油类列表 </nav>
<div class="pd-20">
<span style="cursor:pointer;margin-left:100px;display: none;">
										    <input type="button" class="btn btn-primary radius" id="showGS" onclick="showGS()" value="根据加油站分类" style="height:30px;width:150px">
											</span>
 					<span style="cursor:pointer;margin-right:800px;float:right;">
											<select id="jiaYouZhan" style="display:none;height:30px;width:150px" onchange="gsChange()" >
                                  
                                            </select>
											</span>


	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort" width="75%">
			<thead>
				<tr class="text-c">
					 <th>油类编号</th>
                                                        <th>油类名称</th>
                                                        <th>父类名称</th>
                                                        <th>油类价格</th>
                                                        <th>折扣</th>
                                                        <th>操作</th>
				</tr>
			</thead>
			<tbody>
				 <c:forEach items="${oilList }" var="oilList" varStatus="index">
                                                   
														<tr align="center" class="d">
															<td  style="text-align: center;" width="10%">${oilList.oid }</td>
															<td   style="text-align: center;" width="20%">${oilList.oname }</td>
															<td style="text-align: center;">${ostyle[oilList.ostyle2] }-${oilList.ostyle2 }</td>
															<td  style="text-align: center;" width="10%">${oilList.oprice }</td>
															<td  style="text-align: center;" id="detail">${oilList.zhekou }</td>
															<td>
															
															</td>
														</tr>
														
													</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<script type="text/javascript">
function gsChange(){

	var gid = document.getElementById("jiaYouZhan").value;
    location = "${smvc }/youleiguanliback.do?method=oilList&choose="+gid;
}
function showGS(){
    var request = new XMLHttpRequest();
    request.open("post" , "${pageContext.request.contextPath}/gasempback.do?method=getAllGs&x="+Math.random());
    request.send(null);
	
    request.onreadystatechange = function(){
	if(request.readyState==4  && request.status ==200){
        
		var ret = request.responseText;
		var json = eval(ret);
		var sel = document.getElementById("jiaYouZhan");
		sel.innerHTML="";
		var op= new Option("请选择加油站" , "0" );
		sel.add(op);	
		for(var i = 0 ; i < json.length ; i ++){				    
			var op1= new Option(json[i].gname , json[i].gid );
			sel.add(op1);					
		}		
	}

}
document.getElementById("jiaYouZhan").style.display="block";
document.getElementById("showGS").style.display="none";
 }

</script> 
</body>
</html>
