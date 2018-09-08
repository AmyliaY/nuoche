package com.service.admin;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.ServiceTypeDAO;
import com.pojo.ProxyCash;
import com.pojo.ServiceType;

import com.util.StringUtil;

@Service
public class AdminFuWuTypeService {

	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private ServiceTypeDAO serviceTypeDAO;
	
	public Map findAllFuwuType(int size, int page, String keywords) {
		StringBuffer sb=new StringBuffer(" where 1=1");
		List paramList=new ArrayList();
		if(StringUtil.isNotNull(keywords) && keywords.trim().length()>0)
		{
			sb.append(" and name like ?");
			paramList.add("%"+keywords+"%");
		}
		String hqlsum="select count(*) from ServiceType "+sb.toString();
		int sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
		int count=sum%size==0 ? sum/size :sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		String hql="from ServiceType"+sb.toString()+" order by updated desc";
		List<ServiceType> list=hqlDAO.pageQuery(hql, size, page,paramList.toArray());
		Map map=new HashMap();
		map.put("size", size);
		map.put("page", page);
		map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}

	public void dodelete(int id) {
		ServiceType serviceType = serviceTypeDAO.findById(id);
		serviceTypeDAO.delete(serviceType);
		
	}

	public void addfuwutypego(String name) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		ServiceType serviceType = new ServiceType();
		serviceType.setName(name);
		serviceType.setStatus((short)1);
		serviceType.setCreated(timestamp);
		serviceType.setUpdated(timestamp);
		serviceTypeDAO.save(serviceType);
	}

	public ServiceType findbyid(int id) {
		ServiceType serviceType = serviceTypeDAO.findById(id);
		return serviceType;
	}

	public void updatefuwutypego(int id, String name) {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		ServiceType serviceType =serviceTypeDAO.findById(id);
		serviceType.setName(name);
		serviceType.setUpdated(timestamp);
		serviceTypeDAO.save(serviceType);
	}
	
}
