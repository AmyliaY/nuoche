package com.service.weixin;

import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.action.WeinxinIndexAction;
import com.dao.HqlDAO;
import com.dao.ServiceDAO;
import com.dao.UserDAO;
import com.dao.WeixinUserDAO;
import com.dao.YuyueDAO;
import com.pojo.User;
import com.pojo.WeixinUser;
import com.pojo.Yuyue;

@Service
public class WeixinFuwuYuyueService {

	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private ServiceDAO serviceDAO;
	@Autowired
	private WeixinUserDAO weixinUserDAO;
	@Autowired
	private YuyueDAO yuyueDAO;
	@Autowired
	private UserDAO userDAO;
	
	

	public com.pojo.Service findServiceByid(int fuwuid) {
		com.pojo.Service service = serviceDAO.findById(fuwuid);
		return service;
	}


	public String getOrderid() {
		String dingdanhao = null;
		dingdanhao = UUID.randomUUID().toString().replaceAll("-", "");
		//   取20位订单号
		//dingdanhao = idd[0]+idd[4];
		return dingdanhao;
	}


	public Yuyue createYuyueOrder(int fuwuid, String buyerComment, String openid, String pay, String orderWx) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		com.pojo.Service service = findServiceByid(fuwuid);
		String hql = "from WeixinUser where openid=?";
		List<WeixinUser> list = hqlDAO.findByHQL(hql, openid);
		WeixinUser user = list.get(0);
		Yuyue yuyue = new Yuyue();
		yuyue.setService(service);
		yuyue.setCreated(timestamp);
		yuyue.setOrderWx(orderWx);
		yuyue.setPay(Double.parseDouble(pay));
		yuyue.setBuyerComment(buyerComment);
		yuyue.setUser(user);
		yuyue.setPayType((short)1);
		yuyue.setStatus((short)0);
		yuyueDAO.save(yuyue);
		return yuyue;
	}


	public void cancelYuyueOrder(int yuyueid) {
		String hql = "delete from Yuyue where id=?";
		hqlDAO.zsg(hql, yuyueid);
	}


	public Yuyue findYuyueByid(int yuyueid) {
		Yuyue yuyue = yuyueDAO.findById(yuyueid);
		return yuyue;
	}


	public Yuyue updateStatusByOrderid(String trade_no) {
		//  付款时间
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		Yuyue yuyue =  (Yuyue) yuyueDAO.findByOrderWx(trade_no).get(0);
		yuyue.setStatus((short)1);
		yuyue.setTime(timestamp);
		yuyueDAO.save(yuyue);
		return yuyue;
	}


	public WeixinUser getWeixinUser(String openid) {
		WeixinUser weixinUser = weixinUserDAO.findById(openid);
		return weixinUser;
	}


	public void updateWeixinUserTel(WeixinUser weixinUser, String wxtel) {
		weixinUser.setWxtel(wxtel);
		weixinUserDAO.merge(weixinUser);
	}
	
	public User getUserByWXuser(String openid){
		String hql = "from User where weixinUser.openid = ?";
		List<User> list= hqlDAO.query(hql, openid);
		if(list.size()>0){
			User user = (User)list.get(0);
			return user;
		}
		else
			return null;
		
	}


	
	
}
