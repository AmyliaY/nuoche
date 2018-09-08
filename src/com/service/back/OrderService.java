package com.service.back;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.GoodsorderdetailDAO;
import com.dao.GoodsordersDAO;
import com.dao.HqlDAO;
import com.pojo.Goodsorderdetail;
import com.pojo.Goodsorders;
import com.util.StringUtil;

@Service
public class OrderService {
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private GoodsorderdetailDAO goodsorderdetailDAO;
	@Autowired
	private GoodsordersDAO goodsordersDAO;
	public Map orderlisting(int size, int page, int status, Timestamp begintime, Timestamp endtime, String keywords) {
		StringBuffer sb=new StringBuffer(" where 1=1 ");
		List paramList=new ArrayList();
		if(begintime!=null)
		{
			sb.append(" and orTime>=?");
			paramList.add(begintime);
		}
		if(endtime!=null)
		{
			sb.append(" and orTime<=?");
			paramList.add(endtime);
		}
		if(StringUtil.isNotNull(keywords) && keywords.trim().length()>0)
		{
			sb.append(" and userinfo.usersName like ?");
			paramList.add("%"+keywords+"%");
		}
		if(status!=10)
		{
			sb.append(" and orStatus=?");
			paramList.add(status);
		}
		String hqlsum="select count(*) from Goodsorders"+sb.toString();
		int sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
		int count=sum%size==0 ? sum/size : sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		String hql="from Goodsorders"+sb.toString()+" order by orTime desc";
		List list=hqlDAO.pageQuery(hql, size, page,paramList.toArray());
		Map map=new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);
		map.put("list", list);
		return map;
	}
	public Goodsorderdetail checkorderdetail(int id) {
		List list=goodsorderdetailDAO.findByProperty("goodsorders.orId", id);
		Goodsorderdetail goodsorderdetail=new Goodsorderdetail();
		if(list.size()>0 && list!=null)
			goodsorderdetail=(Goodsorderdetail) goodsorderdetailDAO.findByProperty("goodsorders.orId", id).get(0);
		if(goodsorderdetail!=null)
		{
			goodsorderdetailDAO.findAll();
		}
		return goodsorderdetail;
	}
	public List getAllCrop() {
		String hql="from Peisongcorp where pscStatus=?";
		List list=hqlDAO.query(hql,1);
		if(list.size()>0)
			return list;
		return null;
	}
	public void ordersfahuo(int id, String orrecipient, int pscid) {
		String hql="update Goodsorders set orRecipient=? , peisongcorp.pscId=?, orStatus=? where orId=?";
		hqlDAO.bulkUpdate(hql, orrecipient,pscid,2,id);
		
	}

}
