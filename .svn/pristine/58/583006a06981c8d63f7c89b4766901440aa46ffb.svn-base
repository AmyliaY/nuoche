package com.shop.service.app;

import java.sql.Timestamp;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AddressDAO;
import com.dao.AreaDAO;
import com.dao.HqlDAO;
import com.dao.UserinfoDAO;
import com.pojo.Address;
import com.pojo.Area;
import com.pojo.Userinfo;
import com.util.JsonFilter;

@Service
public class AppAddressService {
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private UserinfoDAO userinfoDAO;
	@Autowired
	private AreaDAO areaDAO;
	@Autowired
	private AddressDAO addressDAO;
	
	Logger logger = Logger.getRootLogger();
	
	public String getAllAddress(int id) {
		String hql="from Address where userinfo.usersId=? and adExist=1 order by adStatus desc,adTime desc";
		List list=hqlDAO.query(hql, id);
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json=JSONArray.fromObject(list,config).toString();
		return json;
	}
	public String getAllCity(int id) {
		String hql="from City where province.prId=?";
		List list=hqlDAO.query(hql,id);
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json=JSONArray.fromObject(list,config).toString();
		return json;
	}
	public String getAllProvice() {
		String hql="from Province";
		List list=hqlDAO.query(hql);
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json=JSONArray.fromObject(list,config).toString();
		return json;
	}
	public String getAllArea(int id) {
		String hql="from Area where city.ctId=?";
		List list=hqlDAO.query(hql,id);
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json=JSONArray.fromObject(list,config).toString();
		return json;
	}
	public void addAddress(int adId,int uid, String adname, String adphone,
			int adarea, String addetail, int adstatus) {
		Userinfo userinfo=userinfoDAO.findById(uid);	//会员
		Area area=areaDAO.findById(adarea); 			//区/县
		
		Address address=new Address();
		address.setUserinfo(userinfo);
		address.setAdName(adname);
		address.setAdPhone(adphone);
		address.setArea(area);
		address.setAdDetail(addetail);
		address.setAdStatus(adstatus);
		address.setAdTime(new Timestamp(System.currentTimeMillis()));
		address.setAdExist(1);
		if (adstatus==1 ) {
			//找出这个用户的所有地址
			String hql = "from Address a where a.userinfo.usersId = ?";
			List<Address> list = hqlDAO.findByHQL(hql, uid);
			if(list.size()>0){
				
				for (Address a : list) {
					a.setAdStatus(0);
					addressDAO.save(a);
				}
			}
			
		}
		addressDAO.save(address);
	}
	public boolean deleteAddress(int id) {
		Address address=addressDAO.findById(id);
		if(address!=null)
		{
			System.out.print("123");
			String hql="update Address set adExist=0 where adId=?";
			hqlDAO.zsg(hql, id);
			return true;
		}
		return false;
	}
	public Address updataStatus(int adId,int id, int status) {
		Address address1=addressDAO.findById(id);
		if(adId==-1){	//取消默认收货地址
			address1.setAdStatus(0);
		}else if(adId==0){	//没有默认收货地址
			address1.setAdStatus(status);
		}else{	//改变默认收货地址
			Address address2=addressDAO.findById(adId);
			address1.setAdStatus(status);
			address2.setAdStatus(0);
		}
			addressDAO.save(address1);
			return address1;
	}
	public void editAddress(int id, String adname, String adphone, int adarea,
			String addetail, int adstatus) {
		Address address1=addressDAO.findById(id);
	
		Area area=areaDAO.findById(adarea);
		if(address1!=null){
			address1.setAdName(adname);
			address1.setAdPhone(adphone);
			address1.setArea(area);
			address1.setAdDetail(addetail);
			address1.setAdStatus(adstatus);
			address1.setAdTime(new Timestamp(System.currentTimeMillis()));
			if (adstatus==1 ) {
				//找出这个用户的所有地址
				String hql = "from Address a where a.userinfo.usersId = ?";
				List<Address> list = hqlDAO.findByHQL(hql, address1.getUserinfo().getUsersId());
				if(list.size()>0){
					for (Address a : list) {
						if(a.getAdId() != id){
							a.setAdStatus(0);
							addressDAO.merge(a);
						}
					}
				}
			}
			address1.setAdDetail(addetail);
			logger.error("状态："+addetail);
			addressDAO.merge(address1);
		}
	}

}
