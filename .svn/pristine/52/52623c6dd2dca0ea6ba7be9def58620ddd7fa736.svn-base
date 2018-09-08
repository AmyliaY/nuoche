package com.action.wap;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Business;
import com.pojo.Proxy;
import com.pojo.User;
import com.service.wap.WapShopBindService;
import com.service.weixin.WeiXinChangeTelService;
import com.util.SmsUtil;

/**
 * 
 * @author 康旺
 *
 */

@Controller
@RequestMapping("/ShopBind.do")
public class WapShopBindAction {

	@Autowired
	private HttpServletRequest request;
	@Autowired
	private WapShopBindService wapShopBindService;
	
	/**
	 
	
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
		//得到当前用户openid，查出对应的对象User
		String openid = (String)request.getSession().getAttribute("openid");
		
		//得到电话号码
		String phone = request.getParameter("phone");
		//发送验证码，得到验证码
		String code=SmsUtil.createCode(4);
		String content="您的验证码为:"+code+"。此验证码用于卡卡挪车会员修改手机号码。10分钟内有效。";
		//  保存验证码到  验证码表
		wapShopBindService.saveCode(code, phone);
		SmsUtil.send(phone, content);
		return "1";
	}
	
	@RequestMapping(params="p=savetel")
	@ResponseBody
	public String saveTel(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//得到电话号码
		String openid = (String)request.getSession().getAttribute("openid");
		String tel = request.getParameter("tel");
		Business wapbusiness = wapShopBindService.bindBusiness(tel, openid);
		request.getSession().setAttribute("wapbusiness", wapbusiness);
		if(wapbusiness != null)
			return "1";
		else
			return "0";
	}
	
	
}
