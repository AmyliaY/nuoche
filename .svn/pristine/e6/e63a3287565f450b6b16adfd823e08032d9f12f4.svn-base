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
import com.service.weixin.WeiXinOrderCenterService;
import com.sun.org.apache.bcel.internal.generic.SIPUSH;

import weixin.popular.api.OpenIdAPI;
import weixin.popular.bean.AccessToken;
/**
 * 微信端  用户个人中心--订单中心
 * @author 唐仁鑫
 * 
 *
 */
@Controller
@RequestMapping("/ordercenter.do")	
public class WeiXinOrderCenterAction {
	@Autowired
	private HttpServletRequest request;
	@Autowired 
	private WeiXinOrderCenterService orderCenterService;
	
	
	@RequestMapping(params="method=index")
	public String moveCar(HttpServletRequest request,HttpServletResponse response)throws IOException{
		String secret = (String) request.getSession().getAttribute("secret");
		// System.out.println("客户微信号------------"+openid);
		String openid = request.getParameter("openid");
		// --------------- end 获取客户的微信号----------------//
		request.getSession().setAttribute("openid", openid);
		request.getSession().setAttribute("secret", secret);
		
		////System.out.println("微信号:" + openid);
		//  获取该用户下的所有订单信息
		List<Applydetail> applydetails = orderCenterService.findOrderByOpenId(openid);
		request.setAttribute("applydetails", applydetails);
		return "/weixin/orderCenter.jsp";
		//return "/weixin/test.jsp";
	}
	@RequestMapping(params="method=backordercenter")
	public String backOrderCenter(HttpServletRequest request,HttpServletResponse response)throws IOException{
		////System.out.println("用户回到订单中心了。");
		String openid = request.getParameter("openid");
		//System.out.println("微信号:" + openid);
		//  获取该用户下的所有订单信息
		List<Applydetail> applydetails = orderCenterService.findOrderByOpenId(openid);
		request.setAttribute("applydetails", applydetails);
		return "/weixin/orderCenter.jsp";
	}
	//  查看物流 ---待完善
	@RequestMapping(params="method=showwuliu")
	public String showWuliu(HttpServletRequest request,HttpServletResponse response)throws IOException{
		
		String openid = request.getParameter("openid");
		//System.out.println("微信号:" + openid);
		//  获取该用户下的所有订单信息
		List<Applydetail> applydetails = orderCenterService.findOrderByOpenId(openid);
		request.setAttribute("applydetails", applydetails);
		return "/weixin/orderCenter.jsp";
	}
	//  异步确认收货
	@RequestMapping(params="method=querenOrder")
	@ResponseBody
	public String querenOrder(HttpServletRequest request,HttpServletResponse response)throws IOException{
		
		String openid = request.getParameter("openid");
		String orderid = request.getParameter("orderid");
		//System.out.println("微信号:" + openid);
		//  获取该用户下的所有订单信息
		orderCenterService.doQuerenOrder(orderid,openid);
		return "yes";
	}
	
	
	
	//  异步查所有
	@RequestMapping(params="method=findAllorder")
	@ResponseBody
	public String findAllorder(HttpServletRequest request,HttpServletResponse response)throws IOException{
		
		String openid = (String) request.getSession().getAttribute("openid");
		//System.out.println("微信号:" + openid);
		//  获取该用户下的所有订单信息
		String json = orderCenterService.findAllOrder(openid);
		return json;
	}
	
	//  异步根据状态查询  1：未付款  2：已付款3：已发货 4；已确认收货
	@RequestMapping(params="method=findOrderByStatus")
	@ResponseBody
	public String findOrderByStatus(HttpServletRequest request,HttpServletResponse response)throws IOException{
		
		String openid = (String) request.getSession().getAttribute("openid");
		short orderstatus = Short.parseShort(request.getParameter("orderstatus"));
		//System.out.println("微信号:" + openid);
		//  根据状态查询订单信息
		String json = orderCenterService.findOrderByStatus(openid,orderstatus);
		return json;
	}
	//  显示订单信息
	@RequestMapping(params="method=showorder")
	public String showOrder(HttpServletRequest request,HttpServletResponse response)throws IOException{
		String openid = request.getParameter("openId");
		String orderid = request.getParameter("orderid");
		//System.out.println("显示订单信息：orderid="+orderid+"\t openid:"+openid);
		Applydetail applydetail = orderCenterService.findapplydetailByOrderid(orderid,openid);
		request.setAttribute("applydetail", applydetail);
		return "/weixin/showorderforcenter.jsp";
	}
	
}
