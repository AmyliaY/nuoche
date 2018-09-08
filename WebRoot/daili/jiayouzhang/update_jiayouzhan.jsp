<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>新增加油站</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 加油站管理 <span class="c-gray en">&gt;</span> 新增加油站 
<a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace('<%=request.getContextPath()%>/jyzback.do?method=getJiayouzhan');"  >返回上一页</a>
</nav>
<div class="pd-20">
	

	<div class="mt-20">
	                             <form action="" method="post"   name="form1">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
		
			<tbody> 
				<tr>
                                                        <td width="2%">&nbsp;
                                                           <input type="hidden" name="id" value="${s.gid}"/>
                                                        </td>
                                                        <td width="12%">加油站名称(必填)：</td>
                                                        
                                                        <td width="30%"><input class="input-text" onblur="name_onblur()"  type="text" id="gname" name="gname" value="${s.gname }" /></td>
                                                        <td><span id="jyzname" style="color:#f0145c;display:none;">*请输入该加油站的名称</span></td>
                                                     
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                   
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>地址(必填)：</td>
                                                        <td><input class="input-text" onblur="dizhi_onblur()"  type="text" id="gaddress" name="gaddress" value="${s.gaddress }" /></td>
                                                         <td><span id="jyzdizhi" style="color:#f0145c;display:none;">*请输入该加油站的地址</span></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>支付用户(必填)：</td>
                                                        <td><input class="input-text" onblur="zuobiaox_check(this)"  type="text" id="gzuobiaox" name="gzuobiaox" value="${s.uid }" /></td>
                                                         <td><span id="jyzzuobiaox" style="color:#f0145c;display:none;">*请输入支付用户</span></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                            <tr>
                                                        <td width="2%">&nbsp;</td>
                                                        <td>支付密码(必填)：</td>
                                                        <td><input class="input-text" onblur="zuobiaoy_check(this)"  type="text" id="gzuobiaoy" name="gzuobiaoy" value="${s.token }" /></td>
                                                         <td><span id="jyzzuobiaoy" style="color:#f0145c;display:none;">*请输入支付密码</span></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    
                                                    <tr>
                                                       <td width="2%">&nbsp;</td>
                                                       <td>是否启用：</td>
                                                       <td>
                                                           <select class="select2" name="status" style="height:31px;border:1px gray solid;">>
                                                              <option ${s.gstatus==1?"selected":"" } value="1">已启用</option>
                                                              <option ${s.gstatus==0?"selected":"" } value="0">已禁用</option>
                                                           </select>
                                                       </td>
                                                    </tr>
                                                 
                                                    <tr style="display: none;">
                                                        <td width="2%">&nbsp;</td>
                                                        <td>上传图片(必填)：</td>
                                                        <td> <!--  <img  id="imghead" name="pic"  width=100 height=100 border=0 src=''>-->
                                                              <input  type="file" style="height:31px;"  id="myfile" name="myfile" value="" onchange="previewImage(this)" onchange="previewImage(this)"  /></td>
                                                            
                                                        <td><span id="jyzpic" style="color:#f0145c;display:none;">*加油站配图</span></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                  
                                                    <tr style="display: none;">
                                                        <td width="2%">&nbsp;</td>
                                                        <td>详细信息(必填)：</td>
                                                        <td><textarea style="width:220px;" onblur="des_onblur()" class="textarea" type="text" id="gdescribe" name="gdescribe" value="" /></textarea></td>
                                                        <td><span id="jyzdes" style="color:#f0145c;display:none;">*请输入该加油站的详细信息</span></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr style="display: none;">
                                                        <td width="2%">&nbsp;</td>
                                                        <td>站长(必填)：</td>
                                                        <td>
                                                            <select id="mod" name="atype" onchange="getzz()"  style="height:31px;border:1px gray solid;">
                                                               <option value="0" style="width:58px;">请选择</option>    
                                                               <c:forEach items="${adminlist}" var="item">                                                                                                
                                                               <option value="${item.aid }" id="${item.aid }" style="width:58px;height:26px;">${item.aname}</option>
                                                               </c:forEach>   
                                                            </select>
                                                        </td>
                                                        <td><span id="jyzzz" style="color:#f0145c;display:none;">*为该加油站设置一个站长</span></td>
                                                        <td width="2%">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><input style="width: 200px" class="btn btn-primary radius" id="xinzeng"  onclick="add_jyz()" class="btn" type="submit" value="提交" /></td>
                                                        <td>&nbsp;</td>
                                                    </tr>
			</tbody>
		</table>
		</form>
	</div>
