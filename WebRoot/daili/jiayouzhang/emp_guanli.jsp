<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style type="text/css">
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
				top: 15%;
				left: 33%;
				width: 33%;
				height: 72%;
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
			
			#bg3 {
				display: none;
				position: absolute;
				top: 0%;
				left: 0%;
				width: 100%;
				height: 100%;
				background-color: black;
				z-index: 1001;
				-moz-opacity: 0.0;
				opacity: .00;
				filter: alpha(opacity=0);
			}
			
				#bg4 {
				display: none;
				position: absolute;
				top: 0%;
				left: 0%;
				width: 100%;
				height: 100%;
				background-color: black;
				z-index: 1001;
				-moz-opacity: 0.0;
				opacity: .00;
				filter: alpha(opacity=0);
			}
			#show2 {
				display: none;
				position: absolute;
				top: 20%;
			    left: 33%;
				width: 33%;
				height: 60%;
				padding: 8px;
				border: 8px solid #E7F1FE;
				background-color: white;
				z-index: 1002;
				overflow: auto;
			}
			#wait{
			   display: none;
				position: absolute;
				top: 45%;
			    left: 44%;
				width: 5%;
				height: 9%;
				padding: 8px;
				z-index: 1002;
				overflow: auto;
			}
			

			select{
			width:200px;
			height:31px;
			}
	        td{
	        overflow: hidden;
	        
	        }
	        #showImg{
	        	display: none;
				position: absolute;
				padding: 5px;
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
<title>员工列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 加油人员管理<span class="c-gray en">&gt;</span> 人员管理
<a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" id="add"   onclick="addDiv()"  >新增</a>
</nav>
<div class="pd-20">

 <span style="cursor:pointer;margin-left:100px;">
										    <input type="button" class="btn btn-primary radius" id="showGS" onclick="showGS()" value="根据加油站分类" style="height:30px;width:150px;display: none;">
											</span>
 					<span style="cursor:pointer;margin-right:800px;float:right;">
											<select id="jiaYouZhan" style="display:none;height:30px;width:150px" >
                                  
                                            </select>
											</span>

								
		<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort" id="showInfo">
			<thead>
				<tr class="text-c">
				<th>序号</th>
														<th>人员编号</th>
														<th>人员姓名</th>
														<th>所属加油站</th>
														<th>在职状态</th>
														<th>评分</th>
														<th>评价人数</th>
														<th style="width:20%">二维码(左柴右汽)</th>
														<th colspan="2" width="15%">操作 </th>
				</tr>
			</thead>
			
		</table>
	</div>
</div>
<div style="width:100%;text-align: center;">
<a href="javascript:void(0)" id="lastPage"  class="btn btn-primary radius">上一页</a>
								
								<span class="btn btn-danger radius">第<span id="pageCount" ></span>页</span>
								<span class="btn btn-danger radius">共<span id="maxPage" ></span>页</span>
								<a href="javascript:void(0)" id="nextPage"  class="btn btn-primary radius">下一页</a>
								</div>
