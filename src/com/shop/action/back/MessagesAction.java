package com.shop.action.back;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.pojo.Uamessages;
import com.pojo.Userinfo;
import com.service.back.MessagesService;
import com.util.StringUtil;

@Controller
@RequestMapping("/uamessages.do")
public class MessagesAction {
	@Autowired
	private MessagesService messagesService;
	/**
	 * 回复消息列表
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(params="p=messageslisting")
	public String messageslisting(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		//分页
		int page=1;
		int size=6;
		String pageString=request.getParameter("page");
		if(StringUtil.isNotNull(pageString)&& pageString.trim().length()>0)
			page=Integer.parseInt(pageString);
		String sizeString=request.getParameter("size");
		if(StringUtil.isNotNull(sizeString)&& sizeString.trim().length()>0)
			size=Integer.parseInt(sizeString);
		String begindate=request.getParameter("begindate");
		String enddate=request.getParameter("enddate");
		String keywords=request.getParameter("keywords");
		if(request.getMethod().equalsIgnoreCase("GET"))
			if(keywords!=null)
				keywords=new String(keywords.getBytes("iso8859-1"),"utf-8");
		Map mmap=messagesService.messageslisting(size,page,begindate,enddate,keywords);
		request.setAttribute("mmap", mmap);
		request.setAttribute("keywords", keywords);
		return "/admin/messageslisting.jsp";
	}
	/**
	 * 进入回复页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params="p=replymessagesview")
	public String replymessagesview(HttpServletRequest request,HttpServletResponse response)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		int page = Integer.parseInt(request.getParameter("page"));
		Uamessages msg=messagesService.replymessagesview(id);
		List msglist=messagesService.getAllMsgUserid(msg.getUserinfo());	//根据会员ID 查出该会员所发出去的消息
		//List umsglist=messagesService.getAlluMsgUserid(msg.getUserinfo());
		request.setAttribute("msglist", msglist);
		//request.setAttribute("umsglist", umsglist);
		request.setAttribute("msg", msg);
		request.setAttribute("page", page);
		return "/admin/messagesreply.jsp";
	}
	/**
	 * 回复消息
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(params="p=replymessages")
	public String replymessages(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int type = Integer.parseInt(request.getParameter("type"));
		int page=1;
		if(type==1)
		{
			page = Integer.parseInt(request.getParameter("page"));
		}
		int meid=Integer.parseInt(request.getParameter("meid"));	//消息ID
		int usersid = Integer.parseInt(request.getParameter("usersid")); //用户ID
		Userinfo userinfo=messagesService.findByIdUsers(usersid);
		
		String smdetail=request.getParameter("smdetail");
		messagesService.replymessages(usersid,admin);	//根据会员ID 把所有改会员的消息状态改为已读
		messagesService.addmessages(userinfo,smdetail,admin);	//新增一条消息ID
		String json =messagesService.firstmsg(usersid,admin);
		return json;
		//return "/uamessages.do?p=messageslisting&page="+page;
	}
	/**
	 * 删除回复消息
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 * @throws ServletException 
	 */
	@RequestMapping(params="p=deletemsg")
	public String deletemsg(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int type=Integer.parseInt(request.getParameter("type"));
		int status=Integer.parseInt(request.getParameter("status"));
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");	//格式化
		String thisdate=sdf.format(date);		//当前时间
		Calendar calendar=Calendar.getInstance(); //得到日历
		calendar.setTime(date);	//把当前时间赋值给日历
		if(type==1)
		{
			calendar.add(Calendar.DAY_OF_MONTH, -30);
			date=calendar.getTime();//设置前30天
		}
		if(type==2)
		{
			calendar.add(Calendar.MONTH, -6);	//设置半年
			date=calendar.getTime();
		}
		if(type==3)
		{
			calendar.add(calendar.YEAR, -1);	//设置一年
			date=calendar.getTime();
		}
		if(type==4)
		{
			int day=Integer.parseInt(request.getParameter("day"));
			calendar.add(calendar.DAY_OF_MONTH, -day);
			date=calendar.getTime();
		}
		if(type==5)
		{
			calendar.add(calendar.DAY_OF_MONTH, -10);	//设置10天
			date=calendar.getTime();
		}
		String threezerodate=sdf.format(date);	
		messagesService.deletemsg(status,Timestamp.valueOf(thisdate+" 23:59:59"),Timestamp.valueOf(threezerodate+" 00:00:00"));
		String retString=null;
		if(status==1){
			retString="<script>alert('删除成功');location='" + request.getContextPath()
		+ "/admin/messagesdelete.jsp';</script>";
		}else{
			retString="<script>alert('删除成功');location='" + request.getContextPath()
			+ "/admin/messagesxtdelete.jsp';</script>";
		}
		response.getWriter().print(retString);
		return null;
		
	}
	/**
	 * 消息提示框 提示有多少个会员发送消息
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params="p=msgtishi")
	@ResponseBody
	public String msgtishi(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int json=messagesService.msgtishi();
		response.getWriter().print(json);
		return null;
	}
	/**
	 * 把所有发送消息的会员查出来
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params="p=plreplymessagesview")
	public String plreplymessagesview(HttpServletRequest request,HttpServletResponse response)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		List<Uamessages> list=messagesService.plreplymessagesview();
		for (int i = 0; i < 1; i++) {
			Uamessages msg=messagesService.replymessagesview(list.get(0).getMeid());
			List msglist=messagesService.getAllMsgUserid(msg.getUserinfo());	//根据会员ID 查出该会员所发出去的消息
			request.setAttribute("msg", msg);
			request.setAttribute("msglist", msglist);
		}
		request.setAttribute("list", list);
		return "/admin/messagesplreply.jsp";
	}
	/**
	 * 查出该会员的发送的所有信息
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params="p=plsetmsg")
	public String plsetmsg(HttpServletRequest request,HttpServletResponse response)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		List<Uamessages> list=messagesService.plreplymessagesview();
		request.setAttribute("list", list);
		int id = Integer.parseInt(request.getParameter("id"));
		Uamessages msg=messagesService.replymessagesview(id);
		List msglist=messagesService.getAllMsgUserid(msg.getUserinfo());	//根据会员ID 查出该会员所发出去的消息
		request.setAttribute("msg", msg);
		request.setAttribute("msglist", msglist);
		return "/admin/messagesplreply.jsp";
	}
	@ResponseBody
	@RequestMapping(params="p=getAllGoods")
	public String getAllGoods(HttpServletRequest request,HttpServletResponse response)
	{
		int gid=Integer.parseInt(request.getParameter("gid"));
		String json=messagesService.getAllGoods(gid);
		return json;
	}
}
