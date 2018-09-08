<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
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
<title>财务统计</title>
</head>
<body>
<div class="pd-20" style="padding-top:20px;">
  <p class="f-20 text-success">欢迎使用卡卡挪车 <span class="f-14">v1.0</span>后台管理！</p>
  <table class="table table-border table-bordered table-bg">
    <thead>
      <tr>
        <th colspan="11" scope="col">平台财务统计</th>
      </tr>
      <tr class="text-c">
        <th>统计</th>
        <th>会员人数</th>
        <th>会员充值</th>
        <th>代理充值</th>
        <th>预约服务收入</th>
        <th>代理领卡收入</th>
        <th>线上销售二维码收入</th>
        <th>提现支出</th>
        <th>代理置顶收入</th>
         <th>轮播收入</th>
        <th>收入总金额</th>
      </tr>
    </thead>
    <tbody>
      <tr class="text-c">
        <td>今日</td>
        <td>${tjmap.udsum}</td>
        <td><fmt:formatNumber value="${tjmap.cguserxufeisumday}" type="currency"/></td>
        <td><fmt:formatNumber value="${tjmap.proxychongzhidaysum}" type="currency"/></td>
        <td><fmt:formatNumber value="${tjmap.odsum+tjmap.daiodsum*1.0}" type="currency"/></td>
        <td><fmt:formatNumber value="${tjmap.proxylingkadaysum}" type="currency"/></td>
        <td><fmt:formatNumber value="${tjmap.applydaysum}" type="currency"/></td>
        <td><fmt:formatNumber value="${tjmap.vipcashdaysum+tjmap.proxycashdaysum}" type="currency"/></td>
        <td><fmt:formatNumber value="${tjmap.topdaysum}" type="currency"/></td>
        <td><fmt:formatNumber value="${tjmap.lunbodaysum}" type="currency"/></td>
         <td><fmt:formatNumber value="${tjmap.cguserxufeisumday+tjmap.proxychongzhidaysum+tjmap.totalpaydaysum2+tjmap.totalfeedaysum+tjmap.totalfeedaysum1+tjmap.toppricesumday+tjmap.lunbopricesumday+tjmap.qrcodeProxypricesumday-tjmap.vipcashdaysum-tjmap.proxycashdaysum }" type="currency"/></td>
      </tr>
      <tr class="text-c">
        <td>本月</td>
        <td>${tjmap.usermonthsum}</td>
         <td><fmt:formatNumber value="${tjmap.cguserxufeimonthsum}" type="currency"/></td>
         <td><fmt:formatNumber value="${tjmap.proxychongzhimonthsum}" type="currency"/></td>
        <td><fmt:formatNumber value="${tjmap.ordermonthsum + tjmap.daiomsum*1.0}" type="currency"/></td>
        <td><fmt:formatNumber value="${tjmap.proxylingkamonthsum}" type="currency"/></td>
        <td><fmt:formatNumber value="${tjmap.applymonthsum}" type="currency"/></td>
         <td><fmt:formatNumber value="${tjmap.vipcashmonthsum+tjmap.proxycashmonthsum}" type="currency"/><c:out value=" "></c:out></td>
         <td><fmt:formatNumber value="${tjmap.topmonthsum}" type="currency"/></td>
         <td><fmt:formatNumber value="${tjmap.lunbomonthsum}" type="currency"/></td>
          <td><fmt:formatNumber value="${tjmap.cguserxufeimonthsum+tjmap.proxychongzhimonthsum+tjmap.totalpaymonthsum2+tjmap.totalfeemonthsum+tjmap.totalfeemonthsum1+tjmap.toppricesummonth+tjmap.lunbopricesummonth+tjmap.qrcodeProxypricesummonth-tjmap.vipcashmonthsum-tjmap.proxycashmonthsum }" type="currency"/> </td>
       
      </tr>
      <tr class="text-c">
        <td>总数</td>
        <td>${tjmap.usersum}</td>
        <td><fmt:formatNumber value="${tjmap.xufeisum}" type="currency"/></td>
        <td><fmt:formatNumber value="${tjmap.proxychongzhisum}" type="currency"/></td>
         <td><fmt:formatNumber value="${tjmap.ordersum+tjmap.daiordersum*1.0}" type="currency"/></td>
        <td><fmt:formatNumber value="${tjmap.proxylingkasum}" type="currency"/></td>
       <td><fmt:formatNumber value="${tjmap.applysum}" type="currency"/></td>
     <td><fmt:formatNumber value="${tjmap.vipcashsum+tjmap.proxycashsum}" type="currency"/></td>
     <td><fmt:formatNumber value="${tjmap.topsum}" type="currency"/></td>
     <td><fmt:formatNumber value="${tjmap.lunbosum}" type="currency"/></td>
        <td><fmt:formatNumber value="${tjmap.xufeisum+tjmap.proxychongzhisum+tjmap.totalpaysum2+tjmap.totalfeesum+tjmap.totalfeesum1+tjmap.toppricesum+tjmap.lunbopricesum+tjmap.qrcodeProxypricesum-tjmap.vipcashsum-tjmap.proxycashsum }" type="currency"/></td>
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