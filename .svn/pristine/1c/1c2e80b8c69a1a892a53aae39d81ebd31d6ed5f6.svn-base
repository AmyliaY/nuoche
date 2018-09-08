package com.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AdminDAO;
import com.dao.HqlDAO;
import com.pojo.Admin;
import com.util.MD5Util;
import com.util.StringUtil;

@Service
public class AdminAdminService {
	@Autowired
	private HqlDAO hqldao;
	@Autowired
	AdminDAO adminDao;
	
	public Map dailiListing(int size, int page, String keywords) {
		StringBuffer sb = new StringBuffer(" where 1=1 ");
		List paramList = new ArrayList();
		if (StringUtil.isNotNull(keywords) && keywords.trim().length() > 0) {
			sb.append(" and username like ?");
			paramList.add("%" + keywords + "%");
		}	
		
		String hqlsum = "select count(*) from Admin" + sb.toString();
		int sum = (int) hqldao.unique(hqlsum,paramList.toArray());
		int count = sum % size == 0 ? sum / size : sum / size + 1;
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;		
		String hql = "from Admin" + sb.toString();		
		
		List list = hqldao.pageQuery(hql, size, page, paramList.toArray());
		
		Map map = new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("keywords", keywords);
		map.put("sum", sum);
		map.put("list", list);
		map.put("count", count);
		return map;		
		
		
	}

	public void add(String gname,String psd) {
		// TODO Auto-generated method stub
		Admin admin = new Admin();
		String pwd = MD5Util.getMD5(MD5Util.getMD5(psd+"sunjob")+"sunjob");
		admin.setUsername(gname);
		admin.setPassword(pwd);
		adminDao.save(admin);
	}
	
	
	public void xiugaipsd(){}

	public Admin findById(int id) {
		// TODO Auto-generated method stub
		return adminDao.findById(id);
	}

	public void xiugaopsd(Admin admin,String psd) {
		// TODO Auto-generated method stub
		String pwd = MD5Util.getMD5(MD5Util.getMD5(psd+"sunjob")+"sunjob");
		admin.setPassword(pwd);
		adminDao.save(admin);
	}
}
