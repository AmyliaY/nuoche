package com.service.daili;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.ProxyDAO;
import com.pojo.Proxy;
import com.util.MD5Util;

@Service
public class DailiService {
	
	@Autowired
	private HqlDAO hqlDAO;
	
	/**
	 * 修改密码
	 * @param proxy
	 * @param password
	 */
	 
	public void updatepsd(Proxy proxy,String password) {
		
		String hql = "update Proxy set password=? where id=?";
		String pwd = MD5Util.getMD5(MD5Util.getMD5(password+"sunjob")+"sunjob");
		hqlDAO.bulkUpdate(hql, pwd, proxy.getId());
		
	}
	
	public Proxy checkUpdate(Proxy proxy, String password) {
		String hql = "from Proxy where id=? and password=?";
		String pwd = MD5Util.getMD5(MD5Util.getMD5(password+"sunjob")+"sunjob");
		List<Proxy> list = hqlDAO.pageQuery(hql, 1, 1, proxy.getId(), pwd);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;

	}
	
}
