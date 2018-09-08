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
import com.dao.UserDAO;
import com.pojo.SylbRecord;
import com.pojo.Top;
import com.pojo.User;
import com.util.StringUtil;

/*
 * 张嘉雄    3月27
 * 
 * */
@Service
public class AdminZhidingXQService {

	@Autowired
	HqlDAO hqlDAO;

	// 根据id得到代理的轮播记录详情
	public Map zhidinglisting(int id, int size, int page, int status, Timestamp begintime, Timestamp endtime,
			String keywords) {
		StringBuffer sb = new StringBuffer(" where 1=1 ");
		List paramList = new ArrayList();
		if (begintime != null) {
			sb.append(" and created>=?");
			paramList.add(begintime);
		}
		if (endtime != null) {
			sb.append(" and created<=?");
			paramList.add(endtime);
		}
		if (StringUtil.isNotNull(keywords) && keywords.trim().length() > 0) {
			sb.append(" and service.title like ?");
			paramList.add("%" + keywords + "%");
		}
		sb.append(" and proxy.id like ?");
		paramList.add( id );
		String hqlsum = "select count(*) from Top" + sb.toString();
		int sum = (int) hqlDAO.unique(hqlsum, paramList.toArray());
		int count = sum % size == 0 ? sum / size : sum / size + 1;
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;
		String hql = "from Top" + sb.toString() + " order by created desc";
		List list = hqlDAO.pageQuery(hql, size, page, paramList.toArray());
		Map map = new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);
		map.put("list", list);
		return map;
	}
}
