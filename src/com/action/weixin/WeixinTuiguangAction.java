package com.action.weixin;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.action.WeixinConfig;
import com.listener.WeixinGetAccessTokenListen;
import com.pojo.User;
import com.pojo.WeixinUser;
import com.service.weixin.WeixinPersonCenterService;
import com.service.weixin.WeixinUserService;
import com.util.URLManager;

import weixin.popular.api.OpenIdAPI;
import weixin.popular.api.UserAPI;
import weixin.popular.bean.AccessToken;

/**
 * 全恒
 * @author dell
 * 微信推广
 */
@Controller
@RequestMapping("/tuiguang.do")
public class WeixinTuiguangAction {

	@Autowired
	private WeixinUserService weixinUserService;
	@Autowired
	private WeixinPersonCenterService wxpersonCenterService;
	
	@RequestMapping(params="p=tuiguang")
	public String tuiguang(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//得到推广人的openid，放进session
		String tgopenid  = request.getParameter("tuiguangren");
		request.getSession().setAttribute("tgopenid", tgopenid);
		String shop_url = URLManager.getServerURL(request)
				+ "/tuiguang.do?p=tuiguang2";
		String shop_newUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(shop_url, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		return "redirect:" + shop_newUrl;
	}
	
	
	@RequestMapping(params="p=tuiguang2")
	public String tuiguang2(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//判断用户是否关注
		String code = request.getParameter("code");
		String appid = WeixinConfig.APPID;
		String secret = WeixinConfig.APPSECRET;
		AccessToken accessToken = new OpenIdAPI().getOpenId(appid, secret, code);
		String weixinhao = accessToken.getOpenid();
		
		UserAPI userAPI = new UserAPI();
		weixin.popular.bean.User weixin_user = userAPI.userInfo(
				WeixinGetAccessTokenListen.access_token, weixinhao);
		return "/weixin/guanzhu.jsp";
	}
}
