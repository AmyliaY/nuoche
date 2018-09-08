<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
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
<link href="${smvc }/css/mui.min.css" rel="stylesheet" />

  <style type="text/css">
  	.menuDetail{
  	   display: none;
  	}
  		#bg {
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
				filter: alpha(opacity=0);
			}
			
			#show {
				display: none;
				position: absolute;
				top: 150px;
				left: 34%;
				width: 30%;
				height: 290px;
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
				filter: alpha(opacity=0);
			}
			
		#show2 {
				display: none;
				position: absolute;
				top: 100px;
				left: 34%;
				width: 30%;
				height: 400px;
				padding: 8px;
				border: 8px solid #E7F1FE;
				background-color: white;
				z-index: 1002;
				overflow: auto;
			}
  </style>
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>资讯列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>客户管理<span class="c-gray en">&gt;</span>vip管理</nav>


<div class="pd-20">
<!-- 
<input class="input-text" type="input" id="NN" placeholder="输入姓名或电话号码" style="width:200px;margin-right: 10px;" />
<Button  class="btn btn-primary radius" onclick="getUserByNN();" >搜索</Button>
充值金额大于<input class="input-text" type="input" id="money"  style="width:100px;margin-right: 10px;" /><Button  class="btn btn-primary radius" onclick="getUserByMoney();" >搜索</Button>
消费金额大于<input class="input-text" type="input" id="money2"  style="width:100px;margin-right: 10px;" /><Button  class="btn btn-primary radius" onclick="getUserByMoney2();" >搜索</Button>
&nbsp;
 -->
<c:if test="${role eq 1 }"><a href="javascript:void(0)"  class="btn btn-danger radius"  onclick="showdiv();" >送红包</a></c:if><br />
<div style="width: 100%;text-align: center;margin-top: 20px;">
<a class="btn btn-success radius  mr-20" href="${pageContext.request.contextPath}/daili_jiayouzhang.do?method=getviplist">全&nbsp;部</a>
<a class="btn btn-success radius  mr-20" href="${pageContext.request.contextPath}/daili_jiayouzhang.do?method=getviplist&status=0">未审核</a>
<a class="btn btn-success radius  mr-20" href="${pageContext.request.contextPath}/daili_jiayouzhang.do?method=getviplist&status=-1">系统剔除<span class="mui-badge mui-badge-primary">${map.count }</span></a>
<a class="btn btn-success radius  mr-20" href="${pageContext.request.contextPath}/daili_jiayouzhang.do?method=getviplist&status=-2">已禁用</a>
</div>


	<div class="mt-20">

		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					                                     <th>全选<input type = "checkbox" onclick="selectAll(this);" class = "uids" value="" >/<span onclick="select_other();" class = "uids">反选</span></th>
                                                        <th>客户ID</th>
                                                        <th>真实姓名</th>
                                                        <th>余额</th>
                                                        <th>充值金额</th>
                                                        <th>消费金额</th>
                                                        <th >积分</th>
                                                        <th width="45%">详情</th>
                                                    
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${map.userlist}" var="user" varStatus="i">
                                                    <tr align="center" class="d">
                                                         <td style="text-align: center;"><input type = "checkbox"  class = "uids" value="${user.openid}"></td>
                                                        <td style="text-align: center;"><a href="" style="color: blue;">${user.openid }</a></td>
                                                        <td style="text-align: center;">${user.nickname }</td>             
                                                        
                                                        <td style="text-align: center;">￥0.00</td>
                                                       
                                                       
                                                        
                                                       
                                                        <td style="text-align: center;">￥0.00</td>
                                                       
                                                        
                                                        
                                                        <td style="text-align: center;">￥0.00</td>
                                                       
                                                      
                                                        <td style="text-align: center;">0</td>
                                                       
                                                        <td style="text-align: center;width:36%;">
                            <c:if test="${user.vip.vstatus eq 1 }">                    
                                                        <c:if test="${user.vip.ostyle eq 1 }">
                                                        柴油
                                                        </c:if>
                                                         <c:if test="${user.vip.ostyle eq 2 }">
                                                        汽油
                                                        </c:if>
                                                       ${fn:substring(user.vip.vipgrade, 1, 2)} 级客户   &nbsp;                                    
                                           
                                                       结算剩余: ${30-user.vip.vdays%30 }天&nbsp; 
                <c:if test="${user.vip.vlimit>user.vip.vxiaofei }">                                      
                                                       还需消费:<fmt:formatNumber type="number" value="${user.vip.vlimit-user.vip.vxiaofei }" pattern="0.00" maxFractionDigits="2"/>元
                </c:if> 
                <c:if test="${user.vip.vlimit<user.vip.vxiaofei }">                                      
                                                      已超出:<fmt:formatNumber type="number" value="${user.vip.vxiaofei-user.vip.vlimit }" pattern="0.00" maxFractionDigits="2"/>元
                </c:if>
