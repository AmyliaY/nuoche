package com.service.daili;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AdminDAO;
import com.dao.BusinessDAO;
import com.dao.HqlDAO;
import com.dao.ProxyDAO;
import com.dao.ServiceDAO;
import com.pojo.Business;
import com.pojo.Proxy;
import com.pojo.SylbImages;
import com.util.JsonFilter;
import com.util.MD5Util;
import com.util.StringUtil;

import net.sf.json.JsonConfig;

/**
 * 后台管理 管理
 * 
 * @author 康旺 2018.03.20
 * 
 */

@Service
public class DailiTopService {

	@Autowired
	private HqlDAO hqldao;

	/*
	 * @Autowired private ProxyDAO proxyDAO;
	 */

	@Autowired
	private ServiceDAO serviceDAO;

	@Autowired
	private BusinessDAO businessDAO;

	/**
	 * 根据置顶参数查询服务
	 * 
	 * @return 查询成功返回Service对象，失败返回null
	 */

	public Map yiZhiDingListing(int size, int page, String keywords,int id) {
		StringBuffer sb = new StringBuffer(" where 1=1 and business.proxy.id="+id+" and (isZhiding=0 or isZhiding=1 or isZhiding=2) ");
		List paramList = new ArrayList();
		if (StringUtil.isNotNull(keywords) && keywords.trim().length() > 0) {
			sb.append(" and title like ?");
			paramList.add("%"+keywords+"%");
			/*sb.append(" or business.shopname like ?");
			paramList.add("%" + keywords + "%"+" )");*/
		}
		String hqlsum = "select count(*) from Service" + sb.toString();
		int sum = (int) hqldao.unique(hqlsum, paramList.toArray());
		int count = sum % size == 0 ? sum / size : sum / size + 1;
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;
		String hql = "from Service s " + sb.toString() +" order by overtime desc,isZhiding desc";
		List list = hqldao.pageQuery(hql, size, page, paramList.toArray());
		// System.out.println("模糊查询sql语句"+hql);
		Map map = new HashMap();
		map.put("size", size);
		map.put("page", page);
		map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}

	/**
	 * 根据ID修改状态
	 * @param id
	 * @return service
	 */
	
	public com.pojo.Service updateIsZhiding(int id) {
		com.pojo.Service service = serviceDAO.findById(id);
		short isZhiding = service.getIsZhiding();
		Timestamp overtime = service.getOvertime();
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		if (service != null){	
			if(overtime != null){
				if(overtime.getTime() >= nousedate.getTime()){
					service.setIsZhiding((short)(1-isZhiding));
				}
				else if(overtime.getTime() < nousedate.getTime()){
					service.setIsZhiding((short)(2));
				}
				serviceDAO.save(service);
			}
		}	
		return service;
	}
	
	/**
	 * 根据ID修改时间并且状态改为1  即置顶状态显示已置顶
	 * @param id
	 * @return service
	 */
	
	public com.pojo.Service addIsZhiding(int id,Timestamp overtime) {
		com.pojo.Service service = serviceDAO.findById(id);
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		if (service != null){
				service.setOvertime(overtime);
				service.setIsZhiding((short)1);
				serviceDAO.save(service);
		}
		return service;
	}
	
	/**
	 * 根据ID修改时间和状态
	 * @param id
	 * @return service
	 */
	
	public com.pojo.Service editZhiding(int id,Timestamp overtime,short isZhiding) {
		com.pojo.Service service = serviceDAO.findById(id);
		if (service != null){
			if(overtime != null){
				service.setOvertime(overtime);
			}	
			service.setIsZhiding(isZhiding);
		}
		serviceDAO.save(service);
		return service;
	}

	/**
	 * 批量修改置顶
	 * @param type
	 * @param zhiding
	 * @param quxiao
	 */
	public void plupdateIsZhiding(int type, String zhiding, String quxiao) {	
		if (type == 1) {
			String hql = "update Service set isZhiding=1 where id in(" + zhiding + ")";
			hqldao.bulkUpdate(hql);
		} else {
			String hql = "update Service set isZhiding=0 where id in(" + quxiao + ")";
			hqldao.bulkUpdate(hql);
		}

	}
	
	/**
	 * 根据代理ID找所代理的商家
	 * @param id
	 * @return
	 */
	public List findbusiness(int id){
		String hql = "from Business where proxy.id = ?";
		List list = hqldao.query(hql, id);
		return list;
	}
	
	/**
	 * 根据商家id找服务
	 * @param id
	 * @return
	 */
	public String findService(int id){
		String hql = "from Service where business.id = ? and isZhiding = -1";
		List list = hqldao.query(hql, id);
		JsonConfig config=new JsonConfig();
		//config.setExcludes(new String[]{"proxy","goodses"});
		JsonFilter.ignoredSet(config);
		String json=net.sf.json.JSONArray.fromObject(list, config).toString();
		return json;
	}
	/**
	 * 根据服务ID找服务
	 * @param id
	 * @return
	 */
	public com.pojo.Service findServiceById(int id){
		com.pojo.Service service = serviceDAO.findById(id);
		return service;
	}
	

	public boolean deleteZhiding(int id) {
		com.pojo.Service service = serviceDAO.findById(id);
		if (service != null){
			service.setIsZhiding((short)(-1));
			serviceDAO.save(service);
			return true;
			}
		return false;

	}
	
	/**
	 * 更新数据库置顶状态  
	 * @return
	 */
	public void guoqiZhiding() {
		Date date = new Date();       
		Timestamp nousedate = new Timestamp(date.getTime());
		String hql = "update Service set isZhiding=2 where isZhiding <>-1 and overtime <= '"+nousedate+"'";
		hqldao.bulkUpdate(hql);
		System.out.println("更新数据库置顶状态成功");

	}

	public void plDelete(String delete) {
		String hql = "update Service set isZhiding=-1 where id in(" + delete + ")";
		hqldao.bulkUpdate(hql);
		System.out.println("批量删除置顶成功");
	}

	/**
	 * @param isZhiding:是否置顶参数,updated:更新时间
	 *            根据 置顶参数=1 且 更新时间离当前时间大于一个星期 为即将过期置顶服务
	 * 
	 * @return 查询成功返回List集合，失败返回null
	 */

}
