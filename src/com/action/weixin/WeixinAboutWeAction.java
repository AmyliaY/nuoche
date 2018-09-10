package com.action.weixin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.weixin.WeixinAboutWeService;

/**
 * 
 * @author 全恒
 *
 */
@Controller
@RequestMapping("/aboutwe.do")
public class WeixinAboutWeAction {
	@Autowired
	private WeixinAboutWeService weixinAboutWeService;

	/**
	 * 获取“关于我们”的图文内容
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params="p=aboutwe")
	public String showAboutWe(HttpServletRequest request, HttpServletResponse response){
		String awdesc = weixinAboutWeService.getDesc();
		request.setAttribute("awdesc", awdesc);
		
		return "/weixin/aboutwe.jsp";
	}
}
