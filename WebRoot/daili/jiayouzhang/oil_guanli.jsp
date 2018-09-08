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
				top: 150px;
				left: 34%;
				width: 30%;
				height: 330px;
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
				top: 150px;
			    left: 34%;
				width: 30%;
				height:330px;
				padding: 8px;
				border: 8px solid #E7F1FE;
				background-color: white;
				z-index: 1002;
				overflow: auto;
			}
			

		textarea{
	   height:80px;	
	   width:200px;
		}	
	        td{
	        overflow: hidden;
	        }
		</style>
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>资讯列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 油类管理 
  <a class="btn btn-success radius r mr-20" onclick="addDiv()" style="line-height:1.6em;margin-top:3px"  >新增油类</a>
 </nav>
<div class="pd-20">
 <span style="cursor:pointer;margin-left:100px;display: none;">
										    <input type="button" class="btn btn-primary radius" id="showGS" onclick="showGS()" value="根据加油站分类" style="height:30px;width:150px">
											</span>
 					<span style="cursor:pointer;margin-right:800px;float:right;">
											<select id="jiaYouZhan" style="display:none;height:30px;width:150px" >
                                  
                                            </select>
											</span>
	
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					
														<th>油类编号</th>
														<th>油类名称</th>
														<th>父类名称</th>
														<th>油类价格</th>
														<th>折扣</th>
														<th>备注</th>
														<th>油类状态</th>
														<th width="15%">操作 </th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${oilList }" var="oilList" varStatus="index">
														<tr align="center" class="d">
														
															<td style="text-align: center;">${oilList.oid }</td>
															
															<td style="text-align: center;">${oilList.oname }</td>
															<td style="text-align: center;">${ostyle[oilList.ostyle2] }-${oilList.ostyle2 }</td>
															<td style="text-align: center;">${oilList.oprice }</td>
																<td style="text-align: center;">${oilList.zhekou }</td>
															<td style="text-align: center;">${oilList.odetail }</td>
															<td style="text-align: center;">
															<c:if test="${oilList.ostatus==1 }" var="f">
																<span id="ostatus${oilList.oid }now">已启用</span>
																</c:if>
																<c:if test="${not f }">
																<span id="ostatus${oilList.oid }now">已禁用</span>
																</c:if>
															</td>
															<td style="text-align: center;">
																<a id="btnshow" class="btn btn-primary radius"  onclick="showdiv('${oilList.oid }','${oilList.oname }','${oilList.oprice }','${oilList.odetail }','${ostyle[oilList.ostyle2] }-${oilList.ostyle2 }','${oilList.ostyle }','${oilList.zhekou }')" >编辑 </a>
																<c:if test="${oilList.ostatus==1 }" var="f">
																<a id="ostatus${oilList.oid }" class="btn btn-danger radius"  onclick="changeOstatus('${oilList.oid }','${oilList.ostatus }',this.id)" >禁用</a>
																</c:if>
																<c:if test="${not f }">
																<a id="ostatus${oilList.oid }" class="btn btn-danger radius" onclick="changeOstatus('${oilList.oid }','${oilList.ostatus }',this.id)" >启用</a>
																</c:if>
																
															</td>
														</tr>
													</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div id="bg"></div>
		<div id="show" style="text-align: center;">
			<form   id="oilForm">
				<table  id="oilTable"  style=" width:90%;margin:auto;border-collapse:separate; border-spacing:11px;">
					<tr style="display: none;">
						<td width="50%" style="text-align:left;">油类编号：</td>
						<td><input type="text" id="oid" name="oid"class="input-text" readonly="true"  style="width:200px;"></td>
					</tr>
					<tr>
						<td width="50%" >油类别：</td>
						<td>
                        <input type="text" name="ostyle" id="oldstyle"class="input-text"  readonly="true" style="width:100px;"/>
						<select  id="oldstyles"  class="input-text" style="width:100px;float:right;" onclick="changestatus()";>
						<option>更改</option>
						<c:forEach items="${ostyle }" var="ostyle">
	                    
						<option vlaue="${ostyle.key }">${ostyle.value }-${ostyle.key }</option>
						</c:forEach>
						</select> </td>
					</tr>
					
					<tr>
						<td width="50%" style="text-align:left;">油类名称：</td>
						<td><input type="text" name="oname" id="oname"class="input-text" oninput="ExistsData(this);" /></td>
					</tr>
					<tr>
						<td width="50%" style="text-align:left;">油类价格：</td>
						<td><input type="text" name="oprice" id="oprice"class="input-text"  onpaste="return false;"  oninput="ExistsData(this);"/></td>
					</tr>
					
					<tr>
						<td width="50%" style="text-align:left;">油类折扣：</td>
						<td><input type="text" name="zhekou" id="zhekou"class="input-text"  onpaste="return false;"  oninput="ExistsData(this);"/></td>
					</tr>
					<tr>
						<td width="50%" style="text-align:left;">备注：</td>
						<td>
						<textarea  name="odetail" id="odetail" rows="3" cols="20" oninput="ExistsData(this);">
						</textarea>
						</td>
					</tr>
					<tr>
						<td style="text-align:left;"><input type="submit" id ="updateSubmit"value="修改"  class='btn btn-primary radius' style=" width: 80px;height: 30px;"/></td>
						<td style="text-align:right;"><input id="btnclose" type="button" value="取消" onclick="hidediv();" class='btn btn-danger radius' style="width: 80px;height: 30px;"/></td>
					</tr>
				</table>

			</form>
			</div>
			
		  <div id="bg2"></div>
		<div id="show2" style="text-align: center;">
			<form   id="addForm">
				<table  id="addTable" style=" width:90%;margin:auto;border-collapse:separate; border-spacing:11px;">
					
					<tr>
						<td width="50%" >油类别：</td>
						<td><select  id="ostyle" name="ostyle" class="input-text" style="width:200px;">
						<c:forEach items="${ostyle }" var="ostyle">
						
						
						<option vlaue="${ostyle.key }">${ostyle.key }-${ostyle.value }</option>
						</c:forEach>
						</select> </td>
					</tr>
					<tr>
						<td width="50%" >油类名称：</td>
						<td><input type="text" id="newname" name="oname" class="input-text" placeholder="初始名称" oninput="ExistsData2(this)" style="width:200px;"/></td>
					</tr>
					<tr>
						<td width="50%" >油类价格：</td>
						<td><input type="text" id="newprice" name="oprice" class="input-text" placeholder="初始价格" onpaste="return false;"  oninput="ExistsData2(this)" /></td>
					</tr>
					<tr>
						<td width="50%" style="text-align:left;">油类折扣：</td>
						<td><input placeholder="输入0-1间数" type="text" name="zhegou" id="zhegou"class="input-text"  onpaste="return false;"  oninput="ExistsData(this);"/></td>
					</tr>
					<tr>
						<td width="50%" >备注：</td>
						<td><textarea type="text" id="newdetail" name="odetail"   placeholder="初始描述" oninput="ExistsData2(this)" rows="3" cols="20"></textarea></td>
					</tr>
					
					
					<tr>
						<td style="text-align:left;"><input type="submit" id ="addSubmit"value="增加" class='btn btn-primary radius' disabled="disabled" style=" width: 80px;height: 30px;"/></td>
						<td style="text-align:right;"><input id="btnclose" type="button" value="取消" onclick="hidediv2();"  class='btn btn-danger radius' type="button"  style="width: 80px;height: 30px;"/></td>
					</tr>
				</table>

			</form>
			
			</div>

