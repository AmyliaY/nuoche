package com.service.weixin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.pojo.Applydetail;
import com.util.JsonFilter;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

@Service
public class WeiXinOrderCenterService {
	
	@Autowired
	private HqlDAO hqlDAO;

	public List<Applydetail> findOrderByOpenId(String weixinhao) {
		String hql = "from Applydetail where weixinUser.openid = ? order by created desc";
		List<Applydetail> applydetails = hqlDAO.findByHQL(hql, weixinhao);
		return applydetails;
	}

	public String findAllOrder(String openid) {
		String hql="from Applydetail where weixinUser.openid = ? order by created desc";
		List<Applydetail> list = hqlDAO.findByHQL(hql, openid);
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json=JSONArray.fromObject(list, config).toString();
		return json;
	}

	public void doQuerenOrder(String orderid, String openid) {
		String hql = "update Applydetail set status=4 where orderId = ? and weixinUser.openid = ?";
		hqlDAO.zsg(hql, orderid,openid);
	}

	public String findOrderByStatus(String openid, short orderstatus) {
		String hql="from Applydetail where weixinUser.openid = ? and status=? order by created desc";
		List<Applydetail> list = hqlDAO.findByHQL(hql, openid,orderstatus);
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json=JSONArray.fromObject(list, config).toString();
		return json;
	}

	public Applydetail findapplydetailByOrderid(String orderid, String openid) {
		String hql="from Applydetail where orderId = ? and weixinUser.openid = ?";
		List<Applydetail> list = hqlDAO.findByHQL(hql, orderid,openid);
		Applydetail applydetail= list.get(0);
		return applydetail;
	}
}
