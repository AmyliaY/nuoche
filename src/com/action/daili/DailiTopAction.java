package com.action.daili;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
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
import com.pojo.Proxy;
import com.pojo.Service;
import com.service.daili.DailiTopService;
import com.util.StringUtil;
import com.util.Upload;



/**
 * pc端 后台管理管理
 * @author 康旺
 * 
 *
 */

@Controller
@RequestMapping("/dailiTop.do")
public class DailiTopAction {
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private DailiTopService dailiTopService;
	
	/**
	 * 置顶列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(params = "p=zhidinglisting")
	public String zhidingListing(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
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
		Map yizhidingService = dailiTopService.yiZhiDingListing(size, page, keywords,proxy.getId());
		request.setAttribute("yizhidingServiceMap", yizhidingService);
		request.setAttribute("keywords", keywords);
		return "/daili/yiZhiDingService.jsp";
	}
	
	
	/**
	 * 修改置顶状态  取消  or 置顶
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=updateIsZhiding")
	public String updateZhiding(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		Service service = dailiTopService.updateIsZhiding(id);
		response.getWriter().print(service.getIsZhiding());
		return null;
	}
	
	/**
	 * 批量修改置顶状态 置顶 or 取消
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "p=plupdateIsZhiding")
	public String plupdateZhiding(HttpServletRequest request,
			HttpServletResponse response) {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		int type = Integer.parseInt(request.getParameter("type"));
		String zhiding = request.getParameter("zhiding");
		String quxiao = request.getParameter("quxiao");
		dailiTopService.plupdateIsZhiding(type, zhiding, quxiao);
		return null;
	}
	
	/**
	 * 逻辑删除置顶 把置顶属性isZhiding=-1
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=deleteZhiding")
	public String deleteZhiding(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		boolean f = dailiTopService.deleteZhiding(id);
		if (f)
			response.getWriter().print(true);
		else
			response.getWriter().print(false);
		return null;
	}


	/**
	 * 批量删除置顶
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "p=plDelete")
	public String pldelete(HttpServletRequest request,
			HttpServletResponse response) {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		String delete = request.getParameter("delete");
		dailiTopService.plDelete(delete);
		return null;

	}
	/**
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "p=addZhidingView")
	public String addZhidingView(HttpServletRequest request){
		
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		List business = dailiTopService.findbusiness(proxy.getId());
		request.setAttribute("business", business);
		return "/daili/addZhiding.jsp";
	}
	
	/**
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "p=editZhidingView")
	public String editZhidingView(HttpServletRequest request){
		
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		List business = dailiTopService.findbusiness(proxy.getId());
		int serviceId = Integer.parseInt(request.getParameter("serviceId"));
		Service service = dailiTopService.findServiceById(serviceId);
		String strovertime = (service.getOvertime()+"").substring(0,10);
		/*DateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		format.setLenient(false);  
		Timestamp overtime =null;
		try {  
		    	overtime = new Timestamp(format.parse(strovertime).getTime()); 
		    } catch (ParseException e) {   
		        e.printStackTrace(); 
		    }*/
		request.setAttribute("business", business);
		request.setAttribute("serviceId", serviceId);
		request.setAttribute("service", service);
		request.setAttribute("strovertime", strovertime);
		return "/daili/editZhiding.jsp";
	}
	
	
	/**
	 * 得到当前代理的商家的服务
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params="p=getService")
	@ResponseBody
	public String getService(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		int bid = Integer.parseInt(request.getParameter("bid"));
		String json = dailiTopService.findService(bid);
		return json;
	}
	
	/**
	 * 添加置顶服务
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "p=addZhiding")
	public String addZhiding(HttpServletRequest request,
			HttpServletResponse response) {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		String strovertime = request.getParameter("overtime");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		format.setLenient(false);  
		Timestamp overtime =null;
		try {  
		    	overtime = new Timestamp(format.parse(strovertime).getTime()); 
		    } catch (ParseException e) {   
		        e.printStackTrace(); 
		    }
		int serviceId = Integer.parseInt(request.getParameter("sid"));
		//得到系统当前时间
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		if(overtime.getTime() >= nousedate.getTime()){
			dailiTopService.addIsZhiding(serviceId,overtime);
			return "/dailiTop.do?p=zhidinglisting";
		}
		else
			return "/dailiTop.do?p=addZhidingView";
	}
	
	/**
	 * 编辑置顶服务
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=editZhiding")
	public String editZhiding(HttpServletRequest request,
			HttpServletResponse response) {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		short isZhiding = Short.parseShort(request.getParameter("isZhiding"));
		String strovertime = request.getParameter("overtime");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		format.setLenient(false);  
		Timestamp overtime =null;
		try {  
		    	overtime = new Timestamp(format.parse(strovertime).getTime()); 
		    } catch (ParseException e) {   
		        e.printStackTrace(); 
		    }
		int newserviceId = Integer.parseInt(request.getParameter("sid"));
		int serviceId = Integer.parseInt(request.getParameter("serviceId"));
		//System.out.println("编辑置顶业务--overtime:"+overtime+"\n"+"serviceId："+serviceId+"\n"+"isZhiding："+isZhiding);
		//得到系统当前时间
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		if(overtime.getTime() >= nousedate.getTime()){
			dailiTopService.editZhiding(newserviceId, overtime, isZhiding);
			if(newserviceId != serviceId){
				dailiTopService.deleteZhiding(serviceId);
			}
			return "/dailiTop.do?p=zhidinglisting";
		}
		else 
			return "/dailiTop.do?p=editZhidingView";
	}
	/**
	 * 
	 * 根据置顶参数为2
	 * 获得所有的已过期置顶服务
	 * 
	 *
	 *//*
	@RequestMapping(params="p=getYGQZDService")
	public String getAllKGQZD(HttpServletRequest request){
		short status = 2;
		List<Service> list= dailiTopService.findAllYZD(status);
		Map map = new HashMap();
		map.put("list", list);
		request.setAttribute("map", map);
		return "/daili/yiGuoQiZhiDingService.jsp";
	}*/
	
	
}
