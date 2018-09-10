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

import com.alibaba.fastjson.serializer.SimpleDateFormatSerializer;
import com.dao.ProxyDAO;
import com.dao.UserDAO;
import com.pojo.Admin;
import com.pojo.Proxy;
import com.pojo.User;
import com.qq.connect.utils.http.Response;
import com.service.daili.DailiYuyueService;
import com.service.daili.DailiUserService;
import com.util.StringUtil;

import bsh.ParseException;

/*
 * 张嘉雄    3月24
 * 
 * */

@Controller
@RequestMapping("/daili_yuyue.do") 
public class DailiYuyueAction {

	@Autowired
	private DailiYuyueService yuyueservice;
	@Autowired
	private HttpServletRequest request;
	// 得到所有预约信息
	
	
	
	@RequestMapping(params = "p=yuyuelisting")
	public String yuyueorderslisting(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/proxy/login.jsp";
		}
		int page = 1; // 页数
		int size = 10; // 大小
		String pageString = request.getParameter("page");
		if (StringUtil.isNotNull(pageString) && pageString.trim().length() > 0)
			page = Integer.parseInt(pageString);
		String sizeString = request.getParameter("size");
		
		int id = proxy.getId();
		Map yuyueordermap = yuyueservice.yuyueorderlisting(id, size, page);
		request.setAttribute("yuyueordermap", yuyueordermap);
		return "/daili/yuyueOrderlisting.jsp";
	}
}
