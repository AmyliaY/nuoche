<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
		<link href="${pageContext.request.contextPath }/lib/css/H-ui.min.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath }/lib/css/H-ui.admin.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath }/lib/lib/icheck/icheck.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath }/lib/lib/Hui-iconfont/1.0.7/iconfont.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/webuploader.css"
			rel="stylesheet" type="text/css" />
		<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
		<title>后台充值</title>
	</head>
	<body>
		<div class="pd-20">
			<div class="form form-horizontal" id="form-member-add">
				<div class="row cl">
					<label class="form-label col-3">
						<span class="c-red">*</span>会员名称：
					</label>
					<div class="formControls col-3" style="margin-top: 3px;">
						${users.usersName}
					</div>
					<div class="col-4">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-3">
						<span class="c-red">*</span>充值金额：
					</label>
					<div class="formControls col-3">
						<input type="text" class="input-text" placeholder="" id="price" onkeyup="go()"
							name="price">
					</div>
					<div class="col-4" id="msg">
					</div>
				</div>
				
				<div class="row cl">
					<label class="form-label col-3">
						<span class="c-red"></span>充值赠送：
					</label>
					<div class="formControls col-9" id="recharge-div">
					</div>
				</div>
				
				
				
				<div class="row cl">
					<div class="col-12 col-offset-2">
						<input class="btn btn-primary radius" id="sub"
							onclick="return tijiao()" type="submit"
							value="&nbsp;&nbsp;充值&nbsp;&nbsp;">
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/icheck/jquery.icheck.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/Validform/5.3.2/Validform.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/layer/2.1/layer.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/js/H-ui.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/js/H-ui.admin.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/webuploader/0.1.5/webuploader.min.js"></script>
		<script type="text/javascript">
function tijiao()
{
	var price=$("#price").val();
	if(price==null || ""==price)
	{
		layer.msg("充值金额不能为空！",{icon:5,time:1000});
		return false;
	}
	if(!price.match('^[0-9]*$'))
	{	
		layer.msg("金额只能输入数字",{icon:6,time:1000});
		return false;
	}
	$.ajax({
		url:"${pageContext.request.contextPath}/users.do?p=userschongzhi&id=${users.usersId}",
		type:"post",
		data:{price:price},
		success:function()
		{
			window.parent.location.reload();
		}
	});
}

$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	//充值优惠
	var presentList = eval("(" + '${json}' + ")"); //得到优惠信息list
						
						if(presentList.length > 0) {
							var div = document.createElement("div");
							div.className = "reminder";
							var str = '<p class="tishi" style="margin-top: 10px;margin-bottom: 5px;">温馨提示</p>';
							for(var i = 0; i < presentList.length; i++) {
					
									str = str + '<p class="tishi">充值' + presentList[i].ppMin + '-'+presentList[i].ppMax+'积分送' + presentList[i].ppPresent + '积分</p>'
								
							}
							
							div.innerHTML = str;
							$("#recharge-div").append(div);
						

						}
	
});

  function go()
  {
      //msg,price
      var money = $("#price").val();
      var msg   = $("#msg");
      msg.html("");
      if (money=="")
       return;
      if (isNaN(money))
      {
         msg.html("只能是数字");
         return false;
      }
     if (money*1<0)
     {
         msg.html("不能负数");
         return false;
     }
     
     var presentList = eval("(" + '${json}' + ")");
     for (var i=0;i<presentList.length;i++)
     {
        var min = presentList[i].ppMin;
        var max = presentList[i].ppMax;
        if (money*1>=min && money*1<=max)
        {
           msg.html("赠送积分:"+presentList[i].ppPresent);
           return false;  
         }
     }
      
  }      
</script>
	</body>
</html>













