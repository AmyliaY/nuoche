package com.action.admin;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.pojo.Admin;
import com.pojo.Proxy;
import com.pojo.SylbImages;
import com.service.admin.AdminProxyService;
import com.service.daili.DailiLoginBackService;
import com.service.daili.DailiLunboService;
import com.service.daili.ServiceBusinessService;
import com.util.SmsUtil;
import com.util.StringUtil;
import com.util.Upload;

/**
 * pc端 后台管理管理
 * @author 全恒
 */

@Controller
@RequestMapping("/admin_messageCount.do")
public class AdminMessageCountAction {
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private AdminProxyService adminProxyService;
	

	/**
	 * 列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(params="p=messageCount")
	public String proxylisting(HttpServletResponse response) throws IOException
	{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int messageCount = SmsUtil.getMessageCount();
		request.getSession().setAttribute("messageCount", messageCount);
		request.getSession().setAttribute("account", "N8857514");
		return "/admin/messageCount.jsp";
	}
	
}