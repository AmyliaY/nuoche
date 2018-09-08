package com.action.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.action.YzmAction;
import com.pojo.Admin;
import com.service.admin.AdminBackService;
import com.util.SmsUtil;


/**
 * pc端 后台管理管理
 * @author lgh
 * 
 *
 */

@Controller
@RequestMapping("/adminlogin.do")
public class AdminBackAction {
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private AdminBackService adminService;
	
	/**
	 * 管理员后台登录
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params="p=checkuser")
	@ResponseBody
	public String login(HttpServletResponse response) throws IOException
	{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Admin admin = adminService.checkLogin(username, password);
		if (admin!=null) //登录成功
		{
			request.getSession().setAttribute("admin", admin);
			return "true";
		}
		else
		{
			return "false";
		}
	}
	
	/**
	 * @throws IOException 
	 * 
	 * @Title: LoginAction
	 * @author: LAP QQ:2549295092
	 * @Description: 	判断验证码是否正确
	 * @throws  
	 */
	@RequestMapping(params="p=yzm")
	public void checkyzm(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String yzm=request.getParameter("yzm");
		if(YzmAction.sjs!=null){
			if(yzm.equalsIgnoreCase(YzmAction.sjs)){
				response.getWriter().print("true");
			}else{
				response.getWriter().print("false");
			}
		}else{
			response.getWriter().print("false");
		}
	}
	
	@RequestMapping(params="p=login")
	public String getLogin(HttpServletRequest request,HttpServletResponse response){
		return "redirect:/admin/back_index.jsp";
	}
	
	@RequestMapping(params="p=logout")
	public String logout(HttpServletRequest request)
	{
	    request.getSession().invalidate();
	    return "redirect:/";
	}
	
	
}