<div id="bg"></div>
		<div id="show" style="text-align: center;">
			<form   id="GasEmpForm">
				<table  id="oilTable"  style=" width:90%;margin:auto;border-collapse:separate; border-spacing:11px;">
				    
				    <tr>
						<td><input type="text" class="input-text"  id="count" name="count" style="display: none"></td>
					</tr>
					<tr>
						<td width="50%" style="text-align:left;">编号：</td>
						<td><input type="text" class="input-text" id="geid" name="geid" readonly="true" ></td>
					</tr>
					<tr>
						<td width="50%" style="text-align:left;">姓名：</td>
						<td><input type="text"  class="input-text" id="gename" name="gename" _oninput="ExistsData(5,this);" ></td>
					</tr>
					<tr>
						<td width="50%" style="text-align:left;">性别：</td>
						<td><input type="text" class="input-text" id="gesex"  readonly="true"/></td>
					</tr>
					<tr>
						<td width="50%" style="text-align:left;">身份证号：</td>
						<td><input type="text" class="input-text" name="gecard" id="gecard"    _oninput="ExistsData(18,this);"onblur="check0(this)"/><span id="msg0" style="font-size:12px;"></span></td>
					</tr>
					<tr>
						<td width="50%" style="text-align:left;">联系方式：</td>
						<td><input type="text" class="input-text" name="genumber" id="genumber"   _oninput="ExistsData(11,this);"/></td>
					</tr>
					<tr>
						<td width="50%" style="text-align:left;">家庭住址：</td>
						<td>
						<textarea  name="geaddress" class="input-text" id="geaddress" rows="3" cols="20" style="height:80px;width:200px;">
						</textarea>
						</td>
					</tr>
					<tr style="display: none;">
						<td width="50%" style="text-align:left;">入职时间：</td>
						<td><input type="text" class="input-text" name="getime" id="getime"    readonly="true"/></td>
					</tr>
					<!--  <tr>
						<td width="50%" style="text-align:left;">离职状态：</td>
						<td><input type="text" name="geover" id="geover"    readonly="true"/></td>
					</tr>-->
				
					<tr>
						<td style="text-align:left;"><input type="submit" style="width:100px;height:30px;line-height:30px;" class='btn btn-primary radius' id ="updateSubmit"value="修改" /></td>
						<td style="text-align:right;"><input id="btnclose" style="width:100px;height:30px;line-height:30px;" class='btn btn-danger radius' type="button" value="取消" onclick="hidediv();" /></td>
					</tr>
				</table>

			</form>
			</div>
			
		  <div id="bg2"></div>
		<div id="show2" style="text-align: center;">
			<form   id="addForm">
				<table  id="addTable" style=" width:90%;margin:auto;border-collapse:separate; border-spacing:11px;">
					
					<tr>
						<td width="50%" style="text-align:left;" >姓名：</td>
						<td><input type="text" id="newname" class="input-text" name="newname"  _oninput="ExistsData2(20,this);" ></td>
					</tr>
					
					<tr>
						<td width="50%" style="text-align:left;">身份证号：</td>
						<td><input type="text" name="newcard"  class="input-text" id="newcard"  _oninput="ExistsData2(18,this);" onblur="check(this)"/><span id="msg" style="font-size:12px;"></span></td>
					</tr>
					<tr>
						<td width="50%" style="text-align:left;">联系方式：</td>
						<td><input type="text" name="newnumber" class="input-text" id="newnumber" _oninput="ExistsData2(11,this);"/></td>
					</tr>
					<tr>
						<td width="50%" style="text-align:left;">家庭住址：</td>
						<td>
						<textarea  name="newaddress" id="newaddress" class="input-text" rows="3" cols="20"  style="height:80px;" placeholder="可不填";>
						</textarea>
						</td>
					</tr>
					<tr>
						<td width="50%" style="text-align:left;">入职时间：</td>
						<td><input placeholder="2018-01-01"  type="text" class="input-text" name="getime" id="getime"  /></td>
					</tr>
					
					
					<tr>
						<td style="text-align:left;"><input type="submit" class='btn btn-primary radius' style="width:100px;height:30px;line-height:30px;" id ="addSubmit"value="增加"  /></td>
						<td style="text-align:right;"><input id="btnclose" class='btn btn-danger radius' style="width:100px;height:30px;line-height:30px;" type="button" value="取消" onclick="hidediv2();" /></td>
					</tr>
				</table>

			</form>			
			</div>
			<div id="bg3"></div>
			<div id="showImg" >			    
				<img id="img"  src="#"  style="float: left">
				<img id="img2"  src="#" style="float: right;">
			</div>
			<div id="bg4"></div>
			    
				<img style="display: none;" id="wait"  src="${pageContext.request.contextPath}/BackstageWebsite/Images/006.gif">