<script src="${smvc}/js/jquery-1.8.3.min.js" type="text/javascript" language="javascript"></script>
	<script language="javascript" type="text/javascript">
	
	function getScrollTop() {
		var scrollPos; 
		if (window.pageYOffset) {
		scrollPos = window.pageYOffset; 
		
		} else if (document.compatMode && document.compatMode != 'BackCompat') { scrollPos = document.documentElement.scrollTop; 
		} else if (document.body) { 
			scrollPos = document.body.scrollTop;
			} return scrollPos;
			} 
	
		function showdiv(oid, oname, oprice, odetail,ostyle,osid,zhekou) {
		   
			var bg = document.getElementById("bg");
			var show = document.getElementById("show");
			var distanse = getScrollTop();
			show.style.top =(distanse+150)+"px";	
			var onlyoid = document.getElementById("oid");
			var oldname = document.getElementById("oname");
			var oldprice = document.getElementById("oprice");
			var olddetail = document.getElementById("odetail");
			var oldstyle = document.getElementById("oldstyle");
			var oldzhekou = document.getElementById("zhekou");
			//alert(oldzhekou);
			onlyoid.value = oid;
			oldname.value = oname;
			oldprice.value = oprice;
			olddetail.value = odetail;
            oldzhekou.value = zhekou;
			oldstyle.value = ostyle;
			oldname.setAttribute("placeholder", oname);
			oldprice.setAttribute("placeholder", oprice);
			olddetail.setAttribute("placeholder", odetail);
			bg.style.display = "block";
			show.style.display = "block";
		}
		
		jQuery('#jiaYouZhan').change(function(){
	      var gid = document.getElementById("jiaYouZhan").value;
	      location = "${smvc }/youleiguanliback.do?choose="+gid;
	    });
		
		function changestatus(){
			
			var oldstyles = document.getElementById("oldstyles");
			var curOptObj=oldstyles.options(0);
			if(curOptObj.selected==false){
				document.getElementById("oldstyle").value = oldstyles.value;
		        
			}
		}

		function hidediv() {
			document.getElementById("bg").style.display = 'none';
			document.getElementById("show").style.display = 'none';
			var oldstyles = document.getElementById("oldstyles");

			    var curOptObj=oldstyles.options(0);
			    curOptObj.selected = true;
	
		}
		
		function addDiv() {
			var bg2 = document.getElementById("bg2");
			var show2 = document.getElementById("show2");
			bg2.style.display = "block";
			show2.style.display = "block";
			
			var request = new XMLHttpRequest();
		    request.open("post" , "${smvc }/daili_jiayouzhang.do?method=getAllGs&x="+Math.random());
		    request.send(null);
		   
		    request.onreadystatechange = function(){
		    
			if(request.readyState==4  && request.status ==200){
				
				var ret = request.responseText;
				var json = eval(ret);
				if(json==""){
			        alert("请先添加加油站");
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
			
		}
	    
	  
	    
	    function changeOstatus(oid,ostatus,id){
	        
	        if (ostatus==1) {
	         if(window.confirm('确定要禁用？')){
                $.ajax({
                 type: "post",
                 url: "daili_jiayouzhang.do?method=updateOstatus&time="+new Date().getTime(),     
                 data: {  
                 oid : oid,
                 ostatus : ostatus
                 },    
                 dataType: "json",
                 success: function(data) {
                     if(data.flag==1){
                     alert("提交成功！");
                      location.replace('daili_jiayouzhang.do');
                     }else
                     alert("内部错误，提交失败！");
                 },
                 error: function(data) {
                     alert("网络异常，提交失败");
                 }
                 })
                 return false;
              }
             }else{
               if(window.confirm('确定要启用？')){
              $.ajax({
                 type: "post",
                 url: "daili_jiayouzhang.do?method=updateOstatus&ran="+new Date().getTime(),   
                 data: {  
                 oid : oid,
                 ostatus : ostatus
                 },    
                 dataType: "json",
                 success: function(data) {
                   if(data.flag==1){
                     alert("提交成功！");
                      location.replace('daili_jiayouzhang.do');
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
                 url: "daili_jiayouzhang.do?method=updateOil&ran="+new Date().getTime(),   
                 data: $("#oilForm").serialize(),   
                  dataType: "json",  
                 success: function(data) {
                    if(data.flag==1){
                     alert("提交成功！");
                      location.replace('<%=request.getContextPath()%>/daili_jiayouzhang.do?p=getAllOilInfo&id=${param.id }');
                     }else
                     alert("内部错误，提交失败！");
                    
                 },
                 error: function(data) {
                     alert("网络异常，提交失败");
                 }
             })
              return false;
              }
         });
         
         $("#addSubmit").click(function(){
             $.ajax({
                 type: "get",
                 url: "daili_jiayouzhang.do?method=addOil&gid=${param.id}&ran="+new Date().getTime(),   
                 data: $("#addForm").serialize(),    
                 success: function(data) {
                     alert("新增成功！");
                     location.replace('<%=request.getContextPath()%>/daili_jiayouzhang.do?p=getAllOilInfo&id=${param.id }');
                 },
                 error: function(data) {
                     alert("网络异常，提交失败");
                 }
             })
              return false;
         });


          function ExistsData(obj){		 
           var t1 = document.getElementById("oname");
           var t2 = document.getElementById("oprice");
           var t3 = document.getElementById("odetail");
           var t4 = document.getElementById("oldstyle");
           
             if(obj==t2){
          obj.value = obj.value.replace(/[^\d.]/g, "");
		  obj.value = obj.value.replace(/^\./g, "");
		  obj.value = obj.value.replace(/\.{2,}/g, ".");
		  obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
		  obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3');
		  obj.value = obj.value.substring(0,8);
          }
          
           document.getElementById("oname").value = t1.value.substring(0,16);
          
          if(t1.value!= ""&&t2.value!=""&&t3.value!=""&&t4.value!=""){
          document.getElementById("updateSubmit").disabled = "";	
          document.getElementById("updateSubmit").style.color="white";
          }
	      else{
          document.getElementById("updateSubmit").disabled = "disabled";	
          document.getElementById("updateSubmit").style.color="gray";
          }
																}
         
          
          function ExistsData2(obj)	{		 
           var t1 = document.getElementById("newname");
           var t2 = document.getElementById("newprice");
           var t3 = document.getElementById("newdetail");
           
           if(obj==t2){
          obj.value = obj.value.replace(/[^\d.]/g, "");
		  obj.value = obj.value.replace(/^\./g, "");
		  obj.value = obj.value.replace(/\.{2,}/g, ".");
		  obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
		  obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3');
		  obj.value = obj.value.substring(0,8);	  
          }
           document.getElementById("newname").value = t1.value.substring(0,16);
          
          if(t1.value!= ""&&t2.value!=""&&t3.value!=""){
          document.getElementById("addSubmit").disabled = "";	
          document.getElementById("addSubmit").style.color="white";
          }
	      else{
          document.getElementById("addSubmit").disabled = "disabled";	
          document.getElementById("addSubmit").style.color="gray";
	      }
          }
          
          function showGS(){
              var request = new XMLHttpRequest();
  		    request.open("post" , "${smvc }/daili_jiayouzhang.do?method=getAllGs&x="+Math.random());
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
