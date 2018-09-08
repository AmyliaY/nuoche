package com.service.daili;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SmsDAO;
import com.pojo.Sms;

/**
 * pc端 后台管理管理-代理手机验证码
 * @author 唐仁鑫
 * 2018.3.24
 *
 */
@Service
public class DailiSmsService {
	
	@Autowired
	private SmsDAO smsDAO;

	public void saveCode(String code, String dl_tel) {
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
		sms.setPhone(dl_tel);
		sms.setStatus(status);
		smsDAO.save(sms);
	}
	public static void main(String[] args) {
		Date date=new Date();
		System.out.println(date);
		Timestamp time=new Timestamp(date.getTime());
		Timestamp time2 = new Timestamp(date.getTime()+600000);
		System.out.println(date.getTime() < time2.getTime());
		System.out.println(time.getTime()+"\t"+time2.getTime());
		System.out.println(time);
		System.out.println(time2);
	}
	public boolean testYzm(String yzm, String dl_tel) {
		List<Sms> list =  smsDAO.findByPhone(dl_tel);
		if(list.size()>0)
		{
			Date datenow = new Date();
			Sms sms = list.get(list.size()-1);
			if(datenow.getTime() <= sms.getOverdue().getTime()&& yzm.equals(sms.getIdcode()))
			{
				//System.out.println("后台验证成功");
				sms.setStatus((short)1);
				return true;
			}
			else
				return false;
		}
		return false;
	}
	public boolean testYzm(String daili_tel) {
	//	System.out.println("来了");
		List<Sms> list =  smsDAO.findByPhone(daili_tel);
		Sms sms1 = list.get(list.size()-1);
		System.out.println("zuizhong"+sms1.getIdcode()+"\t"+sms1.getOverdue());
		if(sms1.getStatus()!=0)
		{
			return true;
		}
		return false;
	}
}
