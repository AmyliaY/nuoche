package com.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.service.admin.AdminService;
import com.util.JsonFilter;
import com.util.MD5Util;

@Controller
@RequestMapping("/admin.do")
public class AdminAction {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping(params="p=addAdmin")
	@ResponseBody
	public String addAdmin(String username,String password)
	{
		Admin admin =new Admin();
		admin.setUsername(username);
		admin.setPassword(MD5Util.getMD5(password));
		adminService.addAdmin(admin);
		//return "/admin.jsp";//转发
		//return "redirect:/admin.jsp";//重定向 
		
		List list = adminService.findAll();
		JsonConfig config = new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json = JSONArray.fromObject(list,config).toString();
		
		
		return json;
	}
   
}
