package com.service.admin;

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
import com.dao.TemplatemessageDAO;
import com.dao.UserDAO;
import com.pojo.Templatemessage;
import com.pojo.User;
import com.util.StringUtil;

/*
 * 张嘉雄    3月25
 * 
 * */
@Service
public class AdminMobanService {

	@Autowired
	HqlDAO hqlDAO;
	@Autowired
	private TemplatemessageDAO templatemessageDAO;

	// 得到预约用户信息
	public Map xiaoxilisting(int size, int page, int status, Timestamp begintime, Timestamp endtime, String keywords) {
		StringBuffer sb = new StringBuffer(" where 1=1 ");
		List paramList = new ArrayList();
		if (begintime != null) {
			sb.append(" and tpcreatetime>=?");
			paramList.add(begintime);
		}
		if (endtime != null) {
			sb.append(" and tpcreatetime<=?");
			paramList.add(endtime);
		}
		if (StringUtil.isNotNull(keywords) && keywords.trim().length() > 0) {
			sb.append(" and tptitle like ?");
			paramList.add("%" + keywords + "%");
			sb.append(" or tpstart like ?");
			paramList.add("%" + keywords + "%");
			sb.append(" or tpending like ?");
			paramList.add("%" + keywords + "%");
		}
		String hqlsum = "select count(*) from Templatemessage" + sb.toString();
		int sum = (int) hqlDAO.unique(hqlsum, paramList.toArray());
		int count = sum % size == 0 ? sum / size : sum / size + 1;
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;
		String hql = "from Templatemessage" + sb.toString() + " order by tpcreatetime desc";
		List list = hqlDAO.pageQuery(hql, size, page, paramList.toArray());
		Map map = new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);
		map.put("list", list);
		return map;
	}

	// 修改状态
	public Templatemessage xiugaistatus(int id) {
		Templatemessage templatemessage = templatemessageDAO.findById(id);
		int status = templatemessage.getTpstatus();
		if (templatemessage != null)
			templatemessage.setTpstatus(1 - status);
		templatemessageDAO.save(templatemessage);
		return templatemessage;
	}

	// 添加模板
	public int addmobanxiaoxi(String tptitle, String tpstart, String tpending, String tplink, int tpparameters,
			String tpmeaning,String tpweixin_id,String tpweixin_name) {
		
		Templatemessage templatemessage = new Templatemessage();
		templatemessage.setTptitle(tptitle);
		templatemessage.setTpstart(tpstart);
		templatemessage.setTpending(tpending);
		templatemessage.setTplink(tplink);
		templatemessage.setTpparameters(tpparameters);
		templatemessage.setTpweixinId(tpweixin_id);
		templatemessage.setTpweixinName(tpweixin_name);
		templatemessage.setTpmeaning(tpmeaning);
		Date date=new Date();
		Timestamp time=new Timestamp(date.getTime());
		templatemessage.setTpcreatetime(time);
		templatemessage.setTpstatus(1);
		templatemessageDAO.save(templatemessage);
		return 1;
	}
	
	
	public void updatemobanxiaoxi(int id,String tptitle, String tpstart, String tpending, String tplink, int tpparameters,
			String tpmeaning,String tpweixin_id,String tpweixin_name) {
		Templatemessage templatemessage = templatemessageDAO.findById(id);
		
		templatemessage.setTptitle(tptitle);
		templatemessage.setTpstart(tpstart);
		templatemessage.setTpending(tpending);
		templatemessage.setTplink(tplink);
		templatemessage.setTpparameters(tpparameters);
		templatemessage.setTpmeaning(tpmeaning);
		templatemessage.setTpweixinId(tpweixin_id);
		templatemessage.setTpweixinName(tpweixin_name);
		templatemessage.setTpstatus(1);
		templatemessageDAO.save(templatemessage);
		
	}
	
	
	
	public Templatemessage findbyid(int id){
		Templatemessage templatemessage = templatemessageDAO.findById(id);
		return templatemessage;
	}
}
