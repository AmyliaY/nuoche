package com.shop.service.app;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.util.JsonFilter;

@Service
public class AppLunboService {

	@Autowired
	private HqlDAO hqlDAO;

	/**
	 * 得到所有启用的轮播图
	 * 
	 * @return
	 */
	public String getAllLunbo() {
		String hql = "from Carouselimages where cimgStatus=1";
		List list = hqlDAO.findByHQL(hql);
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		String json = JSONArray.fromObject(list, jsonConfig).toString();
		return json;

	}

	/**
	 * 音乐界面轮播图
	 * @return
	 */
	public String getAllLunbo_music() {
		String hql = "from LunboMusic where cimgStatus=1";
		List list = hqlDAO.findByHQL(hql);
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig);
		String json = JSONArray.fromObject(list, jsonConfig).toString();
		return json;
	}

}
