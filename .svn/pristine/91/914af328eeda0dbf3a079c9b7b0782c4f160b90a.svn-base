package com.service.admin;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.action.JccsAction;
import com.dao.HqlDAO;
import com.pojo.Applydetail;
import com.pojo.Yuyue;
import com.util.SmsUtil;

@Service
public class MoneytongjiService {
	@Autowired
	private HqlDAO hqlDAO;
	
	public Map tongjilisting(String daydate, String monthone, String monthlast,String lunboprice,String topprice,String vipyuyueprice,String qrcodeProxyprice,String qrcodeprice) {
		String userhqlsum="select count(*) from User where overdue=?";	//总共有多少个会员
		int usersum=(int) hqlDAO.unique(userhqlsum,(short)2);
		
		String userday="select count(*) from User where  overdue=? and created>=? and created<=?";	//今日总共注册多少个会员
		int udsum=(int) hqlDAO.unique(userday,(short)2, Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		//本月总共注册多少个会员
		String usermonth="select count(*) from User where overdue=? and created>=? and created<=?";
		int usermonthsum=(int) hqlDAO.unique(usermonth, (short)2,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		
		
		
		String Userxufeisum="select SUM(fee) from Userxufei where status=?";	//所有会员总共成功充值的钱
		float xufeisum= hqlDAO.unique(Userxufeisum, (short)1);
		String daiUserxufeisum="select SUM(fee) from Userxufei where status=?";	//所有会员总共失败充值的钱
		float daixufeisum= hqlDAO.unique(daiUserxufeisum, (short)0);
		//今日下成功充值的钱
		String userxufeiday="select SUM(fee) from Userxufei where status=? and time>=? and time<=?";
		float cguserxufeisumday= hqlDAO.unique(userxufeiday, (short)1,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		
		//本月下成功充值的钱
		String userxufeimonth="select SUM(fee) from Userxufei where status=? and time>=? and time<=?";
		float cguserxufeimonthsum= hqlDAO.unique(userxufeimonth, (short)1,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		
		
		
		String proxychongzhisumhql="select SUM(fee) from Proxychongzhi where status=?";	//所有代理总共成功充值的钱
		float proxychongzhisum= hqlDAO.unique(proxychongzhisumhql, (short)1);
		String daiproxychongzhisumhql="select SUM(fee) from Proxychongzhi where status=?";	//所有代理总共失败充值的钱
		float daiproxychongzhisum=hqlDAO.unique(daiproxychongzhisumhql, (short)0);
		//今日下成功充值的钱
		String proxychongzhisumdayhql="select SUM(fee) from Proxychongzhi where status=? and time>=? and time<=?";
		float proxychongzhidaysum= hqlDAO.unique(proxychongzhisumdayhql, (short)1,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		//本月下成功充值的钱
		String proxychongzhisummonthhql="select SUM(fee) from Proxychongzhi where status=? and time>=? and time<=?";
		float proxychongzhimonthsum= hqlDAO.unique(proxychongzhisummonthhql, (short)1,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		
		
		
		
		
		String applyhqlsum="select SUM(totalFee) from Applydetail where status=?";	
		double applysum1=(double) hqlDAO.unique(applyhqlsum, (short)2);	//用户申请订单数  已付款的
		double daiapplysum=(double) hqlDAO.unique(applyhqlsum, (short)3);	//用户申请订单数    已发货的
		double shouapplysum=(double) hqlDAO.unique(applyhqlsum, (short)4);
		double applysum=applysum1+daiapplysum+shouapplysum;
		//今日下订单总数量  已付款的
		String applyday="select SUM(totalFee) from Applydetail where status=? and created>=? and created<=?";
		double applydaysum1=(double) hqlDAO.unique(applyday, (short)2,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		double daiapplydaysum=(double) hqlDAO.unique(applyday, (short)3,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		double shouapplydaysum=(double) hqlDAO.unique(applyday, (short)4,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		double applydaysum=applydaysum1+daiapplydaysum+daiapplydaysum;
		
		//本月下订单总数量 已付款的
		String applymonth="select SUM(totalFee) from Applydetail where status=? and created>=? and created<=?";
		double applymonthsum1=(double) hqlDAO.unique(applymonth, (short)2,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		double daioapplymonthsum= (double) hqlDAO.unique(applymonth, (short)3,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		double shouapplymonthsum= (double) hqlDAO.unique(applymonth, (short)4,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		double applymonthsum=applymonthsum1+daioapplymonthsum+shouapplymonthsum;
		
		
		
		
		
		
		
		String orderhqlsum="select SUM(pay) from Yuyue where status=?";	
		double ordersum= hqlDAO.unique(orderhqlsum, (short)1);	//总订单数  已付款的
		double daiordersum= hqlDAO.unique(orderhqlsum, (short)2);	//总订单数  已服务的
		//今日预约服务订单总数量  已付款的
		String orderday="select SUM(pay) from Yuyue where status=? and created>=? and created<=?";
		double odsum= hqlDAO.unique(orderday, (short)1,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		double daiodsum= hqlDAO.unique(orderday, (short)2,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		//本月预约服务订单总数量 已付款的
		String ordermonth="select SUM(pay) from Yuyue where status=? and created>=? and created<=?";
		double ordermonthsum= hqlDAO.unique(ordermonth, (short)1,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		double daiomsum=  hqlDAO.unique(ordermonth, (short)2,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		
		
		String vipcashhqlsum="select SUM(cash) from VipCash where status=?";	//所有会员总共成功提现的钱
		double vipcashsum=(double) hqlDAO.unique(vipcashhqlsum, (short)1);
		String proxycashhqlsum="select SUM(cash) from ProxyCash where status=?";	//所有代理总共成功提现的钱
		double proxycashsum=(double) hqlDAO.unique(proxycashhqlsum, (short)1);
		//今日下会员与代理成功提现的钱
		String vipcashhqldaysum="select SUM(cash) from VipCash where status=? and time>=? and time<=?";
		double vipcashdaysum=(double) hqlDAO.unique(vipcashhqldaysum, (short)1,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		String proxycashhqldaysum="select SUM(cash) from ProxyCash where status=? and time>=? and time<=?";
		double proxycashdaysum=(double) hqlDAO.unique(proxycashhqldaysum, (short)1,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		
		//本月下会员与代理成功提现的钱
		String vipcashhqlmonthsum="select SUM(cash) from VipCash where status=? and time>=? and time<=?";
		double vipcashmonthsum=(double) hqlDAO.unique(vipcashhqlmonthsum, (short)1,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		String proxycashhqlmonthsum="select SUM(cash) from ProxyCash where status=? and time>=? and time<=?";
		double proxycashmonthsum=(double) hqlDAO.unique(proxycashhqlmonthsum, (short)1,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		
		

		String proxyhqllingkasum ="select SUM(fee) from ProxyCard ";//代理总的领卡数
		float proxylingkasum =hqlDAO.unique(proxyhqllingkasum); 
		String proxyhqllingkadaysum="select SUM(fee) from ProxyCard where created>=? and created<=? ";	//今日总共领了的卡
		float proxylingkadaysum= hqlDAO.unique(proxyhqllingkadaysum, Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		String proxyhqllingkamonthsum="select SUM(fee) from ProxyCard where created>=? and created<=? ";	//本月总共领了的卡
		float proxylingkamonthsum= hqlDAO.unique(proxyhqllingkamonthsum, Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		
		
		
		String topsumhql ="select sum(totalprice) from Top ";//总置顶数
		float topsum =hqlDAO.unique(topsumhql ); 
		String topdaysumhql="select SUM(totalprice) from Top where created>=? and created<=? ";	//今日总共置顶数
		float topdaysum= hqlDAO.unique(topdaysumhql, Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		String topmonthsumhql="select SUM(totalprice) from Top where created>=? and created<=? ";	//本月总共置顶数
		float topmonthsum= hqlDAO.unique(topmonthsumhql, Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		
		
		String lunbosumhql ="select sum(totalprice) from SylbRecord ";//总轮播数
		float lunbosum =hqlDAO.unique(lunbosumhql ); 
		String lunbodaysumhql="select SUM(totalprice) from SylbRecord where created>=? and created<=? ";	//今日总共轮播数
		float lunbodaysum= hqlDAO.unique(lunbodaysumhql, Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		String lunbomonthsumhql="select SUM(totalprice) from SylbRecord where created>=? and created<=? ";	//本月总共轮播数
		float lunbomonthsum=hqlDAO.unique(lunbomonthsumhql, Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		
		
		
		
		float qrcodeProxypricesum= proxylingkasum;//代理领卡总金额
		float qrcodeProxypricesumday=proxylingkadaysum;//今日代理领卡总金额
		float qrcodeProxypricesummonth= proxylingkamonthsum;//本月代理领卡总金额
		
		float lunbopricesum= lunbosum;//总轮播价格
		float lunbopricesumday=lunbodaysum;//今日轮播总价格
		float lunbopricesummonth=lunbomonthsum;//本月轮播总价格
		
		float toppricesum=topsum;//总置顶价格
		float toppricesumday= topdaysum;//今日置顶总价格
		float toppricesummonth= topmonthsum;//本月置顶总价格
		
		
		
		
		
		
		// 订单用户申请总金额
		String hqlmoneysum="from Applydetail where status=?";
		List<Applydetail> mslist=hqlDAO.query(hqlmoneysum, (short)2);
		Double totalfeesum=0.0;
		for(Applydetail totalfeesums:mslist)
		{
			Double n=totalfeesums.getTotalFee();
			BigDecimal db=new BigDecimal(Double.toString(n));
			BigDecimal bd=new BigDecimal(Double.toString(totalfeesum));
			totalfeesum=db.add(bd).doubleValue();
		}
		String hqlmoneysum1="from Applydetail where status=?";
		List<Applydetail> mslist1=hqlDAO.query(hqlmoneysum1, (short)3);
		Double totalfeesum1=0.0;
		for(Applydetail totalfeesums1:mslist1)
		{
			Double n=totalfeesums1.getTotalFee();
			BigDecimal db=new BigDecimal(Double.toString(n));
			BigDecimal bd=new BigDecimal(Double.toString(totalfeesum1));
			totalfeesum1=db.add(bd).doubleValue();
		}
		
		// 今日用户申请订单总金额
		String hqlodmoney="from Applydetail where status=? and created>=? and created<=?";
		List<Applydetail> odlist=hqlDAO.query(hqlodmoney, (short)2,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		Double totalfeedaysum=0.0;
		for(Applydetail totalfeesums:odlist)
		{
			Double n = totalfeesums.getTotalFee();
			BigDecimal db= new BigDecimal(Double.toString(n));
			BigDecimal bd = new BigDecimal(Double.toString(totalfeedaysum));
			totalfeedaysum=db.add(bd).doubleValue();
		}
		String hqlodmoney1="from Applydetail where status=? and created>=? and created<=?";
		List<Applydetail> odlist1=hqlDAO.query(hqlodmoney1, (short)3,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
		Double totalfeedaysum1=0.0;
		for(Applydetail totalfeesums1:odlist1)
		{
			Double n = totalfeesums1.getTotalFee();
			BigDecimal db= new BigDecimal(Double.toString(n));
			BigDecimal bd = new BigDecimal(Double.toString(totalfeedaysum1));
			totalfeedaysum1=db.add(bd).doubleValue();
		}
		
		// 本月用户申请订单总金额
		String hqlmmoney="from Applydetail where status=? and created>=? and created<=?";
		List<Applydetail> mmlist=hqlDAO.query(hqlmmoney, (short)2,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		Double totalfeemonthsum=0.0;
		for(Applydetail totalfeesums:mmlist)
		{
			Double n=totalfeesums.getTotalFee();
			BigDecimal bd = new BigDecimal(Double.toString(n));
			BigDecimal db = new BigDecimal(Double.toString(totalfeemonthsum));
			totalfeemonthsum=db.add(bd).doubleValue();
		}
		
		String hqlmmoney1="from Applydetail where status=? and created>=? and created<=?";
		List<Applydetail> mmlist1=hqlDAO.query(hqlmmoney1, (short)3,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
		Double totalfeemonthsum1=0.0;
		for(Applydetail totalfeesums1:mmlist1)
		{
			Double n=totalfeesums1.getTotalFee();
			BigDecimal bd = new BigDecimal(Double.toString(n));
			BigDecimal db = new BigDecimal(Double.toString(totalfeemonthsum1));
			totalfeemonthsum1=db.add(bd).doubleValue();
		}
		
		
		// 预约服务订单总金额
				String hqlmoneyyuyuesum="from Yuyue where status=?";
				List<Yuyue> yuyuelist=hqlDAO.query(hqlmoneyyuyuesum, (short)1);
				List<Yuyue> yuyuelist1=hqlDAO.query(hqlmoneyyuyuesum, (short)2);
				Double totalpaysum=0.0;
				for(Yuyue totalpaysums:yuyuelist)
				{
					Double n=totalpaysums.getPay();
					BigDecimal db=new BigDecimal(Double.toString(n));
					BigDecimal bd=new BigDecimal(Double.toString(totalpaysum));
					totalpaysum=db.add(bd).doubleValue();
				}
				Double totalpaysum1=0.0;
				for(Yuyue totalpaysums:yuyuelist1)
				{
					Double n=totalpaysums.getPay();
					BigDecimal db=new BigDecimal(Double.toString(n));
					BigDecimal bd=new BigDecimal(Double.toString(totalpaysum1));
					totalpaysum1=db.add(bd).doubleValue();
				}
				Double totalpaysum2=totalpaysum+totalpaysum1;
				
				
				// 今日预约服务订单总金额
				String hqlodyuyuemoney="from Yuyue where status=? and created>=? and created<=?";
				List<Yuyue> odyuyuelist=hqlDAO.query(hqlodyuyuemoney, (short)1,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
				List<Yuyue> odyuyuelist1=hqlDAO.query(hqlodyuyuemoney, (short)2,Timestamp.valueOf(daydate+" 00:00:00"),Timestamp.valueOf(daydate+" 23:59:59"));
				
				Double totalpaydaysum=0.0;
				for(Yuyue totalpaysums:odyuyuelist)
				{
					Double n = totalpaysums.getPay();
					BigDecimal db= new BigDecimal(Double.toString(n));
					BigDecimal bd = new BigDecimal(Double.toString(totalpaydaysum));
					totalpaydaysum=db.add(bd).doubleValue();
				}
				Double totalpaydaysum1=0.0;
				for(Yuyue totalpaysums:odyuyuelist1)
				{
					Double n = totalpaysums.getPay();
					BigDecimal db= new BigDecimal(Double.toString(n));
					BigDecimal bd = new BigDecimal(Double.toString(totalpaydaysum1));
					totalpaydaysum1=db.add(bd).doubleValue();
				}
				Double totalpaydaysum2=totalpaydaysum+totalpaydaysum1;
				
				// 本月预约服务订单总金额
				String hqlmyuyuemoney="from Yuyue where status=? and created>=? and created<=?";
				List<Yuyue> mmyuyuelist=hqlDAO.query(hqlmyuyuemoney, (short)1,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
				List<Yuyue> mmyuyuelist1=hqlDAO.query(hqlmyuyuemoney, (short)2,Timestamp.valueOf(monthone+" 00:00:00"),Timestamp.valueOf(monthlast+" 23:59:59"));
				
				Double totalpaymonthsum=0.0;
				for(Yuyue totalpaysums:mmyuyuelist)
				{
					Double n=totalpaysums.getPay();
					BigDecimal bd = new BigDecimal(Double.toString(n));
					BigDecimal db = new BigDecimal(Double.toString(totalpaymonthsum));
					totalpaymonthsum=db.add(bd).doubleValue();
				}
				
				Double totalpaymonthsum1=0.0;
				for(Yuyue totalpaysums:mmyuyuelist1)
				{
					Double n=totalpaysums.getPay();
					BigDecimal bd = new BigDecimal(Double.toString(n));
					BigDecimal db = new BigDecimal(Double.toString(totalpaymonthsum1));
					totalpaymonthsum1=db.add(bd).doubleValue();
				}
				Double totalpaymonthsum2=totalpaymonthsum+totalpaymonthsum1;
		
		Map map=new HashMap();
		map.put("usersum", usersum);
		//map.put("msg", msg);
		map.put("ordersum", ordersum);
		map.put("cguserxufeisumday", cguserxufeisumday);
		map.put("cguserxufeimonthsum", cguserxufeimonthsum);
		map.put("udsum", udsum);
		map.put("odsum", odsum);
		map.put("proxylingkamonthsum", proxylingkamonthsum);
		map.put("xufeisum", xufeisum);
		map.put("proxychongzhisum", proxychongzhisum);
		map.put("proxychongzhidaysum", proxychongzhidaysum);
		map.put("proxychongzhimonthsum", proxychongzhimonthsum);
		map.put("proxylingkasum", proxylingkasum);
		map.put("proxylingkadaysum", proxylingkadaysum);
		map.put("applysum", applysum);
		map.put("applydaysum", applydaysum);
		map.put("applymonthsum", applymonthsum);
		
		map.put("vipcashsum", vipcashsum);
		map.put("proxycashsum", proxycashsum);
		map.put("vipcashdaysum", vipcashdaysum);
		map.put("proxycashdaysum",proxycashdaysum);
		map.put("vipcashmonthsum", vipcashmonthsum);
		map.put("proxycashmonthsum", proxycashmonthsum);
		map.put("usermonthsum", usermonthsum);
		map.put("ordermonthsum", ordermonthsum);
		map.put("daiordersum", daiordersum);
		map.put("daiodsum", daiodsum);
		map.put("daiomsum", daiomsum);
		map.put("topsum", topsum);
		map.put("topdaysum", topdaysum);
		map.put("topmonthsum", topmonthsum);
		map.put("lunbosum", lunbosum);
		map.put("lunbodaysum", lunbodaysum);
		map.put("lunbomonthsum", lunbomonthsum);
		map.put("totalfeemonthsum", totalfeemonthsum);
		map.put("totalfeedaysum", totalfeedaysum);
		map.put("totalfeesum", totalfeesum);
		map.put("totalfeemonthsum1", totalfeemonthsum1);
		map.put("totalfeedaysum1", totalfeedaysum1);
		map.put("totalfeesum1", totalfeesum1);
		map.put("totalpaymonthsum2", totalpaymonthsum2);
		map.put("totalpaydaysum2", totalpaydaysum2);
		map.put("totalpaysum2", totalpaysum2);
		map.put("toppricesum", toppricesum);
		map.put("toppricesumday", toppricesumday);
		map.put("toppricesummonth", toppricesummonth);
		map.put("lunbopricesum", lunbopricesum);
		map.put("lunbopricesumday", lunbopricesumday);
		map.put("lunbopricesummonth", lunbopricesummonth);
		map.put("qrcodeProxypricesum", qrcodeProxypricesum);
		map.put("qrcodeProxypricesumday", qrcodeProxypricesumday);
		map.put("qrcodeProxypricesummonth", qrcodeProxypricesummonth);
      	return map;
	}

}
