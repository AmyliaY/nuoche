package com.action.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Admin;
import com.pojo.Province;
import com.service.admin.AdminAdminService;
import com.util.StringUtil;

/**
 * pc端 后台代理管理
 * @author 周辉群
 * admin_admin.do?p=adminlisting
 *
 */
@Controller 
@RequestMapping("/admin_admin.do")	
public class AdminAdminglAction {
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private AdminAdminService adminService;
	
	@RequestMapping(params="p=adminlisting")
	public String daliListing(HttpServletRequest request,HttpServletResponse response)  throws IOException{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int page = 1;
		int size = 12;
		
		String pageString = request.getParameter("page");
		if (StringUtil.isNotNull(pageString) && pageString.trim().length() > 0) {
			page = Integer.parseInt(pageString);
		}
		String sizeString = request.getParameter("size");
		if (StringUtil.isNotNull(sizeString) && sizeString.trim().length() > 0) {
			size = Integer.parseInt(sizeString);
		}
		String keywords = request.getParameter("keywords");
		if (request.getMethod().equalsIgnoreCase("GET")) {
			if (keywords != null)
				keywords = new String(keywords.getBytes("iso8859-1"), "utf-8");
		}
		Map dailiListMap = adminService.dailiListing(size, page ,keywords);
		request.setAttribute("sjbusinessMap", dailiListMap);
		request.setAttribute("keywords", keywords);
		return "/admin/Admin_Listing.jsp";
	}
	@RequestMapping(params="p=addadminlisting")
	public String add(){
Admin admin = (Admin) request.getSession().getAttribute("admin");
		
		if (admin == null) {
			return "/admin/login.jsp";
		}	
		return "/admin/admin_add.jsp";
	}
	
	@RequestMapping(params="p=insertadmin")
	public String addadmin(HttpServletRequest request,HttpServletResponse response)  throws IOException{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		
		if (admin == null) {
			return "/admin/login.jspp=adminlisting";
		}		
		String gname = request.getParameter("gname");
		String psd = request.getParameter("psd");
		adminService.add(gname,psd);
		return "/admin_admin.do?p=adminlisting";
	}
	
	
	@RequestMapping(params="p=xiugaipsd")	
	public String xiugaipsd(HttpServletRequest request,HttpServletResponse response)  throws IOException{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String id = request.getParameter("id");
		Admin a = adminService.findById(Integer.parseInt(id));
		request.getSession().setAttribute("admin", a);
		return "/admin/admin_update.jsp";
	}
	
	@RequestMapping(params="p=updateadmin")	
	public String updateadmin(HttpServletRequest request,HttpServletResponse response)  throws IOException{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String id = request.getParameter("id");
		String psd = request.getParameter("psd");
		Admin a = adminService.findById(Integer.parseInt(id));
		adminService.xiugaopsd(a,psd);
		return "/admin_admin.do?p=adminlisting";
	}
}
