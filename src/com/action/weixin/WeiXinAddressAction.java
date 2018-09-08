package com.action.weixin;

import java.io.IOException;
import java.util.List;

import javax.persistence.MappedSuperclass;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Proxy;
import com.service.weixin.WeiXinAddressService;
/**
 * 微信端  省市级联
 * @author 唐仁鑫
 * 
 *
 */
@Controller
@RequestMapping("/address.do")
public class WeiXinAddressAction {
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private WeiXinAddressService addressService ;
	
	@RequestMapping(params="p=findByidCity")
	@ResponseBody
	public String findByidCity(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		
		int prid = Integer.parseInt(request.getParameter("prid"));
		String json=addressService.findByidCity(prid);
		return json;
	}
	@RequestMapping(params="p=findByIdArea")
	@ResponseBody
	public String findByIdArea(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		
		int crid =Integer.parseInt(request.getParameter("crid"));
		String json=addressService.findByIdArea(crid);
		return json;
	}

}
