package com.action.admin;

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
import com.pojo.Admin;
import com.pojo.SylbImages;
import com.service.admin.AdminProxyChongzhiService;
import com.service.daili.DailiLoginBackService;
import com.service.daili.DailiLunboService;
import com.service.daili.DailiServiceBusinessService;
import com.util.StringUtil;
import com.util.Upload;

/**
 * pc端 后台管理管理
 * @author 全恒
 */

@Controller
@RequestMapping("/admin_chongzhirecord.do")
public class AdminProxyChongzhiAction {
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private AdminProxyChongzhiService proxyChongzhiService;

	
	/**
	 * 充值成功
	 */
	@RequestMapping(params="p=chongzhilisting")
	public String czcgListing(HttpServletResponse response) throws IOException
	{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int page = 1;
		int size = 10;
		String pageString = request.getParameter("page");
		if (StringUtil.isNotNull(pageString) && pageString.trim().length() > 0)
			page = Integer.parseInt(pageString);
		String sizeString = request.getParameter("size");
		if (StringUtil.isNotNull(sizeString) && sizeString.trim().length() > 0)
			size = Integer.parseInt(sizeString);
		String keywords = request.getParameter("keywords");
		if (request.getMethod().equalsIgnoreCase("GET")) {
			if (keywords != null)
				keywords = new String(keywords.getBytes("iso8859-1"), "utf-8");
		}
		Map pczcgmap = proxyChongzhiService.czcgListing(size, page, keywords);
		request.setAttribute("pczcgmap", pczcgmap);
		request.setAttribute("keywords", keywords);
		return "/admin/czsuccesslisting.jsp";
	}
	
	/**
	 * 充值失败
	 */
	@RequestMapping(params="p=czfaultlisting")
	public String czfaultlisting(HttpServletResponse response) throws IOException
	{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int page = 1;
		int size = 10;
		String pageString = request.getParameter("page");
		if (StringUtil.isNotNull(pageString) && pageString.trim().length() > 0)
			page = Integer.parseInt(pageString);
		String sizeString = request.getParameter("size");
		if (StringUtil.isNotNull(sizeString) && sizeString.trim().length() > 0)
			size = Integer.parseInt(sizeString);
		String keywords = request.getParameter("keywords");
		if (request.getMethod().equalsIgnoreCase("GET")) {
			if (keywords != null)
				keywords = new String(keywords.getBytes("iso8859-1"), "utf-8");
		}
		Map czsbmap = proxyChongzhiService.czfaultlisting(size, page, keywords);
		request.setAttribute("czsbmap", czsbmap);
		request.setAttribute("keywords", keywords);
		return "/admin/czdefeatlisting.jsp";
	}
	
}