package com.service.daili;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AreaDAO;
import com.dao.CityDAO;
import com.dao.HqlDAO;
import com.dao.ProxyDAO;
import com.pojo.Area;
import com.pojo.Proxy;
import com.pojo.SylbImages;
import com.sun.java_cup.internal.production;
import com.util.StringUtil;
/**
 * 后台管理 管理
 * 
 * @author 冯慧
 * 
 */
@Service
public class DailiManageService {
	@Autowired
	private ProxyDAO proxyDAO;
	@Autowired 
	private HqlDAO hqldao;
	@Autowired
	private AreaDAO areaDao;

	
	/*得到总条数*/
	public int getsum(int id,String keywords) {
		List paramList = new ArrayList();
		StringBuffer sb=new StringBuffer();
		if (StringUtil.isNotNull(keywords) && keywords.trim().length() > 0) {
			sb.append(" and realname like ?");
			paramList.add("%" + keywords + "%");
		} 
		String hqlsum = "select count(*) from Proxy where parentId="+id+" and (status=1 or status=0) "+sb.toString();
		int total= (int) hqldao.unique(hqlsum, paramList.toArray());
		System.out.println("-------total-----");
		System.out.println(total);
		System.out.println("-------total-----");
		return total;
	}

	/*删除子代理*/
	public boolean deletezidaili(int id) {
		Proxy proxy=proxyDAO.findById(id);
		if (proxy != null){
			//1在职 0离职
			proxy.setStatus((short)2);
			proxyDAO.save(proxy);
			return true;
			}
		return false;
	}

	//列出所有子代理
	public Map listZiDaili(int size, int page, String keywords, Integer id) {
		StringBuffer sb = new StringBuffer(" where 1=1 and parentId="+id+" and (status=1 or status=0)");	
		int sum=getsum(id,keywords);
		System.out.println("-------sum-----");
		System.out.println(sum);
		System.out.println("-------sum-----");
		int count = sum % size == 0 ? sum / size : sum / size + 1;
		System.out.println(count);
		List paramList = new ArrayList();
		if (StringUtil.isNotNull(keywords) && keywords.trim().length() > 0) {
			sb.append(" and realname like ?");
			paramList.add("%" + keywords + "%");
		} /*else {
			sb.append(" and isZhiding=1 or isZhiding=0");
		}*/
		String hqlsum = "select count(*) from Proxy" + sb.toString();
		
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;
		String hql = "from Proxy " + sb.toString();
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
	//批量删除
	public void plDeleteDl(String delete) {
		String hql = "update Proxy set status=2 where id in(" + delete + ")";
		hqldao.bulkUpdate(hql);
		System.out.println("批量删除代理成功");
	}
	//做新增子代理
	public void doaddzidaili(Proxy proxy2,Integer arId) {
		Area area = areaDao.findById(arId);
		proxy2.setArea(area);
		proxyDAO.save(proxy2);
		
	}

	public boolean cheaktel(String tel) {
		List<Proxy> list=proxyDAO.findByTel(tel);
		if(list.size()>0){
			return true;
		}
		return false;
	}

	public List selectArea(Proxy proxy) {
		Integer fuCtId = proxy.getArea().getCity().getCtId();
		String hql = "from Area where city.ctId=?";
		List areaList = hqldao.query(hql, fuCtId);
		System.out.println(areaList);
		return areaList;
	}

	/**
	 * 查询该城市的在职的一级代理人数
	 * @param ctId
	 * @return
	 */
	public String findOnProxy(int area) {
		String hql = "from Area where arId = ?";
		List<Area> list = hqldao.query(hql, area);
		int onproxy_num = 0;
		for (Area area2 : list) {
			int arId = area2.getArId();
			String hql2 = "from Proxy where status=1 and area.arId = ?";
			List list2 = hqldao.query(hql2, arId);
			onproxy_num += list2.size();
		}
		return onproxy_num+"";
	}

	/**
	 * 修改代理状态 禁用 or 启用
	 */
	public Proxy updatestatus(int id) {
		Proxy proxy=proxyDAO.findById(id);
		int status=proxy.getStatus();
		if(proxy!=null)
			proxy.setStatus((short) (1-status));
			proxyDAO.save(proxy);
		return proxy;
	}

}
