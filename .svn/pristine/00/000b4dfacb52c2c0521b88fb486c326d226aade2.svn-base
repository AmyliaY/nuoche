package com.action.weixin;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.action.WeixinConfig;
import com.pojo.User;
import com.service.weixin.WeiXinBangdingService;
import com.service.weixin.WeiXinMoveCarService;
import com.util.URLManager;

import weixin.popular.api.OpenIdAPI;
import weixin.popular.bean.AccessToken;
import weixin.popular.util.JSSDKUtil;
@Controller
@RequestMapping("/weixinbangding.do")	
public class WeiXinBangdingchepaiAction {
	@Autowired
	private HttpServletRequest request; 
	@Autowired
	private WeiXinBangdingService weixinbangdingservice;   
	
	@RequestMapping(params = "p=bangding")
	public String moveCar(HttpServletRequest request,HttpServletResponse response)throws IOException{
		String qrid =(String)request.getSession().getAttribute("qrid");//request.getParameter("qrid");
		String weixinhao =(String)request.getSession().getAttribute("uweixinhao");// request.getParameter("uweixinhao");
		if (qrid==null || weixinhao==null)
		{
		    return "/weixin/bangdingshibai.jsp";
		}
		String chepaihao  = request.getParameter("chepaihao");
		String name  = request.getParameter("name");
		String tel  = request.getParameter("tel");
		User user = weixinbangdingservice.bangding(qrid,chepaihao, name, tel,weixinhao);
		//System.out.println("绑定成功");
		
		
		String url3_3 = URLManager.getServerURL(request)
				+ "/personCenter.do?method=index";
		String newUrl3_3 = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(url3_3, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		return "redirect:"+newUrl3_3;

	}
	
	
}
