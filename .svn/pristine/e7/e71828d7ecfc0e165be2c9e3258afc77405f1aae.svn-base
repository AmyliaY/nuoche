package com.shop.service.app;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Hex;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import weixin.popular.api.PayMchAPI;
import weixin.popular.bean.paymch.Unifiedorder;
import weixin.popular.bean.paymch.UnifiedorderResult;
import weixin.popular.util.MapUtil;
import weixin.popular.util.SignatureUtil;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.dao.UserinfoDAO;
import com.pojo.Userinfo;

@Service
public class AppPayService {
	@Autowired
	private UserinfoDAO userinfoDAO;
	public Userinfo getAllUserinfo(int userid) {
		Userinfo userinfo=userinfoDAO.findById(userid);
		return userinfo;
	}
public Object payByWeixin(String out_trade_no,String subject,String body,String notify_url,float money,HttpServletRequest request) {
		
		
		//产生一个uuid 确定订单唯一 
		String uuid=UUID.randomUUID().toString().replaceAll("-","");
		
		Unifiedorder unifiedorder = new Unifiedorder();
		//微信开放平台审核通过的应用APPID
		unifiedorder.setAppid("wx0c84e9db258bd8b0");	// 1
		// 商品描述
		unifiedorder.setBody(subject);
		
		//终端设备号(门店号或收银设备ID)，默认请传"WEB" 可为空
		//unifiedorder.setDevice_info("");
		//商品标记，代金券或立减优惠功能的参数，说明详见代金券或立减优惠 示例值 WXG
		//unifiedorder.setGoods_tag("XYST");
		
		//微信支付分配的商户号
		unifiedorder.setMch_id("1418243302");			//2
		
		//随机字符串，不长于32位。推荐随机数生成算法
		unifiedorder.setNonce_str(uuid);
		
		//接收微信支付异步通知回调地址，通知url必须为直接可访问的url，不能携带参数。
		unifiedorder.setNotify_url(notify_url);// 通知地址
		
		//商户系统内部的订单号,32个字符内、可包含字母, 其他说明见商户订单号
		unifiedorder.setOut_trade_no(out_trade_no); // 外部订单号	           //3
		
//		unifiedorder.setProduct_id(out_trade_no);//产品号（二维码时有用)
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		//订单失效时间，格式为yyyyMMddHHmmss，如2009年12月27日9点10分10秒表示为20091227091010。其他详见时间规则
		//注意：最短失效时间间隔必须大于5分钟
		unifiedorder.setTime_expire(sdf.format(new java.util.Date(System
				.currentTimeMillis() + 24 * 3600 * 1000)));
		
		//订单生成时间，格式为yyyyMMddHHmmss，如2009年12月25日9点10分10秒表示为20091225091010
		Date date=new Date();
		unifiedorder.setTime_start(sdf.format(date)); 
		
		// 用户端实际ip
		unifiedorder.setSpbill_create_ip(request.getLocalAddr());
		String money2 = money*100 + ""; //
		int index = money2.indexOf('.');
		if (index > -1) {
			money2 = money2.substring(0, index);
		}
		//money2="1";
		// 订单总金额， Int 
		unifiedorder.setTotal_fee(money2); 
		
		//附加数据，在查询API和支付通知中原样返回，该字段主要用于商户携带订单的自定义数据
		//unifiedorder.setAttach("");
		
		//支付类型
		unifiedorder.setTrade_type("APP");
		

		String sign = SignatureUtil.generateSign(MapUtil.objectToMap(
				unifiedorder, "sign"), "XYST2016112520461124CENYUZHINENG");
		System.out.println("sign"+sign);
		unifiedorder.setSign(sign);
		
		// 自己写的 
//		String data=XMLConverUtil.convertToXML(MapUtil.objectToMap(unifiedorder));
//		String result = new HttpsRequest().sendPost("https://api.mch.weixin.qq.com/pay/unifiedorder", data);
//		UnifiedorderResult return_Result=XMLConverUtil.convertToObject(UnifiedorderResult.class, result);
		
		
		//引用了微信api的
		UnifiedorderResult return_Result=new PayMchAPI().payUnifiedorder(unifiedorder);
		
		String return_code=return_Result.getReturn_code();//此字段是通信标识，非交易标识，交易是否成功需要查看result_code来判断
		System.out.println(return_code);

		//这里 表示获取订单信息失败
		if("FAIL".equalsIgnoreCase(return_code)){
			String return_msg=return_Result.getReturn_msg();
			System.out.println(return_msg);
			return "false";
		}
		
		String timestamp = String.valueOf(System.currentTimeMillis() / 1000);
		
		String prepay_id=return_Result.getPrepay_id();
		
		String mch_id=return_Result.getMch_id();
		
		String noncestr=return_Result.getNonce_str();
		
		String appid=return_Result.getAppid();
		
		
		//还需要重新生成 sign
		String s="appid="+appid+"&noncestr="+noncestr+"&package=Sign=WXPay"+"&partnerid="+
        	mch_id+"&prepayid="+prepay_id+"&timestamp="+timestamp+"&key=" +"XYST2016112520461124CENYUZHINENG";
		String newSign = new String(Hex.encodeHex(DigestUtils.md5(s))).toUpperCase();
		
		StringBuffer json = new StringBuffer();
	    json.append("{\"appid\":\"");
	    json.append(appid);
	    json.append("\",\"noncestr\":\"");
	    json.append(noncestr);
	    json.append("\",\"package\":\"");
	    json.append("Sign=WXPay");
	    json.append("\",\"partnerid\":\"");
	    json.append(mch_id);
	    json.append("\",\"prepayid\":\"");
	    json.append(prepay_id);
	    json.append("\",\"timestamp\":\"");
	    json.append(timestamp);
	    json.append("\",\"sign\":\"");
	    json.append(newSign);
	    json.append("\"}");
		
		return json.toString();
	}
	public void setUserinfoMoney(int userid, Double newmoney) {
		Userinfo userinfo=userinfoDAO.findById(userid);
		if(userinfo!=null)
			userinfo.setUsersIntegral(newmoney);
			userinfoDAO.save(userinfo);
	}

}
