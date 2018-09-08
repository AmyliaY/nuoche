package com.action.daili;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.action.YzmAction;
import com.pojo.Admin;
import com.pojo.Province;
import com.pojo.Proxy;
import com.service.daili.DailiLoginBackService;
import com.service.daili.DailiSmsService;
import com.service.daili.DailiUserInfoService;
/**
 * pc端 后台管理管理
 * @author 唐仁鑫
 * 
 *
 */
@Controller
@RequestMapping("/dailiinfo.do")
public class DailiUserInfoAction {
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private DailiUserInfoService dailiuserinfoservice;
	
	@Autowired
	private DailiSmsService dailismsservice;
	
	/**
	 * 代理后台登录
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ParseException 
	 */
	@RequestMapping(params="p=findUserInfoByid")
	public String FindUserInfoByid(HttpServletResponse response) throws IOException, ParseException
	{
		Proxy proxy0 = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy0 == null) {
			return "/daili/login.jsp";
		}
		//  得到要查询的代理人ID
		int id = Integer.parseInt(request.getParameter("id"));
		//update=0:跳转个人信息页面  update=1:跳转个人信息修改页面  update=2:跳转欢迎页面
		int update = Integer.parseInt(request.getParameter("update"));
		Proxy proxy = dailiuserinfoservice.FindUserInfoByid(id);
		//  查询子代理
		int ziproxynum = dailiuserinfoservice.FindZiDailiById(id);
		//  上一级代理名字
		String parenproxyname = "";
		if(proxy.getParentId()==0)
		{
			parenproxyname ="卡卡管理员";
		}else{
			// 查询上一级代理
			Proxy parenproxy = dailiuserinfoservice.FindUserInfoByid(proxy.getParentId());
			parenproxyname = parenproxy.getRealname();
		}
		List<Province> plist = dailiuserinfoservice.FindProvinceAll();
		if (proxy!=null) //查询成功
		{
			request.getSession().setAttribute("parenproxyname", parenproxyname);
			request.getSession().setAttribute("ziproxynum", ziproxynum);
			request.getSession().setAttribute("proxy", proxy);
			if(update == 2)
				return "/daili/dailihello.jsp";
			else if(update == 0)
				return "/daili/showuserinfobyid.jsp";
			else 
			{
				request.getSession().setAttribute("plist", plist);
				return "/daili/updateuserinfobyid.jsp";
			}
			
		}
		else
		{
			return "false";
		}
	}
	@RequestMapping(params="p=updateUserInfoByid")
	public String UpdateUserInfoByid(HttpServletResponse response) throws IOException
	{
		Proxy proxy0 = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy0 == null) {
			return "/daili/login.jsp";
		}
		//  得到要查询的代理人ID
		int id = Integer.parseInt(request.getParameter("id"));
		String birthday = request.getParameter("daili_birthday");
		int daili_arid = Integer.parseInt(request.getParameter("arid"));
		String daili_tel = request.getParameter("daili_tel");
		Proxy proxy1 = dailiuserinfoservice.FindUserInfoByid(id);
		// 如果没有修改手机号
		if(daili_tel.equals(proxy1.getTel()))
		{
			Proxy proxy = dailiuserinfoservice.UpdateUserInfoByid(id,birthday,daili_arid);
			if (proxy!=null) //查询成功
			{
				request.getSession().setAttribute("proxy", proxy);
				return "/daili/showuserinfobyid.jsp";
			}
			else
			{
				return "false";
			}
			
		}else{
			//  验证码验证
			boolean re =  dailismsservice.testYzm(daili_tel);
			if(re)
			{
				Proxy proxy = dailiuserinfoservice.UpdateUserInfoByid(id,birthday,daili_arid,daili_tel);
				if (proxy!=null) //查询成功
				{
					request.getSession().setAttribute("proxy", proxy);
					return "/daili/showuserinfobyid.jsp";
				}
				else
				{
					return "false";
				}
			}
			else
				return "false";
			
			
		}
		
		
	}
	@RequestMapping(params="p=findByidCity")
	@ResponseBody
	public String findByidCity(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		int prid = Integer.parseInt(request.getParameter("prid"));
		String json=dailiuserinfoservice.findByidCity(prid);
		return json;
	}
	@RequestMapping(params="p=findByIdArea")
	@ResponseBody
	public String findByIdArea(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		int crid =Integer.parseInt(request.getParameter("crid"));
		String json=dailiuserinfoservice.findByIdArea(crid);
		return json;
	}
	
	
}
