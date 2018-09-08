<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>

		<meta charset="utf-8">
		<meta name="viewport"
			content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

		<title>我要加油</title>

		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/mui.min.css">

		<link href="${pageContext.request.contextPath}/weixin/css/mui.picker.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/weixin/css/mui.poppicker.css" rel="stylesheet" />

		<style>
#bg {
	width: 100%;
	height: 100%;
	background-color: black;
	position: fixed;
	top: 0;
	z-index: 3000;
	opacity: 0.25;
	display: none;
}

#bgson {
	display: none;
	position: absolute;
	top: 43%;
	left: 35%;
	width: 30%;
	height: 14%;
	background-color: gainsboro;
	border-radius: 3px;
	z-index: 3001;
	text-align: center;
}

body,html {
	height: 100%;
}

.mui-btn {
	font-size: 16px;
	padding: 8px;
	margin: 3px;
}

h5.mui-content-padded {
	margin-left: 3px;
	margin-top: 20px !important;
}

h5.mui-content-padded:first-child {
	margin-top: 12px !important;
}

.ui-alert {
	text-align: center;
	padding: 20px 10px;
	font-size: 16px;
}

.mui-content-padded {
	margin: 10px;
}

.mui-plus header.mui-bar {
	display: none !important;
}

.mui-plus .mui-bar-nav ~.mui-content {
	padding: 0 !important;
}

.mui-plus .plus {
	display: inline;
}

.plus {
	display: none;
}



#middlePopover {
	position: fixed;
	bottom: 16px;
	left: 6px;
}

#topPopover .mui-popover-arrow {
	left: auto;
	right: 6px;
}

p {
	text-indent: 22px;
}

span.mui-icon {
	font-size: 14px;
	color: #007aff;
	margin-left: -15px;
	padding-right: 10px;
}

.mui-popover {
	height: 300px;
	width: 100%;
}

.mui-content {
	padding: 10px;
}

#entry {
	text-align: center;
	right: 3%;
	margin-top: -100px;
	width: auto;
	height: auto;
	background: #fff;
	z-index: 1;
	position: absolute;
	/*设置圆角*/
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	padding: 15px;
	border-top: solid 1px #cacaca;
	border-left: solid 1px #cacaca;
	border-right: solid 1px #cacaca;
}

