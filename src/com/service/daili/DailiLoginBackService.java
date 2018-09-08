package com.service.daili;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AdminDAO;
import com.dao.HqlDAO;
import com.dao.ProxyDAO;
import com.pojo.Admin;
import com.pojo.Proxy;
import com.util.MD5Util;

/**
 * 后台管理 管理
 * 
 * @author lgh 2016.11.06
 * 
 */

@Service
public class DailiLoginBackService {

	@Autowired
	private HqlDAO hqldao;

	@Autowired
	private ProxyDAO proxyDAO;
	
	
	public static void main(String[] args) {
		String password = "123456";
		String pwd = MD5Util.getMD5(MD5Util.getMD5(password+"sunjob")+"sunjob");
		System.out.println(pwd);
	}
	
	/**
	 * 
	 * @param username
	 *            用户
	 * @param password
	 *            密码：密码后缀sunjob后加密一次再次后缀sunjob加密一次
	 * @return 登录成功返回admin对象，登录失败返回null 
	 */
	public Proxy checkLogin(String username, String password) {
		String hql = "from Proxy where tel=? and  password=? and status<>0 ";
		String pwd = MD5Util.getMD5(MD5Util.getMD5(password+"sunjob")+"sunjob");
		System.out.println(username);
		System.out.println(pwd);
		List<Proxy> list = hqldao.pageQuery(hql, 1, 1, username, pwd);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;

	}

	/**
	 * 新增代理
	 * 
	 * @param admin
	 */
	public void addProxy(Proxy proxy) {
		proxyDAO.save(proxy);
	}

}
