package com.shop.action.back;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.pojo.City;
import com.service.admin.PeisongcorpService;
import com.service.back.YunfeiService;
import com.util.StringUtil;

@Controller
@RequestMapping("/yunfei.do")
public class YunfeiAction {
	@Autowired
	private YunfeiService yunfeiService;
	@Autowired
	private PeisongcorpService corpService;
	/**
	 * 进入设置运费页面  查出所有省份
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params="p=setyunfeiview")
	public String setyunfeiview(HttpServletRequest request,HttpServletResponse response)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int ctid=33;
		City city=yunfeiService.getctfeiyong(ctid);
		request.setAttribute("city", city);
		return "/admin/setgmyunfei.jsp";
	}
	/**
	 * 设置通用运费
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=settongyong")
	public String settongyong(HttpServletRequest request,HttpServletResponse response)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		String yunfei=request.getParameter("yunfei");
		yunfeiService.settongyong(yunfei);
		System.out.println("laile");
		return "ok";
	}
	
	/**
	 * 根据省ID 查出所有市级
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params="p=setdiqu")
	public String setdiqu(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int page=1;
		int size=10;
		String pageString=request.getParameter("page");
		if(StringUtil.isNotNull(pageString)&& pageString.trim().length()>0)
			page=Integer.parseInt(pageString);
		String sizeString=request.getParameter("size");
		if(StringUtil.isNotNull(sizeString)&& sizeString.trim().length()>0)
			size=Integer.parseInt(sizeString);
		int prid = Integer.parseInt(request.getParameter("prid"));
		Map  fymap=yunfeiService.setdiqu(prid,size,page);
		request.setAttribute("fymap", fymap);
		request.setAttribute("prid", prid);
		return "/yunfei.do?p=setdiquyunfei";
	}
	/**
	 * 根据市ID  查出该市    进入设置city运费页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params="p=setdiquprice")
	public String setdiquprice(HttpServletRequest request,HttpServletResponse response)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		City city=yunfeiService.setdiquprice(id);
		request.setAttribute("city", city);
		return "/admin/setcitypriceview.jsp";
	}
	//设置city费用
	@ResponseBody
	@RequestMapping(params="p=setcityyunfei")
	public String setcityyunfei(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		String ctyunfei=request.getParameter("yunfei");
		City city=yunfeiService.setcityyunfei(id,ctyunfei);
		response.getWriter().print("ok");
		return null;
	}
	
}
