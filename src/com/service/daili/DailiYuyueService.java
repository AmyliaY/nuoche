package com.service.daili;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jms.Session;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.Transaction;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.UserDAO;
import com.pojo.Business;
import com.pojo.User;
import com.pojo.Yuyue;
import com.util.StringUtil;

/*
 * 张嘉雄    3月25
 * 
 * */
@Service
public class DailiYuyueService {

	
	@Autowired
	HqlDAO hqlDAO;
	
	// 得到预约用户信息
	public Map yuyueorderlisting(int id,int size, int page) throws UnsupportedEncodingException 
	{
		//得到代理下的所有用户
		Map map = new HashMap();
		String hql1="from Business where proxy.id ="+id;
		List businesslist=hqlDAO.query(hql1);
		Business business = new Business();
		StringBuffer sb = new StringBuffer();
		if(businesslist.size()>0){
			sb.append("(");
			for (int i = 0; i < businesslist.size(); i++) {
				business = (Business) businesslist.get(i);
				sb.append(business.getId()+",");
			}
			sb.deleteCharAt(sb.length()-1);
			sb.append(")");
			
			
			String hql2="from Service where business.id in"+sb;
			List servicelist=hqlDAO.query(hql2);
			StringBuffer sb2 = new StringBuffer();
			com.pojo.Service service = new com.pojo.Service();
			if(servicelist.size()>0){
				sb2.append("(");
				for (int i = 0; i < servicelist.size(); i++) {
					service = (com.pojo.Service) servicelist.get(i);
					sb2.append(service.getId()+",");
				}
				sb2.deleteCharAt(sb2.length()-1);
				sb2.append(")");
			}
			int sum = 0;
			if(sb2.length()>0){
			String hqlsum = "select count(*) from Yuyue where service.id in"+sb2;
			sum = (int) hqlDAO.unique(hqlsum);
			}
			int count = sum % size == 0 ? sum / size : sum / size + 1;
			if (page < 1)
				page = 1;
			if (page > count)
				page = count;
			
			List list = null;
			if(sb2.length()>0){
				String hql = "from Yuyue where service.id in "+sb2+" order by time desc";
				list = hqlDAO.pageQuery(hql, size, page);
				}
			
			Yuyue yuyue = new Yuyue();
			if(list!=null && list.size()>0){
			for (int i = 0; i < list.size(); i++) {
				yuyue = (Yuyue) list.get(i);
				String s = URLDecoder.decode(yuyue.getUser().getNickname(), "utf-8");
				yuyue.getUser().setNickname(s); 
			}
			}
			map.put("page", page);
			map.put("size", size);
			map.put("sum", sum);
			map.put("count", count);
			map.put("list", list);
			return map;
		}
		return map;
		
	}
}
