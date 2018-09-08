package com.service.wap;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * 
 * @author 全恒
 *
 */

@org.springframework.stereotype.Service
public class WapServiceManagerService {

	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private BusinessDAO businessDAO;
	@Autowired
	private ServiceDAO serviceDAO;
	@Autowired
	private ServiceTypeDAO serviceTypeDAO;
	
	public List getServiceList(Integer businessid, int size, int page) {
		String hql = "from Service where business.id=? order by updated desc";
		List servicelist = hqlDAO.pageQuery(hql, size, page, businessid);
		System.out.println("servicelist:"+servicelist.size());
		return servicelist;
	}

	public void addservice(Integer bid, Integer stid, String stitle, String describe, Double scprice, Double yyprice,
			Integer time, String cimages) {
		Service service=new Service();
		Business business = businessDAO.findById(bid);
		service.setBusiness(business);
		ServiceType serviceType = serviceTypeDAO.findById(stid);
		service.setServiceType(serviceType);
		service.setTitle(stitle);
		service.setServiceDesc(describe);
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
	 * 编辑服务
	 * @param id
	 * @param title
	 * @param shichangPrice
	 * @param yuyuePrice
	 * @param time
	 * @param servicetype
	 */
	public void editservice(int id, String title, Double shichangPrice, Double yuyuePrice, Integer time, Integer servicetype, 
			String describe, String images) {
		Service service=serviceDAO.findById(id);
		System.out.println(service!=null);
		if(service!=null){
			ServiceType serviceType = serviceTypeDAO.findById(servicetype);
			service.setServiceType(serviceType);
			service.setTitle(title);
			System.out.println("标题2————————————————————————"+title);
			service.setShichangPrice(shichangPrice);
			service.setYuyuePrice(yuyuePrice);
			service.setTime(time);
			service.setServiceDesc(describe);
			service.setImage("daili/images/lunboimg/"+images);
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dateString = sdf.format(date);
			Timestamp updated = Timestamp.valueOf(dateString);
			service.setUpdated(updated);
		}
		serviceDAO.save(service);
		
	}

	public Service updatestatus(int id) {
		Service Service=serviceDAO.findById(id);
		int status=Service.getStatus();
		if(Service!=null)
			Service.setStatus((short) (1-status));
			serviceDAO.save(Service);
		return Service;
	}

	
	/**
	 * 总条数
	 * @param size
	 * @param page
	 * @param id
	 * @return
	 */
	public int getSum(int size, int page, Integer id) {
		String hqlsum="select count(*) from Service where business.id = ?";
		int sum=(int) hqlDAO.unique(hqlsum, id);
		return sum;
	}

	public Service editserviceview(int id) {
		Service Service=serviceDAO.findById(id);
		if(Service!=null)
			serviceDAO.findAll();
		return Service;
	}

	public List findServiceType(){
		return serviceTypeDAO.findAll();
	}

}
