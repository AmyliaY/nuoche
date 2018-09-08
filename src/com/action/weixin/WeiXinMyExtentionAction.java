package com.action.weixin;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.action.WeixinConfig;
import com.pojo.Admin;
import com.service.weixin.WeiXinMyExtentionService;
import com.souvc.weixin.pojo.WeixinUserInfo;
import com.util.StringUtil;
import com.util.URLManager;

import weixin.popular.api.OpenIdAPI;
import weixin.popular.bean.AccessToken;

/**
 * 个人推广二维码
 * @author 全恒
 *
 */
@Controller
@RequestMapping("/myextention.do")
public class WeiXinMyExtentionAction {
	/**
	 * 返回用户的推广二维码
	 */
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private WeiXinMyExtentionService wxExtentionService;
	
	@RequestMapping(params="p=myqrcode")
	public String proxylisting(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String openid = request.getParameter("openid");
		
		//System.out.println("微信号:" + openid);
		//1.根据openid生成图片
		//二维码对应的url
		String encoderContent =URLManager.getServerURL(request) + "/tuiguang.do?p=tuiguang&tgopenid=";
		//二维码存放的路径
		String path = request.getSession().getServletContext().getRealPath("/extention_qrcodeimage");
		//System.out.println("我的推广路径:"+path);
		File file = new File(path);
		if (file.exists()==false)
			file.mkdir();
		//返回图片的路径
		String returnimg = wxExtentionService.doCreate(encoderContent,openid,path);
		//System.out.println(returnimg);
		request.setAttribute("returnimg", returnimg);
		return "/weixin/myExtention.jsp";
	}
	
	
	
	
}
