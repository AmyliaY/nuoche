<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="smvc" value="${pageContext.request.contextPath}" /> 

<link   href="${smvc }/weixin/css/mui.min.css" rel="stylesheet" type="text/css" />
<script src="${smvc}/weixin/js/mui.min.js"></script>

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
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>加油站管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 加油站管理<span class="c-gray en">&gt;</span> 加油站管理 
<a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" onclick="add_jyz()" >新增加油站</a>
</nav>
<div class="pd-20">
	<div class="text-c"> 
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					                                    <th width="10%">加油站编号</th>
                                                        <th>名称</th>
                                                        <th>地址</th>
                                                        <th>支付帐号</th>
                                                        <th>支付密码</th>
                                                        <th>状态</th>
                                                        <th width="30%">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="item">
                                                    <tr align="center" class="d">
                                                       
                                                        <td style="text-align: center;">${item. gid}</td>
                                                        <td style="text-align: center;">${item.gname }</td>
                                                        <td style="text-align: center;">${item.gaddress }</td>
                                                          <td style="text-align: center;">${item.uid }</td>
                                                          <td style="text-align: center;">${item.token}</td>
                                                        <td style="text-align: center;"><c:if test="${item.gstatus==1 }" >正常营业</c:if>
                                                            <c:if test="${item.gstatus==0 }" >暂停营业</c:if>
                                                        </td>
                                                        <td style="text-align: center;">
                                                        
                                                           <c:choose>
                                                              <c:when test="${param.type==1}">
                                                                  <a href="<%=request.getContextPath()%>/daili_jiayouzhang.do?p=getJYZById&id=${item.gid }" class="btn btn-primary radius" >编辑</a>
                                                              </c:when>
                                                              
                                                              
                                                              <c:when test="${param.type==2}">
                                                                  <a href="<%=request.getContextPath()%>/daili/jiayouzhang/emp_guanli.jsp?id=${item.gid }" class="btn btn-primary radius" >员工列表</a>
                                                              </c:when>
                                                              
                                                              
                                                              <c:when test="${param.type==4}">
                                                                 <a href="<%=request.getContextPath()%>/daili_jiayouzhang.do?p=getAllOilInfo&id=${item.gid }" class="btn btn-primary radius" >油管理</a>
                                                              </c:when>
                                                              
                                                              <c:when test="${param.type==5}">
                    <fmt:formatNumber var="qiyou" value="${item.qiyou_fanxian*100}" pattern=".#"></fmt:formatNumber>  
                    <fmt:formatNumber var="chaiyou" value="${item.chai_fanxian*100}"></fmt:formatNumber> 
                                                            
                                                                  汽油返现<input  type="text" class="input-text" style="width: 50px;text-align: right;" value="${qiyou }">% 
                                                                  柴油返现<input type="text" class="input-text" style="width: 50px;text-align: right;" value="${chaiyou }">%
                         <button onclick="fanxian(this,${item.gid})" type="button" class="btn btn-success radius r">修改</button>                                           
                                                                     
                                                                 
                                                              </c:when>
                                                              
                                                              
                                                              <c:when test="${param.type==8}">
                                                                  <a href="<%=request.getContextPath()%>/daili_jiayouzhang.do?p=getJYZById&id=${item.gid }" class="btn btn-primary radius" >加油记录</a>
                                                              </c:when>
                                                           </c:choose>
                                         
                                         
                                                        </td>
                                                    </tr>
                                                    </c:forEach>
			</tbody>
		</table>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/H-ui.js"></script> 
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
function add_jyz(){
        location="${pageContext.request.contextPath}/daili/jiayouzhang/add_jiayouzhan.jsp";
        target="main";
    }
    
    function fanxian(btn,gid)
    {
       var chaiyou = $(btn).prev();
       var qiyou   = chaiyou.prev();
       var c = chaiyou.val();
       var q = qiyou.val();
       if (isNaN(c) || isNaN(q))
       {
          alert('只能是数字');
          return false;
       }
       
       if (c<0 || q<0)
       {
         alert('不能是负数');
         return false;
       }
       
       var url = '${pageContext.request.contextPath}/daili_jiayouzhang.do?p=jiayouFanxian';
       var data = {gid:gid,c:c,q:q};
       var callback = function(d)
       {
           if(d!="success")
             return d;
          else
             mui.toast("设置成功");
       }
       $.post(url,data,callback);
       
       
    }

</script> 
</body>
</html>
