package com.action.daili;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.action.WeixinConfig;
import com.pojo.Admin;
import com.pojo.Proxy;
import com.pojo.Proxychongzhi;
import com.pojo.Admin;
import com.pojo.SylbImages;
import com.service.admin.AdminProxyChongzhiService;
import com.service.daili.DailiChongzhiService;
import com.service.daili.DailiChongzhipayService;
import com.service.daili.DailiLoginBackService;
import com.service.daili.DailiLunboService;
import com.service.daili.DailiServiceBusinessService;
import com.util.StringUtil;
import com.util.URLManager;
import com.util.Upload;

import weixin.popular.api.OpenIdAPI;
import weixin.popular.bean.AccessToken;
import weixin.popular.bean.pay.PayNotify;
import weixin.popular.util.JSSDKUtil;
import weixin.popular.util.SignatureUtil;
import weixin.popular.util.XMLConverUtil;

/**
 * pc端 代理管理--代理充值 唐仁鑫18/4/14
 * 
 * 查仕龙18/4/19
 */

@Controller
@RequestMapping("/dlchongzhi.do")
public class DailichongzhiAction {

	@Autowired
	private HttpServletRequest request;
	@Autowired
	private DailiChongzhiService dailichongzhiservice;
	@Autowired
	private DailiChongzhipayService dailichongzhipayservice;

	/**
	 * 某个代理充值成功记录
	 */
	@RequestMapping(params = "p=chongzhipage")
	public String czjllisting(HttpServletResponse response) {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		
		proxy = dailichongzhiservice.findProxyByIdNoCache(proxy.getId());
		System.out.println(proxy.getKeCash());
		request.getSession().setAttribute("proxy", proxy);
		return "/daili/dailichongzhi.jsp";
	}

	@RequestMapping(params = "p=topay")
	public String toPay(HttpServletResponse response) {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}

		

		int proxyid = Integer.parseInt(request.getParameter("proxyid"));

		if (proxy.getId() == proxyid) {
			request.setAttribute("proxy", proxy);

		}
		String fee1 = request.getParameter("rechnum");

		double fee = Double.parseDouble(fee1);
		String dingdanhao = null;
		dingdanhao = UUID.randomUUID().toString().replaceAll("-", "");
		Timestamp time = new Timestamp(System.currentTimeMillis());
		request.getSession().setAttribute("dingdanhao", dingdanhao);
		request.getSession().setAttribute("fee", fee);
		dailichongzhipayservice.addpay(proxyid, fee, dingdanhao, time);

		return "/dlchongzhi.do?p=createerweima&dingdanhao=" + dingdanhao
				+ "&fee=" + fee;
	}

	@RequestMapping(params = "p=createerweima")
	public String createErweima(HttpServletResponse response) {

		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		String dingdanhao = request.getParameter("dingdanhao");
		String fee = request.getParameter("fee");

		// System.out.println("支付金额"+fee);
		// System.out.println("订单号"+dingdanhao);

		// 开始生成二维码图片
		// String encoderContent
		// ="http://zzsunjob.vicp.cc/nuoche/dlchongzhi.do?p=pay&money="+fee+"&orderid="+dingdanhao;
		String encoderContent = URLManager.getServerURL(request)
				+ "/dlchongzhi.do?p=pay&money=" + fee + "&orderid="
				+ dingdanhao;
		String path = request.getSession().getServletContext().getRealPath(
				"/payerweima");
		// System.out.println("路径:"+path);
		// System.out.println("生成二维码");
		File file = new File(path);
		if (file.exists() == false)
			file.mkdir();
		String returnimg = dailichongzhipayservice.doCreate2(encoderContent,
				dingdanhao, path);
		//System.out.println(dingdanhao);
		request.setAttribute("dingdanhao", dingdanhao);
		request.setAttribute("returnimg", returnimg);
		return "/daili/showpayerweima.jsp";

	}

	@RequestMapping(params = "p=pay")
	public String pay(HttpServletResponse response) throws IOException {

		String money = request.getParameter("money");
		String orderid = request.getParameter("orderid");
		String shop_url = URLManager.getServerURL(request)
				+ "/dlchongzhi.do?p=pay1&money=" + money + "&orderid="
				+ orderid;
		String shop_newUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(shop_url, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		return "redirect:" + shop_newUrl;

	}

	@RequestMapping(params = "p=pay1")
	public String myMoney(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		// System.out.println("来支付了!");
		// 1.得openId

		String code = request.getParameter("code");
		String appid = WeixinConfig.APPID;
		String secret = WeixinConfig.APPSECRET;
		AccessToken accessToken = new OpenIdAPI()
				.getOpenId(appid, secret, code);
		String weixinhao = accessToken.getOpenid();
		// System.out.println("微信号:" + weixinhao); // 有的时候，要验证是否新用户，就要录入手机号码
		request.getSession().setAttribute("weixinhao", weixinhao);

		String money = request.getParameter("money");
		String orderid = request.getParameter("orderid");

		// 2.去支付

		String notifyUrl = URLManager.getServerURL(request) + "/dlchongzhi.do";
		String json = JSSDKUtil.setPayParam(request, notifyUrl, money, orderid,
				weixinhao);
		// 4.调用微信支付
		return "/daili/pay/pay_example.jsp";

	}

	@RequestMapping
	public String payNotify(HttpServletResponse response) throws IOException {
		InputStream is = request.getInputStream();
		byte[] b = new byte[1024];
		int size = is.read(b);
		String str = new String(b, 0, size);
		// System.out.println("封装的xml："+str);
		// 获取请求数据
		PayNotify payNotify = XMLConverUtil.convertToObject(PayNotify.class,
				str);

		// 签名判断略...
		String sign = payNotify.getSign();

		boolean f = SignatureUtil.validateAppSignature(payNotify,
				WeixinConfig.PAY_KEY);
		// System.out.println("签名判断："+f);

		// 支付成功
		if ("SUCCESS".equals(payNotify.getResult_code())
				&& "SUCCESS".equals(payNotify.getReturn_code())) {
			String trade_no = payNotify.getOut_trade_no();

			// 支付成功改充值订单状态
			dailichongzhipayservice.updateStatusByOrderid(trade_no);

			// 支付成功之后将充值金额存入代理表
			dailichongzhipayservice.updatecash(trade_no);

			response.getOutputStream().write("success".getBytes());
			

		} else {
			response.getOutputStream().write("error".getBytes());
		}

		return null;

	}
	
	@ResponseBody
	@RequestMapping(params = "p=pdstatus")
	public String getStatus(){
		String orderid = request.getParameter("dingdanhao");
		int status = dailichongzhipayservice.getStatusByOrderid(orderid);
		System.out.println("status"+orderid);
		System.out.println(status);
		
		return String.valueOf(status);


	}

}