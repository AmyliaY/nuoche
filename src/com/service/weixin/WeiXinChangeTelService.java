package com.service.weixin;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.SmsDAO;
import com.dao.UserDAO;
import com.pojo.Sms;
import com.pojo.User;

@Service
public class WeiXinChangeTelService {
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private SmsDAO smsDAO;
	

	public User getUser(String openid) {
		String hql = "from User where weixinUser.openid=?";
		List<User> list = hqlDAO.pageQuery(hql,1,1,openid);
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}


	/**
	 * 保存验证码到数据库
	 * @param code
	 * @param tel
	 */
	public void saveCode(String code, String tel) {
		Date date=new Date();
		// 设置验证码发送时间
		Timestamp settime=new Timestamp(date.getTime());
		// 设置验证码的生命周期  10分钟
		Timestamp outtime = new Timestamp(date.getTime()+600000);
		//  验证码使用状态   0 ：可用  1 ：已用
		Short status = 0;
		Sms sms = new Sms();
		sms.setTime(settime);
		sms.setOverdue(outtime);
		sms.setIdcode(code);
		sms.setPhone(tel);
		sms.setStatus(status);
		smsDAO.save(sms);
	}


	/**
	 * 保存电话号码
	 * @param newtel
	 */
	public void saveTel(String openid, String newtel) {
		User user = getUser(openid);
		if(null == user){
			return;
		}
		user.setTel(newtel);
		userDAO.merge(user);
	}


	

}
