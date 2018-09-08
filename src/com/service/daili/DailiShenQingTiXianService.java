package com.service.daili;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.ProxyDAO;
import com.dao.UserDAO;
import com.dao.VipCashDAO;
import com.pojo.Proxy;
import com.pojo.User;
import com.pojo.VipCash;


/**
 *代理申请提现Service
 * @author dell
 *
 */

@Service
public class DailiShenQingTiXianService {

	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private VipCashDAO vipcashDAO;
	@Autowired
	private ProxyDAO proxyDAO;
	
	
	/**
	 * 我的余额
	 * @param weixinhao
	 * @return
	 */
	public Map tongjilisting(int proxyid) {
	
		
		
		
		
		String ketixianhqlsum="select keCash from Proxy where id=?";	//会员可提现的余额
		double ketixiansum=(double) hqlDAO.unique(ketixianhqlsum ,proxyid);
		
//		String tixianzhonghqlsum="select SUM(cash) from ProxyCash proxy.id=? and status=?";	//会员提现中金额
//		double tixianzhongsum=(double) hqlDAO.unique(tixianzhonghqlsum ,proxyid,(short)0);
		
		String yitixianhqlsum="select SUM(yiCash) from Proxy where id=?";	//会员已提现的金额
		double yitixiansum=(double) hqlDAO.unique(yitixianhqlsum ,proxyid);
	
		System.out.println(ketixiansum);
		//System.out.println(tixianzhongsum);
		System.out.println(yitixiansum);
		Map map=new HashMap();
		map.put("ketixiansum", ketixiansum);
		//map.put("ketixianzhongsum", tixianzhongsum);
		map.put("yitixiansum", yitixiansum);
		
		return map;
	}
	
	/**
	 * 余额提现申请
	 * @param cash
	 * @param dingdanhao
	 * @param createtime
	 * @param weixinhao
	 */
	public void addtixian(double cash,String dingdanhao,Timestamp createtime,int proxyid) {
		
		String idhql="from Proxy where id=?";	
		List list =  hqlDAO.query(idhql, proxyid);
		Proxy proxy = (Proxy) list.get(0);
		int id = proxy.getId();
		//System.out.println("ppppp"+id);
		String hql="insert into proxy_cash (proxy_id,time,cash,order_id,status) value (?,?,?,?,?)";
		
		hqlDAO.executeSql(hql, id,createtime,cash,dingdanhao,(short)0);
		
		proxy.setKeCash(proxy.getKeCash()-cash);
		
		proxyDAO.save(proxy);
		
	}
	
	/**
	 * 提现记录
	 * @param weixinhao
	 * @return
	 */
	public Map txrecord(String weixinhao){
		
		
		String listhql=" from VipCash where user.weixinUser.openid=? and status=? order by time desc";
		List list=hqlDAO.query(listhql, weixinhao,(short)0);
		
		Map map=new HashMap();
		map.put("list", list);	
		return map;
		
	}
}
