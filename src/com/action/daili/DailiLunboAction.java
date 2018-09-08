package com.action.daili;

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

import com.pojo.Proxy;
import com.pojo.Proxy;
import com.pojo.SylbImages;
import com.service.daili.DailiLoginBackService;
import com.service.daili.DailiLunboService;
import com.service.daili.ServiceBusinessService;
import com.util.StringUtil;
import com.util.Upload;

/**
 * pc端 后台管理管理
 * @author 全恒
 */

@Controller
@RequestMapping("/daili_lunboimg.do")
public class DailiLunboAction {
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private DailiLunboService dailiLunboService;
	
	@Autowired
	private ServiceBusinessService serviceService;
	
	/**
	 * 轮播图片列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(params="p=lunboimglisting")
	public String lunboimglisting(HttpServletResponse response) throws IOException
	{
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
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
		Map lunbomap = dailiLunboService.lunboimglisting(size, page, keywords, proxy.getId());
		request.setAttribute("lunbomap", lunbomap);
		request.setAttribute("keywords", keywords);
		return "/daili/lunboimglisting.jsp";
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
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		SylbImages SylbImages = dailiLunboService.updatestatus(id);
		response.getWriter().print(SylbImages.getStatus());
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
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		short type = Short.parseShort(request.getParameter("type"));
		String qiyong = request.getParameter("qiyong");
		String jinyong = request.getParameter("jinyong");
		dailiLunboService.plupdatestatus(type, qiyong, jinyong);
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
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		List businesslist = dailiLunboService.findbusiness(proxy.getId());
		request.setAttribute("businesslist", businesslist);
		int id = Integer.parseInt(request.getParameter("id"));
		SylbImages lunboimg = dailiLunboService.editlunboimgview(id);
		request.setAttribute("lunboimg", lunboimg);
		return "/daili/lunboimgedit.jsp";
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
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		String path = request.getSession().getServletContext()
				.getRealPath("/daili/images/lunboimg");
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
					.getRealPath("/daili/images/lunboimg");
			File folder = new File(imgPath);
			File[] files = folder.listFiles();
			for (File f : files) {
				if (f.getName().equals(delLunboimages)) {
					f.delete();
				}
			}
		}
		String cdescribe = map.get("cdescribe");
		//商家id，如果id=1说明代理没有选择商家
		String bid = map.get("bid");
		//服务id，如果id=1说明代理没有选择服务
		String sid = map.get("sid");
		//当选择的轮播类型为商家时，用bid2
		String bid2 = map.get("bid2");
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = sdf.format(date);
		Timestamp cimgTime = Timestamp.valueOf(dateString);
		dailiLunboService.editlunboimg(id, cimtype, cimgtitle, cimages,
				cdescribe, cimgTime, bid, sid, bid2);
		return "/daili_lunboimg.do?p=lunboimglisting";
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
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		String path = request.getSession().getServletContext()
				.getRealPath("/daili/images/lunboimg");
		Map<String, String> map = Upload.upload(request, 5 * 1024 * 1024, path);
		String cimgtitle = map.get("cimgtitle");
		String cimgstatus = map.get("cimgstatus");
		String cimgtype = map.get("cimgtype");
		String bid = map.get("bid");
		String sid = map.get("sid");
		String bid2 = map.get("bid2");
		System.out.println(bid);
		String cimages = map.get("cimages");

		String cimgdescribe = map.get("cimgdescribe");
		System.out.println(cimgdescribe);
		dailiLunboService.addlunboimg(cimgtitle, cimgstatus, cimgtype, cimages, cimgdescribe, bid, sid, bid2, proxy.getId());
		return "/daili_lunboimg.do?p=lunboimglisting";
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
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		boolean f = dailiLunboService.deletelunbo(id);
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
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		String shanchu = request.getParameter("shanchu");
		dailiLunboService.pldelete(shanchu);
		return null;

	}
	
	/**
	 * 进入添加轮播图界面
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "p=goAdd")
	public String goAdd(HttpServletRequest request){
		
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		List business = dailiLunboService.findbusiness(proxy.getId());
		request.setAttribute("business", business);
		
		return "/daili/addLunboimg.jsp";
	}

	/**
	 * 得到当前代理的商家的服务
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params="p=findservice")
	@ResponseBody
	public String findservice(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		int bid = Integer.parseInt(request.getParameter("bid"));
		String json = dailiLunboService.findservice(bid);
		//response.getWriter().print(json);
		return json;
	}

	
	
}