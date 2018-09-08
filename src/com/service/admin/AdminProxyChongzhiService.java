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

import com.dao.BusinessDAO;
import com.dao.HqlDAO;
import com.dao.ServiceDAO;
import com.dao.SylbImagesDAO;
import com.pojo.Business;
import com.pojo.Proxychongzhi;
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
public class AdminProxyChongzhiService {

	@Autowired
	private HqlDAO hqlDAO;
	
	/**
	 * 代理充值成功
	 */
	public Map czcgListing(int size, int page, String keywords){
		StringBuffer sb=new StringBuffer(" where 1=1");
		List paramList=new ArrayList();
		if(StringUtil.isNotNull(keywords) && keywords.trim().length()>0)
		{
			sb.append(" and proxy.tel like ?");
			paramList.add("%"+keywords+"%");
		}
		//status，0充值失败，1充值成功
		sb.append(" and status=1");
		
		String hqlsum="select count(*) from Proxychongzhi "+sb.toString();
		int sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
		int count=sum%size==0 ? sum/size :sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		String hql="from Proxychongzhi"+sb.toString()+" order by time desc";
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
	 * 代理充值失败
	 */
	public Map czfaultlisting(int size, int page, String keywords){
		StringBuffer sb=new StringBuffer(" where 1=1");
		List paramList=new ArrayList();
		if(StringUtil.isNotNull(keywords) && keywords.trim().length()>0)
		{
			sb.append(" and proxy.tel like ?");
			paramList.add("%"+keywords+"%");
		}
		//status，0充值失败，1充值成功
		sb.append(" and status=0");
		
		String hqlsum="select count(*) from Proxychongzhi "+sb.toString();
		int sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
		int count=sum%size==0 ? sum/size :sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		String hql="from Proxychongzhi"+sb.toString()+" order by time desc";
		List list=hqlDAO.pageQuery(hql, size, page,paramList.toArray());
		Map map=new HashMap();
		map.put("size", size);
		map.put("page", page);
		map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}
	
	//得到某个代理充值总额
	public Float dailichongzhizonge(int id, Timestamp begintime, Timestamp endtime){
		StringBuffer sb = new StringBuffer(" where 1=1 ");
		List paramList = new ArrayList();
		if (begintime != null) {
			sb.append(" and time>=?");
			paramList.add(begintime);
		}
		if (endtime != null) {
			sb.append(" and time<=?");
			paramList.add(endtime);
		}
		
		String hql="select SUM(fee) from Proxychongzhi  " + sb.toString() + " and proxy.id = "+id;
		Float zongjine =  hqlDAO.unique(hql);
		return zongjine;
	}
	
	
	
	//得到某个代理成功充值的所有记录
		public Map dailichongzhijilu(int id,int size, int page){
			StringBuffer sb=new StringBuffer(" where 1=1");
			List paramList=new ArrayList();
			String hqlsum="select count(*) from Proxychongzhi where proxy.id = "+id+"and status = 1";
			int sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
			int count=sum%size==0 ? sum/size :sum/size+1;
			if(page<1) page=1;
			if(page>count) page=count;
			String hql="from Proxychongzhi where proxy.id ="+id+"and status = 1 order by time desc";
			List list=hqlDAO.pageQuery(hql, size, page,paramList.toArray());
			Map map=new HashMap();
			map.put("size", size);
			map.put("page", page);
			map.put("count", count);
			map.put("sum", sum);
			map.put("list", list);
			return map;
		}
	
	
	
}
