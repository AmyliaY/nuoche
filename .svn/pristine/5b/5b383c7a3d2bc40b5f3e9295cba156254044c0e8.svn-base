package com.shop.action.app;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Userinfo;
import com.shop.service.app.AppUamessagesService;
import com.util.StringUtil;
import com.util.Upload;

@Controller
@RequestMapping("/uamessage.do")
public class AppUamessagesAction {
	@Autowired
	private AppUamessagesService appUamessagesService;
	@Autowired
	private HttpServletRequest request;
	
	@ResponseBody
	@RequestMapping(params="p=getAll")
	//得到所有信息
	public String getAll(){
		Userinfo userinfo=(Userinfo) request.getSession().getAttribute("userinfo");
		if(userinfo==null)
		{
			return "请先登录";
		}
		int userid=Integer.parseInt(request.getParameter("userid"));
		String json=appUamessagesService.getAll(userid);
		return json;
	}
	//用户发消息
	@ResponseBody
	@RequestMapping(params="p=addmessage")
	public String addMessage(){
		System.out.println("laile");
		//int adminid=Integer.parseInt(request.getParameter("shopid"));
		String smdetail=request.getParameter("neirong");
		int userid=Integer.parseInt(request.getParameter("userid"));
		Timestamp metime=new Timestamp(new Date().getTime());
		appUamessagesService.addMessage(userid,smdetail,metime);
		return "ture";
	}
	
	
	/**
	 * 设置时间
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=setTime")
	public String getTime(){
		Timestamp now  = new Timestamp(new Date().getTime());

		int userid=Integer.parseInt(request.getParameter("userid"));
		String last = appUamessagesService.getLastTime(userid);
		if(last == null){
			appUamessagesService.addMessage(userid,":time"+now.getTime(),now);
			return "";
		}
		if(last.length()<5)
			return "";
		if(":time".equals(last.substring(0,5))){
			
			Timestamp timestamp = new Timestamp(Long.parseLong(last.substring(5)));
			int min = (int) ((now.getTime() - timestamp.getTime())/(1000*60));
//			System.out.println("相差:"+min+"分钟");
			if(min>=15){
				appUamessagesService.addMessage(userid,":time"+now.getTime(),now);
			}
		}
		
		return "";
	}
	
	
	//用户图片
		@ResponseBody
		@RequestMapping(params="p=addmessageImg")
		public String addMessageImg(){
			System.out.println("来了了 。 。 ");
			String path = request.getSession().getServletContext().getRealPath(
					"messageImages");
			Map map = Upload.upload(request, 1024 * 1024 * 100, path);

			//得到 工程名

	        String schema = request.getScheme();
	        String serverName = request.getServerName();
	        // 端口号返回的是int类型
	        int serverPort = request.getServerPort();
	        String contentPath = request.getContextPath();
	        String servletPath = request.getServletPath();
	 
			
			
			String userid = (String) map.get("userid");
			map.remove("userid");
			StringBuffer img = new StringBuffer("img:"); //图片消息
			String name =null;
			Set set = map.keySet();
			for (Iterator iterator = set.iterator(); iterator.hasNext();) {
				String key = (String) iterator.next();
				String filename = (String) map.get(key);
				String fileExtName = filename.substring(
						filename.lastIndexOf(".") + 1).toLowerCase();
				if (fileExtName.equalsIgnoreCase("jpeg")
						|| fileExtName.equalsIgnoreCase("png")
						|| fileExtName.equalsIgnoreCase("jpg")
						|| fileExtName.equalsIgnoreCase("gif")) {
					img.append(filename);
					name = filename;
				}
			}
			if(StringUtil.isNull(userid)){
				return "false";
			}
			String imgString =  img.toString().trim();
			Timestamp metime=new Timestamp(new Date().getTime());
			appUamessagesService.addMessage(Integer.parseInt(userid),imgString,metime);
			return name;
		}
	
	
	
	
	
	//消息已读
	@ResponseBody
	@RequestMapping(params="p=updstatus")
	public String updStatus(){
		int meid=Integer.parseInt(request.getParameter("meid"));
		appUamessagesService.updStatus(meid);
		return "OK";
	}
	
	@ResponseBody
	@RequestMapping(params="p=getadminmsg")
	public String getAdminmsg(){
		//int shopid=Integer.parseInt(request.getParameter("shopid"));
		int userid=Integer.parseInt(request.getParameter("userid"));
		String json=appUamessagesService.getadminmsg(userid);
		return json;
	}
	public static void main(String[] args) {
		System.out.println(new Timestamp(new Date().getTime()).getTime());
	}
}
