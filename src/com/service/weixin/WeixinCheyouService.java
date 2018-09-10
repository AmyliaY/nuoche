package com.service.weixin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BusinessDAO;
import com.dao.HqlDAO;
import com.pojo.Applydetail;
import com.pojo.Business;
import com.util.JsonFilter;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

@Service
public class WeixinCheyouService {

	@Autowired
	private BusinessDAO businessDAO;
	@Autowired
	private HqlDAO hqlDAO;

	public String findAllshop() {
		String hql="from Business";
		List<Business> list = hqlDAO.findByHQL(hql);
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json=JSONArray.fromObject(list, config).toString();
		return json;
	}
}
