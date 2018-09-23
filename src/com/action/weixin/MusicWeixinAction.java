package com.action.weixin;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.MLevel;
import com.pojo.MSongs;
import com.pojo.Userinfo;
import com.service.weixin.WeixinMusicWeixinService;
import com.util.JsonFilter;
import com.util.StringUtil;

/**
 * 微信音乐管理
 * @author lgh
 *
 */

@Controller
@RequestMapping("/music.do")
public class MusicWeixinAction {

	 @Autowired
	 private WeixinMusicWeixinService  musicWeixinService;
	 @Autowired
	 private HttpServletRequest request;
	
	 @RequestMapping(params="p=getNextDenji")
	 @ResponseBody
	 public String getNextDenji()
	 {
		 Userinfo userinfo = (Userinfo) request.getSession().getAttribute("userinfo");
		 //------------------------------------------------------
		 if (userinfo==null)
		 {	 
			 userinfo = musicWeixinService.findUserById(9);
		     request.getSession().setAttribute("userinfo", userinfo);
		 }
		 //------------------------------------------------------
		 String gidString = request.getParameter("gid");
		 int gid = 1;
		 if (StringUtil.isDigit(gidString))
		    gid  = Integer.parseInt( gidString ); //商品
		 MLevel  m = musicWeixinService.getNextDenji(gid, userinfo.getUsersId());//获取等级
		 if (m==null)
			 return "";
//		 System.out.println(m.getZhekou());
		 MSongs  music = musicWeixinService.randomMusic(m.getId());
		 request.getSession().setAttribute("music", music);
		 if (music==null)
			 return "";
		 
		 JsonConfig jsonConfig = new JsonConfig();
		 JsonFilter.ignoredSet(jsonConfig);
		 
		 String json = JSONObject.fromObject(music,jsonConfig).toString();
		 return json;
	 }
	 
	 @RequestMapping(params="p=checkMusic")
	 @ResponseBody
	 public String checkMusic()
	 {
		 String name = request.getParameter("name");
		 MSongs songs = (MSongs) request.getSession().getAttribute("music");
		 Userinfo userinfo = (Userinfo) request.getSession().getAttribute("userinfo");
		 String gid = request.getParameter("gid");
		 //----------------------------------------------------
		 if (StringUtil.isDigit(gid)==false)
			 gid = "1";
		 //----------------------------------------------------
		 
		 //MLevel  m = musicWeixinService.getCurrentDenji(Integer.parseInt(gid), userinfo.getUsersId());
		 //float zhekou = music
		
		 
		 if (songs!=null && songs.getName().equalsIgnoreCase(name))
		 {
			 request.getSession().removeAttribute("music");
			 musicWeixinService.updateMusicDenji(userinfo.getUsersId(), Integer.parseInt(gid), songs.getId());
			 float zhekou = musicWeixinService.getNextDenji(Integer.parseInt(gid), userinfo.getUsersId()).getZhekou();
			 return "{msg:'挑战成功',zhekou:"+zhekou+"}";
		 }
		 else
		 {
			 float zhekou = musicWeixinService.getCurrentZhekou(Integer.parseInt(gid), userinfo.getUsersId());
			 return "{msg:'挑战失败',zhekou:"+zhekou+"}";
		 }
		 
		 
		 
		 
		 
	 }
	 
	 
	 
	 
	 
	 
	 
	 
}