#entry-trangle {
	position: absolute;
	bottom: 0;
	width: 0;
	height: 0;
	border-left: 10px solid transparent;
	border-right: 10px solid transparent;
	border-top: 10px solid white;
	margin-bottom: -10px;
	margin-left: 110px;
}
</style>
	</head>

	<body>

		<div class="mui-content">
			<div class="mui-content-padded">

				<h5>
					加油站：
				</h5>
				
				<div>
				<input readonly="readonly" type=text id="gid" value="${station.gname}"/>
                </div>
                

				<h5>
					加油员：
				</h5>
				<div>
				<input readonly="readonly"  type=text id="geid" value="${emp.gename }"/>
                </div>

				<h5>
					请选择油类：
				</h5>

				<select id="oid" class="mui-btn mui-btn-block" name="oid"
					onchange="oilSelect()">

					<c:forEach items="${list}" var="oil" varStatus="status">
                        <c:if test="${status.index==0}">
                           <c:set var="zhekou" value="${oil.zhekou}"></c:set>
                           <c:set var="price" value="${oil.oprice}"></c:set>
                        </c:if>
						<option
							value="${oil.oid }-${oil.oprice*oil.zhekou }-${oil.zhekou }-${oil.oprice }"
							class="oil${oil.jiayouStation.gid }">
							${oil.oname }
							
						         （价格：${oil.oprice }元)
						</option>


					</c:forEach>

				</select>

			</div>
		</div>

		<div class="mui-input-group" style="padding-top: 10px;">


			<label style="width: auto; font-size: 15px;">
				&nbsp;&nbsp;&nbsp;&nbsp;消费金额
			</label>
			<div class="mui-input-row" style="height: auto;">

				<label style="width: auto; font-size: 40px;">
					￥
				</label>
				<input
					style="font-size: 40px; float: left; height: auto; line-height: normal;"
					id="gdmoney" type="number" class="mui-input-clear"
					placeholder="0.00" onkeyup="clearNoNum()">
			</div>

			<div class="mui-input-row">
				<label style="width: auto;">
					油量(升)
				</label>
				<input type="text" class="mui-input-clear" id="gdcount"
					disabled="disabled" style="white-space: pre;">
			</div>

		</div>

		<div class="mui-content">

			<div class="mui-content-padded">
				<button id='promptBtn' class="mui-btn mui-btn-primary mui-btn-block"
					disabled="disabled">
					立即支付
				</button>
				&nbsp;&nbsp;
			</div>

            <h5 class="mui-content-padded" style="display: none;">
            </h5>
			<c:if test="${!empty redpapers }">
				<div id="entry" style="display: none;">
					<div id="entry-trangle"></div>
					这里有未使用红包哦
					<br />
					<button id="turnoff" class="mui-btn  mui-btn-block"
						style="font-size: 13px;">
						我知道了
					</button>
				</div>
			</c:if>
			<h5 class="mui-content-padded" style="display: none;">
				付款方式


				<a href="#middlePopover" style="float: right;" id="hongbao"
					style="display:block;">使用红包</a>
			</h5>
			
			<div class="mui-input-row mui-radio mui-left" _style="display: none;">
				
				<input id="radio1" value="1" type="radio" name="Pay_style"  onclick="changeStyle1()"  checked="checked"/>
					
				<label>
					折扣优惠&nbsp;
					<font id="shen" size="2" color="#cacaca"><fmt:formatNumber
							value="${zhekou*10}" pattern="0.00" />折</font>
				</label>	
			</div>

			<div class="mui-input-row mui-radio mui-left" _style="display: none;">
			
				<input id="radio2" type="radio" name="Pay_style" value="2"
					onclick="changeStyle2()">
					<label>
					余额优惠&nbsp;
					<font size="2" color="#cacaca">余额<fmt:formatNumber
							value="${yuer}" pattern="0.0#" />元</font>
				    </label>
			</div>

			<div class="mui-input-row mui-radio mui-left" _style="display: none;">
				
				<input id="radio3" type="radio" name="Pay_style" value="3"
					onclick="changeStyle3(true)">
					
					<label >
					   红包优惠&nbsp;
					   <font size="2" color="#cacaca" id="hongbaoMsg">
					   </font>
				    </label>
			</div>
			
			<div style="margin-top: 8px;" class="mui-input-row"  align="center">
			    <a href="${pageContext.request.contextPath}/weixin_jiayou.do?method=renzheng">更多优惠，申请认证</a>
			</div>
		</div>

		<div id="middlePopover" class="mui-popover mui-popover-bottom">
			<div class="mui-popover-arrow"></div>
			<div class="mui-scroll-wrapper">
				<div class="mui-scroll">
					<ul class="mui-table-view">
						<c:forEach items="${redpapers }" var="redpaper">
							<li class="mui-table-view-cell">
								<a onclick=
	checkIt(this);;
