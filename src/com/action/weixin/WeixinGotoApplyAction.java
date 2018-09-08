package com.action.weixin;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.action.WeixinConfig;
import com.util.URLManager;

@Controller
@RequestMapping("/gotoapply.do?")
public class WeixinGotoApplyAction {

	@RequestMapping(params="p=gotoapply")
	public String gotoApply(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String url3_1 = URLManager.getServerURL(request)
				+ "/applyforqrcode.do?method=applyforqrcodeindex";

		String newurl3_1 = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(url3_1, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		return newurl3_1;
	}
}
