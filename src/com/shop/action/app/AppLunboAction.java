package com.shop.action.app;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.app.AppLunboService;
import com.util.JsonFilter;


@Controller
@RequestMapping("/appLunbo.do")
public class AppLunboAction {
	
	
	@Autowired
	private AppLunboService appLunboService;
	
	
	@Autowired
	private HttpServletRequest request;
	
	/**
	 * 轮播图
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=getAllLunbo")
	public String getAllLunbo()
	{
		String json = appLunboService.getAllLunbo();
		return json;
	}
	
	/**
	 * 轮播图
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=getAllLunbo_muic")
	public String getAllLunbo_music()
	{
		String json = appLunboService.getAllLunbo_music();
		return json;
	}
	
	
}
