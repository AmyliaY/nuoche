package com.shop.action.app;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.action.CorpAction;
import com.pojo.Address;
import com.pojo.Shoppingcat;
import com.pojo.Userinfo;
import com.service.weixin.MusicWeixinService;
import com.shop.service.app.AppCatService;
import com.util.JsonFilter;

@Controller
@RequestMapping("/appcat.do")
public class AppCatAction {
	@Autowired
	private AppCatService appCatService;
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private MusicWeixinService  musicWeixinService;
	/**
	 * 得到所有的购物车信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=getAllCat")
	public String getAllCat()
	{
		Userinfo userinfo=(Userinfo) request.getSession().getAttribute("userinfo");
		if(userinfo==null)
		{
			return "请先登录";
		}else{
			System.out.println("来了");
			int userid=userinfo.getUsersId();//Integer.parseInt(request.getParameter("id"));
			System.out.println(userid);
			String json=appCatService.getAllCat(userid);
			return json;
		}
	}
	/**
	 * 得到收货地址信息 和 商品信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=getAllAddressAndGoods")
	public String getAllAddressAndGoods()
	{
		String[] catid=request.getParameterValues("catid[]");	// catID 数组
		List<Shoppingcat> catlist=new ArrayList<Shoppingcat>();	// 购物车LIST
		String str=null;
		float sum=0;
		if (catid!=null)
		for (int i = 0; i < catid.length; i++) {
			str=catid[i].toString().replace("{", "").replace("}", "");
			System.out.println("catid"+str);
			Shoppingcat shoppingcat=appCatService.findByIdCat(str);	 //根据ID 得到购物车信息
			float zhekou =  musicWeixinService.getCurrentZhekou(shoppingcat.getGoods().getGid(), shoppingcat.getUserinfo().getUsersId());
			shoppingcat.setZhekou(zhekou);
			catlist.add(shoppingcat);
			sum=sum+zhekou*appCatService.getSumById(str);	//得到总价格
		}
		//配送方式
		CorpAction corp=new CorpAction();
		corp.init();
		
		//读取配置文件
		
		
		
		
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		Map map=new HashMap();
		map.put("sum", sum);
		map.put("catlist", catlist);
		map.put("ziti", corp.getZiti());
		map.put("kuaidi", corp.getKuaidi());
		map.put("songhuo", corp.getSonghuo());
		JSONObject obj=new JSONObject();
		obj.putAll(map, config);
		String json=obj.toString();
		
		return json;
	}
	//得到地址
	@ResponseBody
	@RequestMapping(params="p=getAllAddress")
	public String getAllAddress(HttpServletRequest request,HttpServletResponse response)
	{
		
		Userinfo userinfo=(Userinfo) request.getSession().getAttribute("userinfo");
		if(userinfo==null)
		{
			return "请先登录";
		}
		int userid=userinfo.getUsersId();//Integer.parseInt(request.getParameter("userid"));	//会员ID
		System.out.println("会员ID："+userid);
		Address address=appCatService.findByUidAddress(userid);		//查看有没有默认的地址
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json=JSONObject.fromObject(address, config).toString();
		System.out.println(json);
		return json;
	}
	/**
	 * 购物车 编辑购买数量  + or -
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(params="p=editCatNum")
	public String editCatNum(HttpServletResponse response) throws IOException
	{
		System.out.println("laile");
		int catid=Integer.parseInt(request.getParameter("catid"));
		int type=Integer.parseInt(request.getParameter("type"));
		
		Shoppingcat cat=appCatService.editCatNum(catid,type);
		response.getWriter().print(cat.getScatNum());
		return null;
	}
	/**
	 * 购物车 输入购买数量
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(params="p=editCatSetNum")
	public String editCatSetNum(HttpServletResponse response) throws IOException
	{
		int catid=Integer.parseInt(request.getParameter("catid"));
		int catnum=Integer.parseInt(request.getParameter("catnum"));
		Shoppingcat cat=appCatService.editCatSetNum(catid,catnum);
		response.getWriter().print(cat.getScatNum());
		return null;
	}
	/**
	 * 单个删除购物车商品
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=deleteCat")
	public String deleteCat(HttpServletResponse response)
	{
		String catid=request.getParameter("catid");
		appCatService.deleteCat(catid);
		return "成功";
	}
	/**
	 * 批量删除购物车商品
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=plcatdelete")
	public String plcatdelete()
	{
		String catid[]=request.getParameterValues("catid[]");
		String str=null;
		for (int i = 0; i < catid.length; i++) {
			str=catid[i].toString();
			appCatService.deleteCat(str);
		}
		return "成功";
	}
	/**
	 * 得到自提地址
	 */
	@ResponseBody
	@RequestMapping(params="p=getAllZitiAddress")
	public String getAllZitiAddress()
	{
		String json=appCatService.getAllZitiAddress();
		System.out.println(json);
		return json;
	}
}
