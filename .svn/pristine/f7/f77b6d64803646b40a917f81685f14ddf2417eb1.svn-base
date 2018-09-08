<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>微信支付</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/weixin/js/jquery.min.js" ></script>
<script type="text/javascript">
//json 数据
/*

	用于微信公众号的内部支付
	请勿修改
*/
var x_json = ${json};

var obj = eval(x_json);

  //调用微信JS api 支付
        function jsApiCall()
        {
            WeixinJSBridge.invoke(
                'getBrandWCPayRequest',
                 obj,
                function(res){
                    //alert(res.err_code+res.err_desc+res.err_msg);
                    if (res.err_msg=="get_brand_wcpay_request:ok") //支付成功
                    {
                    	var openid  = '${openid}';
						window.location ="${pageContext.request.contextPath }/useryuyueRecord.do?p=index&openid="+openid;        		
                    }
                    else if (res.err_msg=="get_brand_wcpay_request:cancel") //支付过程中用户取消
                    {
                       alert('取消');
                     	
                       
                    }
                    else if (res.err_msg=="get_brand_wcpay_request:fail") //支付失败
                    {
                      alert('FALL');
                    }
                    
                    
                }
            );
        }

        function callpay()
        {
            if (typeof WeixinJSBridge == "undefined"){
                if( document.addEventListener ){
                    document.addEventListener('WeixinJSBridgeReady', jsApiCall, false);
                }else if (document.attachEvent){
                    document.attachEvent('WeixinJSBridgeReady', jsApiCall); 
                    document.attachEvent('onWeixinJSBridgeReady', jsApiCall);
                }
            }else{
                jsApiCall();
            }
        }
        
        onload  = function()
        {
          callpay();
        }

</script>
</head>
<body>

</body>
</html>