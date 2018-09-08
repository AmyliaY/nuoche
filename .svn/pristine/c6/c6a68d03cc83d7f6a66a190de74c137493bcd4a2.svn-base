package com.action.weixin;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.infinispan.util.TimSort;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.action.JccsAction;
import com.action.WeixinConfig;
import com.dao.HqlDAO;
import com.dao.UserDAO;
import com.pojo.Applydetail;
import com.pojo.Province;
import com.pojo.User;
import com.service.daili.DailiUserInfoService;
import com.service.weixin.WeiXinAddressService;
import com.service.weixin.WeiXinApplyForQrcodeService;
import com.service.weixin.WeiXinUserXufeiService;
import com.sun.org.apache.bcel.internal.generic.SIPUSH;
import com.util.URLManager;

import weixin.popular.api.OpenIdAPI;
import weixin.popular.bean.AccessToken;
import weixin.popular.bean.pay.PayNotify;
import weixin.popular.util.JSSDKUtil;
import weixin.popular.util.SignatureUtil;
import weixin.popular.util.XMLConverUtil;
/**
 * 微信端    用户续费
 * @author 唐仁鑫 2018.4.19
 * 
 *
 */
@Controller
@RequestMapping("/userxufei.do")	
public class WeiXinUserXufeiAction {
	@Autowired
	private HttpServletRequest request;
	@Autowired 
	private WeiXinUserXufeiService userxufeiService;

	//  会员续费
	@RequestMapping(params = "p=userxufei")
	public String userXufei(HttpServletResponse response) {
		// 1.得openId
		String openid = request.getParameter("openid");
		//System.out.println("openid:"+openid);
		String qrcodeprice = JccsAction.getQrcodeprice();
		request.getSession().setAttribute("openid", openid);
		request.setAttribute("qrcodeprice", qrcodeprice);
		//  转到续费页面
		return "/weixin/viprenew.jsp";
	}
	
	//  go
	@RequestMapping(params = "p=renewgo")
	public String reNewGo(HttpServletResponse response) {
		//System.out.println("去支付了!");
		// 1.得openId
		String money = request.getParameter("money");
		String openid = (String) request.getSession().getAttribute("openid");
		String year = request.getParameter("year");
		String orderid = userxufeiService.getOrderId();
		//System.out.println("orderid:"+orderid);
		//System.out.println("openid:"+openid);
		int userxufeiprice = Integer.parseInt(JccsAction.getQrcodeprice());
		double fee = (double)userxufeiprice*Integer.parseInt(year);
		int userxufeiid = userxufeiService.addUserxufei(openid,fee,orderid);
		// 2.去支付
		request.getSession().setAttribute("userxufeiid", userxufeiid);
		request.getSession().setAttribute("openid", openid);
		request.getSession().setAttribute("xufeiyear", year);
		String notifyUrl = URLManager.getServerURL(request)+ "/userxufei.do";
		String json = JSSDKUtil.setPayParam(request, notifyUrl, money, orderid,openid);
		// 4.调用微信支付
		return "/weixin/pay/pay_example2.jsp";	
		
		
	}
	//  用户续费  回调
	@RequestMapping
	public String payNotify(HttpServletResponse response) throws IOException {
		InputStream is = request.getInputStream();
		byte[] b = new byte[1024];
		int size = is.read(b);
		String str = new String(b, 0, size);
		//System.out.println("封装的xml："+str);
		// 获取请求数据
		PayNotify payNotify = XMLConverUtil.convertToObject(PayNotify.class,
				str);

		// 签名判断略...
		String sign = payNotify.getSign();

		boolean f = SignatureUtil.validateAppSignature(payNotify,
				WeixinConfig.PAY_KEY);
		//System.out.println("签名判断："+f);
		

		
		// 支付成功
		if ("SUCCESS".equals(payNotify.getResult_code())
				&& "SUCCESS".equals(payNotify.getReturn_code())) {
			String trade_no = payNotify.getOut_trade_no();
			
			String openid = (String) request.getSession().getAttribute("openid");
			String xufeiyear = (String) request.getSession().getAttribute("xufeiyear");
			String userxufeiid = (String) request.getSession().getAttribute("userxufeiid");
			//  根据openID  修改会员表的到期时间   
			userxufeiService.updateOverdueTime(openid,xufeiyear);
			userxufeiService.updateUserxufeiStatus(userxufeiid);
			
			
			response.getOutputStream().write("success".getBytes());

		} else {
			response.getOutputStream().write("error".getBytes());
		}
        
		return null;

	}
	
	
}
