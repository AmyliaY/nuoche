package com.action.admin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Admin;
import com.pojo.PeisongCorp;
import com.service.admin.AdminPeisongcorpService;
import com.util.StringUtil;

/**
 * 配送管理Action
 * @author dell
 *
 */



@Controller
@RequestMapping("/admin_corp.do")
public class PeisongcorpAction {
	
	@Autowired
	private AdminPeisongcorpService corpService;
	
	/**
	 *  配送公司列表
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(params="p=corplisting")
	public String corplisting(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int page=1;
		int size=6;
		String pageString=request.getParameter("page");
		if(StringUtil.isNotNull(pageString) && pageString.trim().length()>0)
			page=Integer.parseInt(pageString);
		String sizeString=request.getParameter("size");
		if(StringUtil.isNotNull(sizeString) && sizeString.trim().length()>0)
			size=Integer.parseInt(sizeString);
		String keywords=request.getParameter("keywords");
		if(request.getMethod().equalsIgnoreCase("GET"))
		{
			if(keywords!=null)
				keywords=new String(keywords.getBytes("iso8859-1"),"utf-8");
		}	
		Map corpmap=corpService.corplisting(size,page,keywords);
		request.setAttribute("corpmap", corpmap);
		request.setAttribute("keywords", keywords);
		return "/admin/peisongcorplisting.jsp";
	}
	
	/**
	 * 修改配送公司状态  禁用 or 启用
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params="p=updatestatus")
	public String updatestatus(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		PeisongCorp corp=corpService.updatestatus(id);
		response.getWriter().print(corp.getPscstatus());
		return null;
	}
	
	/**
	 *  配送公司列表编辑
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params="p=corplinstingedit")
	public String editlunboimgview(HttpServletRequest request,HttpServletResponse response)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		PeisongCorp corplisting=corpService.editcorplisting(id);
		request.setAttribute("corplisting", corplisting);
		return "/admin/peisongcorplistingedit.jsp";
	}
	
	/**
	 *  修改配送公司列表编辑
	 * @param request
	 * @param response
	 * @return
	 */
	
	@RequestMapping(params="p=editcorplinsting")
	public String editcorplinsting(HttpServletRequest request,HttpServletResponse response)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		String chinesename=request.getParameter("chinesename");
		String englishname=request.getParameter("englishname");
		String pscurl=request.getParameter("pscurl");
		String pscdetail=request.getParameter("pscdetail");
		corpService.editcorp(id, chinesename, englishname, pscurl, pscdetail);
		return "/admin_corp.do?p=corplisting";
	}
	
	/**
	 * 添加公司
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params="p=addcorp")
	public String addcorp(HttpServletRequest request,HttpServletResponse response)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		String chinesename=request.getParameter("chinesename");
		String englishname=request.getParameter("englishname");
		int pscstatsu=Integer.parseInt(request.getParameter("pscstatus"));
		String pscurl=request.getParameter("pscurl");
		String pscdetail=request.getParameter("pscdetail");
		corpService.addcorp(chinesename,englishname,pscstatsu,pscurl,pscdetail);
		return "/admin_corp.do?p=corplisting";
	}
	

}
