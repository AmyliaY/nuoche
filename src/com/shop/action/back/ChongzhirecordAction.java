package com.shop.action.back;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.pojo.Paypresent;
import com.service.back.ChongzhirecordService;
import com.util.StringUtil;

@Controller
@RequestMapping("/chongzhirecord.do")
public class ChongzhirecordAction {
	@Autowired
	private ChongzhirecordService chongzhirecordService;
	/**
	 * 分页会员充值记录
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(params="p=chongzhilisting")
	public String chongzhilisting(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		//分页
		int page=1;
		int size=10;
		String pageString=request.getParameter("page");
		if(StringUtil.isNotNull(pageString) && pageString.trim().length()>0)
			page=Integer.parseInt(pageString);
		String sizeString=request.getParameter("size");
		if(StringUtil.isNotNull(sizeString) && sizeString.trim().length()>0)
			size=Integer.parseInt(sizeString);
		//充值类型
		String cztype=request.getParameter("cztype");
		//充值状态
		String czstatus=request.getParameter("czstatus");
		//搜索   日期区间
		String begindate=request.getParameter("begindate");
		Timestamp begintime=null;
		if(StringUtil.isNotNull(begindate) && begindate.trim().length()>0)
			begintime=Timestamp.valueOf(begindate+" 00:00:00");
		String enddate=request.getParameter("enddate");
		Timestamp endtime=null;
		if(StringUtil.isNotNull(enddate) && enddate.trim().length()>0)
			endtime=Timestamp.valueOf(enddate+" 23:59:59");
		//搜索   会员名称  or 充值订单号
		String keywords=request.getParameter("keywords");
		if(request.getMethod().equalsIgnoreCase("GET"))
			if(keywords!=null)
				keywords=new String(keywords.getBytes("iso8859-1"),"utf-8");
		Map chongzhimap=chongzhirecordService.chongzhilisting(size,page,cztype,czstatus,begintime,endtime,keywords);
		request.setAttribute("chongzhimap", chongzhimap);
		request.setAttribute("cztype", cztype);
		request.setAttribute("czstatus", czstatus);
		request.setAttribute("keywords", keywords);
		return "/admin/chongzhilisting.jsp";
	}
	//根据ID 删除充值记录
	@RequestMapping(params="p=deletechongchi")
	public String deletechongchi(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		boolean f=chongzhirecordService.deletechongchi(id);
		if(f)
			response.getWriter().print(true);
		else
			response.getWriter().print(false);
		return null;
	}
	/**
	 * 批量删除
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=pldelete")
	public String pldelete(HttpServletRequest request,HttpServletResponse response)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		String payid=request.getParameter("shanchu");
		System.out.println(payid);
		chongzhirecordService.pldelete(payid);
		return null;
	}
	/**
	 * 充值赠送积分数
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params="p=ChongZhiYouHui")
	public String ChongZhiYouHui(HttpServletRequest request,HttpServletResponse response)
	{
		int page=1;
		int size=10;
		String pageString=request.getParameter("page");
		if(StringUtil.isNotNull(pageString) && pageString.length()>=0)
		{
			page=Integer.parseInt(pageString);
		}
		String sizeString=request.getParameter("size");
		if(StringUtil.isNotNull(sizeString) && sizeString.length()>=0)
		{
			size=Integer.parseInt(sizeString);
		}
		Map map=chongzhirecordService.ChongZhiYouHui(size,page);
		request.setAttribute("map", map);
		return "/admin/chongzhiyouhui.jsp";
	}
	/**
	 * 设置充值价格区间
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=setqujian")
	public String setqujian(HttpServletRequest request,HttpServletResponse response)
	{
		int ppmin =Integer.parseInt(request.getParameter("ppmin"));
		int ppmax= Integer.parseInt(request.getParameter("ppmax"));
		int ppPresent =Integer.parseInt(request.getParameter("ppPresent"));
		int ppstatus= Integer.parseInt(request.getParameter("ppstatus"));
		chongzhirecordService.setqujian(ppmin,ppmax,ppPresent,ppstatus);
		return null;
	}
	/**
	 * 是否禁用充值优惠区间
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(params="p=updatestatus")
	public String updatestatus(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		int id = Integer.parseInt(request.getParameter("id"));
		Paypresent paypresent=chongzhirecordService.updatestatus(id);
		response.getWriter().print(paypresent.getPpStatus());
		return null;
	}
	/**
	 * 删除充值优惠区间
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(params="p=deleteYouhui")
	public String deleteYouhui(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		int id = Integer.parseInt(request.getParameter("id"));
		boolean f=chongzhirecordService.deleteYouhui(id);
		if(f)
			response.getWriter().print(true);
		else
			response.getWriter().print(false);
		return null;
	}
}
