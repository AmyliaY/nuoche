package com.action.daili;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.pojo.Proxy;
import com.pojo.Admin;
import com.pojo.SylbImages;
import com.service.admin.AdminProxyChongzhiService;
import com.service.daili.DailiChongzhiService;
import com.service.daili.DailiLoginBackService;
import com.service.daili.DailiLunboService;
import com.service.daili.DailiShenQingTiXianService;
import com.service.daili.DailiTixianService;
import com.service.daili.DailiServiceBusinessService;
import com.util.StringUtil;
import com.util.Upload;

/**
 * pc端 代理提现
 * 
 */

@Controller
@RequestMapping("/daili_tixian.do")
public class DailiTixianJiluAction {
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private DailiTixianService dailitixianservice;
	@Autowired
	private DailiShenQingTiXianService mymoneyservice;
	
	
	/**
	 * 某个代理提现成功记录
	 */
	@RequestMapping(params="p=tixianlisting")
	public String czjllisting(HttpServletResponse response) 
	{
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		int page = 1;
		int size = 10;
		String pageString = request.getParameter("page");
		if (StringUtil.isNotNull(pageString) && pageString.trim().length() > 0)
			page = Integer.parseInt(pageString);
		String sizeString = request.getParameter("size");
		if (StringUtil.isNotNull(sizeString) && sizeString.trim().length() > 0)
			size = Integer.parseInt(sizeString);
	
		int proxyid = proxy.getId();
		//System.out.println(proxyid+"代理id");
		request.getSession().setAttribute("proxyid", proxyid);
		Map txjlmap = dailitixianservice.dailitixianjilu(proxyid, size, page);
		Map tjmap=mymoneyservice.tongjilisting(proxyid);
		request.getSession().setAttribute("tjmap", tjmap);
		request.setAttribute("txjlmap", txjlmap);
		//System.out.println("来提现记录了");
		return "/daili/tixianjilu.jsp";
	}
	
	
	
}