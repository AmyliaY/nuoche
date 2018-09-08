package com.shop.action.app;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import weixin.popular.util.JSSDKUtil;

import com.pojo.Goodsorders;
import com.pojo.Userinfo;
import com.pojo.WeixinUser;
import com.shop.service.app.AppOrderService;
import com.shop.service.app.AppPayService;
import com.util.URLManager;

@Controller
@RequestMapping("/apppay.do")
public class AppPayAction {
	@Autowired
	private AppPayService appPayService;
	@Autowired
	private AppOrderService appOrderService;
	@Autowired
	private HttpServletRequest request;

	/**
	 * 积分支付
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "p=payjifen")
	public String payjifen() {

		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "请先登录";
		}

		int userid = Integer.parseInt(request.getParameter("userid")); // 会员ID
		Double jifenpay = Double.parseDouble(request.getParameter("jifenpay")); // 支付的积分

		String ddhao = request.getParameter("ddhao"); // 订单号
		Goodsorders orders = appOrderService.findByOrderId(ddhao);
		if (orders == null || orders.getOrStatus() != 0)
			return "订单不存在或已支付";
		Double money = orders.getOrPrice(); // 需支付的总金额
		Double userjifen = userinfo.getUsersIntegral(); // 会员积分余额
		// 二次判断
		if (jifenpay > userjifen) {
			System.out.println("支付金额大于余额积分");
			return "大于";
		}
		// 修改会员积分 支付后会员积分
		Double newmoney = userjifen - jifenpay;
		// System.out.println("支付后会员积分：" + newmoney);
		appPayService.setUserinfoMoney(userid, newmoney);
		// 如果 支付的积分 == 需支付的总金额 则 订单结束 订单状态改为1(已付款) 不需要第三方支付 否则订单为结束 订单状态还是未付款
		// 需第三方支付剩余余额
		appOrderService.updateOrder(userid, ddhao, jifenpay);
		return "支付成功";
	}

	/**
	 * 积分支付
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "p=jifenPay")
	public String jifenPay() {
		int userid = Integer.parseInt(request.getParameter("userid")); // 会员ID
		String paypwd = request.getParameter("mima"); // 支付密码
		Double money = Double.parseDouble(request.getParameter("money")); // 支付金额
		String ddhao = request.getParameter("ddhao");// 订单号
		Userinfo userinfo = appPayService.getAllUserinfo(userid);
		Double jifen = userinfo.getUsersIntegral(); // 会员余额积分
		if (money > jifen) {
			System.out.println("支付金额大于余额积分");
			return false + "";
		}
		Double newmoney = 0.00;
		String truepaypwd = userinfo.getUsersPaypwd();
		if (paypwd.equals(truepaypwd)) {
			System.out.println("密码正确");
			// 余额 - 支付金额 修改会员积分
			newmoney = jifen - money;
			System.out.println("新money:" + newmoney);
			appPayService.setUserinfoMoney(userid, newmoney);
			// 修改订单状态
			appOrderService.updateOrder(userid, ddhao, money);
			return true + "";
		} else {
			System.out.println("密码错误");
			return false + "";
		}
	}

	
	
	/**
	 * 微信支付回掉
	 * @param request
	 * @param response
	 * @return 支付成功
	 * @throws IOException
	 */
	@RequestMapping(params="p=callback")
	public String callback(HttpServletRequest request,HttpServletResponse response)
			throws IOException{
		
		WeixinUser weixinuser = (WeixinUser) request.getSession().getAttribute("weixinuser"); //判断
				
		
		//判断是否登陆
		if(request.getSession().getAttribute("weixinuser")!=null){
			return "/weixin/home/login.jsp";
		}
		
		String orderId = request.getParameter("orderId"); // 订单号
		String money = request.getParameter("money"); // 应付总金额
		appOrderService.alipayEditOrder(orderId, money);

		
		return "/weixin/goodsdetail/paySuccess.jsp";
	}
	
	
	
	

	/**
	 * 微信端支付发起
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params="p=weinPay")
	public String weixinPay(HttpServletRequest request,HttpServletResponse response)
		throws IOException{
			
		WeixinUser weixinuser = (WeixinUser) request.getSession().getAttribute("weixinuser"); //判断
		
		
		
		//判断是否登陆
		if(request.getSession().getAttribute("weixinuser")!=null){
			return "/weixin/home/login.jsp";
		}
		
		String orderId = request.getParameter("orderId"); // 订单号
		String money = request.getParameter("money"); // 应付总金额
		
		Goodsorders goodsorders = appOrderService.findByOrderId(orderId);
		if (goodsorders == null || goodsorders.getOrStatus() != 0) {
			return "/weixin/home/login.jsp";
		}
		Double jifen = goodsorders.getOrPrice() - Double.parseDouble(money);// 应付积分
		if (jifen > weixinuser.getUserinfo().getUsersIntegral()) // 二次验证积分
			return "/weixin/home/login.jsp";
		
		
		String notifyUrl = URLManager.getServerURL(request) + "/weixinPay.do"; // 异步通知地址http://iptv2.vicp.net/jht_1
		String openId = weixinuser.getOpenid();
		String json = JSSDKUtil.setPayParam(request, notifyUrl, money, orderId, openId);
		
		request.setAttribute("orderId", orderId);
		request.setAttribute("money", money);
		
		
		return "/pay/weixinpay/pay_example.jsp";
	}
	
	
	
	
	
	
	
	
	
	/**
	 * 微信支付
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "p=payByWeixin")
	public String payByWeixin() {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "false";
		}
		String ddhao = request.getParameter("ddhao"); // 订单号
		String money = request.getParameter("money"); // 应付总金额
		Goodsorders goodsorders = appOrderService.findByOrderId(ddhao);
		if (goodsorders == null || goodsorders.getOrStatus() != 0) {
			return "false";
		}
		Double jifen = goodsorders.getOrPrice() - Double.parseDouble(money);// 应付积分
		if (jifen > userinfo.getUsersIntegral()) // 二次验证积分
			return "false";

		goodsorders.setOrJifen(jifen);
		goodsorders.setOrPaytype(0);
		goodsorders.setOrThreepay(Double.parseDouble(money));
		appOrderService.updateOrder(goodsorders);
		String notifyUrl = URLManager.getServerURL(request);
		int userid = Integer.parseInt(request.getParameter("userid"));
		String orderid = request.getParameter("ddhao"); // 订单号
		System.out.println("订单号：" + orderid);
		String openid = null;

		return (String) appPayService.payByWeixin(orderid, "shuiguo2",
				"shuiguo2", notifyUrl, Float.parseFloat(money), request);
	}
}
