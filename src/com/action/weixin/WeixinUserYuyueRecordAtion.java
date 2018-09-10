package com.action.weixin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.action.WeixinConfig;
import com.pojo.Admin;
import com.pojo.Applydetail;
import com.pojo.Yuyue;
import com.pojo.Proxy;
import com.service.weixin.WeixinUserYuyueRecordService;
import com.util.JsonFilter;
import com.util.StringUtil;
import com.util.URLManager;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import weixin.popular.api.OpenIdAPI;
import weixin.popular.bean.AccessToken;

/*
 * 查仕龙--用户预约记录Action
 */
@Controller
@RequestMapping("/useryuyueRecord.do")
public class WeixinUserYuyueRecordAtion {
	@Autowired
	private HttpServletRequest request;

	@Autowired
	public WeixinUserYuyueRecordService useryuyuerecordservice;

	@RequestMapping(params="p=index")
	public String getDetail(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		//当前用户微信号
		String openid = request.getParameter("openid");
		request.getSession().setAttribute("openid", openid);
		////System.out.println("微信号:" + openid);
		
		int page=1;		//页数
		int size=5;		//大小
		
		String pageString=request.getParameter("page");
		if(StringUtil.isNotNull(pageString) && pageString.trim().length()>0)
			page=Integer.parseInt(pageString);
		
		String sizeString=request.getParameter("size");
		if(StringUtil.isNotNull(sizeString) && sizeString.trim().length()>0)
			size=Integer.parseInt(sizeString);
		
		
		
		int sum=useryuyuerecordservice.getSum(size, page, openid);
		int count=sum%size==0 ? sum/size : sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		
		
		request.setAttribute("sum", sum);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("size", size);
		return "/wap/shop/useryuyuerecord.jsp";
		
	}
	
	@RequestMapping(params="method=findAll")
	@ResponseBody
	public String getDetail2(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		//当前用户微信号
		String openid = (String) request.getSession().getAttribute("openid");

		////System.out.println("微信号11:" + openid);
		
		int page=1;		//页数
		int size=5;		//大小
		short status=10;
		
		String pageString=request.getParameter("page");
		if(StringUtil.isNotNull(pageString) && pageString.trim().length()>0)
			page=Integer.parseInt(pageString);
		
		String sizeString=request.getParameter("size");
		if(StringUtil.isNotNull(sizeString) && sizeString.trim().length()>0)
			size=Integer.parseInt(sizeString);
		
		String statusString=request.getParameter("status");
		if(StringUtil.isNotNull(statusString) && statusString.trim().length()>0)
			status=Short.parseShort(statusString);
		
		int sum=useryuyuerecordservice.getSum(size, page, openid);
		int count=sum%size==0 ? sum/size : sum/size+1;
		if(page<1) page=1;
		
		List<Yuyue> yuyuerecords=useryuyuerecordservice.yuyuerecordListing(openid, size, page);
		Map map=new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);
		map.put("yuyuerecords", yuyuerecords);
		
		
		JsonConfig config=new JsonConfig();
		net.sf.json.JSONObject object = new net.sf.json.JSONObject();
		JsonFilter.ignoredSet(config);
		object.putAll(map, config);
		String json=object.toString();
		
		
		return json;
		
	}
	
//  异步查所有
	@RequestMapping(params="method=findAll2")
	@ResponseBody
	public String findAll2(HttpServletRequest request,HttpServletResponse response)throws IOException{
		
		String openid = (String) request.getSession().getAttribute("openid");
		////System.out.println("微信号22:" + openid);
		//  获取该用户下的所有预约记录
		String json = useryuyuerecordservice.findAll2(openid);
		////System.out.println(json);
		return json;
	}
	
	//  异步根据状态查询  1：未服务  2 ：已服务
	@RequestMapping(params="method=findByStatus")
	@ResponseBody
	public String findByStatus(HttpServletRequest request,HttpServletResponse response)throws IOException{
		
		String openid = (String) request.getSession().getAttribute("openid");
		short status = Short.parseShort(request.getParameter("status"));
		////System.out.println("微信号33:" + openid);
		
		int page=1;		//页数
		int size=5;		//大小
		
		String pageString=request.getParameter("page");
		if(StringUtil.isNotNull(pageString) && pageString.trim().length()>0)
			page=Integer.parseInt(pageString);
		
		String sizeString=request.getParameter("size");
		if(StringUtil.isNotNull(sizeString) && sizeString.trim().length()>0)
			size=Integer.parseInt(sizeString);
		
		String statusString=request.getParameter("status");
		if(StringUtil.isNotNull(statusString) && statusString.trim().length()>0)
			status=Short.parseShort(statusString);
		
		int sum=useryuyuerecordservice.getSum2(size, page, openid, status);
		int count=sum%size==0 ? sum/size : sum/size+1;
		if(page<1) page=1;
		//if(page>count) page=count;
		
		//  根据状态查询预约记录
		List<Yuyue> yuyuerecords = useryuyuerecordservice.findByStatus(size,page,openid,status);
		Map map=new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);
		map.put("yuyuerecords", yuyuerecords);
		
		JsonConfig config=new JsonConfig();
		net.sf.json.JSONObject object = new net.sf.json.JSONObject();
		JsonFilter.ignoredSet(config);
		object.putAll(map, config);
		String json=object.toString();

		
		
		
		return json;
	}
	
	

}
