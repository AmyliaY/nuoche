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
import com.pojo.Userinfo;
import com.service.back.UsersService;
import com.shop.service.app.AppRechargeService;
import com.util.MD5Util;
import com.util.StringUtil;

@Controller
@RequestMapping("/users.do")
public class UsersAction {
	
	@Autowired
	private UsersService usersService;
	
	
	@Autowired
	private AppRechargeService  appRechargeService;
	
	@Autowired
	private HttpServletRequest request;
	
	
	
	/**
	 * 根据手机查昵称
	 * @return
	 */
	@RequestMapping(params="p=getNameByTel")
	@ResponseBody
	public String getNameByTel()
	{
		String tel = request.getParameter("tel");
		Userinfo userinfo = usersService.findByPhone(tel);
		if (userinfo!=null)
		{
			return userinfo.getUsersName();
		}
		
		return "";
	}
	
	/**
	 * 判断是否关注
	 * @return
	 */
	@RequestMapping(params="p=guanzhu")
	public String guanzhu()
	{
		return null;
	}
	
	
	
	/**
	 * 会员列表
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 * @throws NumberFormatException 
	 * @throws NumberFormatException 
	 */
	@RequestMapping(params="p=userlisting")
	public String userlisting(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int page=1;
		int size=10;
		String pageString=request.getParameter("page");
		if(StringUtil.isNotNull(pageString) && pageString.trim().length()>0)
			page=Integer.parseInt(pageString);
		String sizeString=request.getParameter("size");
		if(StringUtil.isNotNull(sizeString) && sizeString.trim().length()>0)
			size=Integer.parseInt(sizeString);
		int type=Integer.parseInt(request.getParameter("type"));
		String begindate=request.getParameter("begindate");
		Timestamp begintime=null;
		if(StringUtil.isNotNull(begindate) && begindate.trim().length()>0)
			begintime=Timestamp.valueOf(begindate+" 00:00:00");
		String enddate=request.getParameter("enddate");
		Timestamp endtime=null;
		if(StringUtil.isNotNull(enddate) && enddate.trim().length()>0)
			endtime=Timestamp.valueOf(enddate+" 23:59:59");
		String keywords=request.getParameter("keywords");
		StringBuffer sb = new StringBuffer();
		if (keywords!=null) {
			sb.append(keywords.trim());
		}else{
			sb.append("");
		}
		if(request.getMethod().equalsIgnoreCase("GET"))
		{
			if(keywords!=null)
				keywords=new String(keywords.getBytes("iso8859-1"),"utf-8");
		}
		Map usersmap=usersService.userlisting(page,size,type,begintime,endtime,sb.toString());
		request.setAttribute("usersmap", usersmap);
		request.setAttribute("keywords", keywords);
		return "/admin/userlisting.jsp";
		
	}
	/**
	 * 修改用户状态
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
		System.out.println(id);
		Userinfo userinfo=usersService.xiugaistatus(id);
		response.getWriter().print(userinfo.getUsersStatus());
		return null;
		
	}
	//修改用户类型
	@RequestMapping(params="p=xiugaitype")
	public String xiugaitype(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int id=Integer.parseInt(request.getParameter("id"));
		Userinfo userinfo=usersService.xiugaitype(id);
		response.getWriter().print(userinfo.getUsersType());
		return null;
	}
	/**
	 * 根据会员ID 查看该会员积分记录
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params="p=jifencord")
	public String jifencord(HttpServletRequest request,HttpServletResponse response)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int page=1;
		int size=10;
		String pageString=request.getParameter("page");
		if(StringUtil.isNotNull(pageString) && pageString.trim().length()>0)
			page=Integer.parseInt(pageString);
		String sizeString=request.getParameter("size");
		if(StringUtil.isNotNull(sizeString) && sizeString.trim().length()>0)
			size=Integer.parseInt(sizeString);
		int id =Integer.parseInt(request.getParameter("id"));
		Userinfo users=usersService.findByidUser(id);
		Map jifenMap=usersService.jifencord(size,page,id);
		request.setAttribute("jifenMap", jifenMap);
		request.setAttribute("users", users);
		request.setAttribute("id", id);
		return "/admin/jifenlisting.jsp";
	}
	//进入后台会员充值页面
	@RequestMapping(params="p=userschongzhiview")
	public String userschongzhiview(HttpServletRequest request,HttpServletResponse response)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		Userinfo users=usersService.userschongzhiview(id);
		request.setAttribute("users", users);
		
		//充值优惠
		String json = appRechargeService.getAllPresent();
		request.setAttribute("json", json);
		
		return "/admin/userschongzhi.jsp";
	}
	/**
	 * 后台会员充值
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=userschongzhi")
	public String userschongzhi(HttpServletRequest request,HttpServletResponse response)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id")); //会员ID
		Double price=Double.parseDouble(request.getParameter("price")); //充值金额
		usersService.userschongzhi(id,price);
		return null;
	}
	
	//注册
	@RequestMapping(params = "p=zhuce")
	public void zhuce(HttpServletRequest request, HttpServletResponse response){
		String mobile = request.getParameter("userName");
		System.out.println("啥子："+mobile);
		String pwd = request.getParameter("pwd");
		String password = MD5Util.getMD5(MD5Util.getMD5(pwd + "sunjob")
				+ "sunjob");
		String usersReferrer=request.getParameter("userPhone");
		 System.out.print(usersReferrer);
		String username=request.getParameter("username");
		System.out.println("昵称："+username);
		
		String weixinhao = request.getParameter("weixinhao");//自己微信号
		String tjr  = request.getParameter("tjr");//推荐 人手机号码
		if (tjr == null)
			tjr = usersReferrer;
		System.out.println("微信号:"+weixinhao);
		System.out.println("推荐人:"+tjr);
		if(tjr==null){
			usersService.zhuce(weixinhao,mobile, password,username);
		}else{
			usersService.zhuceWithReferrer(weixinhao,mobile, password,tjr,username);
		}
		
		
	}
	
	//修改密码
	@RequestMapping(params = "p=updatepws")
	public void updatepws(HttpServletRequest request, HttpServletResponse response){
		String mobile = request.getParameter("userName");
		String pwd = request.getParameter("pwd");
		System.out.println(mobile);
		System.out.println(pwd);
		String password = MD5Util.getMD5(MD5Util.getMD5(pwd + "sunjob")
				+ "sunjob");
		usersService.updatepws(mobile, password);
	}
	
}
