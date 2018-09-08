package com.service.weixin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.UserDAO;
import com.dao.WeixinUserDAO;
import com.pojo.User;
import com.pojo.WeixinUser;

@Service
public class WeixinPersonCenterService {

	@Autowired
	private WeixinUserDAO weixinUserDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private HqlDAO hqlDAO;
	
	
	public WeixinUser getWeixinUser(String weixinhao) {
		WeixinUser weixinUser = weixinUserDAO.findById(weixinhao);
		if(weixinUser != null){
			return weixinUser;
		}
		return null;
	}
	
	public User getUser(String weixinhao) {
		String hql ="from User u join fetch u.weixinUser  w where w.openid=?";
		List<User> list = hqlDAO.pageQuery(hql, 1, 1 ,weixinhao);
		if (list.size()>0)
			return list.get(0);
		return null;
	}
	
	
	
}
