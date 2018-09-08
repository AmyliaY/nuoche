package com.shop.action.back;


import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Admin;
import com.service.back.GoodsZiyingService;
import com.util.StringUtil;


@Controller
@RequestMapping("/ziyinggoods.do")
public class GoodsZiyingAction {

	@Autowired
	private GoodsZiyingService ziyingService;
	
	@RequestMapping(params = "p=zygoodsview")
	public String zygoodsview(HttpServletRequest request,HttpServletResponse response)
	throws UnsupportedEncodingException{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int page = 1;
		int size = 6;
		String pageString = request.getParameter("page");
		if (StringUtil.isNotNull(pageString) && pageString.trim().length() >0) 
			page = Integer.parseInt(pageString);
			String sizeString = request.getParameter("size");
		if (StringUtil.isNotNull(sizeString) && sizeString.trim().length() >0) 
		size = Integer.parseInt(sizeString);
		
		String gttid = request.getParameter("gttid");
		String gstate = request.getParameter("gstate");//商品状态
		String keywords = request.getParameter("keywords");
		
		if (request.getMethod().equalsIgnoreCase("GET")) 
			if (keywords != null) {
				keywords = new String(keywords.getBytes("iso8859-1"),"utf-8");
			}
		
			String minprice = request.getParameter("minprice");
			String maxprice = request.getParameter("maxprice");
			
			Map zygoodsMap = ziyingService.zygoodsview(size, page, keywords, gttid, minprice, maxprice,gstate);
		//	List twotypelist = ziyingService.getzyTwotypegoods();
			request.setAttribute("zygoodsMap", zygoodsMap);
		//	request.setAttribute("twotypelist", twotypelist);
			request.setAttribute("keywords", keywords);
			return "/admin/ziyinggoods.jsp";
	}
}
