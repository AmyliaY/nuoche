package com.action.daili;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Proxy;
import com.service.daili.DailiSmsService;
import com.service.daili.DailiUserInfoService;
import com.util.SmsUtil;
/**
 * pc端 后台管理管理-代理修改手机号
 * @author 唐仁鑫
 * 2018.3.24
 *
 */
@Controller
@RequestMapping("/dluptel.do")
public class DailiUpdateTelAction {
	@Autowired
	private DailiUserInfoService dailiUserInfoService;
	
	@Autowired
	private DailiSmsService dailismsservice;
	
	@RequestMapping(params="p=getyzm")
	@ResponseBody
	private String getYzm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		String dl_tel=request.getParameter("dl_tel");
		List list=dailiUserInfoService.findBydl_tel(dl_tel);
		if(list.size()>0)
		{
			return "false";
		}
		String code=SmsUtil.createCode(4);
		String content="您的验证码为:"+code+"。此验证码用于卡卡挪车登录或修改手机号码。10分钟内有效。";
		//  保存验证码到  验证码表
		dailismsservice.saveCode(code, dl_tel);
		//request.getSession().setAttribute("code", code);
		SmsUtil.send(dl_tel, content);
		return "true";
		}
	
	@RequestMapping(params="p=testyzm")
	@ResponseBody
	private String testYzm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		String yzm =request.getParameter("yzm");
		String dl_tel=request.getParameter("dl_tel");
		boolean re =  dailismsservice.testYzm(yzm,dl_tel);
		if(re)
		{
			return "yes";
		}
		return "no";
	}
	
	
}
