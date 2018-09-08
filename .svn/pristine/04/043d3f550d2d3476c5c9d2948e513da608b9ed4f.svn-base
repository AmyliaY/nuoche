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
import com.pojo.Movecar;
import com.pojo.Proxy;
import com.service.weixin.WeiXinMoveCarDetailService;
import com.util.JsonFilter;
import com.util.StringUtil;
import com.util.URLManager;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import weixin.popular.api.OpenIdAPI;
import weixin.popular.bean.AccessToken;

@Controller
@RequestMapping("/moveCarDetail.do")
public class WeiXinMoveCarDetailAction {
	@Autowired
	private HttpServletRequest request;

	@Autowired
	public WeiXinMoveCarDetailService weiXinMoveCarDetailService;

	@RequestMapping(params="method=index")
	public String getDetail(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		//当前用户微信号
		String openid = request.getParameter("openid");

		System.out.println("微信号:" + openid);
		
		int page=1;		//页数
		int size=5;		//大小
		//short status=10;
		
		String pageString=request.getParameter("page");
		if(StringUtil.isNotNull(pageString) && pageString.trim().length()>0)
			page=Integer.parseInt(pageString);
		
		String sizeString=request.getParameter("size");
		if(StringUtil.isNotNull(sizeString) && sizeString.trim().length()>0)
			size=Integer.parseInt(sizeString);
		
		/*String statusString=request.getParameter("status");
		if(StringUtil.isNotNull(statusString) && statusString.trim().length()>0)
			status=Short.parseShort(statusString);*/
		
		int sum=weiXinMoveCarDetailService.getSum(size, page, openid);
		int count=sum%size==0 ? sum/size : sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		
		//List<Movecar> movecars=weiXinMoveCarDetailService.moveCarDetailListing(openid, size, page);
		//request.setAttribute("movecars", movecars);
		request.setAttribute("sum", sum);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("size", size);
		return "/weixin/movecardetail.jsp";
		
	}
	
	@RequestMapping(params="method=findAll")
	@ResponseBody
	public String getDetail2(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		//当前用户微信号
		String openid = (String) request.getSession().getAttribute("openid");

		System.out.println("微信号:" + openid);
		
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
		
		int sum=weiXinMoveCarDetailService.getSum(size, page, openid);
		int count=sum%size==0 ? sum/size : sum/size+1;
		if(page<1) page=1;
		//if(page>count) page=count;
		
		List<Movecar> movecars=weiXinMoveCarDetailService.moveCarDetailListing(openid, size, page);
		Map map=new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);
		map.put("movecars", movecars);
		
		
		JsonConfig config=new JsonConfig();
		net.sf.json.JSONObject object = new net.sf.json.JSONObject();
		JsonFilter.ignoredSet(config);
		object.putAll(map, config);
		String json=object.toString();
		
//		System.out.println(json);
//		System.out.println("我所挪的车的记录");
//		System.out.println("sum:"+sum);
//		System.out.println("count:"+count);
//		System.out.println("page:"+page);
//		System.out.println("size:"+size);
		return json;
		
	}
	
/*	@RequestMapping(params="method=index3")
	public String moveCarDetail(HttpServletRequest request,HttpServletResponse response)throws IOException{
		//当前用户微信号
		String openid = request.getParameter("openid");

		System.out.println("微信号:" + openid);
		//  获取该用户下的所有挪车记录
		List<Movecar> movecars = weiXinMoveCarDetailService.findByOpenId2(openid);
		request.setAttribute("movecars", movecars);
		return "/weixin/movecardetail.jsp";
		//return "/weixin/test.jsp";
	}*/
	
	
/*//  异步查所有
	@RequestMapping(params="method=findAll")
	@ResponseBody
	public String findAll(HttpServletRequest request,HttpServletResponse response)throws IOException{
		
		String openid = (String) request.getSession().getAttribute("openid");
		System.out.println("微信号:" + openid);
		//  获取该用户下的所有挪车记录
		String json = weiXinMoveCarDetailService.findAll(openid);

		System.out.println(json);
		return json;
	}*/
	
//  异步查所有
	@RequestMapping(params="method=findAll2")
	@ResponseBody
	public String findAll2(HttpServletRequest request,HttpServletResponse response)throws IOException{
		
		String openid = (String) request.getSession().getAttribute("openid");
		//System.out.println("微信号:" + openid);
		//  获取该用户下的所有挪车记录
		String json = weiXinMoveCarDetailService.findAll2(openid);
		//System.out.println(json);
		return json;
	}
	
	//  异步根据状态查询  0：挪车成功  1：挪车失败  2 ：挪车中
	@RequestMapping(params="method=findByStatus")
	@ResponseBody
	public String findByStatus(HttpServletRequest request,HttpServletResponse response)throws IOException{
		
		String openid = (String) request.getSession().getAttribute("openid");
		short status = Short.parseShort(request.getParameter("status"));
	//	System.out.println("微信号:" + openid);
		
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
		
		int sum=weiXinMoveCarDetailService.getSum2(size, page, openid, status);
		int count=sum%size==0 ? sum/size : sum/size+1;
		if(page<1) page=1;
		//if(page>count) page=count;
		
		//  根据状态查询挪车记录
		List<Movecar> movecars = weiXinMoveCarDetailService.findByStatus(size,page,openid,status);
		Map map=new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);
		map.put("movecars", movecars);
		
		JsonConfig config=new JsonConfig();
		net.sf.json.JSONObject object = new net.sf.json.JSONObject();
		JsonFilter.ignoredSet(config);
		object.putAll(map, config);
		String json=object.toString();
/*		
		request.setAttribute("sum", sum);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("size", size);
		*/
		
//	//	System.out.println(json);
//		if(status==0)
//		//	System.out.println("挪车成功记录");
//		if(status==2)
//			//System.out.println("挪车中记录");
//		System.out.println("sum:"+sum);
//		System.out.println("count:"+count);
//		System.out.println("page:"+page);
//		System.out.println("size:"+size);
//		
		return json;
	}
	
	
	/*@RequestMapping(params = "p=getDetail")
	public String orderlisting(HttpServletRequest request,HttpServletResponse response)throws IOException{
		
		String url = URLManager.getServerURL(request)
				+ "/moveCarDetail.do?p=getDetail2";
		String newUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(url, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";

				
	    return "redirect:"+newUrl;
	}
	
	

	*/
}