><input type="checkbox"                 id="hongbao_${redpaper.id}"
										class="redpapers"
										value="${redpaper.youmoney}-${redpaper.money}-${redpaper.id}"
										disabled="disabled" />${redpaper.money }元红包<br />&nbsp;&nbsp;&nbsp;(消费满${redpaper.youmoney
									}元使用 &nbsp;&nbsp;2018-12-11到期)</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>

		</div>
		<div id="bg">
		</div>
		<div id="bgson">
			<br />
			<span class="mui-spinner" style="font-size: smaller;"></span>
			<br />

			<span style="font-size: smaller; color: gray;">加载中</span>
		</div>

         <form style='display:none;' id='formpay' name='formpay' method='post' action='https://pay.bbbapi.com'>
        <input name='goodsname' id='goodsname' type='text' value='' />
        <input name='istype' id='istype' type='text' value='' />
        <input name='key' id='key' type='text' value=''/>
        <input name='notify_url' id='notify_url' type='text' value=''/>
        <input name='orderid' id='orderid' type='text' value=''/>
        <input name='orderuid' id='orderuid' type='text' value=''/>
        <input name='price' id='price' type='text' value=''/>
        <input name='return_url' id='return_url' type='text' value=''/>
        <input name='uid' id='uid' type='text' value=''/>
        <input type='submit' id='submitdemo1'>
    </form>

		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>

		<script src="${pageContext.request.contextPath}/weixin/js/mui.picker.js"></script>
		<script src="js/mui.poppicker.js"></script>
		<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
		<script
			src="${pageContext.request.contextPath}/weixin/js/jquery-1.9.0.min.js"
			type="text/javascript" language="javascript"></script>
		<script>
	var total = 0;
   var redbagArray =[];
   var redbagMoney = 0;	
	var gid = document.getElementById("gid");
	var geid = document.getElementById("geid");
	var oid = null;
	var fcount = null;
	var gdmoney = document.getElementById("gdmoney").value;
	var gdcount = null;
	var oilAll = document.getElementById("oid").innerHTML;
	var limit = 0;
	mui.init( {
		swipeBack : true
	//启用右滑关闭功能
			});
	mui('.mui-scroll-wrapper').scroll();
	mui('body').on('shown', '.mui-popover', function(e) {

	});
	mui('body').on('hidden', '.mui-popover', function(e) {

	});
	if (document.getElementById("turnoff") != null) {
		document.getElementById("turnoff").addEventListener("tap", function() {
			document.getElementById("entry").style.display = "none";
			document.getElementById("entry-trangle").style.display = "none";
		});
	}



	function checkIt(obj) {
        gdmoney = document.getElementById("gdmoney").value;
		var str = obj.childNodes[0].value.split("-");
		var oil = document.getElementById("oid").value.split("-");
		oid    = oil[0];
		money  = oil[1];
		zhekou = oil[2];
     	price  = oil[3];
     	gdcount = gdmoney/price;
		if (!obj.childNodes[0].checked) {
			limit += parseFloat(str[0]); //油
			total += parseFloat(str[1]); //红包
			
			if (gdmoney == "") {
				obj.childNodes[0].checked = "";
				limit -= parseFloat(str[0]);
				total -= parseFloat(str[1]);
				mui.toast("消费金额不足");
				return;
			}
			if (limit > parseFloat(gdmoney)) {
				obj.childNodes[0].checked = "";
				limit -= parseFloat(str[0]);
				total -= parseFloat(str[1]);
				mui.toast("消费金额不足");
				return;
			}
			obj.childNodes[0].checked = "true";
			document.getElementById("gdcount").value = gdcount.toFixed(2) + "  实际消费(￥)："
					+ (gdmoney - parseFloat(str[1])).toFixed(2);
				
			//gdmoney = parseFloat(gdmoney) - parseFloat(str[1]);
			
			redbagArray.push(str[2]);
			redbagMoney+=str[1]*1;
			
			if (redbagMoney>0)
			   document.getElementById("hongbaoMsg").innerHTML = "红包金额:"+redbagMoney;
		    else
		       document.getElementById("hongbaoMsg").innerHTML = "";
		} else {
            redbagArray.remove(str[2]);
			redbagMoney-=str[1]*1;
			var cha = gdmoney - redbagMoney;
			obj.childNodes[0].checked = "";
			document.getElementById("gdcount").value = gdcount.toFixed(2) + "  实际消费(￥)："
					+ cha.toFixed(2);
			//gdmoney = parseFloat(gdmoney) + parseFloat(str[1]);
			limit -= parseFloat(str[0]); //油
			total -= parseFloat(str[1]); //金额 
			
			if (redbagMoney>0)
			   document.getElementById("hongbaoMsg").innerHTML = "红包金额:"+redbagMoney;
		    else
		       document.getElementById("hongbaoMsg").innerHTML = "";
		}
		
		

	}

	function getElementsByClassName(n) {

		var classElements = [], allElements = document
				.getElementsByTagName('*');
		for ( var i = 0; i < allElements.length; i++) {
			if (allElements[i].className == n) {
				classElements[classElements.length] = allElements[i];
			}
		}
		return classElements;
	}
	
	$(function(){
	   if (${empty redpapers})
     	{
     	    document.getElementById("hongbaoMsg").innerHTML = "暂无可用红包 ";
     	    return;
     	}
	});

	
	function changeStyle1() {
		
        var oil = document.getElementById("oid").value.split("-");
		
		oid    = oil[0];
		money  = oil[1];
		zhekou = oil[2];
     	price  = oil[3];
     	
		var oldMoney = document.getElementById("gdmoney").value;
		if (oldMoney=="")
		{
		   document.getElementById("gdcount").value = "0.00   实际消费(￥)：0.00";
		   return;
					
		}
		var shen = oldMoney/price;
		document.getElementById("gdcount").value = shen.toFixed(2) + "  实际消费(￥)："+(oldMoney*zhekou).toFixed(2);
	    var  zhe2 = zhekou*10;
	    document.getElementById("shen").innerHTML =zhe2.toFixed(2)+'折';
	}

	function changeStyle2() {
		//document.getElementById("hongbao").style.display = "block";

		////var radio1 = document.getElementById("radio1");
		//radio1.checked = 0;
		
        var oil = document.getElementById("oid").value.split("-");
		
		oid    = oil[0];
		money  = oil[1];
		zhekou = oil[2];
     	price  = oil[3];
     	
		//document.getElementById("hongbao").style.display = "none";
		//var radio2 = document.getElementById("radio2");
		//radio2.checked = 0;
		var oldMoney = document.getElementById("gdmoney").value;
		if (oldMoney=="")
		{
		   document.getElementById("gdcount").value = "0.00   实际消费(￥)：0.00";
		   return;
					
		}
		var shen = oldMoney/price;
		var cha  = oldMoney-'${yuer}';
		if (cha<0) 
		    cha = 0;
		document.getElementById("gdcount").value = shen.toFixed(2) + "  需要支付(￥)："+cha.toFixed(2);
	}
	
	function changeStyle3(show){  
       
        var oil = document.getElementById("oid").value.split("-");
		
		oid    = oil[0];
		money  = oil[1];
		zhekou = oil[2];
     	price  = oil[3];
     	
     	if (${empty redpapers})
     	{
     	    document.getElementById("hongbaoMsg").innerHTML = "暂无可用红包 ";
     	    return;
     	}
     	else
     	   document.getElementById("hongbaoMsg").innerHTML = "";
     	
     	
		//document.getElementById("hongbao").style.display = "none";
		//var radio2 = document.getElementById("radio2");
		//radio2.checked = 0;
	
		var oldMoney = document.getElementById("gdmoney").value;
		if (oldMoney=="")
		{
		   document.getElementById("gdcount").value = "0.00   实际消费(￥)：0.00";
		   return;
					
		}
		
		var shen = oldMoney/price;
		
    	if (redbagArray.length>0)
    	{
	    	for (var i in redbagArray)
	    	{
	    	   var hb = document.getElementById("hongbao_"+redbagArray[i]);
	    	   if (hb)
	    	    hb.checked = true;
	    	}
    	}
    	var cha = oldMoney - redbagMoney;
    	if (cha<0) cha = 0;
    	document.getElementById("gdcount").value = shen.toFixed(2) + "  实际消费(￥)："
					+ cha.toFixed(2);
				
	    if (show)			
		mui('#middlePopover').popover('show');
    }
    

	function clearNoNum() {
	    for (var i in redbagArray)
	    {
	    	   var hb = document.getElementById("hongbao_"+redbagArray[i]);
	    	   if (hb)
	    	    hb.checked = false;
	    }
	    
	    if (document.getElementById("gdmoney").value != ""
				&& document.getElementById("gdmoney").value != 0)
			document.getElementById("promptBtn").disabled = "";
		else
			document.getElementById("promptBtn").disabled = "disabled";
			
			
	    document.getElementById("hongbaoMsg").innerHTML = "";	
	    redbagArray.length = 0;
	    redbagMoney = 0;
	    limit = 0;
	    total = 0;
	    $("input[name=Pay_style]:checked").trigger("click");
	    return;
	  
		limit = 0;
		total = 0;
		jQuery.each($("input[type=checkbox]"), function(i, n) {

			n.checked = "";

		});
		if (document.getElementById("gdmoney").value != ""
				&& document.getElementById("gdmoney").value != 0)
			document.getElementById("promptBtn").disabled = "";
		else
			document.getElementById("promptBtn").disabled = "disabled";
		var obj = document.getElementById("gdmoney");
		obj.value = obj.value.replace(/[^\d.]/g, "");
		obj.value = obj.value.replace(/^\./g, "");
		obj.value = obj.value.replace(/\.{2,}/g, ".");
		obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace(
				"$#$", ".");
		obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3');
		obj.value = obj.value.substring(0, 8);

		var str = document.getElementById("oid").value;

		var str2 = str.split("-");
		oid = str2[0];
		fcount = str2[2];
		var gasprice = str2[3];
		gdmoney = (obj.value * fcount).toFixed(2);
		if (gdmoney < 0.01 && gdmoney != 0)
			gdmoney = 0.01;

		document.getElementById("gdcount").value = obj.value / gasprice;
		document.getElementById("gdcount").value = document
				.getElementById("gdcount").value.replace(/\.{2,}/g, ".");
		document.getElementById("gdcount").value = document
				.getElementById("gdcount").value.replace(".", "$#$").replace(
				/\./g, "").replace("$#$", ".");
		document.getElementById("gdcount").value = document
				.getElementById("gdcount").value.replace(
				/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3');
		gdcount = document.getElementById("gdcount").value;

		document.getElementById("gdcount").value = document
				.getElementById("gdcount").value
				+ "  实际消费(￥)：" + (gdmoney - total).toFixed(2);

	}

	function oilSelect() {
	
	    $("input[name=Pay_style]:checked").trigger("click");
	    return;
	  
	  
		limit = 0;
		total = 0;
		jQuery.each($("input[type=checkbox]"), function(i, n) {

			n.checked = "";

		});
		var oil = document.getElementById("oid").value.split("-");
		gasprice = oil[1];
		oid = oil[0];
		fcount = oil[2];
		oldprice = oil[3];
		var gdmoneyj = document.getElementById("gdmoney");
		document.getElementById("gdcount").value = gdmoneyj.value / oil[3];
		document.getElementById("gdcount").value = document
				.getElementById("gdcount").value.replace(/\.{2,}/g, ".");
		document.getElementById("gdcount").value = document
				.getElementById("gdcount").value.replace(".", "$#$").replace(
				/\./g, "").replace("$#$", ".");
		document.getElementById("gdcount").value = document
				.getElementById("gdcount").value.replace(
				/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3');
		gdcount = document.getElementById("gdcount").value;//折扣
		var real = gdmoneyj.value * fcount;
		gdmoney = real;
		if (gdmoney < 0.01 && gdmoney != 0)
			gdmoney = 0.01;
		document.getElementById("gdcount").value = document
				.getElementById("gdcount").value
				+ "  需要支付(￥)：" + real.toFixed(2);
		var  fcount2 = fcount*10;		
		document.getElementById("").innerHTML =fcount2.toFixed(2)+  "折,省"+(oldprice-gasprice);		

	}

	function zhifu() {

		if (isNaN(gdcount) || gid.value == "" || geid.value == "")
			return;

		var radio1 = document.getElementById("radio1");
		var radio2 = document.getElementById("radio2");
		var redpapers = getElementsByClassName("redpapers");
		var str = "";

		for ( var i = 0; i < redpapers.length; i++) {

			if (redpapers[i].checked) {
				var array = redpapers[i].value.split("-");
				str += array[2] + ",";

			}
		}
		var zonge = document.getElementById("gdmoney").value;
		if (radio1.checked == true) {

			if (gdmoney > parseFloat("${yue }")) {
				alert("余额不足！");
				return;
			}
			document.getElementById("bg").style.display = "block";
			document.getElementById("bgson").style.display = "block";
			var dizhi1 = "woyaojiayou.do?method=yuezhifu&gid=" + gid.value
					+ "&geid=" + geid.value + "&gdmoney=" + gdmoney + "&oid="
					+ oid + "&fcount=" + fcount + "&id=${id }&gdcount="
					+ gdcount + "&str=" + str + "&total=" + total + "&zonge="
					+ zonge + "-flag";
			location.replace(dizhi1);
		} else {

			var dizhi2 = "woyaojiayou.do?method=weixinzhifu&gid=" + gid.value
					+ "&geid=" + geid.value + "&gdmoney=" + gdmoney
					+ "&isRest=0&oid=" + oid + "&fcount=" + fcount
					+ "&id=${id }&weixinhao=${weixinhao }&gdcount=" + gdcount
					+ "&str=" + str + "&total=" + total + "&zonge=" + zonge
					+ "-flag";
			location.replace(dizhi2);
			return false;
		}
	}
	
	
	$("#promptBtn").click(function(){
	       $.post(
            "${pageContext.request.contextPath}/pays.do?p=toPay",
            {
                price : $("#gdmoney").val(), 
                empId:   ${emp.geid},
                youId:   $("#oid").val(),
                type :   $("input[name=Pay_style]:checked").val(), //1折扣
                redbag:  redbagArray.join(",")

            },
            function(data){ 
               
                if (data.code > 0){
                    $("#goodsname").val(data.data.goodsname);
                    $("#istype").val(data.data.istype);
                    $('#key').val(data.data.key);
                    $('#notify_url').val(data.data.notify_url);
                    $('#orderid').val(data.data.orderid);
                    $('#orderuid').val(data.data.orderuid);
                    $('#price').val(data.data.price);
                    $('#return_url').val(data.data.return_url);
                    $('#uid').val(data.data.uid);
                    $('#submitdemo1').click();

                } else {
                    alert(data.code);
                }
            }
        );
	});
	
   //删除数组指定元素	
   Array.prototype.remove= function(data)
   {
   	  var index = -1;
   	  for (var i in  this)
   	  {
   	  	  if (this[i]==data)
   	  	  {
   	  	  	 index = i;
   	  	  	 break;
   	  	  }
   	  }
   	  if (index==-1)
   	       return 0;
   	  this.splice(index,1);     
   }
</script>
	</body>

</html>