package com.service.back;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.pojo.Admin;

@Service
public class AdminloginService {
	@Autowired
	private HqlDAO hqlDAO;
	public Admin login(String username, String password) {
		String hql="from Admin where adminUsername=? and adminPassword=?";
		List<Admin> list=hqlDAO.pageQuery(hql,1,1, username,password);
		if(list.size()>0)
			return list.get(0);
		return null;
		
	}

}
