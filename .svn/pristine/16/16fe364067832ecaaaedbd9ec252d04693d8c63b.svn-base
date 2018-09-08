package com.service.weixin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AreaDAO;
import com.dao.HqlDAO;
import com.dao.ProvinceDAO;
import com.dao.ProxyDAO;
import com.pojo.Province;
import com.util.JsonFilter;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

/**
 * 微信  省市级联
 * 
 * @author 唐仁鑫 2018.3.20
 * 
 */

@Service
public class WeiXinAddressService {
	@Autowired
	private HqlDAO hqldao;
	@Autowired
	private ProvinceDAO provinceDAO;
	
	
	public String findByidCity(int prid) {
		String hql="from City c where c.province.prId=?";
		List list=hqldao.findByHQL(hql,prid);
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json=JSONArray.fromObject(list, config).toString();
		return json;
	}
	public String findByIdArea(int crid) {
		String hql="from Area  a where a.city.ctId=?";
		List list=hqldao.findByHQL(hql, crid);
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json=JSONArray.fromObject(list, config).toString();
		return json;
	}
	public List<Province> FindProvinceAll() {
		List<Province> plist = provinceDAO.findAll();
		return plist;
	}

}
