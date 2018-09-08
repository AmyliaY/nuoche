<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<a href="javascript:pay(id,money)" >立即支付</a>


<script>
   function pay(id,money)
   {
     var type = doc....();
     switch(type)
     {
     
       case 2:
          location = "baofu/pay.jsp?id="+id+"&money="+money;
           break;
       
     }
   }
</script>