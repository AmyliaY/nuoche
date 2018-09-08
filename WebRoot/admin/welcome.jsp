<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="${pageContext.request.contextPath }/lib/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/lib/css/H-ui.admin.css" rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath }/lib/lib/Hui-iconfont/1.0.7/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>我的桌面</title>
</head>
<body>
<div class="pd-20" style="padding-top:20px;">
  <p class="f-20 text-success">欢迎使用归真太极养生 <span class="f-14">v1.0</span>后台管理！</p>
  <table class="table table-border table-bordered table-bg">
    <thead>
      <tr>
        <th colspan="7" scope="col">信息统计</th>
      </tr>
      <tr class="text-c">
        <th>统计</th>
        <th>会员</th>
        <th>订单数</th>
        <th>待发货数</th>
        <th>订单总金额</th>
      </tr>
    </thead>
    <tbody>
      <tr class="text-c">
        <td>今日</td>
        <td>${tjmap.udsum}</td>
        <td>${tjmap.odsum}</td>
        <td>${tjmap.daiodsum}</td>
        <td>${tjmap.odmoney} 元</td>
      </tr>
      <tr class="text-c">
        <td>本月</td>
        <td>${tjmap.usermonthsum}</td>
        <td>${tjmap.ordermonthsum}</td>
        <td>${tjmap.daiomsum}</td>
        <td>${tjmap.mmoney} 元</td>
      </tr>
      <tr class="text-c">
        <td>总数</td>
        <td>${tjmap.usersum}</td>
        <td>${tjmap.ordersum}</td>
        <td>${tjmap.daiordersum}</td>
        <td>${tjmap.moneysum} 元</td>
      </tr>
    </tbody>
  </table>
   <table class="table table-border table-bordered table-bg mt-20">
    <thead>
      <tr>
        <th colspan="2" scope="col">短信通知信息</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th width="200">短信通知剩余条数</th>
        <td><span id="lbServerName">${tjmap.msg}</span></td>
      </tr>
      <tr>
        <td>购买网址 </td>
        <td>http://253.com/</td>
      </tr>
      <tr>
        <td>账号 </td>
        <td>N2271140</td>
      </tr>
    </tbody>
  </table>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/js/H-ui.js"></script>
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F080836300300be57b7f34f4b3e97d911' type='text/javascript'%3E%3C/script%3E"));
</script>
</body>
</html>