</div>

<script type="text/javascript">
var count=0;
var a=0;
var b=0;
var c=0;
var d=0;
var e=0;

 

//判断加油站名称不能为空
function name_onblur(){
    var jyzname=document.getElementById("gname").value;
    if(jyzname.length<=0){
         document.getElementById("jyzname").style.display="block";
         a=1;
     }else{
         document.getElementById("jyzname").style.display="none";
         a=0;
     }
     //alert("a="+a);
     test();

}

function zuobiaox_check(obj){
		 var regex=/^[+-]?\d+(\.\d+)?$/;
			if(obj.value==""){
				
			document.getElementById("jyzzuobiaox").style.display="block";
            b=1;
			return;
			}
			b=0;
			document.getElementById("jyzzuobiaox").style.display="none";
            test();
}

function zuobiaoy_check(obj){
   
		 var regex=/^[+-]?\d+(\.\d+)?$/;
			if(obj.value=="")
			{
				 
			document.getElementById("jyzzuobiaoy").style.display="block";
		    c=1;
			return;
			}
             c=0;
			document.getElementById("jyzzuobiaoy").style.display="none";
            test();
}

function dizhi_onblur(){
    var jyzname=document.getElementById("gaddress").value;
    if(jyzname.length<=0){
         document.getElementById("jyzdizhi").style.display="block";
         d=1;
     }else{
         document.getElementById("jyzdizhi").style.display="none";
         d=0;
     }
     //alert("b="+b);
     test();

}

function des_onblur(){
    var jyzname=document.getElementById("gdescribe").value;
    if(jyzname.length<=0){
         document.getElementById("jyzdes").style.display="block";
         c=0;
     }else{
         document.getElementById("jyzdes").style.display="none";
         c=1;
     }
     //alert("c="+c);
     test();

}

     /*
     var fileid=document.getElementById("myfile");
     fileid.onchange=function(){
        if(this.value==''){
           document.getElementById("jyzpic").style.display="block";
           e=0;
        }else{
           document.getElementById("jyzpic").style.display="none";
           e=1;
        }
        test();
     }*/


function test(){
     count=a+b+c+d;
     // alert(count);
    // alert("a="+a+"count="+count);
     if(count==0){
         document.getElementById("xinzeng").disabled=false;
      }else{
         document.getElementById("xinzeng").disabled=true;
      }
  }

    //得到select标签里面选中的站长的id
    function getzz(){
        var all_options = document.getElementById("mod").options;
        var aid;
        for (i=0; i<all_options.length; i++){
             // 根据option标签的ID来进行判断 测试的代码这里是两个等号
             if (all_options[i].selected ) {
                 aid=all_options[i].id;
             }
        }
       // alert("aid="+aid);
        if(aid==""){
             document.getElementById("jyzzz").style.display="block";
             d=0;
        }else{
             document.getElementById("jyzzz").style.display="none";
             d=1;
        }
        //alert("d="+d);
        test();
        return aid;
    
    }
    
    //跳转
    function add_jyz(){
      document.form1.action="${pageContext.request.contextPath}/daili_jiayouzhang.do?p=update_jyz";
      document.form1.submit();
       
    }
</script> 
</body>
</html>