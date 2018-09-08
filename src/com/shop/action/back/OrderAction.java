package com.shop.action.back;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Admin;
import com.pojo.Goodsorderdetail;
import com.pojo.Goodsorders;
import com.service.back.OrderService;
import com.util.StringUtil;

@Controller
@RequestMapping("/goodsorder.do")
public class OrderAction {
	@Autowired
	public OrderService orderService;
	
	/**
	 * 所有订单列表
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(params="p=orderslisting")
	public String orderslisting(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int page=1;		//页数
		int size=10;		//大小
		String pageString=request.getParameter("page");
		if(StringUtil.isNotNull(pageString) && pageString.trim().length()>0)
			page=Integer.parseInt(pageString);
		String sizeString=request.getParameter("size");
		if(StringUtil.isNotNull(sizeString) && sizeString.trim().length()>0)
			size=Integer.parseInt(sizeString);
		int status=Integer.parseInt(request.getParameter("status"));	//订单状态
		//搜索区间
		String begindate=request.getParameter("begindate");
		Timestamp begintime=null;
		if(StringUtil.isNotNull(begindate) && begindate.trim().length()>0)
			begintime=Timestamp.valueOf(begindate+" 00:00:00");
		String enddate=request.getParameter("enddate");
		Timestamp endtime=null;
		if(StringUtil.isNotNull(enddate) && enddate.trim().length()>0)
			endtime=Timestamp.valueOf(enddate+" 23:59:59");
		//关键字
		String keywords=request.getParameter("keywords");
		if(request.getMethod().equalsIgnoreCase("GET")){
			if(keywords!=null)
				keywords=new String(keywords.getBytes("iso8859-1"),"utf-8");
		}
		Map ordermap=orderService.orderlisting(size,page,status,begintime,endtime,keywords);
		request.setAttribute("ordermap", ordermap);
		request.setAttribute("status", status);
		request.setAttribute("keywords", keywords);
		return "/admin/orderlisting.jsp";
		
	}
	/**
	 * 查看订单详情
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params="p=checkorderdetail")
	public String checkorderdetail(HttpServletRequest request,HttpServletResponse response)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		Goodsorderdetail god= orderService.checkorderdetail(id);
		request.setAttribute("god", god);
		return "/admin/orderdetail.jsp";
	}
	/**
	 * 订单发货页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params="p=ordersfahuoview")
	public String ordersfahuoview(HttpServletRequest request,HttpServletResponse response)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		List corplist=orderService.getAllCrop();
		request.setAttribute("id", id);
		request.setAttribute("corplist", corplist);
		return "/admin/ordersfahuo.jsp";
	}
	/**
	 * 订单发货
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params="p=ordersfahuo")
	public String ordersfahuo(HttpServletRequest request,HttpServletResponse response)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		String orrecipient=request.getParameter("orrecipient");
		int pscid=Integer.parseInt(request.getParameter("pscid"));
		orderService.ordersfahuo(id,orrecipient,pscid);
		return null;
	}
}
