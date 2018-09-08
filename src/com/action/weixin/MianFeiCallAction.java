package com.action.weixin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.weixin.WeiXinMoveCarService;

@Controller
@RequestMapping("/mianfeicall.do")
public class MianFeiCallAction {
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private WeiXinMoveCarService service;
	
	@RequestMapping
	@ResponseBody
	public String dhhuidiao(){
		String wxh = request.getParameter("params");
		String orderid = request.getParameter("orderid");
		String fee_time = request.getParameter("fee_time");
//		System.out.println(wxh);
//		System.out.println(orderid);
//		System.out.println(fee_time);
		service.huiCall(wxh,fee_time);
		
		
		
		return "1";
	}
}
