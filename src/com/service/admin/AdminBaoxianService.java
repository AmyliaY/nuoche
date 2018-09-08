package com.service.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BaoxianBaodanDAO;
import com.dao.BaoxianBaodanGonshiDAO;
import com.dao.BaoxianGonshiDAO;
import com.dao.HqlDAO;
import com.pojo.BaoxianBaodan;
import com.pojo.BaoxianGonshi;
import com.util.StringUtil;

@Service
public class AdminBaoxianService {
	
	
	@Autowired
	private HqlDAO hqlDAO;
	
	@Autowired
	private BaoxianGonshiDAO  baoxianGonshiDAO;
	
	@Autowired
	private BaoxianBaodanDAO  baoxianBaodanDAO;
	
	@Autowired
	private BaoxianBaodanGonshiDAO  baoxianBaodanGonshiDAO;
	
	/**
	 * 查所有保险公司
	 * @return
	 */
	public List getAllBaoxianGongshi()
	{
		String hql = "from BaoxianGonshi";
		List list = hqlDAO.query(hql);
		return list;
	}
	
	/**
	 * 新增保险公司
	 * @param baoxianGonshi
	 */
	public void addBaoxianGongshi(BaoxianGonshi  baoxianGonshi)
	{
		baoxianGonshiDAO.save(baoxianGonshi);
	}
	
	
	
	/**
	 * 获取用户车险数据 @author lgh 
	 * @param page   第几页
	 * @param size   页大小
	 * @param beginTime  开始时间
	 * @param endTime    结束时间
	 * @param openId     微信用户id
	 * @param status     状态0待报价  1已报价  2.已付款
	 * @return
	 */
	public Map fenyeBaodan(int page, int size, String beginTime,String endTime,String openId,String status)
	{
		StringBuffer sb = new StringBuffer(" where 1=1 ");
		List paramList = new ArrayList();
		if (StringUtil.isNotNull(beginTime))
		{
			sb.append(" and time>=?");
			Date timeBegin = java.sql.Timestamp.valueOf(beginTime+" 00:00:00");
		    paramList.add(timeBegin);
		}
		
		if (StringUtil.isNotNull(endTime))
		{
			sb.append(" and time<=?");
			Date timeEND = java.sql.Timestamp.valueOf(endTime+" 23:59:59");
		    paramList.add(timeEND);
		}
		
		if (StringUtil.isNotNull(openId))
		{
			sb.append(" and weixinUser.openid=?");
			paramList.add(openId);
		}
		
		if (StringUtil.isNotNull(status))
		{
			sb.append(" and status=?");
			paramList.add(Integer.parseInt(status));
		}
		
		String hqlsum="select count(*) from BaoxianBaodanGonshi "+sb.toString();
		int sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
		int count=sum%size==0 ? sum/size :sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		String hql="from BaoxianBaodanGonshi "+sb.toString()+" order by time desc";
		List list=hqlDAO.pageQuery(hql, size, page,paramList.toArray());
		Map map=new HashMap();
		map.put("size", size);
		map.put("page", page);
		map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}

	/**
	 * 修改状态
	 * @param id
	 * @return
	 */
	public BaoxianGonshi updatestatus(int id) {
		BaoxianGonshi baoxianGonshi  = baoxianGonshiDAO.findById(id);
		Integer old = baoxianGonshi.getStatus();
		if (old==null)
			old = 0;
		baoxianGonshi.setStatus(1-old);
		baoxianGonshiDAO.merge(baoxianGonshi);
		return baoxianGonshi;
	}

	/**
	 * 根据主键查找保险公司
	 * @param id
	 * @return
	 */
	public BaoxianGonshi findBaoxianGongshiById(int id) {
		BaoxianGonshi baoxianGonshi = baoxianGonshiDAO.findById(id);
		return baoxianGonshi;
	}

	/**
	 * 修改保险公司资料
	 * @param id
	 * @param name
	 * @param logo
	 */
	public void updateBaoxianGongshi(int id, String name, String logo,String openid1,String openid2,String openid3,String openid4,String openid5) {
		BaoxianGonshi baoxianGonshi = null;
		
		if (id==-1)
			baoxianGonshi  = new BaoxianGonshi();
		else
			baoxianGonshi  = findBaoxianGongshiById(id);
		baoxianGonshi.setName(name);
		if (logo!=null)
		{
			baoxianGonshi.setLogo("weixin/chexian/img/"+logo);
		}
		baoxianGonshi.setOpenid1(openid1);
		baoxianGonshi.setOpenid2(openid2);
		baoxianGonshi.setOpenid3(openid3);
		baoxianGonshi.setOpenid4(openid4);
		baoxianGonshi.setOpenid5(openid5);
		
		
		baoxianGonshiDAO.merge(baoxianGonshi);
		
	}

	/*
	 * 获取用户的保单
	 */
	public List getBaodanByUser(String weixinUser) {
		String hql = "from BaoxianBaodan where weixinUser.openid=?";
		List list = hqlDAO.query(hql, weixinUser);
		return list;
	}
	
	

}



