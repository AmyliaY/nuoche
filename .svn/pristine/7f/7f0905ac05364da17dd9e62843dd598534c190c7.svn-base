package com.action.admin;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Admin;
import com.pojo.Proxy;
import com.service.admin.AdminLunboXQService;
import com.service.admin.AdminMoneyService;
import com.service.admin.AdminProxyChongzhiService;
import com.service.admin.AdminZhidingXQService;
import com.service.daili.BusinessService;
import com.util.StringUtil;

@Controller
@RequestMapping("/admin_zhiding.do")
public class AdminZhidingXQAction {

	@Autowired
	private HttpServletRequest request;
	@Autowired
	private AdminZhidingXQService adminzhidingxqservice;
	
	@RequestMapping(params = "p=zhiding")
	public String duizhanglisting() throws UnsupportedEncodingException {

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
		int status = Integer.parseInt(request.getParameter("status").trim()); // 订单状态
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
		int id = Integer.parseInt(request.getParameter("id"));
		Map zhidingmap = adminzhidingxqservice.zhidinglisting(id,size, page, status, begintime, endtime, keywords);
		List list = (List) zhidingmap.get("list");
		request.setAttribute("id", id);
		request.setAttribute("zhidingmap", zhidingmap);
		request.setAttribute("status", status);
		request.setAttribute("keywords", keywords);
	
		return "/admin/zhidingxq.jsp";
	}

}
