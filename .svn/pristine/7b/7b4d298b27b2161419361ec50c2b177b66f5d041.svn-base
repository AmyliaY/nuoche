package com.action.daili;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.pojo.Proxy;
import com.pojo.SylbImages;
import com.service.daili.DailiManageService;
import com.util.MD5Util;
import com.util.StringUtil;
/**
 * pc端 后台管理管理
 * @author 冯慧
 * 全恒改
 *
 */
@Controller
@RequestMapping("/dailimanage.do")
public class DailiManageAction {
	@Autowired
	private DailiManageService DLservice;
	
	
	/**
	 * 查看代理列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(params="p=listzidaili")
	public String listZiDaili(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		Proxy proxy=(Proxy) request.getSession().getAttribute("proxy");
		if(null==proxy){
			return "/daili/login.jsp";
		}
		int id=proxy.getId();
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
		Map zilistmap = DLservice.listZiDaili(size, page, keywords,id);
		request.setAttribute("keywords", keywords);
		request.setAttribute("zilistmap", zilistmap);
		return "/daili/listZidaili.jsp";
		
	}
	
	/**
	 * 删除子代理
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(params="p=deletezidaili")
	public String deletezidaili(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Proxy proxy=(Proxy) request.getSession().getAttribute("proxy");
		if(null==proxy){
			return "/daili/login.jsp";
		}
		//Integer.parseInt(request.getParameter("id"))
		int id = Integer.parseInt(request.getParameter("id"));
		boolean f = DLservice.deletezidaili(id);
		if (f)
			response.getWriter().print(true);
		else
			response.getWriter().print(false);
		return null;
	}
	/**
	 * 批量删除子代理
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(params="p=plDeleteDl")
	public String plDeleteDl(HttpServletRequest request,HttpServletResponse response){
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		String delete = request.getParameter("delete");
		DLservice.plDeleteDl(delete);
		return null;
		
	}
	/**
	 * 显示新增子代理列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(params="p=addzidaili")
	public String addzidaili(HttpServletRequest request,HttpServletResponse response){
		Proxy proxy=(Proxy) request.getSession().getAttribute("proxy");
		if(null==proxy){
			return "/daili/login.jsp";
		}
		List areaList = DLservice.selectArea(proxy);
		request.setAttribute("areaList", areaList);
		return "/daili/addzidaili.jsp";
		
	}
	/**
	 * 新增子代理
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(params="p=doaddzidaili")
	public String doaddzidaili(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		Proxy proxy=(Proxy) request.getSession().getAttribute("proxy");
		if(null==proxy){
			return "/daili/login.jsp";
		}
		String realname=request.getParameter("proxyname");
		Integer arId = Integer.parseInt(request.getParameter("area"));
		String password2 = "123456";
		String password = MD5Util.getMD5(MD5Util.getMD5(password2+"sunjob")+"sunjob");
		int parentid=proxy.getId();
		String tel=request.getParameter("proxytel");
		Timestamp timestamp=new Timestamp(System.currentTimeMillis());
		short level=(short) (proxy.getLevel()+1);
		short status =1;
		Proxy proxy2=new Proxy();
		proxy2.setParentId(parentid);
		proxy2.setTel(tel);
		proxy2.setCreatedTime(timestamp);
		proxy2.setLevel(level);
		proxy2.setStatus(status);
		proxy2.setPassword(password);
		proxy2.setRealname(realname);
		DLservice.doaddzidaili(proxy2,arId);
		return "/dailimanage.do?p=listzidaili";
	}
	
	@RequestMapping(params="p=cheaktel")
	@ResponseBody
	public String cheaktel(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		String tel=request.getParameter("tel");
		boolean bl=DLservice.cheaktel(tel);
		if(bl){
			return "yes";
		}
		return "no";
		
	}
	
	/**
	 * 根据城市id查询区县
	 */
	@RequestMapping(params="p=findonproxy")
	@ResponseBody
	public String findonproxy(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Proxy proxy=(Proxy) request.getSession().getAttribute("proxy");
		if(null==proxy){
			return "/daili/login.jsp";
		}
		int area = Integer.parseInt(request.getParameter("area"));
		String onproxy_num = DLservice.findOnProxy(area);
		//String onproxy = adminProxyService.getOnProxy(ctId);
		//response.getWriter().print(json);
		String json="[{\"num\":\""+onproxy_num+"\"}]";
		return json;
	}
	
	/**
	 * 修改代理状态 禁用 or 启用
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=updatestatus")
	public String updatestatus(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		Proxy proxy2 = DLservice.updatestatus(id);
		response.getWriter().print(proxy2.getStatus());
		return null;
	}
	
}
