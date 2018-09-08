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

import com.alibaba.fastjson.serializer.SimpleDateFormatSerializer;
import com.dao.ProxyDAO;
import com.dao.UserDAO;
import com.pojo.Admin;
import com.pojo.Proxy;
import com.pojo.User;
import com.qq.connect.utils.http.Response;
import com.service.admin.AdminYuyueService;
import com.service.daili.UserService;
import com.util.StringUtil;

import bsh.ParseException;

/*
 * 张嘉雄    3月24
 * 
 * */

@Controller
@RequestMapping("/admin_yuyue.do") 
public class AdminYuyueAction {

	@Autowired
	private AdminYuyueService yuyueservice;
	@Autowired
	private HttpServletRequest request;
	// 得到所有预约信息
	
	
	
	@RequestMapping(params = "p=yuyuelisting")
	public String yuyueorderslisting(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int page = 1; // 页数
		int size = 10; // 大小
		String pageString = request.getParameter("page");
		if (StringUtil.isNotNull(pageString) && pageString.trim().length() > 0)
			page = Integer.parseInt(pageString);
		String sizeString = request.getParameter("size");
		if (StringUtil.isNotNull(sizeString) && sizeString.trim().length() > 0)
			size = Integer.parseInt(sizeString);
		int status = Integer.parseInt(request.getParameter("status")); // 订单状态
		// 搜索区间
		String begindate = request.getParameter("begindate");
		Timestamp begintime = null;
		if (StringUtil.isNotNull(begindate) && begindate.trim().length() > 0)
			begintime = Timestamp.valueOf(begindate + " 00:00:00");
		String enddate = request.getParameter("enddate");
		Timestamp endtime = null;
		if (StringUtil.isNotNull(enddate) && enddate.trim().length() > 0)
			endtime = Timestamp.valueOf(enddate + " 23:59:59");
		// 关键字
		String keywords = request.getParameter("keywords");
		if (request.getMethod().equalsIgnoreCase("GET")) {
			if (keywords != null)
				keywords = new String(keywords.getBytes("iso8859-1"), "utf-8");
		}
		Map yuyueordermap = yuyueservice.yuyueorderlisting(size, page, status,  begintime, endtime, keywords);
		request.setAttribute("yuyueordermap", yuyueordermap);
		request.setAttribute("status", status);
		request.setAttribute("keywords", keywords);
		return "/admin/yuyue.jsp";
	}
}