<span class="btn btn-danger radius" onclick="updatestatus(${user.vip.vid },-2);">撤销</span>
<span class="btn btn-danger radius" onclick="addDiv('${user.openid }',${fn:substring(user.vip.vipgrade, 1, 2)},${user.vip.ostyle },'${user.nickname }');">修改</span>
</c:if>    
<c:if test="${user.vip.vstatus eq 0}">
未审核
<span class="btn btn-danger radius" onclick="updatestatus(${user.vip.vid },1);">通过</span>
</c:if>
<c:if test="${user.vip.vstatus eq -1}">
已撤销vip（上月未满足消费）
<span class="btn btn-danger radius" onclick="updatestatus(${user.vip.vid },1);">恢复</span>
</c:if>
<c:if test="${user.vip.vstatus eq -2}">
已撤销vip（管理员主动撤销）
<span class="btn btn-danger radius" onclick="updatestatus(${user.vip.vid },1);">恢复</span>
</c:if>

</td>
                                                    </tr>
                                                    </c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div style="width:100%;text-align: center;">

<a href="javascript:void(0)"  class="btn btn-primary radius" id="lastPage" class="jiaYouPage" >上一页</a>
							
							<span class="btn btn-danger radius">第${map.page}页</span>
							<span  class="btn btn-danger radius" >共${map.totalPage}页</span>
							<a href="javascript:void(0)"  class="btn btn-primary radius" id="nextPage" class="jiaYouPage">下一页</a>
</div>

<div id="bg"></div>
		<div id="show" style="text-align: center;">
		
				<table  id="oilTable"  style=" width:90%;margin:auto;border-collapse:separate; border-spacing:11px;">
					<tr>
						<td width="50%" style="text-align:left;">红包金额(元)：</td>
						<td><input  type="text" id="hongbao"  class="input-text" /></td>
					</tr>
					
					<tr>
						<td width="50%" style="text-align:left;">红包期限(天)：</td>
						<td><input type="text"  id="timelimit"class="input-text"  /></td>
					</tr>
					
					<tr>
						<td width="50%" style="text-align:left;">消费满足(元)：</td>
						<td><input type="text"  id="moneylimit"class="input-text"  /></td>
					</tr>
					
						<tr>
						<td width="50%" style="text-align:left;">问候语：</td>
						<td><textarea rows="3" cols="20" id="meeting"></textarea></td>
					</tr>

					<tr>
						<td style="text-align:left;"><input type="submit" id ="updateSubmit"value="发送" onclick="sendHonbao();" class='btn btn-primary radius' style=" width: 80px;height: 30px;"/></td>
						<td style="text-align:right;"><input id="btnclose" type="button" value="取消" onclick="hidediv();" class='btn btn-danger radius' style="width: 80px;height: 30px;"/></td>
					</tr>
				</table>

			</div>
			
		  <div id="bg2"></div>
		<div id="show2" style="text-align: center;">

				<table  id="addTable" style=" width:90%;margin:auto;border-collapse:separate; border-spacing:11px;">
					<tr ><td id="stage" colspan="2"></td> </tr>
					<tr>
						<td width="50%" >油类别：</td>
						<td>
					
						<select  id="ostyle"  style="width:150px;font-size: 12px;">
						<option value="2" >
				                             汽油
						</option>
						<option value="1" >
				                             柴油
						</option>
                        </select>
                   
						 </td>
					</tr>
				
					<tr>
						<td width="50%" >客户等级：</td>
						
						<td>
						
						<select style="width:150px;font-size: 12px;"  id="vgrade"  >
						<option value="1" >
				                             一级客户
						</option>
						<option value="2" >
				                                二级客户
						</option>
						<option value="3" >
				                               三级客户
						</option>
						</select>
						
						</td>
					</tr>
				
		
					<tr>
						<td style="text-align:left;"><input  id ="addSubmit"value="修改" class='btn btn-primary radius' onclick="updategrade();" style=" width: 80px;height: 30px;"/></td>
						<td style="text-align:right;"><input id="btnclose" type="button" value="取消" onclick="hidediv2();"  class='btn btn-danger radius' type="button"  style="width: 80px;height: 30px;"/></td>
					</tr>
				</table>

			
			</div>



	<script type="text/javascript"
			src="${pageContext.request.contextPath}/lib/lib/jquery/1.9.1/jquery.min.js"></script>
			
