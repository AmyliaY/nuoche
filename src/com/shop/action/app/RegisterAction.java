package com.shop.action.app;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Jihuoma;
import com.service.back.UsersService;
import com.shop.service.app.AppRegisterService;
import com.util.SmsUtil;


@Controller
@RequestMapping("/message.do")
public class RegisterAction {
	
@Autowired
private UsersService userService;
@Autowired
private AppRegisterService appregisterservice;

@RequestMapping(params="method=get")
private void doTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
	System.out.println("到了验证码1");
	String username=request.getParameter("username");
	System.out.println("用户名："+username);
	List list2=userService.findByUsername(username);
	if(list2.size()>0)
	{
		response.getWriter().print("nameFalse");
		return;
	}
	String mobile=request.getParameter("iphone");
	List list=userService.findByMobile(mobile);
	if(list.size()>0)
	{
		response.getWriter().print("false");
		return;
	}
	String code=SmsUtil.createCode(4);
	String content="您的验证码为:"+code;
	appregisterservice.saveCode(code, mobile);
	//request.getSession().setAttribute("code", code);
	  System.out.println("到了验证码2");
		SmsUtil.send(mobile, content);
	}
@RequestMapping(params="method=fows")
private void doTestfows(HttpServletRequest request, HttpServletResponse response) throws Exception {
	String mobile=request.getParameter("iphone");
	List list=userService.findByMobile(mobile);
	if(list.size()==0)
	{
		response.getWriter().print("false");
		return;
	}
	String code=SmsUtil.createCode(4);
	String content="您的验证码为:"+code;
	appregisterservice.saveCode(code, mobile);
	//request.getSession().setAttribute("code", code);
		SmsUtil.send(mobile, content);
	}


@RequestMapping(params="method=code")
public void doCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
	    String mobile=request.getParameter("mobile");
	    
	  
		String code=request.getParameter("code");//得到验证码
		System.out.println(code);
		List list=appregisterservice.findJihuoma(mobile, code);
		if(list.size()>0)
		{
			Jihuoma jihuoma=(Jihuoma) list.get(0);
			Timestamp timestamp=jihuoma.getTime();
			Date date=new Date();
			Timestamp cutimestamp=new Timestamp(date.getTime());
			if((cutimestamp.getTime()-timestamp.getTime())/(1000*60)<30)
			{
				response.getWriter().print("yes");
			}
			else
			{
				response.getWriter().print("no");
			}
			
		}
		else
		{
			response.getWriter().print("no");
		}
		
		
	}
}

