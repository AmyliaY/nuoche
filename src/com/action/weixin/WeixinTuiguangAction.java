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
 *
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
		//关注，跳转到个人中心
		/*if (weixin_user!=null && weixin_user.getSubscribe()!=null && weixin_user.getSubscribe()==1 )
		{
			weixinUserService.addUser(weixin_user);
			//根据微信号查询微信用户的基本信息
			WeixinUser weixinUser = wxpersonCenterService.getWeixinUser(weixinhao);
			request.getSession().setAttribute("weixinUser", weixinUser);
			//判断该用户是否是会员，是：显示详细信息
			User user = wxpersonCenterService.getUser(weixinhao);
			if(null != user){
				request.getSession().setAttribute("pcuser", user);
			}
			
			//返回用户基本信息和详细信息
			
			// --------------- end 获取客户的微信号----------------//
			request.getSession().setAttribute("openid", weixinhao);
			request.getSession().setAttribute("secret", secret);
			
			//System.out.println("微信号:" + weixinhao);
			//  获取该用户下的所有订单信息
			String url3_3 = URLManager.getServerURL(request)
					+ "/personCenter.do?method=index";
			String newUrl3_3 = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
					+ WeixinConfig.APPID
					+ "&redirect_uri="
					+ URLEncoder.encode(url3_3, "utf-8")
					+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
			return "redirect:"+newUrl3_3;
		}*/
		
		//未关注，跳转到guanzhu.jsp
		return "/weixin/guanzhu.jsp";
	}
}
