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

import com.action.JccsAction;
import com.action.WeixinConfig;
import com.pojo.Province;
import com.service.daili.DailiUserInfoService;
import com.service.weixin.WeiXinAddressService;
import com.service.weixin.WeiXinApplyForQrcodeService;
import com.sun.org.apache.bcel.internal.generic.SIPUSH;

import weixin.popular.api.OpenIdAPI;
import weixin.popular.bean.AccessToken;
/**
 * 微信端  申请二维码
 * @author 唐仁鑫
 * 
 *
 */
@Controller
@RequestMapping("/applyforqrcode.do")	
public class WeiXinApplyForQrcodeAction {
	@Autowired
	private HttpServletRequest request;
	@Autowired 
	private WeiXinApplyForQrcodeService applyForQrcodeService;
	//  调用代理Service里面的方法查省市级联
	@Autowired 
	private WeiXinAddressService addressService;
	
	
	@RequestMapping(params="method=applyforqrcodeindex")
	public String applyforqrcodeindex(HttpServletRequest request,HttpServletResponse response)throws IOException{
	
		// ------------------获取客户的微信号 :@author lgh ------------------//
		String code = request.getParameter("code");
		String appid = WeixinConfig.APPID;
		String secret = WeixinConfig.APPSECRET;
		AccessToken accessToken = new OpenIdAPI().getOpenId(appid, secret, code);
		String weixinhao = accessToken.getOpenid();
		// ////System.out.println("客户微信号------------"+weixinhao);
		// --------------- end 获取客户的微信号----------------//
		request.getSession().setAttribute("openid", weixinhao);
		request.getSession().setAttribute("secret", secret);
		request.getSession().setAttribute("weixinhao", weixinhao);
		//  获取二维码销售价格
		Double price = Double.parseDouble(JccsAction.getQrcodeprice());
		request.setAttribute("price", price);
		////System.out.println("微信号:" + weixinhao);
		
		return "/weixin/applyQrcode.jsp";
	}
	@RequestMapping(params="method=submitnum")
	public String submitnum(HttpServletRequest request,HttpServletResponse response)throws IOException{
		//  购买数量
		String account = request.getParameter("account");
		//  总金额
		String sum = request.getParameter("sum");
		request.getSession().setAttribute("account", account);
		request.getSession().setAttribute("sum", sum);
		//  得到省
		List<Province> plist = addressService.FindProvinceAll();
		request.getSession().setAttribute("plist", plist);
		return "/weixin/buyQrcode.jsp";
		
	}
	@RequestMapping(params="method=submitaddr")
	@ResponseBody
	public String submitaddr(HttpServletRequest request,HttpServletResponse response)throws IOException{
		//购买的数量
		int account = Integer.parseInt((String) request.getSession().getAttribute("account"));
		//  总金额
		double sum =  Double.parseDouble((String) request.getSession().getAttribute("sum"));
		//  收件人姓名
		String name = request.getParameter("name");
		//  电话
		String tel = request.getParameter("tel");
		//  地址
		String address = request.getParameter("address");
		//  生成订单号
		String orderid=applyForQrcodeService.getAllDingdanhao();
		//  微信订单号
		//创建时间--生成订单时间
		
		//更新时间--用户付款时间
		//结束时间--用户收货时间
		//状态 0未发货，1未付款，2已付款，3已发货，4已收货，默认为0
		//运费 0yuan
		//卡费
		//总金额
		// 返回创建订单的时间戳
		String weixinhao = (String) request.getSession().getAttribute("weixinhao");
		Timestamp createtime = applyForQrcodeService.doAddOrder(account,name,tel,address,orderid,sum,weixinhao);

		////System.out.println("account:"+account);
		////System.out.println("name:"+name);
		////System.out.println("tel:"+tel);
		////System.out.println("address:"+address);
		////System.out.println("orderid:"+orderid);
		request.getSession().setAttribute("name", name);
		request.getSession().setAttribute("tel", tel);
		request.getSession().setAttribute("address", address);
		request.getSession().setAttribute("orderid", orderid);
		request.getSession().setAttribute("createtime", createtime);
		//return "/weixin/showOrder.jsp";
		return "yes";
	}
	@RequestMapping(params="method=showorder")
	public String showOrder(HttpServletRequest request,HttpServletResponse response)throws IOException{
		
		
		return "/weixin/showOrder.jsp";
	}
	//  取消订单
	@RequestMapping(params="method=cancelOrder")
	@ResponseBody
	public String cancelOrder(HttpServletRequest request,HttpServletResponse response)throws IOException{
		//  获取订单号
		String orderid=request.getParameter("orderid");
		applyForQrcodeService.doCancelOrder(orderid);
		return "yes";
	}
	
	
	
	
	
	
	
	
}
