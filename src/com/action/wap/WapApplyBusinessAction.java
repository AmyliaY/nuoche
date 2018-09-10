package com.action.wap;

import java.io.IOException;
import java.util.HashMap;
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
import com.pojo.Service;
import com.service.wap.WapApplyBusinessService;
import com.service.wap.WapServiceManagerService;
import com.util.FileCopy;
import com.util.JsonFilter;
import com.util.StringUtil;
import com.util.Upload;

import net.sf.json.JsonConfig;

/**
 * 申请成为商家
 * @author 全恒
 *
 */

@Controller
@RequestMapping("applybusiness.do")
public class WapApplyBusinessAction {
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private WapApplyBusinessService applyBusinessService;
	
	/**
	 * 进入申请页面
	 */
	@RequestMapping(params="p=gotoapply")
	public String gotoApply(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		//查出省份
		List<Province> plist = applyBusinessService.FindProvinceAll();
		request.setAttribute("plist", plist);
		return "wap/shop/apply_business.jsp";
	}
	
	/**
	 * 提交申请
	 */
	@RequestMapping(params="p=commitapply")
	@ResponseBody
	public String commitApply(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		//返回当前用户的微信号
		String weixinhao = (String) request.getSession().getAttribute("openid");
		//System.out.println("weixinhao-----------"+weixinhao);
		
		String path = request.getSession().getServletContext().getRealPath("/daili/images/lunboimg");
		Map<String, String> map = Upload.upload(request, 5 * 1024 * 1024, path);
		
		String shopname = map.get("shopname");
		String realname = map.get("realname");
		String shoptel = map.get("shoptel");
		//String shopemail = map.get("shopemail");
		String shoptype= map.get("shoptype");
		Short gender = Short.parseShort("0");//Short.parseShort(map.get("gender"));
		Integer arid = Integer.parseInt(map.get("arid"));
		String gpinpai = map.get("gpinpai");//店铺详细地址
		String cimages = map.get("cimages");//图片
		String describe = map.get("describe");//详细描述
		//System.out.println(cimages);
		applyBusinessService.addApply(weixinhao, shopname,realname, shoptel, shoptype, gender, arid, gpinpai,describe, cimages);
		
		return weixinhao;
	}
	
	@RequestMapping(params="p=findByidCity")
	@ResponseBody
	public String findByidCity(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		int prid = Integer.parseInt(request.getParameter("prid"));
		String json=applyBusinessService.findByidCity(prid);
		return json;
	}
	
	@RequestMapping(params="p=findByIdArea")
	@ResponseBody
	public String findByIdArea(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		int crid =Integer.parseInt(request.getParameter("crid"));
		String json=applyBusinessService.findByIdArea(crid);
		return json;
	}
	
}
