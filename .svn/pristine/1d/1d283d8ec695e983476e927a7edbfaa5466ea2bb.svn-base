package com.shop.service.app;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AdminDAO;
import com.dao.HqlDAO;
import com.dao.UamessagesDAO;
import com.dao.UserinfoDAO;
import com.pojo.Uamessages;
import com.pojo.Userinfo;
import com.util.JsonFilter;

@Service
public class AppUamessagesService {
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private UamessagesDAO uamessagesDAO;
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private UserinfoDAO userinfoDAO;
	
	
	
	/**
	 * 返送时间
	 * @return
	 */
	public String getLastTime(int userid){
		
		String hql  = "select max(meid) from Uamessages where usersId=? and mefangxiang = ? and smdetail like ?  ";
		int id = (int) hqlDAO.unique(hql, userid,1,":time%");
		
		
		Uamessages uamessages = uamessagesDAO.findById(id);
		
		if(uamessages == null){
			return null;
		}
		return uamessages.getSmdetail();
	}
	
	public String getAll(int userid) {
		String hql="from Uamessages where usersId=? order by metime";
		List list=hqlDAO.findByHQL(hql, userid);
		Map<String , Object> map=new HashMap<String,Object>();	//存进Map里面
		map.put("list", list);
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		net.sf.json.JSONObject obj =new net.sf.json.JSONObject();
		obj.putAll(map, config);
		String json=obj.toString();
		return json;
	}
	public void addMessage(int userid, String smdetail, Timestamp metime) {
		Uamessages uamessages=new Uamessages();
		//uamessages.setAdmin(adminDAO.findById(adminid));
		uamessages.setMefangxiang(1);
		uamessages.setMestatus(0);
		uamessages.setMetime(metime);
		System.out.println(smdetail+":test");
		uamessages.setSmdetail(smdetail);
		uamessages.setUserinfo(userinfoDAO.findById(userid));
		uamessagesDAO.save(uamessages);
	}
	public void updStatus(int meid) {
		Uamessages uamessages=uamessagesDAO.findById(meid);
		uamessages.setMestatus(1);
		uamessagesDAO.save(uamessages);
	}
	public String getadminmsg(int userid) {
		String hql="from Uamessages where usersId=? and mefangxiang=0 and mestatus=0";
		List list=hqlDAO.findByHQL(hql,userid);
		Map<String , Object> map=new HashMap<String,Object>();
		map.put("list", list);
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		net.sf.json.JSONObject obj =new net.sf.json.JSONObject();
		obj.putAll(map, config);
		String json=obj.toString();
		return json;
	}
}
