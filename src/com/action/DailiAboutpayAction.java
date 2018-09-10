package com.action;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.listener.WeixinGetAccessTokenListen;
import com.pojo.Applydetail;
import com.pojo.Proxy;
import com.pojo.ProxyCash;
import com.pojo.Yuyue;
import com.service.daili.DailiChongzhiService;
import com.service.daili.DailiChongzhipayService;
import com.service.weixin.WeixinUserYuyueTopayService;
import com.service.weixin.WeiXinApplyForQrcodeService;
import com.util.URLManager;
import com.weixin.util.ParseXmlUtil;

import weixin.popular.api.OpenIdAPI;
import weixin.popular.bean.AccessToken;
import weixin.popular.bean.pay.PayNotify;
import weixin.popular.util.JSSDKUtil;
import weixin.popular.util.MapUtil;
import weixin.popular.util.SignatureUtil;
import weixin.popular.util.XMLConverUtil;

/**
 * 代理充值调用微信支付Action
 * 查仕龙
 * 
 * @author lgh
 * 
 */
@Controller
@RequestMapping("/dailipayAbout.do")
public class DailiAboutpayAction {

	@Autowired
	private HttpServletRequest request;
	@Autowired
	private DailiChongzhipayService dailichongzhipayservice;
	
	
	
	
	

	

	@RequestMapping
	public String payNotify(HttpServletResponse response) throws IOException {
		InputStream is = request.getInputStream();
		byte[] b = new byte[1024];
		int size = is.read(b);
		String str = new String(b, 0, size);
		System.out.println("封装的xml："+str);
		// 获取请求数据
		PayNotify payNotify = XMLConverUtil.convertToObject(PayNotify.class,
				str);

		// 签名判断略...
		String sign = payNotify.getSign();

		boolean f = SignatureUtil.validateAppSignature(payNotify,
				WeixinConfig.PAY_KEY);
		System.out.println("签名判断："+f);
		

		
		// 支付成功
		if ("SUCCESS".equals(payNotify.getResult_code())
				&& "SUCCESS".equals(payNotify.getReturn_code())) {
			String trade_no = payNotify.getOut_trade_no();
			
		//  支付成功改充值订单状态
			dailichongzhipayservice.updateStatusByOrderid(trade_no);
	
		//支付成功之后将充值金额存入代理表
			dailichongzhipayservice.updatecash(trade_no);
			
					
			
			response.getOutputStream().write("success".getBytes());

		} else {
			response.getOutputStream().write("error".getBytes());
		}
        
		return null;

	}

	@RequestMapping(params = "p=toPay")
	public String toPay(HttpServletResponse response) {
		// 1.得openId
		String id = request.getParameter("id");
		String money = request.getParameter("money");
		String openId = (String) request.getSession().getAttribute("weixinhao");

		// 2.去支付
		String notifyUrl = URLManager.getServerURL(request)+ "/dailipayAbout.do";
		String json = JSSDKUtil.setPayParam(request, notifyUrl, money, id,
				openId);

		// 4.调用微信支付
		return "/weixin/pay/pay_example.jsp";
	}

	@RequestMapping(params = "method=aboutbcm")
	public String showAbout(HttpServletResponse response) {
		// ------------------获取客户的微信号 :@author lgh ------------------//
		String code = request.getParameter("code");
		String appid = WeixinConfig.APPID;
		String secret = WeixinConfig.APPSECRET;
		AccessToken accessToken = new OpenIdAPI()
				.getOpenId(appid, secret, code);
		String weixinhao = accessToken.getOpenid();
		// System.out.println("客户微信号------------"+weixinhao);
		// --------------- end 获取客户的微信号----------------//
		System.out.println("微信号:" + weixinhao);

		return "/index.jsp";
	}

	@RequestMapping(params = "method=testClick")
	public String testClick(HttpServletResponse response)
			throws UnsupportedEncodingException {
		// ------------------获取客户的微信号 :@author lgh ------------------//
		String code = request.getParameter("code");
		String appid = WeixinConfig.APPID;
		String secret = WeixinConfig.APPSECRET;
		AccessToken accessToken = new OpenIdAPI()
				.getOpenId(appid, secret, code);
		String weixinhao = accessToken.getOpenid();
		System.out.println("微信号:" + weixinhao); // 有的时候，要验证是否新用户，就要录入手机号码

		// 如果要使用jssdk
		JSSDKUtil.setJsSdkParam(request);

		request.getSession().setAttribute("weixinhao", accessToken.getOpenid());

		return "/weixin_share.jsp";
	}
}
