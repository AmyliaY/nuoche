package com.shop.service.app;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.dao.HqlDAO;
import com.dao.ShoppingcatDAO;
import com.pojo.Address;
import com.pojo.Shoppingcat;
import com.util.JsonFilter;

@Service
public class AppCatService {
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private ShoppingcatDAO shoppingcatDAO;
	public String getAllCat(int userid) {
		String hqlsum="select count(*) from Shoppingcat where userinfo.usersId=?";
		int sum=(int) hqlDAO.unique(hqlsum, userid);
		System.out.println(sum);
		String hql="from Shoppingcat where userinfo.usersId=?";
		List list=hqlDAO.findByHQL(hql, userid);
		Map map=new HashMap();
		map.put("sum", sum);
		map.put("list", list);
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		net.sf.json.JSONObject obj=new net.sf.json.JSONObject();
		obj.putAll(map,config);
		String json=obj.toString();
		return json;
	}

	public Shoppingcat findByIdCat(String str) {
		Shoppingcat shoppingcat=shoppingcatDAO.findById(Integer.parseInt(str));
		return shoppingcat;
		
	}

	public float getSumById(String str) {
		Shoppingcat cat=shoppingcatDAO.findById(Integer.parseInt(str));
		int num=cat.getScatNum();
		Double price=0.00;
		if(cat.getUserinfo().getUsersType()==1)
			price=cat.getGoods().getGvipprice();
		else
			price=cat.getGoods().getGprice();
		return (float) (price*num);
	}

	public Address findByUidAddress(int userid) {
		String hql="from Address where userinfo.usersId=? and adStatus=?";
		List<Address> list=hqlDAO.findByHQL(hql, userid,1);
		List list2=null;
		Address address=new Address();
		if(list.size()>0){
			 address=list.get(0);
		}else{
			String hqladd="from Address where userinfo.usersId=?";
				list2=hqlDAO.findByHQL(hqladd, userid);
			if(list2.size()>0)
				address=(Address) list2.get(0);
			else{
				return null;
			}
		}	
		return address;
	}

	public Shoppingcat editCatNum(int catid, int type) {
		Shoppingcat cat=shoppingcatDAO.findById(catid);
		if(cat!=null)
			if(type==1)
				cat.setScatNum(cat.getScatNum()-1);
			else
				cat.setScatNum(cat.getScatNum()+1);
			shoppingcatDAO.save(cat);
		return cat;
	}

	public Shoppingcat editCatSetNum(int catid, int catnum) {
		Shoppingcat cat=shoppingcatDAO.findById(catid);
		if(cat!=null)
			cat.setScatNum(catnum);
			shoppingcatDAO.save(cat);
		return cat;
	}

	public void deleteCat(String catid) {
		Shoppingcat shoppingcat=shoppingcatDAO.findById(Integer.parseInt(catid));
		if(shoppingcat!=null)
			shoppingcatDAO.delete(shoppingcat);
		
	}

	public String getAllZitiAddress() {
		String hql="from Zitiaddress";
		List list=hqlDAO.query(hql);
		System.out.println(list.size());
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json=JSONArray.fromObject(list, config).toString();
		return json;
	}

}
