package com.action.weixin;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.action.WeixinConfig;
import com.listener.WeixinGetAccessTokenListen;
import com.pojo.Applydetail;
import com.pojo.User;
import com.pojo.WeixinUser;
import com.service.weixin.WeixinPersonCenterService;
import com.service.weixin.WeixinUserService;
import com.util.URLManager;

import weixin.popular.api.OpenIdAPI;
import weixin.popular.api.UserAPI;
import weixin.popular.bean.AccessToken;

/**
 * 微信端 跳转用户个人中心
 * 
 * @author 唐仁鑫
 * @author 全恒完善
 */
@Controller
@RequestMapping("/personCenter.do")
public class WeixinpersonCenterAction {
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private WeixinPersonCenterService wxpersonCenterService;

	@Autowired
	private WeixinUserService weixinUserService;

	@RequestMapping(params = "method=index")
	public String moveCar2(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// ------------------获取客户的微信号 :@author lgh ------------------//
		//System.out.println("进入订单中心");
		String code = request.getParameter("code");
		String appid = WeixinConfig.APPID;
		String secret = WeixinConfig.APPSECRET;
		AccessToken accessToken = new OpenIdAPI()
				.getOpenId(appid, secret, code);
		String weixinhao = accessToken.getOpenid();

		UserAPI userAPI = new UserAPI();
		weixin.popular.bean.User weixin_user = userAPI.userInfo(
				WeixinGetAccessTokenListen.access_token, weixinhao);
		if (weixin_user != null && weixin_user.getSubscribe() != null
				&& weixin_user.getSubscribe() == 1) {
			String tgopenid = null;
			weixinUserService.addUser(weixin_user);
		}

		// 根据微信号查询微信用户的基本信息
		WeixinUser weixinUser = wxpersonCenterService.getWeixinUser(weixinhao);
		request.getSession().setAttribute("weixinUser", weixinUser);
		// 判断该用户是否是会员，是：显示详细信息
		User user = wxpersonCenterService.getUser(weixinhao);
		if (null != user) {
			// 将过期时间格式化

			Timestamp timestamp = user.getOverdueTime();
			if (timestamp != null) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String overdueTime = sdf.format(timestamp);

				// 放到request中
				request.setAttribute("overdueTime", overdueTime);
			}
			request.getSession().setAttribute("pcuser", user);
		}

		// 返回用户基本信息和详细信息

		// --------------- end 获取客户的微信号----------------//
		request.getSession().setAttribute("openid", weixinhao);
		//request.getSession().setAttribute("secret", secret);

		//System.out.println("微信号:" + weixinhao);
		// 获取该用户下的所有订单信息
		return "/weixin/personCenter.jsp";
		// return "/weixin/test.jsp";
	}

	@RequestMapping(params = "p=reindex")
	public String reIndex(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String url = URLManager.getServerURL(request)
				+ "/personCenter.do?method=index";
		String newUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(url, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		return "redirect:" + newUrl;
	}
}
