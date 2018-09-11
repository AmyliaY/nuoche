package com.service.weixin;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.UserDAO;
import com.dao.UserxufeiDAO;
import com.dao.WeixinUserDAO;
import com.pojo.User;
import com.pojo.Userxufei;
import com.pojo.WeixinUser;

@Service
public class WeiXinUserXufeiService {
	
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	UserDAO userDAO;
	@Autowired
	WeixinUserDAO weixinUserDAO;
	@Autowired
	UserxufeiDAO userxufeiDAO;
	
	public String getOrderId() {
		String orderid = null;
		orderid = UUID.randomUUID().toString().replaceAll("-", "");
		return orderid;
	}

	public void updateOverdueTime(String openid, String xufeiyear) {
		//  根据openID查找到user
		String hql = "from User where weixinUser.openid=?";
		List list = hqlDAO.findByHQL(hql, openid);
		User user = (User) list.get(0);
		Timestamp time =  user.getOverdueTime();
		Calendar c = Calendar.getInstance();
		c.setTime(time);
		c.add(Calendar.YEAR,Integer.parseInt(xufeiyear));   // 加一年
		//   年限增加后的时间
		Timestamp time1 = new Timestamp(c.getTimeInMillis());
		user.setOverdueTime(time1);
		userDAO.merge(user);
	}

	public int addUserxufei(String openid, double fee, String orderid) {
		String hql = "from User where weixinUser.id = ?";
		User user = (User) hqlDAO.findByHQL(hql, openid).get(0);
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		Userxufei userxufei =new Userxufei();
		userxufei.setFee(fee);
		userxufei.setUser(user);
		userxufei.setOrderid(orderid);
		userxufei.setTime(timestamp);
		userxufei.setStatus((short)0);
		userxufeiDAO.save(userxufei);
		return userxufei.getId();
	}

	public void updateUserxufeiStatus(String userxufeiid) {
		int id = Integer.parseInt(userxufeiid);
		Userxufei userxufei =userxufeiDAO.findById(id);
		userxufei.setStatus((short)1);
		userxufeiDAO.save(userxufei);
	}
}
