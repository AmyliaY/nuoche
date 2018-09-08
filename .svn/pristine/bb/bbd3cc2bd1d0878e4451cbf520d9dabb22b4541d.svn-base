package com.action.weixin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Proxy;
import com.pojo.User;
import com.service.weixin.WeiXinChangeTelService;
import com.util.SmsUtil;

/**
 * 
 * @author 源码猎人——全恒
 *
 */

@Controller
@RequestMapping("/changeTel.do")
public class WeiXinChangeTelAction {

	@Autowired
	private HttpServletRequest request;
	@Autowired
	private WeiXinChangeTelService wxChangeTelService;
	
	/**
	 * 进入修改手机号的页面
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params="p=changeTel")
	public String showChangeTel(HttpServletRequest request,HttpServletResponse response)throws IOException{
		//得到电话号码，将电话号码放入缓存
		String oldtel = request.getParameter("oldtel");
		request.setAttribute("oldtel", oldtel);
		//返回修改电话的页面
		return "/weixin/changeTel.jsp";
	}
	
	/**
	 * 得到手机验证码
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params="p=getsmscode")
	@ResponseBody
	public String getSmsCode(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		/*//得到当前用户openid，查出对应的对象User
		String openid = (String)request.getSession().getAttribute("openid");
		//System.out.println("改电话微信号："+openid);*/
		
		//得到电话号码
		String phone = request.getParameter("phone");
		//发送验证码，得到验证码
		String code=SmsUtil.createCode(4);
		String content="您的验证码为:"+code+"。此验证码用于卡卡挪车会员修改手机号码。10分钟内有效。";
		//  保存验证码到  验证码表
		wxChangeTelService.saveCode(code, phone);
		//System.out.println(content);
		SmsUtil.send(phone, content);
		return "1";
	}
	
	@RequestMapping(params="p=savetel")
	@ResponseBody
	public String saveTel(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//得到会员的openid和新的电话号码
		String openid = (String)request.getSession().getAttribute("openid");
		String newtel = request.getParameter("tel");
		//System.out.println(newtel);
		wxChangeTelService.saveTel(openid, newtel);
		return "1";
	}
	
	
}
