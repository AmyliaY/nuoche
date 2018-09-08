package com.action.admin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Admin;
import com.pojo.Templatemessage;
import com.service.admin.AdminMobanService;
import com.sun.org.apache.regexp.internal.recompile;
import com.util.StringUtil;


@Controller
@RequestMapping("/admin_moban.do")
public class AdminMobanAction {

	@Autowired
	private AdminMobanService mobanservice;
	@Autowired
	private HttpServletRequest request;
	
	//查询所有消息
	@RequestMapping(params="p=xiaoxilisting")
	public String xiaoxilisting(HttpServletRequest request, HttpServletResponse response)
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
		Map mobanmap = mobanservice.xiaoxilisting(size, page, status, begintime, endtime, keywords);
		request.setAttribute("mobanmap", mobanmap);
		request.setAttribute("status", status);
		request.setAttribute("keywords", keywords);
		return "/admin/moban.jsp";
	}
	
	
	/**
	 * 修改模板状态
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params="p=xiugaistatus")
	public String xiugaistatus(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int id =Integer.parseInt(request.getParameter("id"));
		Templatemessage templatemessage=mobanservice.xiugaistatus(id);
		response.getWriter().print(templatemessage.getTpstatus());
		return null;
		
	}
	
	
	//新增模板消息
	@RequestMapping(params="p=addxiaoxilisting")
	public String addmobanxiaoxi(){
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		String tptitle = request.getParameter("tptitle").trim();
		String tpstart = request.getParameter("tpstart").trim();
		String tpending = request.getParameter("tpending").trim();
		String tplink = request.getParameter("tplink").trim();
		int	tpparameters= Integer.parseInt(request.getParameter("tpparameters"));
		String tpmeaning = request.getParameter("tpmeaning");
		String tpweixin_id = request.getParameter("tpweixin_id");
		String tpweixin_name = request.getParameter("tpweixin_name");
		mobanservice.addmobanxiaoxi(tptitle, tpstart, tpending, tplink, tpparameters, tpmeaning,tpweixin_id,tpweixin_name);
		
		int page = 1; // 页数
		int size = 10; // 大小
		Timestamp begintime = null;
		Timestamp endtime = null;
		String keywords = request.getParameter("keywords");
		Map mobanmap = mobanservice.xiaoxilisting(size, page, 1, begintime, endtime, keywords);
		request.setAttribute("mobanmap", mobanmap);
		request.setAttribute("status", 1);
		return "/admin/moban.jsp";
	}
	
	//根据ID找模板消息
	@RequestMapping(params="p=findbyid")
	public String findbyid(){
		int id = Integer.parseInt(request.getParameter("id"));
		int update = Integer.parseInt(request.getParameter("update"));
		
		Templatemessage templatemessage =  mobanservice.findbyid(id);
		
		if(templatemessage!=null)//查询成功
		{
			if(update==1){
				request.getSession().setAttribute("templatemessage", templatemessage);
				return "/admin/updatemoban.jsp";
			}
		}
		return null;
	}
	
	//修改模板消息
	@RequestMapping(params="p=updatexiaoxilisting")
	public String updatemoban(){
		
		int id = Integer.parseInt(request.getParameter("id"));
		String tptitle = request.getParameter("tptitle").trim();
		String tpstart = request.getParameter("tpstart").trim();
		String tpending = request.getParameter("tpending").trim();
		String tplink = request.getParameter("tplink").trim();
		int	tpparameters= Integer.parseInt(request.getParameter("tpparameters"));
		String tpmeaning = request.getParameter("tpmeaning");
		String tpweixin_id = request.getParameter("tpweixin_id");
		String tpweixin_name = request.getParameter("tpweixin_name");
		mobanservice.updatemobanxiaoxi(id, tptitle, tpstart, tpending, tplink, tpparameters, tpmeaning,tpweixin_id,tpweixin_name);
		
		int page = 1; // 页数
		int size = 10; // 大小
		Timestamp begintime = null;
		Timestamp endtime = null;
		String keywords = request.getParameter("keywords");
		Map mobanmap = mobanservice.xiaoxilisting(size, page, 1, begintime, endtime, keywords);
		request.setAttribute("mobanmap", mobanmap);
		request.setAttribute("status", 1);
		return "/admin/moban.jsp";
	}
 	
}
