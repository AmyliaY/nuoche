package com.service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AdminDAO;
import com.dao.HqlDAO;
import com.pojo.Admin;

@Service
public class AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	@Autowired
	private HqlDAO   hqlDAO;
	
	//增加 
	public void addAdmin(Admin admin )
	{
	   adminDAO.save(admin);	
	}
	
	//删除
	public void delAdmin(int id)
	{
		Admin admin = adminDAO.findById(id);
		adminDAO.delete(admin);
	}
	//修改
	public void updateAdmin(Admin admin)
	{
		adminDAO.merge(admin);
	}
	
	//根据主键查
	public Admin findAdminById(int id)
	{
		return adminDAO.findById(id);
	}
	
	//查所有管理
	public List findAll()
	{
		return adminDAO.findAll();
	}
	
	//条件查件
	public List query(String username,String password)
	{
		String hql = "from Admin where username=? and password=?";
		List list = hqlDAO.query(hql, username,password);
		return list;
	}
	
	/*public Map fenye(int page,int size, String username)
	{
		//List list = hqlDAO.pageQuery(hql, size, page, p)
	}*/
	
}
