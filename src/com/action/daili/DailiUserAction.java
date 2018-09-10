package com.action.daili;

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
import com.pojo.User;
import com.qq.connect.utils.http.Response;
import com.service.daili.DailiService;
import com.service.daili.DailiServiceService;
import com.service.daili.DailiUserService;
import com.util.StringUtil;

import bsh.ParseException;

/*
 * 张嘉雄    3月24
 * 
 * */

@Controller
@RequestMapping("/daili_users.do") 
public class DailiUserAction {

	@Autowired
	private DailiUserService userService;
	@Autowired
	private HttpServletRequest request;
	
	
	
	
	/**
	 * 修改用户的代理,计算代理数
	 * @param proxy
	 * @param uid
	 * @return
	 */
	@RequestMapping(params="p=changeProxy")
	@ResponseBody
	public String changeProxy(int proxy, int uid)
	{
		Proxy _proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (_proxy == null) {
			return "请登录先";
		}
		
	   String str = userService.changeUserProxy(_proxy,proxy,uid);
	   
		
	   return str;
	}

	// 搜索框查询
	@RequestMapping(params = "p=sousuousers")
	public String sousuousers() {
		String keywords = request.getParameter("keywords");
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		int tel = proxy.getId();
		int page = 1;
		int size = 10;
		String pageString = request.getParameter("page");
		if (StringUtil.isNotNull(pageString) && pageString.trim().length() > 0)
			page = Integer.parseInt(pageString);
		String sizeString = request.getParameter("size");
		if (StringUtil.isNotNull(sizeString) && sizeString.trim().length() > 0)
			size = Integer.parseInt(sizeString);
		int type = 1;
		Map usersmap = userService.ssuserlisting(page, size, type, tel, keywords);
		request.setAttribute("usersmap", usersmap);
		return "/daili/userlisting.jsp";

	}

	// 查询该代理下所有会员信息
	@RequestMapping(params = "p=userlisting")
	public String userlisting(HttpServletRequest request) throws UnsupportedEncodingException, java.text.ParseException {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		int tel = proxy.getId();
		int page = 1;
		int size = 10;
		String pageString = request.getParameter("page");
		if (StringUtil.isNotNull(pageString) && pageString.trim().length() > 0)
			page = Integer.parseInt(pageString);
		String sizeString = request.getParameter("size");
		if (StringUtil.isNotNull(sizeString) && sizeString.trim().length() > 0)
			size = Integer.parseInt(sizeString);
		int type = Integer.parseInt(request.getParameter("type"));
		Map usersmap = userService.userlisting(page, size, type, tel);
		request.setAttribute("usersmap", usersmap);
		return "/daili/userlisting.jsp";
	}

	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

	// 编辑用户信息
	@RequestMapping(params = "p=bianjiyonghu")
	public String bianjiyonghu() {
		int uid = Integer.parseInt(request.getParameter("uid"));
		int id = Integer.parseInt(request.getParameter("id"));
		User user = userService.findbyid(uid);
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		String name = proxy.getRealname();
		String date = df.format(user.getOverdueTime());
		request.setAttribute("guoqishijian", date);
		request.setAttribute("name", name);
		request.setAttribute("user", user);
		return "/daili/bianjiuser.jsp";
	}

	// 提交修改后的用户信息
	@RequestMapping(params = "p=xiugai")
	public String xiugai() throws java.text.ParseException {
		int id = Integer.parseInt(request.getParameter("uid"));
		short overdue = Short.parseShort(request.getParameter("user_overdue"));
		String user_address = request.getParameter("user_address");
		String user_tel = request.getParameter("user_tel");
		String strovertime = request.getParameter("user_overdue_time").trim();
		short role = Short.parseShort(request.getParameter("user_role"));
		Timestamp overtime = null;
		if (strovertime.length() == 0) {
			overtime = userService.findbyid(id).getOverdueTime();
		} else {
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			try {
				overtime = new Timestamp(format.parse(strovertime).getTime());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		userService.zsg(id, role, overdue, user_address, user_tel, overtime);
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		int tel = proxy.getId();
		int page = 1;
		int size = 10;
		int type = 1;
		Map usersmap = userService.userlisting(page, size, type, tel);
		request.setAttribute("usersmap", usersmap);
		return "/daili/userlisting.jsp";
	}

	// 得到所有预约信息
	@RequestMapping(params = "p=usersyuyuelisting")
	public String yuyueorderslisting(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
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
		Map yuyueordermap = userService.yuyueorderlisting(size, status, page, begintime, endtime, keywords);
		request.setAttribute("yuyueordermap", yuyueordermap);
		request.setAttribute("status", status);
		request.setAttribute("keywords", keywords);
		return "/daili/yuyueOrderlisting.jsp";
	}
	
	
	@RequestMapping(params="p=updatepsd")	
	public String xiugaipsd(HttpServletRequest request,HttpServletResponse response)  throws IOException{
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		
		request.getSession().setAttribute("proxy", proxy);
		return "/daili/daili_update.jsp";
	}
	
	


}
