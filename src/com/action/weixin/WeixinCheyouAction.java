package com.action.weixin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import weixin.popular.api.OpenIdAPI;
import weixin.popular.api.UserAPI;
import weixin.popular.bean.AccessToken;
import weixin.popular.bean.User;
import weixin.popular.util.JSSDKUtil;

import com.action.WeixinConfig;
import com.listener.WeixinGetAccessTokenListen;
import com.pojo.Userinfo;
import com.pojo.WeixinUser;
import com.service.weixin.WeixinCheyouService;
import com.service.weixin.WeixinUserService;
import com.util.URLManager;


@Controller
@RequestMapping("/weixinCheyou.do")
public class WeixinCheyouAction {
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private WeixinCheyouService cheyouService;
	
	
	@Autowired
	private WeixinUserService  weixinUserService;
	
	@RequestMapping(params = "p=scan")
	public String scan(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		JSSDKUtil.setJsSdkParam(request);

		return "/weixin/test.jsp";
	}
	
	
	
	/**
	 * 加油
	 * @return
	 */
	@RequestMapping(params="p=jiaoyou")
	public String jiaoyou(){
	   String url = "https://bank-static.pingan.com.cn/ca/ccssa/Lkpg/html/e6424428236343b1abf80041e147c47d.html?linkId=e6424428236343b1abf80041e147c47d&activity_Id=V1425&activity_FlowId=m_N0MBTBpiVRQqIBue1367&SSLSOURCE=BROP-CMP&from=singlemessage";
	   return "redirect:"+url;
    }	
	
	/**
	 * 预约
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params="p=yuyue")
	public String yuyue(HttpServletRequest request,
			HttpServletResponse response) throws IOException 
	{
		String shop_url = URLManager.getServerURL(request)
				+ "/weixinCheyou.do?p=yuyue1";
		String shop_newUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(shop_url, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";

				
	    return "redirect:"+shop_newUrl;
	}
	
	@RequestMapping(params="p=yuyue1")
	public String yuyue1(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		
		String code = request.getParameter("code");
		String appid = WeixinConfig.APPID;
		String secret = WeixinConfig.APPSECRET;
		AccessToken accessToken = new OpenIdAPI()
				.getOpenId(appid, secret, code);
		String weixinhao = accessToken.getOpenid();
		////System.out.println("微信号预约:" + weixinhao); 
		request.getSession().setAttribute("weixinhao", weixinhao);
		
		return "/weixin/index-yuyue.jsp";
		
	}
	
	
	/**
	 * 预约
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params="p=shop")
	public String shop(HttpServletRequest request,
			HttpServletResponse response) throws IOException 
	{
		
		load(request);
		
		
		return "/weixin/index-main.jsp";
		//return "/weixin/home/home.jsp";
	}
	
	

	
	/**
	 * 车险
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params="p=chexian")
	public String chexian(HttpServletRequest request,
			HttpServletResponse response) throws IOException 
	{
		
		load(request);
		
		return "/weixin/chexian.jsp";
	}
	
	
	/**
	 * 加载用户信息 
	 * @param request
	 * @return 登陆(true) 未登录(false)
	 */
	private boolean load(HttpServletRequest request){
		String code = request.getParameter("code");
		//得到openid
		
		//判断是否登陆
		WeixinUser weixinuser = null;
		if(weixinuser!=null){
			Userinfo userinfo = weixinuser.getUserinfo();
			//System.out.println("userinfo:"+userinfo);
			if (userinfo!=null)
			{
				request.getSession().setAttribute("weixinuser", weixinuser);
				request.getSession().setAttribute("userinfo",userinfo);
			}
			return true;
		}
		
		
		AccessToken openId = new OpenIdAPI().getOpenId(WeixinConfig.getAPPID(),WeixinConfig.APPSECRET, code);
		weixinuser = weixinUserService.findbyOpenId(openId.getOpenid());
		
		if(weixinuser == null){
			User user  = new UserAPI().userInfo(WeixinGetAccessTokenListen.access_token, openId.getOpenid());
			if (user==null || user.getSubscribe()==0)
			    return false;
			weixinuser = new WeixinUser();
			weixinuser.setCity(user.getCity());
			weixinuser.setCountry(user.getCountry());
			weixinuser.setHeadimgurl(user.getHeadimgurl());
			weixinuser.setLanguage(user.getLanguage());
			weixinuser.setNickname(user.getNickname());
			weixinuser.setOpenid(openId.getOpenid());
			weixinuser.setProvince(user.getProvince());
			weixinuser.setSex(user.getSex());
			weixinuser.setSubscribe(user.getSubscribe());
			weixinuser.setSubscribeTime(user.getSubscribe_time());
			weixinUserService.addWeixinUser(weixinuser);
			request.getSession().setAttribute("weixinuser", weixinuser);//将用户存入session
		}else
		{
			User user  = new UserAPI().userInfo(WeixinGetAccessTokenListen.access_token, openId.getOpenid());
			if (user==null || user.getSubscribe()==null || user.getSubscribe()==0)
			    return false;
			try {
				weixinUserService.addUser(user);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
			}
		}
		
		Userinfo userinfo =  weixinUserService.getUserInfoByWeixin(weixinuser);
		//System.out.println("userinfo:"+userinfo);
		if (userinfo==null)
		{
			userinfo = weixinUserService.addUserinfo(weixinuser);
		}
		request.getSession().setAttribute("userinfo",userinfo);
		request.getSession().setAttribute("weixinuser", weixinuser);//将用户存入session
		return true;
	}
	

}
