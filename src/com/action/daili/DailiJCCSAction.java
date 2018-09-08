package com.action.daili;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.pojo.Proxy;
import com.service.daili.JCCSService;

@Controller
@RequestMapping("/daili_jccs.do")
public class DailiJCCSAction {
	/**
	 * 代理基础参数--唐仁鑫
	 * @param request
	 * @param response
	 * @return
	 */
	@Autowired
	private JCCSService jccsService;
	
	
	@RequestMapping(params="p=jccs")
	public String jccs(HttpServletRequest request,HttpServletResponse response)
	{
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		int type= Integer.parseInt(request.getParameter("type"));
		String price = null;
		String title = null;
		if(type==1){
			title="会员二维码价格";
			price=proxy.getVipprice();
		}
		if(type==2)
		{
			title="子代理二维码价格";
			price=proxy.getZidailiprice();
		}
		Map map=new HashMap();
		map.put("price", price);
		map.put("title", title);
		map.put("type", type);
		request.setAttribute("map", map);
		return "/daili/jccs.jsp";
	}
	/**
	 * 编辑参数
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(params="p=editjccs")
	public String editjccs(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		int type=Integer.parseInt(request.getParameter("type"));
		String price=request.getParameter("price");
		if(type==1){
			jccsService.updatevipprice(proxy.getId(),price.trim());
		}
		if(type==2){
			jccsService.updatezidailiprice(proxy.getId(),price.trim());
		}
		return null;
	}
}
