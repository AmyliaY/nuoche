package com.service.weixin;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.UserDAO;
import com.dao.VipCashDAO;
import com.pojo.User;
import com.pojo.VipCash;
import com.pojo.Yuyue;
import com.util.JsonFilter;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

/**
 * 查仕龙
 * 我的钱包Service
 * @author dell
 *
 */
@Service
public class WeiXinMymoneyService {

	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private VipCashDAO vipcashDAO;
	@Autowired
	private UserDAO userDAO;
	
	/**
	 * 我的余额
	 * @param weixinhao
	 * @return
	 */
	public Map tongjilisting(String weixinhao) {
		String ketixianhqlsum="select ketixian from User where openid=?";	//会员可提现的余额
		double ketixiansum=(double) hqlDAO.unique(ketixianhqlsum ,weixinhao);
		
		String tixianzhonghqlsum="select SUM(cash) from VipCash where user.weixinUser.openid=? and status=?";	//会员提现中金额
		double tixianzhongsum=(double) hqlDAO.unique(tixianzhonghqlsum ,weixinhao,(short)0);
		
		String yitixianhqlsum="select SUM(yitixian) from User where openid=?";	//会员已提现的金额
		double yitixiansum=(double) hqlDAO.unique(yitixianhqlsum ,weixinhao);
	
		Map map=new HashMap();
		map.put("ketixiansum", ketixiansum);
		map.put("ketixianzhongsum", tixianzhongsum);
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
	public void addtixian(double cash,String dingdanhao,Timestamp createtime,String weixinhao) {
		String idhql="from User where weixinUser.openid=?";	//会员可提现的余额
		List list =  hqlDAO.query(idhql, weixinhao);
		if (list.size()>0){
		User user = (User) list.get(0);
		int id = user.getId();
		String hql="insert into vip_cash (user_id,time,cash,order_id,status) value (?,?,?,?,?)";
		hqlDAO.executeSql(hql, id,createtime,cash,dingdanhao,(short)0);
		user.setKetixian(user.getKetixian()-cash);
		if(user.getWeitixian()!=null)
		{
			user.setWeitixian(user.getWeitixian()+cash);
		}
		else{
			user.setWeitixian(cash);
		}
		userDAO.merge(user);
		}
	}
	
	/**
	 * 提现记录
	 * @param weixinhao
	 * @return
	 */
	public Map txrecord(String weixinhao){
		String listhql=" from VipCash where user.weixinUser.openid=? order by time desc";
		List list=hqlDAO.query(listhql, weixinhao);
		
		Map map=new HashMap();
		map.put("list", list);	
		return map;
	}
	
	/**
	 * 提现记录
	 * @param weixinhao
	 * @param size
	 * @param page
	 * @return
	 */
	public List tixianrecordListing(String weixinhao, int size, int page) {
		String hql="from VipCash  where user.weixinUser.openid=? order by time desc";
		List list=hqlDAO.pageQuery(hql, size, page, weixinhao);
		return list;
	}
	
	/**
	 * 总条数
	 * @param size
	 * @param page
	 * @param weixinhao
	 * @return
	 */
	public int getSum(int size, int page, String weixinhao){
		String hqlsum="select count(*) from VipCash where user.weixinUser.openid=? ";
		int sum=(int) hqlDAO.unique(hqlsum,weixinhao);
		return sum;
	}
	
	/**
	 * 
	 *根据用户的微信号查询预约记录
	 * @param openid
	 * @return
	 */
	public String findAll2(String openid) {
		String hql="from VipCash  where user.weixinUser.openid=? order by time desc";
		List<VipCash> list = hqlDAO.findByHQL(hql, openid);
		JsonConfig config=new JsonConfig();
		net.sf.json.JSONObject object = new net.sf.json.JSONObject();
		JsonFilter.ignoredSet(config);
		String json=JSONArray.fromObject(list, config).toString();
		return json;
	}
	
	/**
	 * 根据状态查
	 * @param size
	 * @param page
	 * @param openid
	 * @param status
	 * @return
	 */
	public List findByStatus(int size, int page, String openid, short status) {
		String hql="from VipCash  where user.weixinUser.openid=? and status= ? order by created desc";
		List<Yuyue> list=hqlDAO.pageQuery(hql, size, page, openid, status);
		
		return list;
	}
	
	/**
	 * 异步查总条数
	 * @param size
	 * @param page
	 * @param weixinhao
	 * @param status
	 * @return
	 */
	public int getSum2(int size, int page, String weixinhao,short status){
		String hqlsum="select count(*) from VipCash  where user.weixinUser.openid=? and status= ? ";
		int sum=(int) hqlDAO.unique(hqlsum,weixinhao,status);
		return sum;
	}
}
