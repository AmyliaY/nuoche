package com.shop.service.app;

import java.sql.Timestamp;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.PaypresentDAO;
import com.dao.PayrecordsDAO;
import com.dao.UserinfoDAO;
import com.pojo.Payrecords;
import com.pojo.Userinfo;
import com.util.JsonConfigDateUtil;
import com.util.JsonFilter;

@Service
public class AppRechargeService {
	@Autowired
	private PayrecordsDAO payrecordsDAO;
	@Autowired
	private UserinfoDAO userinfoDAO;
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private PaypresentDAO paypresentDAO;

	public String getAllRecords(int id) {
		String hql = "from Payrecords where userinfo.usersId= ? order by prTime desc";
		List list = hqlDAO.query(hql, id);
		JsonConfig config = new JsonConfig();
		JsonFilter.ignoredSet(config);
		config.registerJsonValueProcessor(Timestamp.class,
				new JsonConfigDateUtil("yyyy-MM-dd hh:mm:ss"));
		String json = JSONArray.fromObject(list, config).toString();
		return json;
	}

	public String getFenye(int id, int page) {
		String hql = "from Payrecords where userinfo.usersId= ? order by prTime desc";
		List list = hqlDAO.pageQuery(hql, 7, page, id);// 默认一页七条
		JsonConfig config = new JsonConfig();
		JsonFilter.ignoredSet(config);
		config.registerJsonValueProcessor(Timestamp.class,
				new JsonConfigDateUtil("yyyy-MM-dd hh:mm:ss"));
		String json = JSONArray.fromObject(list, config).toString();
		return json;

	}
	
	public List getAllPresent2List()
	{
		List list = paypresentDAO.findByPpStatus(1);
		return list;
	}

	public String getAllPresent() {

		List list = paypresentDAO.findByPpStatus(1);
		JsonConfig config = new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json = JSONArray.fromObject(list, config).toString();
		return json;
	}

	public void addRecharRecords(int userid, Double price, int present,
			String orderid, int prType, Timestamp ordertime) {

		Userinfo userinfo = userinfoDAO.findById(userid);
		Payrecords payrecords = new Payrecords();
		payrecords.setUserinfo(userinfo);
		payrecords.setPrDingdanhao(orderid);
		payrecords.setPrMoney(price);
		payrecords.setPrPresent(present);
		payrecords.setPrStatus(1);
		payrecords.setPrTime(ordertime);
		payrecords.setPrType(prType);
		payrecordsDAO.save(payrecords);
		double jifen = userinfo.getUsersIntegral();
		System.out.println(jifen);
		double add = price + present;
		userinfo.setUsersIntegral(jifen + add);
		userinfoDAO.save(userinfo);

	}

	/**
	 * 新增充值订单记录
	 * @param userinfo  用户对象
	 * @param price   用户金额  
	 * @param orderid 订单号
	 * @param prType  支付类型  1支付 宝  2微信  3后台
	 */
	public void addRecharRecords(Userinfo userinfo, double price, String orderid,
			int prType) {
		//Userinfo userinfo = userinfoDAO.findById(userid);
		Payrecords payrecords = new Payrecords();
		payrecords.setUserinfo(userinfo);
		payrecords.setPrDingdanhao(orderid);
		payrecords.setPrMoney(price);
		payrecords.setPrStatus(0);
		//payrecords.setPrTime(new java.sql.Timestamp(System.currentTimeMillis()));
		payrecords.setPrType(prType);
		payrecordsDAO.save(payrecords);
	}

	}

	




