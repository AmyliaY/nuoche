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
import com.dao.SylbImagesDAO;
import com.pojo.Business;
import com.pojo.Service;
import com.pojo.SylbImages;
import com.pojo.SylbImages;
import com.util.JsonFilter;
import com.util.StringUtil;

import net.sf.json.JsonConfig;

/**
 * @author 全恒
 */

@org.springframework.stereotype.Service
public class DailiLunboService {

	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private SylbImagesDAO sylbImagesDAO;
	@Autowired
	private ServiceDAO serviceDAO;
	@Autowired
	private BusinessDAO businessDAO;
	
	/**
	 * 轮播图片列表
	 */
	public Map lunboimglisting(int size, int page, String keywords, Integer proxyid){
		StringBuffer sb=new StringBuffer(" where 1=1 and proxy ="+proxyid);
		List paramList=new ArrayList();
		if(StringUtil.isNotNull(keywords) && keywords.trim().length()>0)
		{
			sb.append(" and title like ?");
			paramList.add("%"+keywords+"%");
		}else{
			sb.append(" and status=1 or status=0");
		}
		String hqlsum="select count(*) from SylbImages"+sb.toString();
		int sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
		int count=sum%size==0 ? sum/size :sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		String hql="from SylbImages "+sb.toString()+" order by time desc";
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
	 * 修改轮播图状态 禁用 or 启用
	 */
	public SylbImages updatestatus(int id) {
		SylbImages SylbImages=sylbImagesDAO.findById(id);
		int status=SylbImages.getStatus();
		if(SylbImages!=null)
			SylbImages.setStatus((short) (1-status));
			sylbImagesDAO.save(SylbImages);
		return SylbImages;
	}
	
	/**
	 * 批量启用 or 禁用
	 */
	public void plupdatestatus(short type, String qiyong, String jinyong) {
		if(type==1){
			String hql="update SylbImages set status=1 where id in("+qiyong+")";
			hqlDAO.bulkUpdate(hql);
		}else{
			String hql="update SylbImages set status=0 where id in("+jinyong+")";
			hqlDAO.bulkUpdate(hql);
		}
		
	}
	
	/**
	 * 进入编辑轮播图页面
	 */
	public SylbImages editlunboimgview(int id) {
		SylbImages SylbImages=sylbImagesDAO.findById(id);
		if(SylbImages!=null)
			sylbImagesDAO.findAll();
		return SylbImages;
	}
	
	/**
	 * 编辑轮播图
	 */
	public void editlunboimg(int id, int cimtype, String Title, String cimages, 
			String cdescribe, Timestamp cimgTime, String bid, String sid, String bid2) {
		SylbImages lunbo=sylbImagesDAO.findById(id);
		if(lunbo!=null)
			lunbo.setTitle(Title);
			lunbo.setImage("daili/images/lunboimg/"+cimages);
			//0为内容，1为服务，2为商家
			if(cimtype==0){
				lunbo.setType((short)0);
				lunbo.setDetail(cdescribe);
			}
			if(cimtype==1){
				lunbo.setType((short)1);
				Service service = serviceDAO.findById(Integer.parseInt(sid));
				lunbo.setService(service);
			}
			if(cimtype==2){
				lunbo.setType((short)2);
				Business business = businessDAO.findById(Integer.parseInt(bid2));
				lunbo.setBusiness(business);
			}
			//修改更新时间
			lunbo.setUpdate(cimgTime);
		sylbImagesDAO.save(lunbo);
		
	}
	
	/**
	 * 添加轮播图
	 */
	public void addlunboimg(String Title, String Status,
			String cimgtype, String cimages, String cimgdescribe, String bid, String sid, String bid2, Integer proxyid) {
		SylbImages lunbo=new SylbImages();
		lunbo.setProxy(proxyid);
		lunbo.setTitle(Title);
		lunbo.setStatus(Short.parseShort(Status));
		lunbo.setType(Short.parseShort(cimgtype));
		System.out.println(cimgtype);
		if(cimgtype.trim().equals("0")){
			lunbo.setDetail(cimgdescribe);
		}else if(cimgtype.trim().equals("1")){
			if(sid.trim()!=null){
				Integer intbid = Integer.parseInt(bid);
				Business business = businessDAO.findById(intbid);
				Integer sid2 = Integer.parseInt(sid);
				Service service = serviceDAO.findById(sid2);
				lunbo.setBusiness(business);
				lunbo.setService(service);
			}
		}else{
			if(bid2.trim()!=null){
				Integer bid22 = Integer.parseInt(bid2);
				Business business = businessDAO.findById(bid22);
				lunbo.setBusiness(business);
				
			}
		}
		lunbo.setImage("daili/images/lunboimg/"+cimages);
		
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString=sdf.format(date);
		Timestamp cimgTime=Timestamp.valueOf(dateString);
		lunbo.setTime(cimgTime);
		lunbo.setUpdate(cimgTime);
		
		sylbImagesDAO.save(lunbo);
		
	}
	
	/**
	 * 删除轮播图
	 */
	public boolean deletelunbo(int id) {
		SylbImages lunbo=sylbImagesDAO.findById(id);
		if(lunbo!=null){
			sylbImagesDAO.delete(lunbo);
			return true;
		}
		return false;
		
	}
	
	/**
	 * 批量删除轮播图
	 */
	public void pldelete(String shanchu) {
		String hql="delete from SylbImages where id in("+shanchu+")";
		hqlDAO.bulkUpdate(hql);
		
	}
	
	/**
	 * 
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
	
	public String findservice(int id){
		String hql = "from Service where business.id = ?";
		List list = hqlDAO.query(hql, id);
		JsonConfig config=new JsonConfig();
		//config.setExcludes(new String[]{"proxy","goodses"});
		JsonFilter.ignoredSet(config);
		String json=net.sf.json.JSONArray.fromObject(list, config).toString();
		return json;
	}

	
}
