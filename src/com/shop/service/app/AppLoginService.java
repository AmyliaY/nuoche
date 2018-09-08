package com.shop.service.app;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AreaDAO;
import com.dao.CityDAO;
import com.dao.HqlDAO;
import com.dao.UserinfoDAO;
import com.pojo.Area;
import com.pojo.Userinfo;
import com.util.JsonFilter;

@Service
public class AppLoginService {
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private UserinfoDAO userinfoDAO;
	@Autowired
	private com.dao.ProvinceDAO proviceDAO;
	@Autowired
	private CityDAO cityDAO;
	@Autowired
	private AreaDAO areaDAO;
	
	
	
	public Userinfo applogin(String username, String userpwd) {
		String hql="from Userinfo where usersPhone=? and usersPassword=?";
		List list=hqlDAO.query(hql, username,userpwd);
		if(list.size()>0){
			Userinfo userinfo=(Userinfo) list.get(0);
			return userinfo;
		}
		return null;
	}
	public boolean uploadHeadimg(int id, String newHeadimg) {
		Userinfo userinfo=userinfoDAO.findById(id);
		if(userinfo!=null){
			userinfo.setUsersHeadimg("/admin/images/tx/"+newHeadimg);
			System.out.println(userinfo.getUsersHeadimg());
			userinfoDAO.save(userinfo);
			return true;
		}
		return false;
		
	}
	
	

		
		
		public List getSheng(){
			String hql="from Provice";
			List list=hqlDAO.query(hql);
			return list;
		}
		// 根据省份ID查询市并转为json字符串
		public String getShi(int provinceID) {
			String hql="from City where province.prId=?";
			List list =hqlDAO.query(hql, provinceID);
			JsonConfig jsonConfig=new JsonConfig();
			JsonFilter.ignoredSet(jsonConfig);
			// 转为json字符串
			String json = JSONArray.fromObject(list,jsonConfig).toString();
			return json;
		}

		// 根据市id查询出县并转为json字符串
		public String getXian(int cityID) {
			String hql="from Area where city.ctId=?";
			List list =hqlDAO.query(hql, cityID);
			JsonConfig jsonConfig=new JsonConfig();
			JsonFilter.ignoredSet(jsonConfig);
			// 转为json字符串
			String json = JSONArray.fromObject(list,jsonConfig).toString();
			return json;
		}
		// 得到所有省份并装为json字符串
		public String getSheng2() {
			List list =proviceDAO.findAll();
			// 转json字符串
			JsonConfig jsonConfig=new JsonConfig();//建立配置文件
			//jsonConfig.setIgnoreDefaultExcludes(false);
		    JsonFilter.ignoredSet(jsonConfig);
			//jsonConfig.setExcludes(new String[]{"cities"});//忽略cities字段
			String json = JSONArray.fromObject(list,jsonConfig).toString();//加载配置文件
			return json;
		}
		public List gettype(){
			String hql="from Shoptype";
			List list=hqlDAO.query(hql);
			return list;
		}
		public String getAreaNameById(String xianid)
		{
			Area area=areaDAO.findById(Integer.parseInt(xianid));
			if (area!=null)
				return area.getCity().getCtName();
			
			return "";
		}
		
		
}
