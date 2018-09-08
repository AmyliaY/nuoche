package com.action.daili;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Area;
import com.pojo.Business;
import com.pojo.Province;
import com.pojo.Proxy;
import com.service.daili.BusinessService;
import com.service.daili.DailiServiceService;
import com.service.daili.DailiUserInfoService;
import com.util.FileCopy;
import com.util.StringUtil;

@Controller
@RequestMapping("/daili_business.do")
/*
 * 商家管理
 * 周辉群
 * 全恒 改（新增店铺申请功能）
 * */
public class BusinessAction {
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private BusinessService businessService;
	
	@Autowired
	private DailiServiceService dailiServiceService;
	
	@Autowired
	private DailiUserInfoService dailiuserinfoservice;
	/*
	 * 上架商家列表
	 * （与当前代理同一个城市）申请的店铺列表
	 * */
	@RequestMapping(params="p=storessj")
	public String bgl(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		
		int page = 1;
		int size = 6;
		
		String pageString = request.getParameter("page");
		if (StringUtil.isNotNull(pageString) && pageString.trim().length() > 0) {
			page = Integer.parseInt(pageString);
		}
		String sizeString = request.getParameter("size");
		if (StringUtil.isNotNull(sizeString) && sizeString.trim().length() > 0) {
			size = Integer.parseInt(sizeString);
		}
		String keywords = request.getParameter("keywords");
		if (request.getMethod().equalsIgnoreCase("GET")) {
			if (keywords != null)
				keywords = new String(keywords.getBytes("iso8859-1"), "utf-8");
		}
		Map sjbusinessMap = businessService.sjbusiness(size, page ,keywords,proxy);
		List blist = businessService.getAllbusiness();
		request.setAttribute("sjbusinessMap", sjbusinessMap);
		request.setAttribute("blist", blist);
		request.setAttribute("keywords", keywords);
		return "daili/business_gl.jsp";
	}
	
	/*
	 * 下架商家列表
	 * 
	 * */
	@RequestMapping(params="p=storesxj")
	public String bxj(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		
		int page = 1;
		int size = 6;
		
		String pageString = request.getParameter("page");
		if (StringUtil.isNotNull(pageString) && pageString.trim().length() > 0) {
			page = Integer.parseInt(pageString);
		}
		String sizeString = request.getParameter("size");
		if (StringUtil.isNotNull(sizeString) && sizeString.trim().length() > 0) {
			size = Integer.parseInt(sizeString);
		}
		String keywords = request.getParameter("keywords");
		if (request.getMethod().equalsIgnoreCase("GET")) {
			if (keywords != null)
				keywords = new String(keywords.getBytes("iso8859-1"), "utf-8");
		}
		Map sjbusinessMap = businessService.xjbusiness(size, page ,keywords);
		List blist = businessService.getXJbusiness();
		request.setAttribute("sjbusinessMap", sjbusinessMap);
		request.setAttribute("blist", blist);
		request.setAttribute("keywords", keywords);
		return "daili/business_xj.jsp";
	}
	
	/*
	 * 商家审核状态修改
	 * 0 未审核
	 * 1 审核通过
	 * 2 审核未通过
	 * */
	@RequestMapping(params = "p=xiugaistatus")
	public String xiugaistatus(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		
		int id = Integer.parseInt(request.getParameter("id"));
		Business business = businessService.xiugaistatus(id,proxy);
		response.getWriter().print(business.getStatus());
		

		
		return "/daili_business.do?p=storessj";	

	}
	//下架商品
	@RequestMapping(params = "p=delete")
	public String deletebusiness(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		
		int id = Integer.parseInt(request.getParameter("id"));
		
			Business business = businessService.deletebusiness(id);
			response.getWriter().print(business.getStatus());
		

		
		return "/daili/business_xj.jsp";

	}
	
	//跳转到编辑商品页面
	@RequestMapping(params = "p=updateone")
	public String updateGoodsOne(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}		
		String id = request.getParameter("id");

		Business business = businessService.findById(Integer.parseInt(id));
		
		request.setAttribute("b", business);
		
