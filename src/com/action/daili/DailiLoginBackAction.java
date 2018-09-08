package com.action.daili;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.action.YzmAction;
import com.pojo.Proxy;
import com.service.daili.DailiLoginBackService;


/**
 * pc端 后台管理管理
 * @author lgh
 * 
 *
 */

@Controller
@RequestMapping("/dailiLoginBack.do")
public class DailiLoginBackAction {
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private DailiLoginBackService dailiLoginBackService;
	
	/**
	 * 代理后台登录
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
		Proxy proxy = dailiLoginBackService.checkLogin(username, password);
		if (proxy!=null) //登录成功
		{
			request.getSession().setAttribute("proxy", proxy);
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
		return "redirect:/daili/back_index.jsp";
	}
	
	@RequestMapping(params="p=logout")
	public String logout(HttpServletRequest request)
	{
	    request.getSession().invalidate();
	    return "redirect:/";
	}
	
	
}