<script type="text/javascript">

function addDiv(id,index,ostyle,name) {

	var bg2 = document.getElementById("bg2");
	var show2 = document.getElementById("show2");
	bg2.style.display = "block";
	show2.style.display = "block";
	var stage =name+"&nbsp;";
	if(ostyle=="1")
		stage += "柴油"+index+"级客户";
	if(ostyle=="2")
		stage += "汽油"+index+"级客户";
     document.getElementById("stage").innerHTML = stage;
     uid= id;
  
}
var uid;

function updategrade(){
	var ostyle = document.getElementById("ostyle").value;
	var vgrade =document.getElementById("vgrade").value;
	 if(window.confirm('确定要修改？')){
         $.ajax({
          type: "post",
          url: "${pageContext.request.contextPath}/daili_jiayouzhang.do?method=updategrade&time="+new Date().getTime(),     
          data: {  
        	  uid:uid,
        	  ostyle : ostyle,
        	  vgrade : vgrade
          },    
          dataType: "json",
          success: function(data) {
              if(data.flag==1){
              alert("修改成功！");
               location.replace('${pageContext.request.contextPath}/daili_jiayouzhang.do?method=getviplist');
              }else
              alert("内部错误，提交失败！");
          },
          error: function(data) {
              alert("网络异常，提交失败");
          }
          })
	 }else
	 return;
}


function hidediv2() {
	document.getElementById("bg2").style.display = 'none';
	document.getElementById("show2").style.display = 'none';
	
}


  function more(uid){
			
				
				var d=document.getElementById(uid+'dd'); 
				d.style.display=" ";
			
	  }

 $("document").ready(
function(){
	$(".more").mouseover(function(){
		$(".details").css("display","block");
		});
	$(".more").mouseout(function(){
		$(".details").css("display","none");
		});
	});
 
 function getUserByNN(){

	var NN= document.getElementById("NN").value;
	if(isNaN(NN)){

	 location="${pageContext.request.contextPath}/daili_jiayouzhang.do?method=getVipbyNN&name="+NN+"&number=0";}
	 else{

		 location="${pageContext.request.contextPath}/daili_jiayouzhang.do?method=getVipbyNN&number="+NN+"&name=0"; }
 }
 
 function getUserByMoney(){
	 var money= document.getElementById("money").value;
		if(isNaN(money)||money==""){

		alert("只能输入数字");
		return;}
		 else{

			 location="${pageContext.request.contextPath}/daili_jiayouzhang.do?method=getvipbyMoney&money="+money; }
	 }
 function getUserByMoney2(){
	 var money2= document.getElementById("money2").value;
		if(isNaN(money2)||money==""){

			alert("只能输入数字");
			return;}
		 else{
  
			 location="${pageContext.request.contextPath}/daili_jiayouzhang.do?method=getvipbyMoney&money2="+money2; }
	 }

</script>
<script type="text/javascript">
    function updatestatus(vid,vstatus){

         $.ajax({
             type: "post",
             url: "${pageContext.request.contextPath}/daili_jiayouzhang.do?method=updatvipstatus&ran="+new Date().getTime(),  
             dataType:"json",  
             data: { 
             	vid:vid,
             	vstatus:vstatus
             	  },  
             success: function(data) {
                if(data.flag==1){
                 alert("修改成功！"); 
                 window.location.reload(); 

		 		}else
		 		alert("修改失败");			
                                    
             },
             error: function(data) {
                 alert("网络异常，提交失败");
             }
         })
         
    }
var str = "";


function showdiv() {
	   
	var bg = document.getElementById("bg");
	var show = document.getElementById("show");
	
	bg.style.display = "block";
	show.style.display = "block";
}

function hidediv() {
	document.getElementById("bg").style.display = 'none';
	document.getElementById("show").style.display = 'none';
	

}