		return "/daili/business_edit2.jsp";
	}
	
	//完成编辑
	@RequestMapping(params = "p=updatetwo")
	public String updateGoods(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}		
		String gid = request.getParameter("gid");// 商品编号
		String defaultImage = request.getParameter("defaultImage");// 默认图片
		String json = request.getParameter("imagelist"); // 其它图片
		String gname = request.getParameter("gname");
		String gchandi = request.getParameter("gchandi");
		String gpinpai = request.getParameter("gpinpai");
		String gjianjie = request.getParameter("gjanjie");
		String gimages = request.getParameter("gimages");
		String cimages = request.getParameter("image");
		Business business = businessService.findById(Integer.parseInt(gid));
		String gprice = request.getParameter("gprice");
		String gvipprice = request.getParameter("gvipprice");
		String gstatus = request.getParameter("gstatus");
		String gzhongchou = request.getParameter("gzhongchou");
		String gdelia = request.getParameter("gdelia");
		if (StringUtil.isNotNull(gimages))
		FileCopy.copy(request, "/tmp", "/daili/images/lunboimg",gimages);
		
		businessService.update_goods(gname, gchandi, gpinpai, gjianjie, gimages, gprice, gvipprice, gstatus, gzhongchou, gdelia, gid,cimages);
		return "/daili_business.do?p=storessj";
	}
	@RequestMapping(params = "p=storesxz")
	public String xzstrea(){
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}
		List<Province> plist = dailiuserinfoservice.FindProvinceAll();
		List serviceType = dailiServiceService.findServiceType();
		proxy = businessService.findProxy(proxy.getId());
		Area area = proxy.getArea();
		request.setAttribute("barea", area);
		request.setAttribute("servicetype", serviceType);
		request.setAttribute("plist", plist);
		return "/daili/business_xz.jsp";
	}
			
	@RequestMapping(params = "p=insertbusiness")
	public String insertGoods(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}		
		String gid = request.getParameter("gid");// 商品编号
		String arid = request.getParameter("arid");// 商品编号
		String defaultImage = request.getParameter("defaultImage");// 默认图片
		String json = request.getParameter("imagelist"); // 其它图片
		String gname = request.getParameter("gname");
		String gchandi = request.getParameter("gchandi");
		String gpinpai = request.getParameter("gpinpai");
		String gjianjie = request.getParameter("gjanjie");
		String gimages = request.getParameter("gimages");
		String cimages = request.getParameter("cimages");
		String path = request.getSession().getServletContext()
				.getRealPath("/daili/images/lunboimg");
		//Map<String, String> Imap = Upload.upload(request, 5 * 1024 * 1024, path);
		FileCopy.copy(request, "/tmp", "/daili/images/lunboimg",gimages);
		
		String gprice = request.getParameter("gprice");
		String gvipprice = request.getParameter("gvipprice");
		String gstatus = request.getParameter("gstatus");
		String gzhongchou = request.getParameter("gzhongchou");
		String gdelia = request.getParameter("gdelia");
		businessService.insert_goods(gname, gchandi, gpinpai, gjianjie, gimages, gprice, gvipprice, gstatus, gzhongchou, gdelia, gid, cimages, proxy,arid);
		return "/daili_business.do?p=storessj";
	}
	
	
	@RequestMapping(params = "p=plxiajiagoods")	
	public String plxiajiagoods(){
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}	
		String xiajia = request.getParameter("xiajia");		
		businessService.plxiajiagoods(xiajia);
		return "/daili_business.do?p=storessj";
	}
	
	@RequestMapping(params = "p=plshangjiagoods")	
	public String plshangjiagoods(){
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/daili/login.jsp";
		}	
		String xiajia = request.getParameter("xiajia");	
		businessService.plshangjiagoods(xiajia);
		return "/daili_business.do?p=storesxj";
	}
	
	@RequestMapping(params = "p=testdingwei")
	@ResponseBody
	public String testdingwei(){
		System.out.println("laile");
		String xiangxidizhi = request.getParameter("xiangxidizhi");
		String arid = request.getParameter("arid");
		System.out.println(xiangxidizhi);
		System.out.println(arid);
		
		int n = businessService.testdingwei(xiangxidizhi, arid);
		System.out.println("来判断地址是否合法了");
		System.out.println("n==========="+n);
		if(n==1)
			return "1";
		else 
			return "0";
	}
}
