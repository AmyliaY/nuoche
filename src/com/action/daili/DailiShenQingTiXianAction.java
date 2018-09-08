package com.action.daili;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.action.WeixinConfig;
import com.service.daili.DailiShenQingTiXianService;
import com.service.weixin.WeiXinMymoneyService;
import com.util.URLManager;

import weixin.popular.api.OpenIdAPI;
import weixin.popular.bean.AccessToken;
import weixin.popular.util.JSSDKUtil;



/**
 *代理申请提现Action--查仕龙
 * @author dell
 *
 */

@Controller
@RequestMapping("/shenqingtx.do")
public class DailiShenQingTiXianAction {
	
	@Autowired
	private DailiShenQingTiXianService shenqingtixianservice;
	
	
	
	
	/**
	 * 提现申请
	 * @param request
	 * @param response
	 * @return
	 */
	

	
	
	@RequestMapping(params="p=inserttixian")
	public String tixian(HttpServletRequest request,HttpServletResponse response)
	{
		
		String dingdanhao = null;
		dingdanhao = UUID.randomUUID().toString().replaceAll("-", "");
		Timestamp createtime = new Timestamp(System.currentTimeMillis());
		
		String proxyid1=request.getParameter("proxyid");
		int proxyid=Integer.parseInt(proxyid1);
		String cash1=request.getParameter("cash1");
		double cash=Double.parseDouble(cash1);
		Map tjmap=shenqingtixianservice.tongjilisting(proxyid); 	//
		request.setAttribute("tjmap", tjmap);
		shenqingtixianservice.addtixian(cash,dingdanhao,createtime,proxyid);
		return "/daili_tixian.do?p=tixianlisting";
	}
	
	

}
