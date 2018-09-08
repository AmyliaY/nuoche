package com.service.admin;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.dao.AreaDAO;
import com.dao.BusinessDAO;
import com.dao.HqlDAO;
import com.dao.ProvinceDAO;
import com.dao.ProxyDAO;
import com.dao.ServiceDAO;
import com.dao.SylbImagesDAO;
import com.pojo.Area;
import com.pojo.Business;
import com.pojo.Province;
import com.pojo.Service;
import com.pojo.SylbImages;
import com.pojo.Proxy;
import com.pojo.Proxy;
import com.util.JsonFilter;
import com.util.MD5Util;
import com.util.StringUtil;

import net.sf.json.JsonConfig;

/**
 * @author 全恒
 */

@org.springframework.stereotype.Service
public class AdminProxyService {

	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private ProxyDAO proxyDAO;
	@Autowired
	private ProvinceDAO provinceDAO;
	@Autowired
	private AreaDAO areaDAO; 
	
	/**
	 * 代理列表
	 */
	public Map proxylisting(int size, int page, String keywords){
		//只查所有的一级代理level=1
		StringBuffer sb=new StringBuffer(" where level=1 ");
		List paramList=new ArrayList();
		if(StringUtil.isNotNull(keywords) && keywords.trim().length()>0)
		{
			sb.append(" and tel like ?");
			paramList.add("%"+keywords+"%");
		}
		
		String hqlsum="select count(*) from Proxy"+sb.toString();
		int sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
		int count=sum%size==0 ? sum/size :sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		String hql="from Proxy "+sb.toString()+" order by createdTime desc";
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
	 * 修改代理状态 在职 or 离职
	 */
	public Proxy updatestatus(int id) {
		Proxy proxy=proxyDAO.findById(id);
		int status=proxy.getStatus();
		if(proxy!=null)
			proxy.setStatus((short) (1-status));
			proxyDAO.save(proxy);
		return proxy;
	}
	
	/**
	 * 批量在职 or 离职
	 */
	public void plupdatestatus(short type, String qiyong, String jinyong) {
		if(type==1){
			String hql="update Proxy set status=1 where id in("+qiyong+")";
			hqlDAO.bulkUpdate(hql);
		}else{
			String hql="update Proxy set status=0 where id in("+jinyong+")";
			hqlDAO.bulkUpdate(hql);
		}
	}
	
	
	/**
	 * 添加代理
	 * @param arid 
	 */
	public void addproxy(String proxyname, String proxytel, int arid) {
		Proxy proxy=new Proxy();
		//真实姓名
		proxy.setRealname(proxyname);
		//电话
		proxy.setTel(proxytel);
		//默认密码为：147258369
		String password = "123456";
		String pwd = MD5Util.getMD5(MD5Util.getMD5(password+"sunjob")+"sunjob");
		proxy.setPassword(pwd);
		//设置所在区县arId
		Area area = areaDAO.findById(arid);
		proxy.setArea(area);
		//设置状态为1，在职
		proxy.setStatus((short)1);
		//设置代理所在树形结构的层级
		proxy.setLevel((short)1);
		//设置代理父节点id
		proxy.setParentId(0);
		//设置创建时间
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString=sdf.format(date);
		Timestamp cimgTime=Timestamp.valueOf(dateString);
		proxy.setCreatedTime(cimgTime);
		
		proxyDAO.save(proxy);
	}
	
	/**
	 * 进入显示业绩
	 */
	public Proxy showAchievement(int id) {
		Proxy proxy=proxyDAO.findById(id);
		if(proxy!=null)
			proxyDAO.findAll();
		return proxy;
	}

	/**
	 * 查询所有的省份
	 * @return
	 */
	public List<Province> getProvince() {
		List<Province> provinceList = provinceDAO.findAll();
		return provinceList;
	}

	/**
	 * 根据省份id查城市
	 * @param prid
	 * @return
	 */
	public String findCity(int prid){
		String hql = "from City where province.prId = ?";
		List list = hqlDAO.query(hql, prid);
		JsonConfig config=new JsonConfig();
		//config.setExcludes(new String[]{"proxy","goodses"});
		JsonFilter.ignoredSet(config);
		String json=net.sf.json.JSONArray.fromObject(list, config).toString();
		return json;
	}

	/**
	 * 根据城市id查区县
	 */
	public String findArea(int ctId) {
		String hql = "from Area where city.ctId = ?";
		List list = hqlDAO.query(hql, ctId);
		JsonConfig config=new JsonConfig();
		//config.setExcludes(new String[]{"proxy","goodses"});
		JsonFilter.ignoredSet(config);
		String json=net.sf.json.JSONArray.fromObject(list, config).toString();
		return json;
	}

	/**
	 * 查询该城市的在职的一级代理人数
	 * @param ctId
	 * @return
	 */
	public String findOnProxy(int ctId) {
		String hql = "from Area where city.ctId = ?";
		List<Area> list = hqlDAO.query(hql, ctId);
		int onproxy_num = 0;
		for (Area area : list) {
			int arId = area.getArId();
			String hql2 = "from Proxy where status=1 and area.arId = ?";
			List list2 = hqlDAO.query(hql2, arId);
			onproxy_num += list2.size();
		}
		return onproxy_num+"";
	}
}
