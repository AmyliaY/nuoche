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
import com.pojo.Service;
import com.service.daili.DailiLoginBackService;
import com.service.daili.DailiServiceService;
import com.service.daili.ServiceBusinessService;
import com.util.StringUtil;
import com.util.Upload;

/**
 * pc端 后台管理管理
 * @author 全恒
 */

@Controller
@RequestMapping("/daili_service.do")
public class DailiServiceAction {
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private DailiServiceService dailiServiceService;
	
	/**
	 * 服务列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(params="p=servicelisting")
	public String servicelisting(HttpServletResponse response) throws IOException
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
		String stId = request.getParameter("prid");
		if (request.getMethod().equalsIgnoreCase("GET")) {
			if (keywords != null)
				keywords = new String(keywords.getBytes("iso8859-1"), "utf-8");
		}
		Map servicemap = dailiServiceService.servicelisting(size, page, keywords, stId, proxy.getId());
		request.setAttribute("servicemap", servicemap);
		request.setAttribute("keywords", keywords);
		request.setAttribute("stId", stId);
		String stName = dailiServiceService.getStName(stId);
		request.setAttribute("stName", stName);
		List serviceTypeList = dailiServiceService.findServiceType();
		
		request.setAttribute("serviceTypeList", serviceTypeList);
		
		return "/daili/servicelisting.jsp";
	}
	
	/**
	 * 修改服务状态 禁用 or 启用
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
		Service Service = dailiServiceService.updatestatus(id);
		response.getWriter().print(Service.getStatus());
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
		dailiServiceService.plupdatestatus(type, qiyong, jinyong);
		return null;
	}

	/**
	 * 进入编辑服务页面
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "p=editserviceview")
	public String editserviceview(HttpServletRequest request,
			HttpServletResponse response) {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		//查商家
		List businesslisting = dailiServiceService.findbusiness(proxy.getId());
		request.setAttribute("businesslisting", businesslisting);
		//查服务类型
		List servicetypelisting = dailiServiceService.findServiceType();
		request.setAttribute("servicetypelisting", servicetypelisting);
		//根据service的id索引service
		int id = Integer.parseInt(request.getParameter("id"));
		Service service = dailiServiceService.editserviceview(id);
		request.setAttribute("service", service);
		return "/daili/serviceedit.jsp";
	}

	/**
	 * 编辑服务
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=editservice")
	public String editservice(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		String path = request.getSession().getServletContext()
				.getRealPath("/daili/images/lunboimg");
		Map<String, String> map = Upload.upload(request, 5 * 1024 * 1024, path);
		int bid = Integer.parseInt(map.get("bid"));
		int stid = Integer.parseInt(map.get("stid"));
		String stitle = map.get("stitle");
		String cdescribe = map.get("cdescribe");
		double scprice = Double.parseDouble(map.get("scprice"));
		double yyprice = Double.parseDouble(map.get("yyprice"));
		int time = Integer.parseInt(map.get("time"));
		String cimages = map.get("cimages");
		String delLunboimages = map.get("delLunboimages");
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
		
		dailiServiceService.editservice(id, bid, stid, stitle, cdescribe,
				scprice, yyprice, time, cimages);
		return "/daili_service.do?p=servicelisting";
	}

	/**
	 * 添加服务
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "p=addservice")
	public String addservice(HttpServletRequest request,
			HttpServletResponse response) {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		String path = request.getSession().getServletContext()
				.getRealPath("/daili/images/lunboimg");
		Map<String, String> map = Upload.upload(request, 5 * 1024 * 1024, path);
		int bid = Integer.parseInt(map.get("bid"));
		int stid = Integer.parseInt(map.get("stid"));
		String stitle = map.get("stitle");
		String cimgdescribe = map.get("cimgdescribe");
		double scprice = Double.parseDouble(map.get("scprice"));
		double yyprice = Double.parseDouble(map.get("yyprice"));
		int time = Integer.parseInt(map.get("time"));
		String cimages = map.get("cimages");
		dailiServiceService.addservice(bid, stid, stitle, cimgdescribe, scprice, yyprice, time, cimages);
		return "/daili_service.do?p=servicelisting";
	}

	/**
	 * 删除服务
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=deleteservice")
	public String deleteservice(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		boolean f = dailiServiceService.deleteservice(id);
		if (f)
			response.getWriter().print(true);
		else
			response.getWriter().print(false);
		return null;
	}

	/**
	 * 批量删除服务
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
		dailiServiceService.pldelete(shanchu);
		return null;

	}
	
	/**
	 * 进入添加服务界面
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "p=goAdd")
	public String goAdd(HttpServletRequest request){
		
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		//查找当前代理的商家
		List business = dailiServiceService.findbusiness(proxy.getId());
		request.setAttribute("business", business);
		//查找服务类型
		List serviceType = dailiServiceService.findServiceType();
		request.setAttribute("servicetype", serviceType);
		
		return "/daili/addservice.jsp";
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
		String json = dailiServiceService.findservice(bid);
		//response.getWriter().print(json);
		return json;
	}

	
	
}