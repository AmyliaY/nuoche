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
import com.service.daili.DailiZhidingjiluService;
import com.service.daili.ServiceBusinessService;
import com.util.StringUtil;
import com.util.Upload;

/**
 * pc端 代理管理
 * 
 */

@Controller
@RequestMapping("/daili_zhidingjilu.do")
public class DailizhidingJiluAction {
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private DailiZhidingjiluService dailizhidingjiluservice;
	
	
	/**
	 * 某个代理充值成功记录
	 */
	@RequestMapping(params="p=zhidinglisting")
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
	
		int id = proxy.getId();
		Map zdjlmap = dailizhidingjiluservice.dailizhidingjilu(id, size, page);
		request.setAttribute("zdjlmap", zdjlmap);
		return "/daili/zhidingjilu.jsp";
	}
	
	
	
}