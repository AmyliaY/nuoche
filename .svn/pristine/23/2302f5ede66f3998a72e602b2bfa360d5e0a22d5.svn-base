package com.action.weixin;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.infinispan.util.TimSort;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.action.WeixinConfig;
import com.pojo.Applydetail;
import com.pojo.Province;
import com.service.daili.DailiUserInfoService;
import com.service.weixin.WeiXinAddressService;
import com.service.weixin.WeiXinApplyForQrcodeService;
import com.sun.org.apache.bcel.internal.generic.SIPUSH;
import com.util.URLManager;

import weixin.popular.api.OpenIdAPI;
import weixin.popular.bean.AccessToken;
import weixin.popular.util.JSSDKUtil;
/**
 * 微信端  申请二维码
 * @author 唐仁鑫
 * 
 *
 */
@Controller
@RequestMapping("/applyqrpay.do")	
public class WeiXinApplyQrPayAction {
	@Autowired
	private HttpServletRequest request;
	@Autowired 
	private WeiXinApplyForQrcodeService applyForQrcodeService;
	
	//  用户按照正常流程顺序购卡付款
	@RequestMapping(params = "method=toPayQrcode")
	public String toPayQrcode(HttpServletResponse response) {
		//System.out.println("来支付了!");
		// 1.得openId
		String orderid = request.getParameter("orderid");
		String money = request.getParameter("money");
		String openid = (String) request.getSession().getAttribute("openid");
		//System.out.println("orderid:"+orderid);
		//System.out.println("money:"+money);
		//System.out.println("openid:"+openid);
		//  查询数据库中的记录
		Applydetail applydetail = applyForQrcodeService.getdetailByOrderid(orderid);
		//System.out.println("数据库中的金额"+applydetail.getTotalFee());
		if(applydetail!=null)
		{
			// 2.去支付
			//System.out.println("从中心详细；金额匹配成功!");
			request.getSession().setAttribute("openid", openid);
			String notifyUrl = URLManager.getServerURL(request)+ "/weixinAbout.do";
			String json = JSSDKUtil.setPayParam(request, notifyUrl, money, orderid,
					openid);
			// 4.调用微信支付
			return "/weixin/pay/pay_example.jsp";
		}else{
			return "";
		}
		
	}
	
	//  用户从订单中心付款
	@RequestMapping(params = "method=toPayQrcode2")
	public String toPayQrcode2(HttpServletResponse response) {
		//System.out.println("来支付了!");
		// 1.得openId
		String orderid = request.getParameter("orderid");
		String openid = (String) request.getSession().getAttribute("openid");
		//System.out.println("orderid:"+orderid);
		//System.out.println("openid:"+openid);
		//  查询数据库中的记录
		Applydetail applydetail = applyForQrcodeService.getdetailByOrderid(orderid);
		//System.out.println("数据库中的金额"+applydetail.getTotalFee());
		if(applydetail!=null)
		{
			// 2.去支付
			request.getSession().setAttribute("openid", openid);
			String notifyUrl = URLManager.getServerURL(request)+ "/weixinAbout.do";
			String json = JSSDKUtil.setPayParam(request, notifyUrl, applydetail.getTotalFee().toString(), orderid,
					openid);
			// 4.调用微信支付
			return "/weixin/pay/pay_example.jsp";
		}else{
			return "";
		}
		
	}
	
	
}
