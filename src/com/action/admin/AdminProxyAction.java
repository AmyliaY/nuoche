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
import com.pojo.Province;
import com.pojo.Admin;
import com.pojo.Proxy;
import com.pojo.SylbImages;
import com.service.admin.AdminProxyService;
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
@RequestMapping("/admin_daili.do")
public class AdminProxyAction {
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private AdminProxyService adminProxyService;
	

	/**
	 * 列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(params="p=dalilisting")
	public String proxylisting(HttpServletResponse response) throws IOException
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
		Map proxymap = adminProxyService.proxylisting(size, page, keywords);
		request.setAttribute("proxymap", proxymap);
		request.setAttribute("keywords", keywords);
		return "/admin/proxylisting.jsp";
	}
	
	/**
	 * 代理状态 离职 or 在职
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=updatestatus")
	public String updatestatus(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		Proxy proxy = adminProxyService.updatestatus(id);
		response.getWriter().print(proxy.getStatus());
		return null;
	}
	
	/**
	 * 批量在职 or 离职
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "p=plupdatestatus")
	public String plupdatestatus(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		short type = Short.parseShort(request.getParameter("type"));
		String qiyong = request.getParameter("qiyong");
		String jinyong = request.getParameter("jinyong");
		adminProxyService.plupdatestatus(type, qiyong, jinyong);
		return null;
	}

	/**
	 * 添加代理
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "p=addproxy")
	public String addproxy(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String proxyname = request.getParameter("proxyname");
		String proxytel = request.getParameter("proxytel");
		int arid = Integer.parseInt(request.getParameter("arid"));
		
		adminProxyService.addproxy(proxyname, proxytel, arid);
		return "/admin_daili.do?p=dalilisting";
	}

	/**
	 * 进入添加代理页面
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "p=adddaililisting")
	public String goAdd(HttpServletRequest request){
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		List<Province> provinceList = adminProxyService.getProvince();
		request.setAttribute("provinceList", provinceList);
		if (admin == null) {
			return "/admin/login.jsp";
		}
		return "/admin/addproxy.jsp";
	}
	
	/**
	 * 进入查看业绩页面
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "p=showachievement")
	public String editlunboimgview(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		Proxy proxy = adminProxyService.showAchievement(id);
		request.setAttribute("proxy", proxy);
		return "/admin/proxyachievement.jsp";
	}
	
	/**
	 * 根据省份id查询城市
	 */
	@RequestMapping(params="p=findcity")
	@ResponseBody
	public String findservice(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int prid = Integer.parseInt(request.getParameter("prid"));
		String json = adminProxyService.findCity(prid);
		System.out.println(json);
		//response.getWriter().print(json);
		return json;
	}
	
	/**
	 * 根据城市id查询区县
	 */
	@RequestMapping(params="p=findarea")
	@ResponseBody
	public String findarea(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int ctId = Integer.parseInt(request.getParameter("ctId"));
		String json = adminProxyService.findArea(ctId);
		//String onproxy = adminProxyService.getOnProxy(ctId);
		//response.getWriter().print(json);
		return json;
	}
	
	/**
	 * 根据城市id查询区县
	 */
	@RequestMapping(params="p=findonproxy")
	@ResponseBody
	public String findonproxy(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int ctId = Integer.parseInt(request.getParameter("ctId"));
		String onproxy_num = adminProxyService.findOnProxy(ctId);
		//String onproxy = adminProxyService.getOnProxy(ctId);
		//response.getWriter().print(json);
		String json="[{\"num\":\""+onproxy_num+"\"}]";
		return json;
	}
	
}