package com.shop.action.app;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.app.AppUserinfoService;

@Controller
@RequestMapping("/appuserinfo.do")
public class AppUserinfoAction {
	@Autowired
	private AppUserinfoService appUserinfoService;
	@Autowired
	private HttpServletRequest request;
	/**
	 * 查看会员是否已设置密码
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(params="p=checkPayPassword")
	public String checkPayPassword(HttpServletResponse response) throws IOException
	{
		int userid=Integer.parseInt(request.getParameter("userid"));
		boolean f=appUserinfoService.checkPayPassword(userid);
		if(f)
			response.getWriter().print(true);
		else
			response.getWriter().print(false);
		return null;
	}
	/**
	 * 设置支付密码
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(params="p=setzhifumima")
	public String setzhifumima(HttpServletResponse response) throws IOException
	{
		int userid=Integer.parseInt(request.getParameter("userid"));
		String paypwd=request.getParameter("password");
		boolean f=appUserinfoService.setzhifumima(userid,paypwd);
		if(f)
			response.getWriter().print("成功");
		else
			response.getWriter().print("失败");
		return null;
	}
	//得到推荐人
	@ResponseBody
	@RequestMapping(params="p=getMytuijianren")
	public String getMytuijianren(){
		int userid=Integer.parseInt(request.getParameter("userid"));
		String json=appUserinfoService.getMytuijianren(userid);
		return json;
	}
	//修改推荐人
	@ResponseBody
	@RequestMapping(params="p=updMytuijianren")
	public String updMytuijianren(){
		String phone=request.getParameter("phone");
		int userid=Integer.parseInt(request.getParameter("userid"));
		String json=appUserinfoService.updMytuijianren(phone,userid);
		return json;
	}
	//下线
	@ResponseBody
	@RequestMapping(params="p=getXiaxian")
	public String getXiaxian(){
		int userid=Integer.parseInt(request.getParameter("userid"));
		String json=appUserinfoService.getXiaxian(userid);
		return json;
	}
	//根据ID找用户
	@ResponseBody
	@RequestMapping(params="p=getUser")
	public String getUser(){
		int userid=Integer.parseInt(request.getParameter("userid"));
		String json=appUserinfoService.getUser(userid);
		return json;
	}
	//修改用户名
	@ResponseBody
	@RequestMapping(params="p=updUsername")
	public String updUsername(){
		int userid = Integer.parseInt(request.getParameter("userid"));
		String username = request.getParameter("username");
		String json = appUserinfoService.updUsername(userid,username);
		return json;
	}
	
}
