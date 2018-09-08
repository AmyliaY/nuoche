package com.service.admin;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ApplydetailDAO;
import com.dao.HqlDAO;
import com.pojo.Applydetail;
import com.util.StringUtil;

@Service
public class AdminOrdersService {
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private ApplydetailDAO applydetaildao;
	
	
	/**
	 * 查询所有订单记录
	 * 模糊查询 分页查询  
	 * @param size
	 * @param page
	 * @param status
	 * @param begintime
	 * @param endtime
	 * @param keywords
	 * @return
	 */
	public Map orderlisting(int size, int page, short status, Timestamp begintime, Timestamp endtime, String keywords) {
		StringBuffer sb=new StringBuffer(" where 1=1 ");
		List paramList=new ArrayList();
		if(begintime!=null)
		{
			sb.append(" and created>=?");
			paramList.add(begintime);
		}
		if(endtime!=null)
		{
			sb.append(" and created<=?");
			paramList.add(endtime);
		}
		if(StringUtil.isNotNull(keywords) && keywords.trim().length()>0)
		{
			sb.append(" and orderId like ?");
			paramList.add("%"+keywords+"%");
		}
		if(status!=10)
		{
			sb.append(" and status=?");
			paramList.add(status);
		}
		String hqlsum="select count(*) from Applydetail"+sb.toString();
		int sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
		int count=sum%size==0 ? sum/size : sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		String hql="from Applydetail"+sb.toString()+" order by time desc";
		List list=hqlDAO.pageQuery(hql, size, page,paramList.toArray());
		Map map=new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);
		map.put("list", list);
		return map;
	}
	
	/**
	 * 根据ID查询订单详情
	 * @param id
	 * @return
	 */
	public Applydetail checkorderdetail(int id) {		
		Applydetail applydetail=applydetaildao.findById(id);
		return applydetail;
	}
	
	/**
	 * 查询所有配送公司
	 * @return
	 */
	public List getAllCrop() {
		String hql="from PeisongCorp where pscstatus=?";
		List list=hqlDAO.query(hql,(short)1);
		if(list.size()>0)
			return list;
		return null;
	}
	
	/**
	 * 订单发货
	 * @param id
	 * @param orrecipient
	 * @param pscid
	 */
	public void ordersfahuo(int id, String orrecipient,int pscid) {
		String hql="update Applydetail set shippingCode=? , peisongCorp.id=?, status=? where id=?";
		hqlDAO.bulkUpdate(hql, orrecipient,pscid,(short)3,id);
		
	}

}
