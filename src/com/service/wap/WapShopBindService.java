package com.service.wap;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BusinessDAO;
import com.dao.HqlDAO;
import com.dao.SmsDAO;
import com.dao.UserDAO;
import com.dao.WeixinUserDAO;
import com.pojo.Business;
import com.pojo.Sms;
import com.pojo.User;
import com.pojo.WeixinUser;

@Service
public class WapShopBindService {
	@Autowired
	private WeixinUserDAO weixinUserDAO;
	@Autowired
	private BusinessDAO businessDAO;
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private SmsDAO smsDAO;
	
/**
 * 将微信号存入商家表中
 * @param tel
 * @param openid
 */
	
	public Business bindBusiness(String tel,String openid) {
		String hql = "from Business where tel=?";
		List<Business> list = hqlDAO.query(hql, tel);
		if(list.size()>0 && list.get(0).getStatus()!=0){
			//System.out.println("存微信号");
			Business business = list.get(0);
			business.setOpenid(openid);
			businessDAO.save(business);
			return business;
		}
		else
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
}
