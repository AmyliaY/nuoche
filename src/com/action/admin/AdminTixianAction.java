package com.action.admin;
/**
 * pc端 超级管理员后台  提现管理
 * @author 唐仁鑫 
 */
import java.io.IOException;
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
import com.pojo.ProxyCash;
import com.service.admin.AdminBackService;
import com.service.admin.AdminTixianService;
import com.util.StringUtil;

@Controller
@RequestMapping("/admin_tixian.do")
public class AdminTixianAction {
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private AdminTixianService admintixianService;
//  代理提现申请列表
	@RequestMapping(params="p=dailitixianrequestlisting")
	public String findDlTixianRequestFenye(HttpServletResponse response) throws IOException
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
		Map cashsmap = admintixianService.findDlTxRequestFenye(size, page, keywords);
		request.setAttribute("cashsmap", cashsmap);
		request.setAttribute("keywords", keywords);
		return "/admin/dailitixianrequest.jsp";
	}
	//   处理代理提现申请
	@RequestMapping(params="p=dodailitixianrequest")
	@ResponseBody
	public String doDailiTiXianRequest(HttpServletResponse response) throws IOException
	{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		int dowhat = Integer.parseInt(request.getParameter("dowhat"));
		admintixianService.dodailitixianrequest(id,dowhat);
		return "yes";
	}
//  vip提现申请列表
	@RequestMapping(params="p=usertixianrequestlisting")
	public String findVipTixianRequestFenye(HttpServletResponse response) throws IOException
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
		Map cashsmap = admintixianService.findVipTxRequestFenye(size, page, keywords);
		request.setAttribute("cashsmap", cashsmap);
		request.setAttribute("keywords", keywords);
		return "/admin/viptixianrequest.jsp";
	}
	//  处理vip提现
	@RequestMapping(params="p=doviptixianrequest")
	@ResponseBody
	public String doVipTiXianRequest(HttpServletResponse response) throws IOException
	{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		int dowhat = Integer.parseInt(request.getParameter("dowhat"));
		admintixianService.doviptixianrequest(id,dowhat);
		return "yes";
	}
//  代理提现列表
	@RequestMapping(params="p=dailitixianlisting")
	public String findDlTixianFenye(HttpServletResponse response) throws IOException
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
		Map cashsmap = admintixianService.findDlTxFenye(size, page, keywords);
		request.setAttribute("cashsmap", cashsmap);
		request.setAttribute("keywords", keywords);
		return "/admin/showdailitixian.jsp";
	}
//  vip提现列表
	@RequestMapping(params="p=usertixianlisting")
	public String findVipTixianFenye(HttpServletResponse response) throws IOException
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
		Map cashsmap = admintixianService.findVipTxFenye(size, page, keywords);
		request.setAttribute("cashsmap", cashsmap);
		request.setAttribute("keywords", keywords);
		return "/admin/showviptixian.jsp";
	}
	
	
	
	
}
