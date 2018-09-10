package com.service.weixin;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.YuyueDAO;
import com.pojo.Applybusiness;
import com.pojo.Applydetail;
import com.pojo.Business;
import com.pojo.PeisongCorp;
import com.pojo.Yuyue;
import com.util.JsonFilter;
import com.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

/*
 * 查仕龙-商家预约记录
 */

@Service
public class WeixinShangjiaYuyueRecordService {
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private YuyueDAO yuyueDAO;
	
	/**
	 * 查总记录
	 * @param weixinhao
	 * @param size
	 * @param page
	 * @return
	 */
public List yuyuerecordListing(String weixinhao, int size, int page) {
		
		String hql="from Yuyue  where service.business.openid = ? order by created desc";
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
		String hqlsum="select count(*) from Yuyue where service.business.openid = ? ";
		int sum=(int) hqlDAO.unique(hqlsum,weixinhao);
		
		return sum;
	}

	/**
	 * 根据微信号查
	 * @param weixinhao
	 * @return
	 */
	public List<Yuyue> findByOpenId(String weixinhao) {
		String hql = "from Yuyue where service.business.openid = ? order by created desc";
		List<Yuyue> yuyuerecords = hqlDAO.findByHQL(hql, weixinhao);
		return yuyuerecords;
	}
	
	/**
	 * 异步
	 * @param weixinhao
	 * @return
	 */
	public List<Yuyue> findByOpenId2(String weixinhao) {
		String hql = "from Yuyue where service.business.openid = ? order by created desc";
		List<Yuyue> yuyuerecords = hqlDAO.findByHQL(hql, weixinhao);
		return yuyuerecords;
	}
	
	/**
	 * 根据用户查询预约记录
	 * @param openid
	 * @return
	 */
	public String findAll(String openid) {
		String hql="from Yuyue where service.business.openid = ? order by created desc";
		List<Yuyue> list = hqlDAO.findByHQL(hql, openid);
	
		
		JsonConfig config=new JsonConfig();
		net.sf.json.JSONObject object = new net.sf.json.JSONObject();
		JsonFilter.ignoredSet(config);
		String json=JSONArray.fromObject(list, config).toString();
		return json;
	}
	/**
	 * 
	 *根据用户的微信号查询预约记录
	 * @param openid
	 * @return
	 */
	public String findAll2(String openid) {
		String hql="from Yuyue where service.business.openid = ? order by created desc";
		List<Yuyue> list = hqlDAO.findByHQL(hql, openid);
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
		String hql="from Yuyue where service.business.openid = ? and status= ? order by created desc";
		List<Yuyue> list=hqlDAO.pageQuery(hql, size, page, openid, status);
		
		return list;
	}
	
	public int getSum2(int size, int page, String weixinhao,short status){
		String hqlsum="select count(*) from Yuyue where service.business.openid = ? and status= ? ";
		int sum=(int) hqlDAO.unique(hqlsum,weixinhao,status);
		
		return sum;
	}
	
	/**
	 * 更新状态
	 * @param id
	 * @return
	 */
	public Yuyue updatestatus(int id) {
		Yuyue yuyue=yuyueDAO.findById(id);
		int status=yuyue.getStatus();
		if(yuyue!=null&&status==1){
			yuyue.setStatus((short)(1+status));
			yuyueDAO.save(yuyue);}
		else if (yuyue!=null&&status==2){
			yuyue.setStatus((short)(status-1));
			yuyueDAO.save(yuyue);
		}
		return yuyue;
		
	}
/**
 * 找商家
 * @param openid
 * @return
 */
	public List<Business> findbusiness(String openid) {
		String hql="from Business where openid=?";
		List<Business> business=hqlDAO.findByHQL(hql, openid);
		return business;
	}

public List<Applybusiness> findapplybusiness(String openid) {
	String hql="from Applybusiness where openid=?";
	List<Applybusiness> applybusiness=hqlDAO.findByHQL(hql, openid);
	return applybusiness;
}

public List<Business> findbusiness2(String tel) {
	String hql="from Business where tel=?";
	List<Business> business=hqlDAO.findByHQL(hql, tel);
	return business;
	
}

	
}
