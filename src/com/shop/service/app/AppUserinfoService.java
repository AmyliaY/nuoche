package com.shop.service.app;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.registry.infomodel.User;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserinfoDAO;
import com.pojo.Userinfo;
import com.qq.connect.api.qzone.UserInfo;
import com.util.JsonFilter;

@Service
public class AppUserinfoService {
	@Autowired
	private UserinfoDAO userinfoDAO;
	public boolean checkPayPassword(int userid) {
		Userinfo userinfo=userinfoDAO.findById(userid);
		String paypwd=null;
		if(userinfo!=null)
			paypwd=userinfo.getUsersPaypwd();
		if(paypwd==null)
		{
			return false;
		}
		return true;
	}
	public boolean setzhifumima(int userid, String paypwd) {
		Userinfo userinfo=userinfoDAO.findById(userid);
		if(userinfo!=null){
			userinfo.setUsersPaypwd(paypwd);
			userinfoDAO.save(userinfo);
			return true;
		}
		return false;
	}
	public String getMytuijianren(int userid) {
		Userinfo userinfo=userinfoDAO.findById(userid);
		List list=userinfoDAO.findByUsersPhone(userinfo.getUsersReferrer());
		Map<String , Object> map=new HashMap<String,Object>();
		map.put("list", list);
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		net.sf.json.JSONObject obj =new net.sf.json.JSONObject();
		obj.putAll(map, config);
		String json=obj.toString();
		return json;
	}
	public String updMytuijianren(String phone, int userid) {
		List list=userinfoDAO.findByUsersPhone(phone);//推荐人
		Userinfo user=userinfoDAO.findById(userid);//用户
		if(list!=null){
			user.setUsersReferrer(phone);
			userinfoDAO.save(user);
			Map map=new HashMap();
			map.put("user", user);
			JsonConfig config=new JsonConfig();
			JsonFilter.ignoredSet(config);
			String json=com.alibaba.fastjson.JSONObject.toJSONString(map);
			return json;
		}
		return "该用户不存在";
	}
	public String getXiaxian(int userid) {
		Userinfo userinfo=userinfoDAO.findById(userid);
		List list=userinfoDAO.findByUsersReferrer(userinfo.getUsersPhone());
		Map map=new HashMap();
		map.put("list", list);
		map.put("count", list.size());
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		net.sf.json.JSONObject obj =new net.sf.json.JSONObject();
		obj.putAll(map, config);
		String json=obj.toString();
		return json;
	}
	public String getUser(int userid) {
		Userinfo userinfo=userinfoDAO.findById(userid);
		Map map=new HashMap();
		map.put("userinfo", userinfo);
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		net.sf.json.JSONObject obj =new net.sf.json.JSONObject();
		obj.putAll(map, config);
		String json=obj.toString();
		return json;
	}
	public String updUsername(int userid, String username) {
		//判断用户名是否存在
		List list = userinfoDAO.findByUsersName(username);
		if(list.size()>0){
			return "exist";
		}
		Userinfo userinfo = userinfoDAO.findById(userid);
		userinfo.setUsersName(username);
		return "success";
	}

}