function sendHonbao(){
	if(str.length<1){
		alert("请先勾选用户");
		return;
	}
	var hongbao = document.getElementById("hongbao").value;
	var timelimit = document.getElementById("timelimit").value;
	var moneylimit = document.getElementById("moneylimit").value;
	var meeting =  document.getElementById("meeting").value;
	var regex=/^[0-9]\d*$/
	var regex2=/^(?!0+(?:\.0+)?$)(?:[1-9]\d*|0)(?:\.\d{1,2})?$/;
		if(!regex2.test(moneylimit)){
			alert("请输入有效满足金额");
			return;
		}
		if(!regex.test(timelimit)){
			alert("请输入有效天数");
			return;
		}
	if(!regex2.test(hongbao)){
		alert("请输入有效红包金额");
		return;
	}else{
		var request = new XMLHttpRequest();
		request.open("post" , "${pageContext.request.contextPath}/daili_jiayouzhang.do?method=fahongbao&hongbao="+hongbao+"&uids="+str+"&moneylimit="+moneylimit+"&timelimit="+timelimit+"&meeting="+encodeURI(meeting)+"&x="+Math.random());
		request.send(null);	
		request.onreadystatechange = function(){
			if(request.readyState==4  && request.status ==200){
				var ret = request.responseText;
				
				var json = eval("(" + ret + ")");
				if(json.flag==1){
					alert("发送成功");
					document.getElementById("bg").style.display = 'none';
					document.getElementById("show").style.display = 'none';
				} else{
					alert("发送失败")
				}
			
				
			}
		}
		
	}
	
}
function selectAll(checkbox) {  
 
                $('input[type=checkbox]').attr('checked', $(checkbox).attr('checked'));  

            } 


function select_other(){  

   jQuery.each($("input[type=checkbox]"), function(i, n){  

     n.checked = !n.checked;  

    });   

 } 
function getElementsByClassName(n) { 

	var classElements = [],allElements = document.getElementsByTagName('*'); 
	for (var i=0; i< allElements.length; i++ ) 
	{ 
	if (allElements[i].className == n ) { 
	classElements[classElements.length] = allElements[i]; 
	} 
	} 
	return classElements; 
	}
	
$(function() {
    $(".uids").click(function() {
        var uids = getElementsByClassName("uids");
str="";
        for (var i = 2; i < uids.length; i++) {
            if (uids[i].checked) {
            	str += uids[i].value+",";
            	
            }
        }
        if(str.length>1)
        str = str.substring(0,str.length-1);
        

    });
})





     function showDetail(n){

       for(i=1;i<8;i++){
        	$("#detail"+i).hide();
       }
         $("#detail"+n).show();
         
     }
     function hideDetail(n){       
        $("#detail"+n).hide();
     }
     $("table").click(function(){
        for(i=1;i<8;i++){
        	$("#detail"+i).hide();
       }
     });
  </script> 
   <script type="text/javascript">       
          		var page;
          		page=${map.page};
                var userMaxPage;   
                userMaxPage=${map.totalPage};                   
                $(window).load(function() {        	
               
					if (userMaxPage * 1 > 1 * 1) {
						$("#nextPage").css('color','blue');					
					}
					if(page*1>1){
						$("#lastPage").css('color','blue');	  
					}
					if(page*1>=userMaxPage * 1){
						$("#nextPage").css('color','black');	
					}
					if(page*1==1){
						$("#lastPage").css('color','black');	
					}
					
				});
				
			
         
          function ExistsData(obj){		 
          obj.value = obj.value.replace(/[^\d.]/g, "");
		  obj.value = obj.value.replace(/^\./g, "");
		  obj.value = obj.value.replace(/\.{2,}/g, ".");
		  obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
		  obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3');
		  obj.value = obj.value.substring(0,8);
          }
         
				$("#nextPage").click(
				   function(){				     				     	    							
							if (page * 1 >= userMaxPage * 1) {
							    page=userMaxPage * 1;
								
							}else{
							   page=page*1+1*1;				   			   	     							
							}
							
							location="${pageContext.request.contextPath}/daili_jiayouzhang.do?method=getviplist&status=${status }&page="+page;     
				          
				   }
				);
				$("#lastPage").click(
					function() {
					
							if (page * 1 <= 1 * 1) {
								page = 1;
							} else {
								page = page * 1 - 1 * 1;
							}
							location="${pageContext.request.contextPath}/daili_jiayouzhang.do?method=getviplist&status=${status }&page="+page;
						
				}
			   );
		
          </script>
</body>
</html>
