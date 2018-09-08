package com.action.weixin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.weixin.WeixinAboutWeService;

@Controller
@RequestMapping("/aboutwe.do")
public class WeixinAboutWeAction {
	@Autowired
	private WeixinAboutWeService weixinAboutWeService;

	@RequestMapping(params="p=aboutwe")
	public String showAboutWe(HttpServletRequest request, HttpServletResponse response){
		String awdesc = weixinAboutWeService.getDesc();
		request.setAttribute("awdesc", awdesc);
		
		return "/weixin/aboutwe.jsp";
	}
}
