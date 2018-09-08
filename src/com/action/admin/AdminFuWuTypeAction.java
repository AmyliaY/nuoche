package com.action.admin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.jws.soap.SOAPBinding.Use;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.serializer.SimpleDateFormatSerializer;
import com.dao.ProxyDAO;
import com.dao.UserDAO;
import com.pojo.Admin;
import com.pojo.Proxy;
import com.pojo.ServiceType;
import com.pojo.User;
import com.qq.connect.utils.http.Response;
import com.service.admin.AdminFuWuTypeService;
import com.service.admin.AdminYuyueService;
import com.service.daili.UserService;
import com.util.StringUtil;

import bsh.ParseException;

/*
 * trx    5.8
 * 
 * */

@Controller
@RequestMapping("/admin_fuwutype.do") 
public class AdminFuWuTypeAction {

	@Autowired
	private AdminFuWuTypeService fuwutypeservice;
	@Autowired
	private HttpServletRequest request;
	// 得到所有预约信息
	
	
	//  查看服务类型
	@RequestMapping(params = "p=fuwutypelist")
	public String fuwutypelist(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
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
		Map fuwutypemap = fuwutypeservice.findAllFuwuType(size, page, keywords);
		request.setAttribute("fuwutypemap", fuwutypemap);
		request.setAttribute("keywords", keywords);
		return "/admin/fuwutypelist.jsp";
	}
	//  进入新增服务类型页面
	@RequestMapping(params = "p=addfuwutype")
	public String addfuwutype(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		
		return "/admin/fuwutypeadd1.jsp";
	}
	//  执行新增服务类型页面
	@RequestMapping(params = "p=addfuwutypego")
	@ResponseBody
	public String addfuwutypego(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String name = request.getParameter("name");
		fuwutypeservice.addfuwutypego(name);
		return "yes";
	}
//  执行删除
	@RequestMapping(params = "p=dodelete")
	@ResponseBody
	public String dodelete(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		fuwutypeservice.dodelete(id);
		return "yes";
	}
	//  进入编辑服务类型页面
	@RequestMapping(params = "p=fuwutypedetail")
	public String updatefuwutype(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		ServiceType servicetype = fuwutypeservice.findbyid(id);
		request.setAttribute("servicetype", servicetype);
		return "/admin/fuwutypeupdate.jsp";
	}
	//  进入编辑服务类型go
	@RequestMapping(params = "p=updatefuwutypego")
	@ResponseBody
	public String updatefuwutypego(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		fuwutypeservice.updatefuwutypego(id,name);
		return "yes";
	}
	
	
}
