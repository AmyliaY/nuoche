package com.action.weixin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.action.WeixinConfig;
import com.pojo.VipCash;
import com.pojo.VipCash;
import com.service.weixin.WeiXinMymoneyService;
import com.util.JsonFilter;
import com.util.StringUtil;
import com.util.URLManager;

import net.sf.json.JsonConfig;
import weixin.popular.api.OpenIdAPI;
import weixin.popular.bean.AccessToken;
import weixin.popular.util.JSSDKUtil;



/**
 *查仕龙--我的钱包Action
 * @author dell
 *
 */

@Controller
@RequestMapping("/mymoney.do")
public class WeiXinMymoneyAction {
	
	@Autowired
	private WeiXinMymoneyService mymoneyservice;
	
	
	/*
	 * 统计余额
	 */
	
	@RequestMapping(params = "p=allmoney")
	public String myMoney1(HttpServletRequest request,HttpServletResponse response)throws IOException{
		
		String shop_url = URLManager.getServerURL(request)
				+ "/mymoney.do?p=allmoney2";
		String shop_newUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(shop_url, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";

				
	    return "redirect:"+shop_newUrl;
	}
	
	

	
	@RequestMapping(params = "p=allmoney2")
	public String myMoney(HttpServletRequest request,HttpServletResponse response)throws IOException{
		
		String code = request.getParameter("code");
		String appid = WeixinConfig.APPID;
		String secret = WeixinConfig.APPSECRET;
		AccessToken accessToken = new OpenIdAPI()
				.getOpenId(appid, secret, code);
		String weixinhao = accessToken.getOpenid();
		////System.out.println("微信号:" + weixinhao); // 有的时候，要验证是否新用户，就要录入手机号码
		request.getSession().setAttribute("weixinhao", weixinhao);
		
		Map tjmap=mymoneyservice.tongjilisting(weixinhao); 	//统计余额
	
		request.getSession().setAttribute("tjmap", tjmap);
		JSSDKUtil.setJsSdkParam(request);
		return "/weixin/myallmoney.jsp";
	}
	
	/**
	 * 提现申请
	 * @param request
	 * @param response
	 * @return
	 */
	

	
	
	@RequestMapping(params="p=inserttixian")
	public String tixian(HttpServletRequest request,HttpServletResponse response)
	{
		
		String dingdanhao = null;
		// Date date=new Date();
		// SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");
		// String dataString=sdf.format(date);
		//		
		// dingdanhao="shuiguoshangcheng"+dataString;
		dingdanhao = UUID.randomUUID().toString().replaceAll("-", "");
		Timestamp createtime = new Timestamp(System.currentTimeMillis());
		
		String weixinhao=request.getParameter("weixinhao");
		////System.out.println(weixinhao);
		String cash1=request.getParameter("cash1");
		//System.out.println("提现金额"+cash1);
		double cash=Double.parseDouble(cash1);
		Map tjmap=mymoneyservice.tongjilisting(weixinhao); 	//
		request.setAttribute("tjmap", tjmap);
		mymoneyservice.addtixian(cash,dingdanhao,createtime,weixinhao);
		return "/mymoney.do?p=allmoney";
	}
	
	/**
	 * 提现记录
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params="p=record")
	public String record(HttpServletRequest request,HttpServletResponse response){
		
		String openid=request.getParameter("weixinhao");
		//System.out.println("record");

		request.getSession().setAttribute("openid", openid);
		//System.out.println("微信号:" + openid);
		
		int page=1;		//页数
		int size=5;		//大小
		
		String pageString=request.getParameter("page");
		if(StringUtil.isNotNull(pageString) && pageString.trim().length()>0)
			page=Integer.parseInt(pageString);
		
		String sizeString=request.getParameter("size");
		if(StringUtil.isNotNull(sizeString) && sizeString.trim().length()>0)
			size=Integer.parseInt(sizeString);
		
		
		
		int sum=mymoneyservice.getSum(size, page, openid);
		int count=sum%size==0 ? sum/size : sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		
		
		request.setAttribute("sum", sum);
		request.setAttribute("count", count);
		request.setAttribute("page", page);
		request.setAttribute("size", size);
		
		
		
		
		return "/weixin/tixianRecord2.jsp";
		
		
	}
	
	
	@RequestMapping(params="method=findAll")
	@ResponseBody
	public String getDetail2(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		//当前用户微信号
		String openid = (String) request.getSession().getAttribute("openid");

		//System.out.println("微信号11:" + openid);
		
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
		
		int sum=mymoneyservice.getSum(size, page, openid);
		int count=sum%size==0 ? sum/size : sum/size+1;
		if(page<1) page=1;
		
		List<VipCash> cashcords=mymoneyservice.tixianrecordListing(openid, size, page);
		Map map=new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);
		map.put("cashcords", cashcords);
		
		
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
		//System.out.println("微信号22:" + openid);
		//  获取该用户下的所有提现记录
		String json = mymoneyservice.findAll2(openid);
		//System.out.println(json);
		return json;
	}

//  异步根据状态查询  1：同意  2 ：拒绝
	@RequestMapping(params="method=findByStatus")
	@ResponseBody
	public String findByStatus(HttpServletRequest request,HttpServletResponse response)throws IOException{
		
		String openid = (String) request.getSession().getAttribute("openid");
		short status = Short.parseShort(request.getParameter("status"));
		//System.out.println("微信号33:" + openid);
		
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
		
		int sum=mymoneyservice.getSum2(size, page, openid, status);
		int count=sum%size==0 ? sum/size : sum/size+1;
		if(page<1) page=1;
		//if(page>count) page=count;
		
		//  根据状态查询提现记录
		List<VipCash> cashcords = mymoneyservice.findByStatus(size,page,openid,status);
		Map map=new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);
		map.put("cashcords", cashcords);
		
		JsonConfig config=new JsonConfig();
		net.sf.json.JSONObject object = new net.sf.json.JSONObject();
		JsonFilter.ignoredSet(config);
		object.putAll(map, config);
		String json=object.toString();

		
		
		
		return json;
	}
	
	
}
