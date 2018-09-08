package com.action.daili;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.pojo.Proxy;
import com.service.daili.DailiService;


/**
 * pc端 后台代理管理
 * @author 康旺
 * 
 */

@Controller
@RequestMapping("/daili_updatepsw.do")	
public class DailiAction {

	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private DailiService dailiService;
	
	@RequestMapping(params="p=updatepsd")	
	public String updatepsd(HttpServletRequest request,HttpServletResponse response)  throws IOException{
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		
		request.getSession().setAttribute("proxy", proxy);
		return "/daili/dailiUpdatePsw.jsp";
	}
	
	@RequestMapping(params="p=updatpsw2")	
	public String updateadmin(HttpServletRequest request,HttpServletResponse response)  throws IOException{
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		String password = request.getParameter("psd");
		dailiService.updatepsd(proxy, password);
		return "/daili/dailihello.jsp";
	}
	
	@RequestMapping(params="p=checkUpdate")
	@ResponseBody
	public String checkUpdate(HttpServletResponse response) throws IOException
	{
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		String password = request.getParameter("oldpsd");
		Proxy proxy1 = dailiService.checkUpdate(proxy, password);
		System.out.println("laile");
		if(proxy1!=null){
			return "1";
		}else{
			return "0";
		}
	}
}
