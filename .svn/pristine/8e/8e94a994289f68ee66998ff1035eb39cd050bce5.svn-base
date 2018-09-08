package com.shop.action.app;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.action.WeixinConfig;
import com.pojo.Userinfo;
import com.shop.service.app.AppRechargePayService;
import com.shop.service.app.AppRechargeService;
import com.util.JsonFilter;
import com.util.URLManager;

@Controller
@RequestMapping("/rechargepay.do")
public class AppRechargePayAction {

	@Autowired
	private HttpServletRequest request;
	@Autowired
	private AppRechargePayService appRechargePayService;

	@Autowired
	private AppRechargeService appRechargeService;

	/**
	 * 微信支付
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "p=wxPay")
	public String wxpay() {
		
		
		String orderId = UUID.randomUUID().toString().replaceAll("-", "");
		String notifyUrl = null;
		String money = request.getParameter("total");
		String title = "积分充值";

		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo != null) {
			String json = appRechargePayService.payByWxpay(notifyUrl, request,
					orderId);

			appRechargeService.addRecharRecords(userinfo, Double
					.parseDouble(money), orderId, 2);

			return json;
		}
		return "false";
	}


	// 创建订单号
	@ResponseBody
	@RequestMapping(params = "p=getOrderid")
	public String getOrderid() {

		String orderId = UUID.randomUUID().toString().replace("-", "");

		return orderId;
	}

	@ResponseBody
	@RequestMapping(params = "p=chongzhiStatus")
	public String chongzhiStatus() {
		WeixinConfig wx = new WeixinConfig();
		//AlipayConfig alipay = new AlipayConfig();
		Map map = new HashMap();
		map.put("wxstatus", wx.getStatus());
		map.put("alipayStatus", 0);
		JsonConfig config = new JsonConfig();
		JsonFilter.ignoredSet(config);
		JSONObject obj = new JSONObject();
		obj.putAll(map, config);
		String json = obj.toString();
		return json;
	}
}
