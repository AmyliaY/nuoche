package com.service.daili;

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

import com.dao.BusinessDAO;
import com.dao.HqlDAO;
import com.dao.ServiceDAO;
import com.dao.ServiceTypeDAO;
import com.pojo.Business;
import com.pojo.Service;
import com.pojo.ServiceType;
import com.util.JsonFilter;
import com.util.StringUtil;

import net.sf.json.JsonConfig;

/**
 * @author 全恒
 */

@org.springframework.stereotype.Service
public class DailiServiceService {

	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private ServiceDAO serviceDAO;
	@Autowired
	private BusinessDAO businessDAO;
	@Autowired
	private ServiceTypeDAO serviceTypeDAO;
	
	/**
	 * 服务列表
	 */
	public Map servicelisting(int size, int page, String keywords, String stId ,Integer proxyid){
		StringBuffer sb=new StringBuffer(" where 1=1 and business.proxy.id="+proxyid);
		List paramList=new ArrayList();
		if(StringUtil.isNotNull(stId) && stId.trim().length()>0 && stId.trim() != "-1")
		{
			sb.append(" and serviceType.id = ?");
			int sstId = Integer.parseInt(stId);
			paramList.add(sstId);
		}
		if(StringUtil.isNotNull(keywords) && keywords.trim().length()>0)
		{
			sb.append(" and title like ?");
			paramList.add("%"+keywords+"%");
		}else{
			//0下架 1上架 2逻辑删除
			sb.append(" and status=1 or status=0");
		}
		String hqlsum="select count(*) from Service"+sb.toString();
		int sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
		int count=sum%size==0 ? sum/size :sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		String hql="from Service"+sb.toString()+" order by time desc";
		List list=hqlDAO.pageQuery(hql, size, page, paramList.toArray());
		Map map=new HashMap();
		map.put("size", size);
		map.put("page", page);
		map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}
	
	/**
	 * 修改轮播图状态 禁用 or 启用
	 */
	public Service updatestatus(int id) {
		Service Service=serviceDAO.findById(id);
		int status=Service.getStatus();
		if(Service!=null)
			Service.setStatus((short) (1-status));
			serviceDAO.save(Service);
		return Service;
	}
	
	/**
	 * 批量启用 or 禁用
	 */
	public void plupdatestatus(short type, String qiyong, String jinyong) {
		if(type==1){
			String hql="update Service set status=1 where id in("+qiyong+")";
			hqlDAO.bulkUpdate(hql);
		}else{
			String hql="update Service set status=0 where id in("+jinyong+")";
			hqlDAO.bulkUpdate(hql);
		}
		
	}
	
	/**
	 * 进入编辑轮播图页面
	 */
	public Service editserviceview(int id) {
		Service Service=serviceDAO.findById(id);
		if(Service!=null)
			serviceDAO.findAll();
		return Service;
	}
	
	/**
	 * 编辑轮播图
	 */
	public void editservice(int id, int bid, int stid,String stitle, String desc, 
			double scprice, double yyprice, int time, String cimages) {
		Service service=serviceDAO.findById(id);
		if(service!=null){
			Business business = businessDAO.findById(bid);
			service.setBusiness(business);
			ServiceType serviceType = serviceTypeDAO.findById(stid);
			service.setServiceType(serviceType);
			service.setTitle(stitle);
			service.setServiceDesc(desc);
			service.setShichangPrice(scprice);
			service.setYuyuePrice(yyprice);
			service.setTime(time);
			service.setImage("daili/images/lunboimg/"+cimages);
			/*Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dateString = sdf.format(date);
			Timestamp update = Timestamp.valueOf(dateString);*/
			//修改更新时间
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dateString = sdf.format(date);
			Timestamp updated = Timestamp.valueOf(dateString);
			service.setUpdated(updated);
		}
		serviceDAO.save(service);
		
	}
	
	/**
	 * 添加服务
	 */
	public void addservice(int bid, int stid,String stitle, String desc, 
			double scprice, double yyprice, int time, String cimages) {
		Service service=new Service();
		Business business = businessDAO.findById(bid);
		service.setBusiness(business);
		ServiceType serviceType = serviceTypeDAO.findById(stid);
		service.setServiceType(serviceType);
		service.setTitle(stitle);
		service.setServiceDesc(desc);
		service.setShichangPrice(scprice);
		service.setYuyuePrice(yyprice);
		service.setTime(time);
		service.setImage("daili/images/lunboimg/"+cimages);
		service.setStatus((short)1);
		//创建时间，更新时间
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = sdf.format(date);
		Timestamp created = Timestamp.valueOf(dateString);
		service.setCreated(created);
		service.setUpdated(created);
		
		serviceDAO.save(service);
		
	}
	
	/**
	 * 删除服务
	 */
	public boolean deleteservice(int id) {
		Service service=serviceDAO.findById(id);
		if(service!=null){
			serviceDAO.delete(service);
			return true;
		}
		return false;
		
	}
	
	/**
	 * 批量删除轮播图
	 */
	public void pldelete(String shanchu) {
		String hql="delete from Service where id in("+shanchu+")";
		hqlDAO.bulkUpdate(hql);
		
	}
	
	/**
	 * 查找当前代理的商家
	 * @param id
	 * @return
	 */
	public List findbusiness(int id){
		String hql = "from Business where proxy.id = ?";
		List list = hqlDAO.query(hql, id);
		/*JsonConfig config=new JsonConfig();
		//config.setExcludes(new String[]{"proxy","goodses"});
		JsonFilter.ignoredSet(config);
		String json=net.sf.json.JSONArray.fromObject(list, config).toString();*/
		return list;
	}
	
	/**
	 * 查找服务类型
	 * @param id
	 * @return
	 */
	public List findServiceType(){
		return serviceTypeDAO.findAll();
	}
	
	public String findservice(int id){
		String hql = "from Service where business.id = ?";
		List list = hqlDAO.query(hql, id);
		JsonConfig config=new JsonConfig();
		//config.setExcludes(new String[]{"proxy","goodses"});
		JsonFilter.ignoredSet(config);
		String json=net.sf.json.JSONArray.fromObject(list, config).toString();
		return json;
	}

	public String getStName(String stId) {
		if(StringUtil.isNotNull(stId) && stId.trim().length()>0 && stId.trim() != "-1")
		{
			ServiceType serviceType = serviceTypeDAO.findById(Integer.parseInt(stId));
			if(serviceType != null){
				return serviceType.getName();
			}
		}
		return null;
	}

	
}
