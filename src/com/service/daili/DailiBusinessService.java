package com.service.daili;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.MapUtils;
import oracle.net.aso.g;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AreaDAO;
import com.dao.BusinessDAO;
import com.dao.CityDAO;
import com.dao.HqlDAO;
import com.dao.ProxyDAO;
import com.pojo.Area;
import com.pojo.Business;
import com.pojo.City;
import com.pojo.Province;
import com.pojo.Proxy;
import com.util.MapUtil;
import com.util.StringUtil;

@Service
public class DailiBusinessService {


@Autowired
private HqlDAO hqldao;
@Autowired
private BusinessDAO businessDAO;
@Autowired
private AreaDAO areaDAO;
@Autowired
private CityDAO cityDAO;
@Autowired
private ProxyDAO pDAO;
	public Business findAll() {
		// TODO Auto-generated method stub
		Business business = businessDAO.findById(2);
		System.out.println(business.getId());
		return business;
		
	}
	public Map sjbusiness(int size,int page,String keywords,Proxy proxy) {
		/**
		 * 查询当前代理所代理的店铺
		 */
		//查出当前代理所在的city的所有area
		StringBuffer city = new StringBuffer("(");
		Area area = proxy.getArea();
		City city2 = area.getCity();
		String hql2="from Area  a where a.city.ctId=?";
		List<Area> arealist=hqldao.findByHQL(hql2, city2.getCtId());
		for (Area object : arealist) {
			city.append(object.getArId());
			city.append(",");
		}
		city.deleteCharAt(city.length()-1);
		city.append(")");
		System.out.println(city);
		StringBuffer sb = new StringBuffer(" where (status=0 and area in "+city+") or proxy="+proxy.getId());
		System.out.println(sb);
		List paramList = new ArrayList();
		if (StringUtil.isNotNull(keywords) && keywords.trim().length() > 0) {
			sb.append(" and shopname like ?");
			paramList.add("%" + keywords + "%");
		}	
		String hqlsum = "select count(*) from Business" + sb.toString();
		System.out.println("you");
		int sum = (int) hqldao.unique(hqlsum,paramList.toArray());
		int count = sum % size == 0 ? sum / size : sum / size + 1;
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;		
		String hql = "from Business" + sb.toString()
		+ " order by status";		
		List list = hqldao.pageQuery(hql, size, page, paramList.toArray());
		/**
		 * 查询与当前代理同city且未被审核的（status==0）店铺
		 */
		
		Map map = new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("keywords", keywords);
		map.put("sum", sum);
		map.put("list", list);
		map.put("count", count);
		return map;
		
	}
	public List getAllbusiness() {
		String hql = "from Business where status = 1";
		List list = hqldao.query(hql);
		if (list.size()>0) {
			return list;
		}
		return null;
	}
	
	//修改商家状态   0未审核  1审核 
	public Business xiugaistatus(int id, Proxy proxy) {
		Business business = businessDAO.findById(id);
		if (business != null) {
			int status = business.getStatus();
			System.out.println(status);
			
			
			if (status == 0) {
				business.setStatus((short)1);
				business.setProxy(proxy);
			}else if (status == 1) {
				business.setStatus((short)0);
			}else if (status == 2) {
				business.setStatus((short)1);
			}
			
			//谁操作的，申请店铺的proxy就是谁
			
		}
		businessDAO.save(business);
		return business;
	}
	//设置商品下架
	public Business deletebusiness(int id) {
		// TODO Auto-generated method stub
		Business business = businessDAO.findById(id);
		if (business != null) {
			business.setStatus((short)2);
		
		
		}
		businessDAO.save(business);
		return business;
	}
	public Business findById(int id) {
		return businessDAO.findById(id);
	}
	
	//修改商品
	public void update_goods(String gname,
			String gchandi, String gpinpai,String jianjie, String gimages,
			 String gprice, String gvipprice,
			String gstatus, String gzhongchou, String gdelia, String gid,String localImag) throws IOException {
		Business goods = businessDAO.findById(Integer.parseInt(gid));
		goods.setShopname(gname);
		goods.setRealname(gchandi);
		goods.setShopaddr(gpinpai);
		goods.setTel(jianjie);
		// goods.setGimages("/admin/images/goods/" + gimages);
		
		Double j = 0.0;
		Double w = 0.0;
		Double j_t=0.0;
		Double w_t=0.0;
		try {
			Map<String, Double> baidu_map=MapUtil.getLngAndLatByBaidu(gpinpai);
			j = baidu_map.get("j");
			w = baidu_map.get("w");
			
			Map<String, Double> tencen_map=MapUtil.getLngAndLatByTencent(j,w);
			j_t=tencen_map.get("j");
			w_t=tencen_map.get("w");
			goods.setLatitude(j);
			goods.setLongitude(w);
		} catch (Exception e) {
			
		}
		
		goods.setEmail(gprice);
		goods.setShoptype(gvipprice);
		goods.setGender((short)Integer.parseInt(gstatus));
		goods.setStatus((short)Integer.parseInt(gzhongchou));
		
		if (StringUtil.isNotNull(gimages)) 
		goods.setShoplogo("daili/images/lunboimg/"+gimages);
		
		goods.setShopDesc(gdelia);
		businessDAO.save(goods);

	

	}
	
