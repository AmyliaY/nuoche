package com.shop.action.app;

import java.io.IOException;
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

import com.pojo.Address;
import com.pojo.Goodsorderdetail;
import com.pojo.Userinfo;
import com.shop.service.app.AppCatService;
import com.shop.service.app.AppGoodsService;
import com.util.JsonFilter;

@Controller
@RequestMapping("/appgoods.do")
public class AppGoodsAction {
	@Autowired
	private AppGoodsService appGoodsService;
	@Autowired
	private AppCatService appCatService;
	@Autowired
	private HttpServletRequest request;
	
	/**
	 * 分页获取商品
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=fenye")
	public String findByIdGoods()
	{
		Userinfo userinfo=(Userinfo) request.getSession().getAttribute("userinfo");
		
		int page=Integer.parseInt(request.getParameter("page"));
		int size=Integer.parseInt(request.getParameter("size"));
		String id = request.getParameter("gttid");
		String json = appGoodsService.fenye(userinfo, size, page);
		return json;
	}
	

	/**
	 * 根据商品ID查看商品图片
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=goodsdetail")
	public String goodsdetail()
	{
		Userinfo userinfo=(Userinfo) request.getSession().getAttribute("userinfo");
		int id=Integer.parseInt(request.getParameter("id")); //商品ID
		String json=appGoodsService.goodsdetail(userinfo,id);
		return json;
	}
	/**
	 * 会员查看收藏的商品
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=getAllCollection")
	public String getAllCollection()
	{
		Userinfo userinfo=(Userinfo) request.getSession().getAttribute("userinfo");
		if(userinfo==null)
		{
			return "请先登录";
		}else{
			int page =  Integer.parseInt(request.getParameter("page")); //page
			String json=appGoodsService.getAllCollection(userinfo,page);
			return json;
		}
	}
	/**
	 * 删除收藏商品
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(params="p=deleteCollGoods")
	public String deleteCollGoods(HttpServletResponse response) throws IOException
	{
		int id = Integer.parseInt(request.getParameter("coid")); //收藏商品ID
		boolean f=appGoodsService.deleteCollGoods(id);
		if(f)
			response.getWriter().print(true);
		else
			response.getWriter().print(false);
		return null;
	}
	/**
	 * 查看该会员是否已经收藏该商品
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(params="p=findByIdColl")
	public String findByIdColl() throws IOException
	{
		int userid=Integer.parseInt(request.getParameter("userid"));
		int gid=Integer.parseInt(request.getParameter("gid"));
		String json=appGoodsService.findByIdColl(userid,gid);
		return json;
	}
	//取消收藏
	@ResponseBody
	@RequestMapping(params="p=deleteColl")
	public String deleteColl()
	{
		int userid=Integer.parseInt(request.getParameter("userid"));
		int gid=Integer.parseInt(request.getParameter("gid"));
		appGoodsService.deleteColl(userid,gid);
		return "成功";
	}
	
	/**
	 *  收藏商品
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=addCollection")
	public String addCollection()
	{
		int userid=Integer.parseInt(request.getParameter("userid"));
		int gid=Integer.parseInt(request.getParameter("gid"));
		appGoodsService.addCollection(userid,gid);
		return "成功";
	}
	/**
	 * 加入购物车
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=addCat")
	public String addCat()
	{
		int userid=Integer.parseInt(request.getParameter("userid"));
		int gid=Integer.parseInt(request.getParameter("gid"));
		int catnum=Integer.parseInt(request.getParameter("catnum"));
		String str=appGoodsService.addCat(userid,gid,catnum);
		return str;
	}
	//购物车数量
	@ResponseBody
	@RequestMapping(params="p=catNumber")
	public String catNumber()
	{
		int userid=Integer.parseInt(request.getParameter("userid"));
		String json=appGoodsService.catNumber(userid);
		return json;
	}
	/**
	 * 得到收货地址信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=getAllAddressAndGoods")
	public String getAllAddressAndGoods()
	{
		int userid=Integer.parseInt(request.getParameter("userid")); //会员ID
		Address address=appCatService.findByUidAddress(userid);		//查看有没有默认的地址
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		Map map=new HashMap();
		map.put("address", address);
		JSONObject obj=new JSONObject();
		obj.putAll(map, config);
		String json=obj.toString();
		return json;
	}
	/**
	 * 众筹商品 修改商品购买数量
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=editZcGoodsNum")
	public String editZcGoodsNum()
	{
		int gid=0;
		int num=0;
		int orid=0;
		String viewid=request.getParameter("viewid");
		if(viewid.equals("crowdfunding-order.html"))
		{
			gid=Integer.parseInt(request.getParameter("gid"));
			num=Integer.parseInt(request.getParameter("num"));
			appGoodsService.editZcGoodsNum(gid,num,viewid);
		}else if (viewid.equals("submit-order")){
			System.out.println("laile");
			String goodid[]=request.getParameterValues("goodid[]");
			String gnum[]=request.getParameterValues("gnum[]");
			String cid=null;
			String gonum=null;
			for (int i = 0; i < goodid.length; i++) {
				cid=goodid[i].toString();
					gonum=gnum[i].toString();
					appGoodsService.editZcGoodsNum(Integer.parseInt(cid),Integer.parseInt(gonum),viewid);
			}
		}else{
			orid=Integer.parseInt(request.getParameter("orid"));
			List<Goodsorderdetail> list=appGoodsService.getAllOrderdetail(orid);
			for (Goodsorderdetail g : list) {
				num=g.getOdNum();
				gid=g.getGoods().getGid();
				appGoodsService.editZcGoodsNum(gid,num,viewid);
			}
		}
		return "成功";
	}
	/**
	 * 根据商品名字查找商品
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=getGoodsId")
	public String getGoodsId()
	{
		String gname = request.getParameter("gname");
		String json = appGoodsService.getGoodsId(gname);
		return json;
	}
}
