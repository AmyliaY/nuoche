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
import com.service.admin.AdminMoneyService;
import com.service.admin.AdminProxyChongzhiService;
import com.service.daili.DailiBusinessService;
import com.util.StringUtil;

@Controller
@RequestMapping("/admin_money.do")
public class AdminMoneyAction {

	@Autowired
	private HttpServletRequest request;
	@Autowired
	private AdminMoneyService adminmoneyservice;
	@Autowired
	private AdminProxyChongzhiService adminproxychongzhiservice;
	@Autowired
	private DailiBusinessService businessservice;

	@RequestMapping(params = "p=duizhang")
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
		Map duizhangmap = adminmoneyservice.duizhanglisting(size, page, status, begintime, endtime, keywords);
		List list = (List) duizhangmap.get("list");
		Float[] chongzhi = new Float[list.size()];
		float[] zhiding = new float[list.size()];
		float[] lunbo = new float[list.size()];
		float zdzongjine = 0;
		float lbzongjine = 0;
		for (int i = 0; i < list.size(); i++) {
			Proxy proxy = (Proxy) list.get(i);
			// 得到代理ID
			int id = proxy.getId();
			// 充值总金额
			Float chongzhizonge = adminproxychongzhiservice.dailichongzhizonge(id, begintime, endtime);
			chongzhi[i] = chongzhizonge;
			// 置顶总收费
			zdzongjine = adminmoneyservice.zdzfy(id,begintime, endtime);
			zhiding[i] = zdzongjine;
			// 轮播收费
			lbzongjine = adminmoneyservice.lbzfy(id,begintime, endtime);
			lunbo[i] = lbzongjine;
		}
		request.setAttribute("duizhangmap", duizhangmap);
		request.setAttribute("status", status);
		request.setAttribute("keywords", keywords);
		request.setAttribute("chongzhi", chongzhi);
		request.setAttribute("zhiding", zhiding);
		request.setAttribute("lunbo", lunbo);
		return "/admin/duizhang.jsp";
	}

}