	public void insert_goods(String gname,
			String gchandi, String gpinpai,String jianjie, String gimages,
			 String gprice, String gvipprice,
			String gstatus, String gzhongchou, String gdelia, String gid,String localImag,Proxy proxy,String arid) throws IOException {
		Business goods = new Business();
		String hql = "from Area where arid = ?";
		Area area = areaDAO.findById(Integer.parseInt(arid));
		String areaname = area.getArName();
		City city = area.getCity();
		String ctname = city.getCtName();
		Province p = city.getProvince();
		String pname = p.getPrName();
		goods.setArea(area);
		goods.setProxy(proxy);
		goods.setShopname(gname);
		goods.setRealname(gchandi);
		goods.setShopaddr(gpinpai);
		goods.setTel(jianjie);
		// goods.setGimages("/admin/images/goods/" + gimages);
		Double j = 0.0;
		Double w = 0.0;
		Double j_t=0.0;
		Double w_t=0.0;
		try {
			System.out.println( "拼地址："+pname+ctname+areaname+gpinpai);
			Map<String, Double> baidu_map=MapUtil.getLngAndLatByBaidu(pname+ctname+areaname+gpinpai);
			j = baidu_map.get("j");
			w = baidu_map.get("w");
			 
			Map<String, Double> tencen_map=MapUtil.getLngAndLatByTencent(j,w);
			j_t=tencen_map.get("j");
			w_t=tencen_map.get("w");
			goods.setLatitude(w);
			goods.setLongitude(j);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		goods.setEmail(gprice);
		goods.setShoptype(gvipprice);
		goods.setGender((short)Integer.parseInt(gstatus));
		goods.setStatus((short)Integer.parseInt(gzhongchou));
		goods.setShoplogo("daili/images/lunboimg/"+gimages);
		Date date = new Date();       
		Timestamp registtime = new Timestamp(date.getTime());
		goods.setRegisttime(registtime);
		System.out.println("daili/images/lunboimg/"+gimages);
		goods.setShopDesc(gdelia);
		System.out.println("新增service");
		businessDAO.save(goods);
		
		
		
		 

	}
	public Map xjbusiness(int size, int page, String keywords) {
		StringBuffer sb = new StringBuffer(" where status = 2 ");
		List paramList = new ArrayList();
		if (StringUtil.isNotNull(keywords) && keywords.trim().length() > 0) {
			sb.append(" and shopname like ?");
			paramList.add("%" + keywords + "%");
		}	
		
		String hqlsum = "select count(*) from Business" + sb.toString();
		System.out.println("you");
		int sum = (int) hqldao.unique(hqlsum,paramList.toArray());
		int count = sum % size == 0 ? sum / size : sum / size + 1;
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;		
		String hql = "from Business" + sb.toString()
		+ " order by status";		
		
		List list = hqldao.pageQuery(hql, size, page, paramList.toArray());
		
		Map map = new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("keywords", keywords);
		map.put("sum", sum);
		map.put("list", list);
		map.put("count", count);
		return map;
		
	
	}
	public List getXJbusiness() {
		String hql = "from Business where status = 2";
		List list = hqldao.query(hql);
		if (list.size()>0) {
			return list;
		}
		return null;
	}
	public void plxiajiagoods(String xiajia) {
		String hql = "update Business set status=2 where id in ("
				+ xiajia + ")";
		hqldao.bulkUpdate(hql);
	}
	public void plshangjiagoods(String xiajia) {
		// TODO Auto-generated method stub
		String hql = "update Business set status=1 where id in ("
				+ xiajia + ")";
		hqldao.bulkUpdate(hql);
	}
	public Proxy findProxy(Integer id) {
		// TODO Auto-generated method stub
		return pDAO.findById(id);
	}

	public int testdingwei(String xiangxidizhi,String arid) {
		String hql = "from Area where arid = ?";
		Area area = areaDAO.findById(Integer.parseInt(arid));
		String areaname = area.getArName();
		City city = area.getCity();
		String ctname = city.getCtName();
		Province p = city.getProvince();
		String pname = p.getPrName();
		
		System.out.println(pname+ctname+areaname+xiangxidizhi);
		Map<String, Double> baidu_map1=MapUtil.getLngAndLatByBaidu(pname+ctname+areaname);
		Map<String, Double> baidu_map2=MapUtil.getLngAndLatByBaidu(pname+ctname+areaname+xiangxidizhi);
		System.out.println("地址1："+baidu_map1);
		System.out.println("地址2："+baidu_map2);
		if(baidu_map1.equals(baidu_map2))
			return 0;
		else 
			return 1;
	}
		
		
		
	


}
