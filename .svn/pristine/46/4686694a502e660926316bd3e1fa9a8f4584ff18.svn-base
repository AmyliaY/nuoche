package com.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AdminDAO;
import com.dao.HqlDAO;
import com.pojo.Admin;
import com.util.MD5Util;

/**
 * 鍚庡彴绠＄悊 绠＄悊
 * 
 * @author lgh 2016.11.06
 * 
 */

@Service
public class AdminBackService {

	@Autowired
	private HqlDAO hqldao;

	@Autowired
	private AdminDAO adminDAO;
	
	
	public static void main(String[] args) {
		String password = "123456";
		String pwd = MD5Util.getMD5(MD5Util.getMD5(password+"sunjob")+"sunjob");
		System.out.println(pwd);
	}
	
	/**
	 * 
	 * @param username
	 *            鐢ㄦ埛
	 * @param password
	 *            瀵嗙爜锛氬瘑鐮佸悗缂�sunjob鍚庡姞瀵嗕竴娆″啀娆″悗缂�sunjob鍔犲瘑涓�娆�
	 * @return 鐧诲綍鎴愬姛杩斿洖admin瀵硅薄锛岀櫥褰曞け璐ヨ繑鍥瀗ull
	 */
	public Admin checkLogin(String username, String password) {
		String hql = "from Admin where username=? and  password=?";
		String pwd = MD5Util.getMD5(MD5Util.getMD5(password+"sunjob")+"sunjob");
		System.out.println(username);
		System.out.println(pwd);
		List<Admin> list = hqldao.pageQuery(hql, 1, 1, username, pwd);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;

	}

	/**
	 * 鏂板绠＄悊鍛�
	 * 
	 * @param admin
	 */
	public void addAdmin(Admin admin) {
		adminDAO.save(admin);
	}

}
