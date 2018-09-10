package com.service.daili;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;

/**
 * 做轮播图添加时用到的类，不是很明白为什么要用这个类
 * @author dell
 *
 */

@Service
public class DailiServiceBusinessService {
	
	@Autowired
	private HqlDAO hqlDAO;
	
	public List getAllOnetype() {
		String hql = "from ServiceType";
		List list = hqlDAO.query(hql);
		if (list.size() > 0)
			return list;
		return null;
	}

}
