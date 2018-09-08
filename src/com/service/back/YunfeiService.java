package com.service.back;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import oracle.net.aso.l;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CityDAO;
import com.dao.HqlDAO;
import com.pojo.City;
@Service
public class YunfeiService {
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private CityDAO cityDAO;
	public void settongyong(String yunfei) {
		String hql="update City set ctYunfei=?";
		hqlDAO.bulkUpdate(hql, Double.parseDouble(yunfei));
		
	}
	public Map setdiqu(int prid, int size, int page) {
		String hqlsum="select count(*) from City where province.prId=?";
		int sum=(int) hqlDAO.unique(hqlsum, prid);
		int count=sum%size==0 ? sum/size: sum/size+1;
		if(page<1)page=1;
		if(page>count)page=count;
		String hql="from City where province.prId=?";
		List list=hqlDAO.pageQuery(hql, size, page, prid);
		Map map=new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;
		
	}
	public City setdiquprice(int id) {
		return cityDAO.findById(id);
	}
	public City setcityyunfei(int id, String ctyunfei) {
		City city=cityDAO.findById(id);
		if(city!=null)
			city.setCityYunfei(Double.parseDouble(ctyunfei));
			cityDAO.save(city);
		return city;
	}
	public City getctfeiyong(int ctid) {
		return cityDAO.findById(ctid);
	}

}
