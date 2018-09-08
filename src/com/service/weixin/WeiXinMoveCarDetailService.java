package com.service.weixin;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.pojo.Applydetail;
import com.pojo.Movecar;
import com.util.JsonFilter;
import com.util.StringUtil;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

@Service
public class WeiXinMoveCarDetailService {
	@Autowired
	private HqlDAO hqlDAO;
	
	
	public List moveCarDetailListing(String weixinhao, int size, int page) {
		/*String hqlsum="select count(*) from Movecar where 1=1 ";
		int sum=(int) hqlDAO.unique(hqlsum);
		int count=sum%size==0 ? sum/size : sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;*/
		String hql="from Movecar  where userByUser.openid = ? order by time desc";
		List list=hqlDAO.pageQuery(hql, size, page, weixinhao);
		/*Map map=new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);
		map.put("list", list);*/
		return list;
	}
	
	public int getSum(int size, int page, String weixinhao){
		String hqlsum="select count(*) from Movecar where userByUser.openid = ? ";
		int sum=(int) hqlDAO.unique(hqlsum,weixinhao);
		//int count=sum%size==0 ? sum/size : sum/size+1;
		return sum;
	}

	public List<Movecar> findByOpenId(String weixinhao) {
		String hql = "from Movecar where userByCar.weixinUser.openid = ? order by time desc";
		List<Movecar> movecars = hqlDAO.findByHQL(hql, weixinhao);
		return movecars;
	}
	
	public List<Movecar> findByOpenId2(String weixinhao) {
		String hql = "from Movecar where userByUser.openid = ? order by time desc";
		List<Movecar> movecars = hqlDAO.findByHQL(hql, weixinhao);
		return movecars;
	}
	
	/**
	 * 根据车主查询挪车记录
	 * @param openid
	 * @return
	 */
	public String findAll(String openid) {
		String hql="from Movecar where userByCar.weixinUser.openid = ? order by time desc";
		List<Movecar> list = hqlDAO.findByHQL(hql, openid);
		//System.out.println("laile"+list.get(0)+list.get(1));
		/*net.sf.json.JSONArray jsonArray = new net.sf.json.JSONArray();
		for (Movecar moveCar : list) {
			net.sf.json.JSONObject object = new net.sf.json.JSONObject();
			object.put("status", moveCar.getStatus());
			object.put("id", moveCar.getId());
			object.put("userByCar()", moveCar.getUserByCar());
			object.put("time", moveCar.getTime());
			object.put("addr", moveCar.getAddr());
			jsonArray.add(object);
		}
		return jsonArray.toString();*/
		
		JsonConfig config=new JsonConfig();
		net.sf.json.JSONObject object = new net.sf.json.JSONObject();
		JsonFilter.ignoredSet(config);
		String json=JSONArray.fromObject(list, config).toString();
		return json;
	}
	/**
	 * 
	 *根据挪车人的微信号查询挪车记录
	 * @param openid
	 * @return
	 */
	public String findAll2(String openid) {
		String hql="from Movecar where userByUser.openid = ? order by time desc";
		List<Movecar> list = hqlDAO.findByHQL(hql, openid);
		JsonConfig config=new JsonConfig();
		net.sf.json.JSONObject object = new net.sf.json.JSONObject();
		JsonFilter.ignoredSet(config);
		String json=JSONArray.fromObject(list, config).toString();
		return json;
	}

	
	public List findByStatus(int size, int page, String openid, short status) {
		String hql="from Movecar where userByCar.weixinUser.openid = ? and status= ? order by time desc";
		List<Movecar> list=hqlDAO.pageQuery(hql, size, page, openid, status);
		//List<Movecar> list = hqlDAO.findByHQL(hql,openid,status);
		/*JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json=JSONArray.fromObject(list, config).toString();
		return json;*/
		return list;
	}
	
	public int getSum2(int size, int page, String weixinhao,short status){
		String hqlsum="select count(*) from Movecar where userByCar.weixinUser.openid = ? and status= ? ";
		int sum=(int) hqlDAO.unique(hqlsum,weixinhao,status);
		//int count=sum%size==0 ? sum/size : sum/size+1;
		return sum;
	}
	
}
