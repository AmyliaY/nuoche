package com.shop.action.back;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.pojo.Carouselimages;
import com.service.back.GoodsShangjiaService;
import com.service.back.LunboimgService;
import com.util.StringUtil;
import com.util.Upload;

@Controller
@RequestMapping("/lunboimg.do")
public class LunboimgAction {
	@Autowired
	private LunboimgService lunboimgService;

	@Autowired
	private GoodsShangjiaService shangjiaService;
	/**
	 * 轮播图片列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(params = "p=lunboimglisting")
	public String lunboimglisting(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int page = 1;
		int size = 10;
		String pageString = request.getParameter("page");
		if (StringUtil.isNotNull(pageString) && pageString.trim().length() > 0)
			page = Integer.parseInt(pageString);
		String sizeString = request.getParameter("size");
		if (StringUtil.isNotNull(sizeString) && sizeString.trim().length() > 0)
			size = Integer.parseInt(sizeString);
		String keywords = request.getParameter("keywords");
		if (request.getMethod().equalsIgnoreCase("GET")) {
			if (keywords != null)
				keywords = new String(keywords.getBytes("iso8859-1"), "utf-8");
		}
		Map lunbomap = lunboimgService.lunboimglisting(size, page, keywords);
		request.setAttribute("lunbomap", lunbomap);
		request.setAttribute("keywords", keywords);
		return "/admin/lunboimglisting.jsp";
	}

	/**
	 * 修改轮播图状态 禁用 or 启用
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=updatestatus")
	public String updatestatus(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		Carouselimages carouselimages = lunboimgService.updatestatus(id);
		response.getWriter().print(carouselimages.getCimgStatus());
		return null;
	}

	/**
	 * 批量启用 or 禁用
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "p=plupdatestatus")
	public String plupdatestatus(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int type = Integer.parseInt(request.getParameter("type"));
		String qiyong = request.getParameter("qiyong");
		String jinyong = request.getParameter("jinyong");
		lunboimgService.plupdatestatus(type, qiyong, jinyong);
		return null;
	}

	/**
	 * 进入编辑轮播图页面
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "p=editlunboimgview")
	public String editlunboimgview(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		//List onetypelist = shangjiaService.getAllOnetype();
		//request.setAttribute("onetypelist", onetypelist);
		int id = Integer.parseInt(request.getParameter("id"));
		Carouselimages lunboimg = lunboimgService.editlunboimgview(id);
		request.setAttribute("lunboimg", lunboimg);
		return "/admin/lunboimgedit.jsp";
	}

	/**
	 * 编辑轮播图
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=editlunboimg")
	public String editlunboimg(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		String path = request.getSession().getServletContext()
				.getRealPath("/admin/images/lunboimg");
		Map<String, String> map = Upload.upload(request, 5 * 1024 * 1024, path);
		String cimgtitle = map.get("cimgTitle");
		String cimages = map.get("cimages");
		int cimtype = Integer.parseInt(map.get("cimgtype"));
		String delLunboimages = map.get("delLunboimages");
		String cimgurl = map.get("cimgurl");
		if (cimages == null) {
			cimages = map.get("oldLunboimages");
		} else {
			String imgPath = request.getSession().getServletContext()
					.getRealPath("/admin/images/lunboimg");
			File folder = new File(imgPath);
			File[] files = folder.listFiles();
			for (File f : files) {
				if (f.getName().equals(delLunboimages)) {
					f.delete();
				}
			}
		}
		String cdescribe = map.get("cdescribe");
		String desc_url = map.get("desc_url");
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = sdf.format(date);
		Timestamp cimgTime = Timestamp.valueOf(dateString);
		lunboimgService.editlunboimg(id, cimtype, cimgurl, cimgtitle, cimages,
				cdescribe, cimgTime,desc_url);
		return "/lunboimg.do?p=lunboimglisting";
	}

	/**
	 * 添加轮播图
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "p=addlunboimg")
	public String addlunboimg(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String path = request.getSession().getServletContext()
				.getRealPath("/admin/images/lunboimg");
		Map<String, String> map = Upload.upload(request, 5 * 1024 * 1024, path);
		String cimgtitle = map.get("cimgtitle");
		String cimgstatus = map.get("cimgstatus");
		String cimgtype = map.get("cimgtype");
		String cimages = map.get("cimages");
		String cimgurl = map.get("gid");
		if("-1".equals(cimgurl)){
			cimgurl = map.get("desc_url");
		}
		System.out.println("cimgurl"+cimgurl);
		String cimgdescribe = map.get("cimgdescribe");
		lunboimgService.addlunboimg(cimgtitle, cimgstatus, cimgtype, cimages,
				cimgurl, cimgdescribe);
		return "/lunboimg.do?p=lunboimglisting";
	}

	/**
	 * 删除轮播图
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=deletelunbo")
	public String deletelunbo(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		boolean f = lunboimgService.deletelunbo(id);
		if (f)
			response.getWriter().print(true);
		else
			response.getWriter().print(false);
		return null;
	}

	/**
	 * 批量删除轮播图
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "p=pldelete")
	public String pldelete(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String shanchu = request.getParameter("shanchu");
		lunboimgService.pldelete(shanchu);
		return null;

	}
	
	/**
	 * 添加轮播
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "p=goAdd")
	public String goAdd(HttpServletRequest request){
		
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		//List onetypelist = shangjiaService.getAllOnetype();
		//request.setAttribute("onetypelist", onetypelist);
		
		return "/admin/addLunboimg.jsp";
	}
}
