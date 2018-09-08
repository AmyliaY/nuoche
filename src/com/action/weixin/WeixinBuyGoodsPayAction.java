package com.action.weixin;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import weixin.popular.bean.pay.PayNotify;
import weixin.popular.util.JSSDKUtil;
import weixin.popular.util.XMLConverUtil;

import com.pojo.Userinfo;
import com.pojo.WeixinUser;
import com.shop.service.app.AppOrderService;
import com.shop.service.app.AppRechargeService;
import com.util.URLManager;

/**
 * 微信端微信支付-订单
 * 
 * @author lgh-pc
 * 
 */
@Controller
@RequestMapping("/wexinBuyGoodsPay.do")
public class WeixinBuyGoodsPayAction {

	@Autowired
	private AppRechargeService appRechargeService;
	
	@Autowired
	private AppOrderService appOrderService;

	@Autowired
	private HttpServletRequest request;

	@RequestMapping(params = "p=toPay")
	public String toPay() {

		String money = request.getParameter("money");
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");

		WeixinUser weixinuser = (WeixinUser) request.getSession().getAttribute(
				"weixinuser");

		if (userinfo == null || weixinuser == null) {
			return "/weixin/home/login.jsp";
		}

		// 写充值订单表
		String orderId = request.getParameter("orderId");
		
		String notifyUrl = URLManager.getServerURL(request)
				+ "/wexinBuyGoodsPay.do";
		String openId = weixinuser.getOpenid();
		JSSDKUtil.setPayParam(request, notifyUrl, money, orderId, openId);
		return "/pay/weixinpay/pay_example.jsp";
	}

	/**
	 * 微信支付回调函数
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping
	@ResponseBody
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		InputStream is = request.getInputStream();
		byte[] b = new byte[1024];
		int size = is.read(b);
		String str = new String(b, 0, size);

		// 获取请求数据
		PayNotify payNotify = XMLConverUtil.convertToObject(PayNotify.class,
				str);

		// 签名判断略...
		{

		}

		System.out.println("##########come on#########");
		System.out.println(payNotify.getResult_code());
		System.out.println(payNotify.getReturn_code());
		System.out.println(payNotify.getOut_trade_no());
		System.out.println(payNotify.getTotal_fee());
		// 支付成功
		if ("SUCCESS".equals(payNotify.getResult_code())
				&& "SUCCESS".equals(payNotify.getReturn_code())) {
			String trade_no = payNotify.getOut_trade_no();
			// if (trade_no.startsWith("jhthg"))
			{
				System.out.println("lailemei:微信支付");
				double money = 0.0f;
				if (payNotify.getTotal_fee() != null) {
					money = Double.parseDouble(payNotify.getTotal_fee()) / 100;
				}
				// String id=trade_no.substring(4);
				// 这里支付成功后修改订单状态
				// payService.payNew(trade_no, null, money + "");
				boolean f = appOrderService.updateOrder(null,trade_no, money);

				return "success";
			}

		} else {
			return "error";
		}

	}

}
