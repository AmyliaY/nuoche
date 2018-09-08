package com.action.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jruby.RubyBoolean.False;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.pojo.BaoxianBaodan;
import com.pojo.BaoxianGonshi;
import com.pojo.PeisongCorp;
import com.service.admin.AdminBaoxianService;
import com.util.Upload;

/**
 * 保险公司管理
 * 
 * @author lgh-pc
 * 
 */
@Controller
@RequestMapping("/admin_baoxian.do")
public class AdminBaoxianAction {

	@Autowired
	private AdminBaoxianService adminBaoxianService;

	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping(params="p=fenyeBaodan")
	public String fenyeBaodan(@RequestParam(defaultValue="1",required=false) int page, @RequestParam(defaultValue="10",required=false) int size)
	{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		
		String status    = request.getParameter("status");
		String openId    = request.getParameter("openId");
		String beginTime = request.getParameter("beginTime");
		String endTime   = request.getParameter("endTime");
		
		Map map = adminBaoxianService.fenyeBaodan(page, size, beginTime, endTime, openId, status);
		
		request.setAttribute("map", map);
		
		return "/admin/baoxian/showBaoxian.jsp";
		
	}
	
	
	/**
	 * 修改保险公司
	 * @return
	 */
	
	@RequestMapping(params="p=updateBaoxianGongshi")
	public String updateBaoxianGongshi()
	{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		
		int maxSize = 10*1024*1024;
		String path = request.getSession().getServletContext().getRealPath("/weixin/chexian/img/");
		Map<String, String> map = Upload.upload(request, maxSize, path);
		String name = map.get("name");
		String logo = map.get("logo");
		String openid1 = map.get("openid1");
		String openid2 = map.get("openid2");
		String openid3 = map.get("openid3");
		String openid4 = map.get("openid4");
		String openid5 = map.get("openid5");
		
		adminBaoxianService.updateBaoxianGongshi(id,name,logo,openid1,openid2,openid3,openid4,openid5);
		
		return getAllBaoxianGongshi();
	}
	
	/**
	 * 去修改界面
	 * @return
	 */
	
	@RequestMapping(params="p=toUpdateView")
	public String toUpdateView()
	{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		BaoxianGonshi baoxianGonshi = adminBaoxianService.findBaoxianGongshiById(id);
		request.setAttribute("b", baoxianGonshi);
		return "/admin/baoxian/updateBaoxianGongshi.jsp";
	}

	/**
	 * 修改保险公司状态：禁用&启用
	 * 
	 * @return
	 */
	@RequestMapping(params = "p=updatestatus")
	@ResponseBody
	public String updatestatus() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		BaoxianGonshi baoxianGonshi = adminBaoxianService.updatestatus(id);
	    return baoxianGonshi.getStatus().toString();
	}
	
	/**
	 * 获取某用户保单
	 * @return
	 */
	
	@RequestMapping(params="p=getBaoxianByUser")
    public String getBaoxianByUser()
    {
		
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		
		
    	String weixinUser = request.getParameter("weixinUser");
    	List list = adminBaoxianService.getBaodanByUser(weixinUser);
    	request.setAttribute("list", list);
    	return "/admin/baoxian/showBaodan.jsp";
    }

	/**
	 * 得所有保险公司
	 * 
	 * @return
	 */
	@RequestMapping(params = "p=getAllBaoxianGongshi")
	public String getAllBaoxianGongshi() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}

		List list = adminBaoxianService.getAllBaoxianGongshi();
		request.setAttribute("list", list);
		return "/admin/baoxian/showBaoxianGongshi.jsp";
	}

}
