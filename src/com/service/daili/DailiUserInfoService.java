package com.service.daili;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AdminDAO;
import com.dao.AreaDAO;
import com.dao.CityDAO;
import com.dao.HqlDAO;
import com.dao.ProvinceDAO;
import com.dao.ProxyDAO;
import com.pojo.Admin;
import com.pojo.Area;
import com.pojo.City;
import com.pojo.Province;
import com.pojo.Proxy;
import com.util.JsonFilter;
import com.util.MD5Util;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

/**
 * 后台管理 管理
 * 
 * @author 唐仁鑫 2018.3.20
 * 
 */

@Service
public class DailiUserInfoService {

	@Autowired
	private HqlDAO hqldao;

	@Autowired
	private ProxyDAO proxyDAO;
	@Autowired
	private AreaDAO areaDAO;
	@Autowired
	private ProvinceDAO provinceDAO;

	public Proxy FindUserInfoByid(int id) {
		Proxy proxy = proxyDAO.findById(id);
		return proxy;
	}
//  代理修改个人信息
	public Proxy UpdateUserInfoByid(int id, String daili_birthday, int daili_arid, String daili_tel) {
		Proxy proxy = proxyDAO.findById(id);
		//City city = cityDAO.findById(daili_city);
		Area area = areaDAO.findById(daili_arid);
		proxy.setBirthday(daili_birthday);
		proxy.setArea(area);
		proxy.setTel(daili_tel);
		proxyDAO.merge(proxy);
		Proxy proxy1 = proxyDAO.findById(id);
		return proxy1;
	}
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
	public List findBydl_tel(String dl_tel) {
		List list = proxyDAO.findByTel(dl_tel);
		return list;
	}
	public Proxy UpdateUserInfoByid(int id, String birthday, int daili_arid) {
		Proxy proxy = proxyDAO.findById(id);
		Area area = areaDAO.findById(daili_arid);
		proxy.setBirthday(birthday);
		proxy.setArea(area);
		proxyDAO.merge(proxy);
		Proxy proxy1 = proxyDAO.findById(id);
		return proxy1;
	}
	public int FindZiDailiById(int id) {
		String hql="select count(*) from Proxy where parentId=?";
		int num=(int) hqldao.unique(hql, id);
		return num;
	}
	
	

}
