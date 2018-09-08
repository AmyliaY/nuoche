package com.service.back;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.jruby.ast.BeginNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.pojo.Goodsorders;
import com.util.SmsUtil;

@Service
public class TongjiService {
	@Autowired
	private HqlDAO hqlDAO;
	
	public Map tongjilisting(String daydate, String monthone, String monthlast) {
		String userhqlsum="select count(*) from Userinfo";	//总共有多少个会员
		int usersum=(int) hqlDAO.unique(userhqlsum);
		
		String userday="select count(*) from Userinfo where usersCreatetime>=? and usersCreatetime<=?";	//今日总共注册多少个会员
		int udsum=(int) hqlDAO.unique(userday, Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		//本月总共注册多少个会员
		String usermonth="select count(*) from Userinfo where usersCreatetime>=? and usersCreatetime<=?";
		int usermonthsum=(int) hqlDAO.unique(usermonth, Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		
		int msg=SmsUtil.getMessageCount();		//会员注册剩余短信通知总条数
		
		String orderhqlsum="select count(*) from Goodsorders where orStatus=?";	
		int ordersum=(int) hqlDAO.unique(orderhqlsum, 1);		//总订单数  已付款的
		int daiordersum=(int) hqlDAO.unique(orderhqlsum, 2);	//总订单数  代发货的
		//今日下订单总数量  已付款的
		String orderday="select count(*) from Goodsorders where orStatus=? and orTime>=? and orTime<=?";
		int odsum=(int) hqlDAO.unique(orderday, 1,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		int daiodsum=(int) hqlDAO.unique(orderday, 2,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		//本月下订单总数量 已付款的
		String ordermonth="select count(*) from Goodsorders where orStatus=? and orTime>=? and orTime<=?";
		int ordermonthsum=(int) hqlDAO.unique(ordermonth, 1,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		int daiomsum= (int) hqlDAO.unique(ordermonth, 2,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		// 订单总金额
		String hqlmoneysum="from Goodsorders where orStatus=?";
		List<Goodsorders> mslist=hqlDAO.query(hqlmoneysum, 1);
		Double moneysum=0.0;
		for(Goodsorders goodsorders:mslist)
		{
			Double n=goodsorders.getOrPrice();
			BigDecimal db=new BigDecimal(Double.toString(n));
			BigDecimal bd=new BigDecimal(Double.toString(moneysum));
			moneysum=db.add(bd).doubleValue();
		}
		// 今日订单总金额
		String hqlodmoney="from Goodsorders where orStatus=? and orTime>=? and orTime<=?";
		List<Goodsorders> odlist=hqlDAO.query(hqlodmoney, 1,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		Double odmoney=0.0;
		for(Goodsorders goodsorders:odlist)
		{
			Double n = goodsorders.getOrPrice();
			BigDecimal db= new BigDecimal(Double.toString(n));
			BigDecimal bd = new BigDecimal(Double.toString(odmoney));
			odmoney=db.add(bd).doubleValue();
		}
		
		// 本月订单总金额
		String hqlmmoney="from Goodsorders where orStatus=? and orTime>=? and orTime<=?";
		List<Goodsorders> mmlist=hqlDAO.query(hqlmmoney, 1,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		Double mmoney=0.0;
		for(Goodsorders goodsorders:mmlist)
		{
			Double n=goodsorders.getOrPrice();
			BigDecimal bd = new BigDecimal(Double.toString(n));
			BigDecimal db = new BigDecimal(Double.toString(mmoney));
			mmoney=db.add(bd).doubleValue();
		}
		
		Map map=new HashMap();
		map.put("usersum", usersum);
		map.put("msg", msg);
		map.put("ordersum", ordersum);
		map.put("udsum", udsum);
		map.put("odsum", odsum);
		map.put("usermonthsum", usermonthsum);
		map.put("ordermonthsum", ordermonthsum);
		map.put("daiordersum", daiordersum);
		map.put("daiodsum", daiodsum);
		map.put("daiomsum", daiomsum);
		map.put("moneysum", moneysum);
		map.put("mmoney", mmoney);
		map.put("odmoney", odmoney)
;		return map;
	}

}