<script src="${smvc}/js/jquery-1.8.3.min.js" type="text/javascript" language="javascript"></script>
	<script language="javascript" type="text/javascript">
	   var page=1;
	   var maxPage=0;
	   var gid ='${param.id}';
	   var json = null;
		function getAjax(){
		var request = new XMLHttpRequest();
		request.open("post" , "${pageContext.request.contextPath}/daili_jiayouzhang.do?p=getAllEmp&page="+page+"&gestatus=all"+"&gid="+gid+"&x="+Math.random());
		request.send(null);	
		request.onreadystatechange = function(){
			if(request.readyState==4  && request.status ==200){
              
				var ret = request.responseText;

				 json = eval(ret);//转成json	
				 if(json[0].geList!=null){	
				for(var i = 0 ; i < json[0].geList.length ; i ++){
			     var tb = document.getElementById("showInfo"); 
                 var newTr = tb.insertRow(i+1);//添加新行，trIndex就是要添加的位置 
                 newTr.id="tr"+json[0].geList[i].geid;
                 
                 //$(newTr).attr("align","center");
                 var newTd1 = newTr.insertCell(); 
                 newTd1.innerHTML = i+1; 
                 newTd1.style
                
                 
                  var newTd2 = newTr.insertCell(); 
                 newTd2.innerHTML = json[0].geList[i].geid; 
                
                 var newTd3 = newTr.insertCell(); 
                 newTd3.innerHTML = json[0].geList[i].gename;
                 
                 var newTd4 = newTr.insertCell(); 
                 newTd4.innerHTML = json[0].geList[i].gsname;
               
                
                  var newTd5 = newTr.insertCell(); 
                  var statusC ;
                 
                  if(json[0].geList[i].gestatus!=1){
                  newTd5.innerHTML ="离职";
                  statusC = "复职";
                  }else{
                  newTd5.innerHTML ="在职";
                  statusC = "撤职";
                  }    
                  
                  var newTd10 = newTr.insertCell(); 
                  newTd10.innerHTML = json[0].geList[i].gerating.toFixed(1);
                 
                  var newTd11 = newTr.insertCell(); 
                  newTd11.innerHTML = json[0].geList[i].gepeople;
              
                  
                  var newTd6 = newTr.insertCell();   
                 var str =json[0].geList[i].gecode;
              
                  if(str.substr(str.length-4)!=".png")
                  newTd6.innerHTML = "<input class='btn btn-primary radius' type='button' value='生成' class='btName' id='bt"+json[0].geList[i].geid+"'   onclick='createQrcode(\"" +json[0].geList[i].geid+ "\",this)'/>";
                  else
                  newTd6.innerHTML = "<input class='btn btn-primary radius' type='button' value='显示' class='btName' id='bt"+json[0].geList[i].geid+"'  onclick='showQrcode(\"" +json[0].geList[i].geid+ "\")'/>";
          
     
                var newTd8 = newTr.insertCell(); 
                  newTd8.innerHTML ="<a  class='btn btn-primary radius' onclick='showdiv(\"" +json[0].geList[i].geid+ "\",\"" +json[0].geList[i].gename+ "\",\"" +json[0].geList[i].gecard+ "\",\"" +json[0].geList[i].geadress+ "\",\"" +json[0].geList[i].getime2+ "\",\"" +json[0].geList[i].genumber+ "\",\"" +json[0].geList[i].geover+ "\",\"" +json[0].geList[i].gestatus+ "\");'>详情/修改</a> ";
				var newTd9 = newTr.insertCell();
				newTd9.innerHTML = "<a  class='btn btn-danger radius' onclick='updateGestatus(\"" +json[0].geList[i].geid+ "\",\"" +json[0].geList[i].gestatus+ "\")'>"+statusC+"</a>";
				
				}
				}
				$("#showInfo td").css("text-align","center");
				 page=json[0].page;
				 maxPage=json[0].maxPage;
				 if(maxPage==0)
				 page=0;
				 
				document.getElementById("pageCount").innerHTML=page;
				document.getElementById("maxPage").innerHTML=maxPage;
			   if (maxPage * 1 > 1 * 1) {
				       
						$("#nextPage").css('color','blue');					
					}
					if(page*1>1){
						$("#lastPage").css('color','blue');	  
					}
					if(page*1>=maxPage * 1){
						$("#nextPage").css('color','black');	
					}
					if(page*1==1){
						$("#lastPage").css('color','black');	
					}				
			}
			}
			
		}
	    onload = function showAll(){

				 getAjax();	
				 					
	}
	
	
	jQuery('#jiaYouZhan').change(function(){
        gid=document.getElementById("jiaYouZhan").value;
        $("#showInfo tr:gt(0)").html("");       
        page=1;
	    maxPage=0;
                 
        getAjax();
    });
    
	  function showGS(){
            var request = new XMLHttpRequest();
		    request.open("post" , "${pageContext.request.contextPath}/daili_jiayouzhang.do?method=getAllGs&x="+Math.random());
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
   
   //上一页
    $("#lastPage").click(function(){
    	if(page*1>1){
    		page=page*1-1;
    		$("#showInfo tr:gt(0)").html("");
     	    getAjax();	
    	}
    });
	 //下一页
    $("#nextPage").click(function(){
    
  			if (page * 1 >= maxPage * 1) {
				 page=maxPage * 1;							
			}else{
				  page=page*1+1*1;				   			   	     							
			}  
     	$("#showInfo tr:gt(0)").html("");
     	 getAjax();			
     	
    });   
	     
	     
		function showdiv(onlyid,oldgename,oldgecard,oldgeadress,oldgetime2,oldnumber,geover,gestatus) {
           
			var bg = document.getElementById("bg");
			var show = document.getElementById("show");
			var geid = document.getElementById("geid");
			var gename = document.getElementById("gename");
			var gecard = document.getElementById("gecard");
			var geaddress = document.getElementById("geaddress");
			var getime = document.getElementById("getime");
			var getimeover = document.getElementById("getimeover");
			var gesex = document.getElementById("gesex");
	        var geover = document.getElementById("geover");
			var genumber = document.getElementById("genumber");
	
			 if(oldgecard.substring(16,17)%2!=1)
                 gesex.value = "女";
                 gesex.value = "男";
            geid.value=onlyid;
			gename.value = oldgename;
			gecard.value = oldgecard;
			geaddress.value = oldgeadress;
			getime.value = oldgetime2;
     		genumber.value = oldnumber;

			/*if(gestatus==1)
			geover.value="尚未离职";
			else
			geover.value = "已离职";*/
			bg.style.display = "block";
			show.style.display = "block";
		}

		function hidediv() {
			document.getElementById("bg").style.display = 'none';
			document.getElementById("show").style.display = 'none';
			 document.getElementById("msg0").innerHTML="";
		}
		
		function addDiv() {
			var bg2 = document.getElementById("bg2");
			var show2 = document.getElementById("show2");
			bg2.style.display = "block";
			show2.style.display = "block";
			var request = new XMLHttpRequest();
		    request.open("post" , "${pageContext.request.contextPath}/daili_jiayouzhang.do?method=getAllGs&x="+Math.random());
		    request.send(null);
			
		    request.onreadystatechange = function(){
			if(request.readyState==4  && request.status ==200){
                
				var ret = request.responseText;
				var json = eval(ret);
				if(json==""){
					alert("请先选择加油！");
					hidediv2();
				}
				var sel = document.getElementById("gasstation");
				sel.innerHTML="";
				for(var i = 0 ; i < json.length ; i ++){

				    
					var op= new Option(json[i].gname , json[i].gid );
					sel.add(op);					
				}		
			}
		
		}
		}

		function hidediv2() {
			document.getElementById("bg2").style.display = 'none';
			document.getElementById("show2").style.display = 'none';
			 document.getElementById("msg").innerHTML="";
		}
	    //创建二维码
	   function createQrcode(geid,obj){
           $("#bg4").css("display","block");
           	 $("#wait").css("display","block");  
	    $.ajax({
                 type: "post",
                 url: "${pageContext.request.contextPath}/daili_jiayouzhang.do?method=createQrcode&time="+new Date().getTime(),     
                 data: {  
                 geid : geid
                 },    
                 success: function(data) {   
                   $("#bg4").css("display","none");
           	       $("#wait").css("display","none");            
                     
                     obj.parentNode.innerHTML =" <input type='button' value='显示'  class='btn btn-primary radius' id='bt"+geid+"'  onclick='showQrcode(\"" +geid+ "\")'/>";
                  alert("提交成功！");   
                 },
                  error: function(data) {
                     alert("网络异常，提交失败");
                 }
             });
              return false;
	   }
	   //显示二维码
         function  showQrcode(n){
 
           if($("#bt"+n).attr("value")=="显示"){   
              $("#bg3").css("display","block");
           	 $("#showImg").css("display","block");  
             $("#img").attr("src","${pageContext.request.contextPath}/qrcode/"+n+".png"); 	
             $("#img2").attr("src","${pageContext.request.contextPath}/qrcode/"+n+"2.png"); 
             $("#showImg").css({"top":$("#bt"+n).offset().top+"px","left":$("#bt"+n).offset().left+30+"px"});
           }     
         }
         
        $("#bg3").click(function(){
    	 $("#showImg").css("display","none"); 
           	  $("#bg3").css("display","none");
    });
	    
	    function updateGestatus(geid,gestatus){	        
	        if (gestatus==1) {
	         if(window.confirm('确定要撤职？')){
	         
                $.ajax({
                 type: "post",
                 url: "${pageContext.request.contextPath}/daili_jiayouzhang.do?method=updateGestatus&time="+new Date().getTime(),     
                 data: {  
                 geid : geid,
                 gestatus : gestatus
                 },    
                 dataType: "json",
                 success: function(data) {
                    if(data.flag==1){
                     var tr = document.getElementById("tr"+data.geid);
                     var index = parseInt(tr.childNodes[0].innerHTML)-1;
                      var statusC = null;
                      if(data.gestatus!=1){
                       tr.childNodes[4].innerHTML ="离职";
                       statusC = "复职";
                        }else{
                       tr.childNodes[4].innerHTML ="在职";
                       statusC = "撤职";
                       }                 
                     tr.childNodes[9].innerHTML="<a  class='btn btn-danger radius'  onclick='updateGestatus(\"" +data.geid+ "\",\"" +data.gestatus+ "\")'>"+statusC+"</a>";
                     alert("提交成功！");
                     }else
                     alert("内部错误，提交失败！");
                     
                 },
                 error: function(data) {
                 alert(data);
                      alert("网络异常，提交失败");
                 }
                 })
                 return false;
              }
             }else{
               if(window.confirm('确定要复职？')){
               
              $.ajax({
                 type: "post",
                 url: "${pageContext.request.contextPath}/daili_jiayouzhang.do?method=updateGestatus&ran="+new Date().getTime(),   
                 data: {  
                 geid : geid,
                 gestatus : gestatus
                 },    
                 dataType: "json",
                 success: function(data) {

                     if(data.flag==1){
                     var tr = document.getElementById("tr"+data.geid);
                     var index = parseInt(tr.childNodes[0].innerHTML)-1;
                      var statusC = null;
                      if(data.gestatus!=1){
                       tr.childNodes[4].innerHTML ="离职";
                       statusC = "复职";
                        }else{
                       tr.childNodes[4].innerHTML ="在职";
                       statusC = "撤职";
                       }                 
                     tr.childNodes[9].innerHTML="<a  class='btn btn-danger radius'  onclick='updateGestatus(\"" +data.geid+ "\",\"" +data.gestatus+ "\")'>"+statusC+"</a>";
                     alert("提交成功！");
                     }else
                     alert("内部错误，提交失败！");
                     
                 },
                 error: function(data) {
                     alert("网络异常，提交失败");
                 }
                 })
                 return false;
             }
	        }
	       
	    }
	  
	  
	  
	   $("#updateSubmit").click(function(){
            if(window.confirm('确定要修改？')){
             $.ajax({
                 type: "get",
                 url: "${pageContext.request.contextPath}/daili_jiayouzhang.do?method=updateJiayouEmp&id=${param.id}&ran="+new Date().getTime(),  
                 dataType:"json",  
                 data: $("#GasEmpForm").serialize(),     
                 success: function(data) {
                 if(data.flag==1){
                      $("#bg").css("display","none");
           	         $("#show").css("display","none"); 
                     alert("修改成功！"); 
                     var tr = document.getElementById("tr"+data.geid);
                     var index = parseInt(tr.childNodes[0].innerHTML)-1;
                     tr.childNodes[2].innerHTML=data.gename;
                   
                     tr.childNodes[8].innerHTML="<a class='btn btn-primary radius' onclick='showdiv(\"" +json[0].geList[index].geid+ "\",\"" +data.gename+ "\",\"" +data.gecard+ "\",\"" +data.geaddress+ "\",\"" +json[0].geList[index].getime2+ "\",\"" +data.genumber+ "\",\"" +json[0].geList[index].geover+ "\",\"" +json[0].geList[index].gestatus+ "\");'>详情/修改</a> ";
                      
                     }else
                     alert("内部错误，修改失败");              
                 },
                 error: function(data) {
                     alert("网络异常，提交失败");
                 }
             })
             }
             return false;
         });

         
         $("#addSubmit").click(function(){
           
             $.ajax({
                 type: "get",
                 url: "${pageContext.request.contextPath}/daili_jiayouzhang.do?method=addJiayouEmp&id=${param.id}&ran="+new Date().getTime(), 
                 data: $("#addForm").serialize(),    
                 success: function(data) {
                     alert("新增成功！"); 
                     location.replace('emp_guanli.jsp?id=${param.id}');                  
                 },
                 error: function(data) {
                     alert("内部错误，提交失败");
                 }
             })
             return false;
         });

		//格式控制
          function ExistsData(length,obj){		 
           var t1 = document.getElementById("gename");
           var t2 = document.getElementById("gecard");
          
           obj.value = obj.value.substring(0,length);
          
           if(obj==t2)
          obj.value=obj.value.replace(/[^\d]/g,'');
          
          if(t1.value!= ""&&t2.value!=""&&t2.value.length==18)
          document.getElementById("updateSubmit").disabled = "";	
	      else
          document.getElementById("updateSubmit").disabled = "disabled";	
          }
          
          function ExistsData2(length,obj)	{		 
           var t1 = document.getElementById("newname");
           var t2 = document.getElementById("newcard");

           obj.value = obj.value.substring(0,length);
           
          if(obj==t2)
          obj.value=obj.value.replace(/[^\d]/g,'');
         
          if(t1.value!= ""&&t2.value!=""&&t2.value.length==18)
         
          document.getElementById("addSubmit").disabled = "";	
	     else
          document.getElementById("addSubmit").disabled = "disabled";	
          }
          
          function check(obj){
          if(obj.value.length!=18)
          document.getElementById("msg").innerHTML="长度不足";
          else
          document.getElementById("msg").innerHTML="";
          }
          
          function check0(obj){
          if(obj.value.length!=18)
          document.getElementById("msg0").innerHTML="长度不足";
          else
          document.getElementById("msg0").innerHTML="";
          }
          
          function showGS(){
              var request = new XMLHttpRequest();
  		    request.open("post" , "${pageContext.request.contextPath}/daili_jiayouzhang.do?method=getAllGs&x="+Math.random());
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
