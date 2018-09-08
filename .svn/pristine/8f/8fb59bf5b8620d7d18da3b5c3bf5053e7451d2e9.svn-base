package com.action.admin;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.pojo.MLevel;
import com.pojo.MSongs;
import com.service.back.MusicBackService;
import com.util.FileUtil;
import com.util.StringUtil;


@Controller
@RequestMapping("/musicBack.do")
public class MusicBackAction {
	
	
	@Autowired
	private HttpServletRequest request;
	
	
	
	@Autowired
	private MusicBackService musicBackService;
	
	
	@RequestMapping(params="p=addDenji")
	@ResponseBody
	public String addDenji()
	{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if(admin==null){
			return "no login";
		}
		
		String name = request.getParameter("name");
		String zhekou = request.getParameter("zhekou");
		String status = request.getParameter("status");
		MLevel level = new MLevel();
		level.setName(name);
		level.setZhekou(Float.parseFloat(zhekou));
		level.setStatus(Integer.parseInt(status));
		musicBackService.addDenji(level);
		
		
		return "success";
	}
	
	@RequestMapping(params="p=showDenji")
	public String showDenji()
	{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if(admin==null){
			return "/admin/";
		}
		List list = musicBackService.getAllDenji();
		request.setAttribute("list", list);
		
		return "/admin/back_music/showDenji.jsp";
		
	}
	
	/**
	 * 去添加歌曲界面
	 * @return
	 */
	@RequestMapping(params="p=addMusicView")
	public String addMusicView()
	{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if(admin==null){
			return "/admin";
		}
		
		List list = musicBackService.getAllDenji();
		request.setAttribute("list", list);
		return "/admin/back_music/add_music.jsp";
	}
	
	/**
	 * 搜索歌曲
	 * @return
	 */
	@RequestMapping(params="p=search")
	public String search()
	{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if(admin==null){
			return "/admin";
		}
		
		String denjiId = request.getParameter("denjiId");
		String name = request.getParameter("name");
		String pageString = request.getParameter("page");
		String sizeString = request.getParameter("size");
		int page = 1;
		int size = 20;
		if (StringUtil.isDigit(pageString))
			page = Integer.parseInt(pageString);
		if (StringUtil.isDigit(sizeString))
			size = Integer.parseInt(sizeString);
		
		Map map = musicBackService.searchMusic(denjiId, name, page, size);
		request.setAttribute("map", map);
		
		List list = musicBackService.getAllDenji();
		request.setAttribute("list", list);
		
		return "/admin/back_music/show_music.jsp";
	}

	/**
	 *修改歌曲等级状态
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params="p=updateStatus")
	@ResponseBody
	public String update(HttpServletRequest request,HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if(admin==null){
			return "no login";
		}
		String id = request.getParameter("id");
		String sstatus = musicBackService.updateStatus(id);
		return sstatus;
	}
	
	
	@RequestMapping(params="p=updateStatusByMusic")
	@ResponseBody
	public String updateStatusByMusic(HttpServletRequest request,HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if(admin==null){
			return "no login";
		}
		String id = request.getParameter("id");
		String sstatus = musicBackService.updateStatusByMusic(id);
		return sstatus;
	}
	
	
	/**
	 * 去修改等级界面
	 * @return
	 */
	@RequestMapping(params="p=updateview")
	public String updateview() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if(admin==null){
			return "/admin/";
		}
		String id = request.getParameter("id");
		MLevel m = musicBackService.findById(id);
		request.setAttribute("m", m);
		return "/admin/back_music/back_update_denji.jsp";
	}
	
	/**
	 * 去修改歌曲界面
	 * @return
	 */
	@RequestMapping(params="p=updateviewByMusic")
	public String updateviewByMusic() {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if(admin==null){
			return "/admin/";
		}
		String id = request.getParameter("id");
		MSongs m = musicBackService.findMusicById(id);
		request.setAttribute("m", m);
		
		List list = musicBackService.getAllDenji();
		request.setAttribute("list", list);
		
		return "/admin/back_music/update_music.jsp";
	}
	
	
	
	/**
	 * 修改等级
	 * @return
	 */
	@RequestMapping(params="p=updateDenji")
	public String updateDenji()
	{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if(admin==null){
			return "/admin";
		}
		
		String name = request.getParameter("name");
		String zhekou = request.getParameter("zhekou");
		String id = request.getParameter("id");
		MLevel level = musicBackService.findById(id);
		level.setName(name);
		level.setZhekou(Float.parseFloat(zhekou));
		//level.setStatus(Integer.parseInt(status));
		musicBackService.updateDenji(level);
		
		return showDenji();
	}
	
	/**
	 * 新增歌曲
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=addMusic")
	public String addMusic()
	{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if(admin==null){
			return "no login";
		}
		
		String name = request.getParameter("name");
		String status = request.getParameter("status");
		String denjiId = request.getParameter("denjiId");
		String file    = request.getParameter("file");
		FileUtil.copy(request, "/tempImages", file, "/mp3");
		musicBackService.addMusic(name,status,denjiId,file);
		return "success";
	}
	
	/**
	 * 保存修改歌曲
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=updateMusic")
	public String updateMusic()
	{
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if(admin==null){
			return "no login";
		}
		
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String file = request.getParameter("file");
		String denjiId = request.getParameter("denjiId");
		MLevel level = musicBackService.findById(denjiId);
		MSongs mSongs  = musicBackService.findMusicById(id);
		mSongs.setName(name);
		mSongs.setMLevel(level);
		if (StringUtil.isNotNull(file))
		{
			String path = request.getSession().getServletContext().getRealPath("/mp3");
			File fileOld = new File(path,mSongs.getFilename());
			fileOld.delete();
			FileUtil.copy(request, "/tempImages", file, "/mp3");
			mSongs.setFilename(file);
		}
		//level.setStatus(Integer.parseInt(status));
		musicBackService.updateMusic(mSongs);
		
		return search();
	}
	
	
}
