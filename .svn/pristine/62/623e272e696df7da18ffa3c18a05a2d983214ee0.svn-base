package com.service.wap;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.allinfinance.ets.client.util.StringUtil;
import com.dao.BusinessDAO;
import com.dao.HqlDAO;
import com.dao.ServiceDAO;
import com.dao.ServiceTypeDAO;
import com.pojo.Business;
import com.pojo.ServiceType;
import com.util.JsonFilter;

@Service("wapservice")
public class Wapservice {
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private BusinessDAO businessDAO;
	@Autowired
	private ServiceDAO serviceDAO;
	
	@Autowired
	private ServiceTypeDAO serviceTypeDAO;
//	@Autowired
//	private CarouselimagesDAO imagesdao;
//	@Autowired
//	private ShoptypeDAO shoptypedao;
//	@Autowired
//	private ShopDAO shopdao;
	//查所有商品
//	public String findAllGoods(){
//		String hql="from Business";
//		List<Business> list = hqlDAO.findByHQL(hql);
//		JsonConfig config=new JsonConfig();
//		JsonFilter.ignoredSet(config);
//		String json=JSONArray.fromObject(list, config).toString();
//		return json;
//	}
//	//查所有轮播图
//	public String findAlllbt(){
//		List list=imagesdao.findAll();
//		JsonConfig config=new JsonConfig();
//		JsonFilter.ignoredSet(config);
//		Map map =new HashMap();
//		map.put("list", list);
//		JSONObject obj=new JSONObject();
//		obj.putAll(map, config);
//		String json=obj.toString();
//		return json;
//	}
	//查所有店铺类别
	public String findAllshopcategory(){
		List list =serviceTypeDAO.findAll();
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		Map map =new HashMap();
		map.put("list", list);
		JSONObject obj=new JSONObject();
		obj.putAll(map, config);
		String json=obj.toString();
		return json;
	}
//	//查所有店铺信息
//	public String findAllshop(){
//		List<Shop> list =shopdao.findAll();
//		JsonConfig config=new JsonConfig();
//		JsonFilter.ignoredSet(config);
//		Map map =new HashMap();
//		map.put("list", list);
//		JSONObject obj=new JSONObject();
//		obj.putAll(map, config);
//		String json=obj.toString();
//		return json;
//	}
	//根据信息查店铺

	public String findtjshop(int typeid,String name,String addressname, String shi, String qu, int page, int size){
		ServiceType serviceType = serviceTypeDAO.findById(typeid);
		StringBuffer sb=new StringBuffer("where 1=1 ");
		List paramlist=new ArrayList();
		if(serviceType!=null)
		{
			sb.append(" and shoptype like ?");
			paramlist.add("%"+serviceType.getName()+"%");
		}
		if (name!=null && name.length()>0) {
			sb.append(" and shopname like ?");
			paramlist.add("%"+name+"%");
		}
//		if (addressname!=null && addressname.length()>0 && "null".equals(addressname)==false) {
//			System.out.println(addressname);
//			if(addressname.equals("全城") || "地区".equals(addressname)){
//				
//			}else{
//				sb.append(" and shopaddress like ?");
//				paramlist.add("%"+addressname+"%");
//			}	
//		}
		if (qu!=null && qu.length()>0 && "null".equals(qu)==false)
		{
			sb.append(" and area.arName like  ?");
			paramlist.add("%"+qu+"%");
		}
		else if (shi!=null && shi.length()>0 && "null".equals(shi)==false && "全城".equals(shi)==false && "地区".equals(shi)==false)
		{
			sb.append(" and area.city.ctName  like ? ");
			System.out.println("市:"+shi);
			paramlist.add("%"+shi.trim()+"%");
		}
		
		String hql="from Business "+sb;
		System.out.println(hql);
		List list=hqlDAO.pageQuery(hql, size, page, paramlist.toArray());
		System.out.println("page:"+page+"/t"+"size:"+size);
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		Map map =new HashMap();
		map.put("list", list);
		JSONObject obj=new JSONObject();
		obj.putAll(map, config);
		String json=obj.toString();
		System.out.println(json);
		return json;
	}
	//根据id查店铺信息
	public Business Toshopdetails(String id){
		int sid=Integer.parseInt(id);
		Business business=businessDAO.findById(sid);
		return business;
	}
	public List<com.pojo.Service> getSetviceById(String id) {
		String hql="from Service where business.id=?";
		int sid=Integer.parseInt(id);
		List<com.pojo.Service> list = hqlDAO.findByHQL(hql,sid);
		return list;
	}

}
