package com.action.weixin;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import weixin.popular.api.OpenIdAPI;
import weixin.popular.api.UserAPI;
import weixin.popular.bean.AccessToken;
import weixin.popular.bean.User;

import com.action.WeixinConfig;
import com.listener.WeixinGetAccessTokenListen;
import com.pojo.JiayouEmp;
import com.pojo.JiayouStation;
import com.pojo.Proxy;
import com.pojo.Userinfo;
import com.pojo.Vip;
import com.pojo.WeixinUser;
import com.service.weixin.WeiXinMoveCarService;
import com.service.weixin.WeixinJiayouService;
import com.service.weixin.WeixinUserService;
import com.util.URLManager;

/**
 * 微信加油站
 * 
 * @author lgh
 * 
 */
@Controller
@RequestMapping("/weixin_jiayou.do")
public class WeixinJiayouAction {

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private WeixinUserService weixinUserService;

	@Autowired
	private WeixinJiayouService weixinJiayouService;

	@Autowired
	private WeiXinMoveCarService weiXinMoveCarService;

	@RequestMapping(params = "p=saoma")
	public String saoma(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		String url = URLManager.getServerURL(request)
				+ "/weixin_jiayou.do?p=saoma2&id=" + id + "&type=" + type;
		String newUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(url, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";

		return "redirect:" + newUrl;
	}

	@RequestMapping(params = "p=saoma2")
	public String saoma2(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		int n = load(request);
		if (n == 2)
			return "/weixin/guanzhu_jiayou.jsp?id=" + id;

		if (n == 3)
			return "/weixin/jiaoyou_station/novip.jsp";

		return "/weixin_jiayou.do?p=gotoJiayou&id=" + id + "&type=" + type;

	}

	/**
	 * 加载用户信息
	 * 
	 * @param request
	 * @return 登陆(true) 未登录(false)
	 */
	private int load(HttpServletRequest request) {
		String code = request.getParameter("code");
		// 得到openid

		// 判断是否登陆
		WeixinUser weixinuser = null;

		AccessToken openId = new OpenIdAPI().getOpenId(WeixinConfig.getAPPID(),
				WeixinConfig.APPSECRET, code);
		weixinuser = weixinUserService.findbyOpenId(openId.getOpenid());

		if (weixinuser == null) {
			User user = new UserAPI()
					.userInfo(WeixinGetAccessTokenListen.access_token, openId
							.getOpenid());
			if (user == null || user.getSubscribe() == null
					|| user.getSubscribe() == 0)
				return 2;
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
			request.getSession().setAttribute("weixinuser", weixinuser);// 将用户存入session
		} else {
			User user = new UserAPI()
					.userInfo(WeixinGetAccessTokenListen.access_token, openId
							.getOpenid());
			if (user == null || user.getSubscribe() == null
					|| user.getSubscribe() == 0)
				return 2;
			try {
				weixinUserService.addUser(user);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				// e.printStackTrace();
			}
		}

		Userinfo userinfo = weixinUserService.getUserInfoByWeixin(weixinuser);
		// System.out.println("userinfo:"+userinfo);
		if (userinfo == null) {
			userinfo = weixinUserService.addUserinfo(weixinuser);
		}

		request.getSession().setAttribute("userinfo", userinfo);
		request.getSession().setAttribute("weixinuser", weixinuser);// 将用户存入session
		com.pojo.User user = weiXinMoveCarService.findUserByOpen(weixinuser
				.getOpenid());
		if (user != null && user.getOverdue() >= 1) // 是会员，绑定了车牌
			return 1;

		return 3;
	}

	// 去加油界面
	@RequestMapping(params = "p=gotoJiayou")
	public String gotoJiayou() {

		// 判断是否登录 ,还要判断是否是会员
		WeixinUser weixinUser = (WeixinUser) request.getSession().getAttribute(
				"weixinuser");
		if (weixinUser == null) {
			return "/";
		}

		String id = request.getParameter("id"); // 加油员编号
		String type = request.getParameter("type");// 加油类型
		JiayouEmp emp = weixinJiayouService.findEmpById(Integer.parseInt(id));
		JiayouStation station = weixinJiayouService.findStationByEmpId(Integer
				.parseInt(id));
		List list = weixinJiayouService.getAllYou(station.getGid(), type);

		// 获取可用优惠卷（红包）
		List redbag = weixinJiayouService.getRedBag(type, weixinUser);
		System.out.println("redbag:" + redbag);
		request.setAttribute("redpapers", redbag);

		Float yuer = weixinJiayouService.getYuerByStation(station.getGid(),
				weixinUser.getOpenid());
		request.setAttribute("emp", emp);
		request.setAttribute("station", station);
		request.setAttribute("list", list);
		if (yuer == null)
			yuer = 0.0F;
		request.setAttribute("yuer", yuer);
		return "/weixin/jiaoyou_station/weixin_woyaojiayou.jsp";
	}

	/**
	 * 去认证
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws FileNotFoundException
	 */
	@RequestMapping(params = "method=renzheng")
	public String renzheng(HttpServletRequest request,
			HttpServletResponse response) throws FileNotFoundException,
			IOException {

		// 判断是否登录 ,还要判断是否是会员
		WeixinUser weixinUser = (WeixinUser) request.getSession().getAttribute(
				"weixinuser");

		Proxy proxy = weixinJiayouService.getProxyByUser(weixinUser);

		if (weixinUser == null) {
			return "/";
		}

		Vip vip = weixinUser.getVip();
		if (vip == null) {

			Properties vipgrade = new Properties();
			vipgrade.load(new FileInputStream(
					WeixinGetAccessTokenListen.SERVER_REAL_PATH
							+ "/WEB-INF/classes/vipgrade" + proxy.getId()
							+ ".properties"));

			Map map = new HashMap();

			map.put("o11", vipgrade.getProperty("11"));
			map.put("o12", vipgrade.getProperty("12"));
			map.put("o13", vipgrade.getProperty("13"));
			map.put("o21", vipgrade.getProperty("21"));
			map.put("o22", vipgrade.getProperty("22"));
			map.put("o23", vipgrade.getProperty("23"));
			Map map2 = new HashMap();
			map2.put("o11rt", vipgrade.getProperty("11rt"));
			map2.put("o12rt", vipgrade.getProperty("12rt"));
			map2.put("o13rt", vipgrade.getProperty("13rt"));
			map2.put("o21rt", vipgrade.getProperty("21rt"));
			map2.put("o22rt", vipgrade.getProperty("22rt"));
			map2.put("o23rt", vipgrade.getProperty("23rt"));
			JSONObject jsonObject = JSONObject.fromObject(map);
			JSONObject jsonObject2 = JSONObject.fromObject(map2);

			request.setAttribute("username", weixinUser.getNickname());
			request.setAttribute("uid", weixinUser.getOpenid());
			request.setAttribute("jsonObject", jsonObject.toString());
			request.setAttribute("jsonObject2", jsonObject2.toString());
			return "/weixin/jiaoyou_station/weixin_renzheng.jsp";
		}

		String touxiang = weixinUser.getHeadimage();
		request.setAttribute("touxiang", touxiang);

		if (vip.getVstatus() == 0) {
			request.setAttribute("user", weixinUser);
			request.setAttribute("vipinfo", vip);
			request.setAttribute("flag", vip.getVstatus());
		} else {

			request.setAttribute("flag", vip.getVstatus());
			request.setAttribute("vipinfo", vip);
			request.setAttribute("user", weixinUser);
		}
		return "/weixin/jiaoyou_station/show_vip.jsp";

	}

	@RequestMapping(params = "method=vipAccess")
	public String vipAccess(HttpServletRequest request,
			HttpServletResponse response) throws FileNotFoundException,
			IOException {
		// 判断是否登录 ,还要判断是否是会员
		WeixinUser weixinUser = (WeixinUser) request.getSession().getAttribute(
				"weixinuser");

		Proxy proxy = weixinJiayouService.getProxyByUser(weixinUser);

		String weixinhao = weixinUser.getOpenid();
		// int uid = Integer.parseInt(request.getParameter("uid")) ;
		String companyname = request.getParameter("companyname");
		if (companyname != null) {
			try {
				companyname = new String(companyname.getBytes("iso-8859-1"),
						"utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int ostyle = Integer.parseInt(request.getParameter("ostyle"));
		int vipgrade = Integer.parseInt(request.getParameter("vipgrade"));
		Properties prop = new Properties();// weixinIndexService.findProp("/vipgrade.properties");
		prop.load(new FileInputStream(
				WeixinGetAccessTokenListen.SERVER_REAL_PATH
						+ "/WEB-INF/classes/vipgrade" + proxy.getId()
						+ ".properties"));

		float vlimit = Float.parseFloat(request.getParameter("vlimit"));
		int vfanxian = Integer.parseInt(prop.get(vipgrade + "rt").toString());
		int vfanxian2 = Integer.parseInt(prop.get(vipgrade + "cz").toString());
		Vip vip = weixinJiayouService.addVip(weixinUser.getOpenid(),
				companyname, ostyle, vipgrade, vlimit, vfanxian, vfanxian2);
		if (vip == null)
			return null;

		return "/weixin_jiayou.do?method=renzheng&weixinhao=" + weixinhao;

	}

}
