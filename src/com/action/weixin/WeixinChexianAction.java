package com.action.weixin;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import weixin.popular.bean.pay.PayNotify;
import weixin.popular.util.JSSDKUtil;
import weixin.popular.util.XMLConverUtil;

import com.pojo.BaoxianBaodanGonshi;
import com.pojo.WeixinUser;
import com.service.weixin.WeixinChexianService;
import com.util.URLManager;

@Controller
@RequestMapping("/weixinChexian.do")
public class WeixinChexianAction {

	@Autowired
	private WeixinChexianService weixinChexianService;

	@Autowired
	private HttpServletRequest request;
	
	
	@RequestMapping(params="p=baojia")
	@ResponseBody
	public String baojia(@RequestParam int id, @RequestParam float price)
	{
		BaoxianBaodanGonshi  baoxianBaodanGonshi = weixinChexianService.getBaoxianBaodanGonshiById(id);
		baoxianBaodanGonshi.setMoney(price);
		baoxianBaodanGonshi.setStatus(1);
		weixinChexianService.updateBaoianGongshiBao(baoxianBaodanGonshi);
		return "success";
	}
	
	
	@RequestMapping(params="p=toPay")
	public String toPay()
	{
		int id = Integer.parseInt(request.getParameter("id"));
		WeixinUser weixinUser = (WeixinUser) request.getSession().getAttribute("weixinuser");
		BaoxianBaodanGonshi  baoxianBaodanGonshi = weixinChexianService.getBaoxianBaodanGonshiById(id);
		String uuid = java.util.UUID.randomUUID().toString().replaceAll("-", "");
		String openId = weixinUser.getOpenid();
		float money = baoxianBaodanGonshi.getMoney();
		baoxianBaodanGonshi.setPayid(uuid);
		weixinChexianService.updateBaoianGongshiBao(baoxianBaodanGonshi);
		String notifyUrl = URLManager.getServerURL(request)+"/weixinChexian.do";
		JSSDKUtil.setPayParam(request, notifyUrl, money+"", uuid, openId);
		return "/weixin/chexian/pay_example.jsp";
	}
	
	@RequestMapping
	@ResponseBody
	public String execute() throws IOException
	{
		
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
				boolean f = weixinChexianService.updateBaodanStatus(trade_no,money);

				return "success";
			}

		} else {
			return "error";
		}
	}
	
	
	
	/**
	 * 获取用户的选择的保险公司
	 * @return
	 */
	@RequestMapping(params = "p=saveBaoxianBaodanGonshi")
	@ResponseBody
	public String saveBaoxianBaodanGonshi() {
		WeixinUser weixinUser = (WeixinUser) request.getSession().getAttribute(
				"weixinuser");
		if (weixinUser == null)
			return "请登录";
		
		String[] names = request.getParameterValues("checkbox");
		weixinChexianService.saveBaoxianBaodanGonshi(names,weixinUser);
		return "success";
		
	}
	
	/**
	 * 获取用户的选择的保险公司
	 * @return
	 */
	@RequestMapping(params = "p=getBaoxianGonshi")
	@ResponseBody
	public String getBaoxianGonshi() {
		WeixinUser weixinUser = (WeixinUser) request.getSession().getAttribute(
				"weixinuser");
		if (weixinUser == null)
			return "请登录";
		
		String json = weixinChexianService.getBaoxianGongshiByUser(weixinUser.getOpenid());
		
		return json;
	}
	
	
	

	/**
	 * 获取用户的选择的保险公司保单信息
	 * @return
	 */
	@RequestMapping(params = "p=getBaoxianBaodanGonshi")
	@ResponseBody
	public String getBaoxianBaodanGonshi() {
		WeixinUser weixinUser = (WeixinUser) request.getSession().getAttribute(
				"weixinuser");
		if (weixinUser == null)
			return "请登录";
		
		String json = weixinChexianService.getBaoxianBaodanGonshi(weixinUser.getOpenid());
		
		return json;
	}

	/**
	 * 保存险种
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "p=saveBaoxianInfo")
	public String saveBaoxianInfo() {
		WeixinUser weixinUser = (WeixinUser) request.getSession().getAttribute(
				"weixinuser");
		if (weixinUser == null)
			return "请登录";
		String names = request.getParameter("names");
		weixinChexianService.updateChexian(weixinUser, names);
		return "success";
	}

	@ResponseBody
	@RequestMapping(params = "p=getBaoxianInfo")
	public String getBaoxianInfo() {
		WeixinUser weixinUser = (WeixinUser) request.getSession().getAttribute(
				"weixinuser");
		if (weixinUser == null)
			return "请登录";

		String json = weixinChexianService.getBaoxianToJson(weixinUser
				.getOpenid());

		return json;
	}

	/**
	 * 得到保险个人资料
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "p=getCheInfo")
	public String getCheInfo() {
		WeixinUser weixinUser = (WeixinUser) request.getSession().getAttribute(
				"weixinuser");
		if (weixinUser == null)
			return "请登录";

		String json = weixinChexianService.getBaoxianInfoToJson(weixinUser
				.getOpenid());

		return json;
	}

	/**
	 * 完善个人车子信息
	 * 
	 * @return
	 */
	@RequestMapping(params = "p=addBaoxianInfo")
	@ResponseBody
	public String addBaoxianInfo() {
		WeixinUser weixinUser = (WeixinUser) request.getSession().getAttribute(
				"weixinuser");
		if (weixinUser == null)
			return "请登录";

		String cph = request.getParameter("cph");
		String cjh = request.getParameter("cjh");
		String fdj = request.getParameter("fdj");
		String sfz = request.getParameter("sfz");
		String cdr = request.getParameter("cdr");
		String xm = request.getParameter("xm");
		weixinChexianService.addBaoxianInfo(weixinUser, cph, cjh, fdj, sfz,
				cdr, xm);

		return "success";
	}

}
