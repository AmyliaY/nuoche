package com.action.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Admin;
import com.service.admin.AdminAboutWeService;
import com.util.Upload;

@Controller
@RequestMapping("/admin_aboutwe.do")
public class AdminAboutWeAction {

	@Autowired
	private AdminAboutWeService adminAboutWeService;
	
	/**
	 * 进入修改页面
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="p=change")
	public String changeAboutWe(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		//得到desc
		String desc = adminAboutWeService.getDesc();
		//存入desc
		request.setAttribute("aboutweDesc", desc);
		
		return "/admin/aboutwe.jsp";
	}
	
	/**
	 * 修改
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params="p=edit")
	public String editAboutwe(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if(admin == null){
			return "admin/login.jsp";
		}
		
		String path = request.getSession().getServletContext()
				.getRealPath("/daili/images/lunboimg");
		Map<String, String> map = Upload.upload(request, 5 * 1024 * 1024, path);
		String desc = map.get("editorValue");
		
		boolean result = adminAboutWeService.edit(desc);
		if(result==true){
			return "/admin_aboutwe.do?p=change";
		}else{
			return "/admin/aboutwe.jsp";
		}
	}
	
	
}
