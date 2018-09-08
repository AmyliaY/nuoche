package com.service.admin;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;

@Service
public class TimeService {

	@Autowired
	private HqlDAO hqldao;

	@Scheduled(cron = "0 0 0 * * ?")
	public void go() {
		long x = System.currentTimeMillis();
		Timestamp now = new Timestamp(x);
		String hql5 = "update OldNew o set oguoqi = 1 where oguoqi = 0 and  UNIX_TIMESTAMP(?)- UNIX_TIMESTAMP(otime) > (timelimit-1)*24*3600  ";

		//hqldao.bulkUpdate(hql5, now);

		String hql2 = "update Vip set vdays=vdays+1 where vstatus = 1 ";

		hqldao.bulkUpdate(hql2);

		String hql3 = "update Vip set vstatus=-1 where vlimit-vxiaofei>0 and vdays%30=0 ";
		Object[] objs3 = new Object[0];
		hqldao.bulkUpdate(hql3, objs3);

		String hql4 = "update Vip set vxiaofei=0 where vlimit-vxiaofei<=0 and vdays%30=0 ";
		Object[] objs4 = new Object[0];
		hqldao.bulkUpdate(hql4, objs4);

//		Date end = new Date();
//		Properties prop = weixinIndexService.findProp("/hello.properties");
//
//		Date begin = getDateBefore(end, Integer.parseInt(prop
//				.getProperty("span")));
//
//		String hql = "select uweixin,uid from User u where not exists(select DISTINCT(user.uid) from GasDetail g where u.uid =  g.user.uid and g.gdtime > ?and g.gdtime < ? ) and not exists(select DISTINCT(userByNewid.uid) from OldNew o where u.uid = o.userByNewid.uid and o.otype = 3 and o.otime > ? and o.otime < ?)";
//		/*
//		 * and EXISTS(select DISTINCT(user.uid) from GasDetail g where u.uid =
//		 * g.user.uid and g.gdtime < ?) and
//		 */
//		List list = hqldao.findByHQL(hql, begin, end, begin, end);
//
//		if (list != null) {
//			float left = Float.parseFloat(prop.getProperty("bonuseleft"));
//			float right = Float.parseFloat(prop.getProperty("bonuseright"));
//			BigDecimal db = new BigDecimal(Math.random() * (right - left)
//					+ left);
//			int moneylimit = Integer.parseInt(prop.getProperty("moneylimit"));
//			int timelimit = Integer.parseInt(prop.getProperty("timelimit"));
//			float hongbao = db.setScale(2, BigDecimal.ROUND_HALF_UP)
//					.floatValue();
//			for (int i = 0; i < list.size(); i++) {
//				Object[] objs = new Object[2];
//				objs = (Object[]) list.get(i);
//				String[] str = new String[1];
//				str[0] = objs[1].toString();
//				int[] onid = userListService.sendHonbao(str, hongbao,
//						moneylimit, timelimit, 3);
//
//				weixinIndexService.sendMoney(objs[0].toString(), prop
//						.getProperty("greeting"), hongbao, moneylimit,
//						timelimit, str, onid[0], (float) moneylimit);
//
//			}
		//}
	}

	public Date getDateBefore(Date d, int day) {
		Calendar now = Calendar.getInstance();
		now.setTime(d);
		now.set(Calendar.DATE, now.get(Calendar.DATE) - day);
		return now.getTime();
	}

}
