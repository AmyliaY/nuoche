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
import com.pojo.ProxyCard;
import com.pojo.SylbRecord;
import com.pojo.Top;
import com.pojo.User;
import com.util.StringUtil;

/*
 * 张嘉雄    3月27
 * 
 * */
@Service
public class AdminMoneyService {

	@Autowired
	HqlDAO hqlDAO;

	// 得到代理账单
	public Map duizhanglisting(int size, int page, int status, Timestamp begintime, Timestamp endtime,
			String keywords) {
		StringBuffer sb = new StringBuffer(" where 1=1 ");
		List paramList = new ArrayList();
		if (StringUtil.isNotNull(keywords) && keywords.trim().length() > 0) {
			sb.append(" and tel like ?");
			paramList.add("%" + keywords + "%");
		}
		String hqlsum = "select count(*) from Proxy" + sb.toString();
		int sum = (int) hqlDAO.unique(hqlsum, paramList.toArray());
		int count = sum % size == 0 ? sum / size : sum / size + 1;
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;
		String hql = "from Proxy" + sb.toString() + " order by created_time desc";
		List list = hqlDAO.pageQuery(hql, size, page, paramList.toArray());
		Map map = new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);
		map.put("list", list);
		return map;
	}
	// 得到代理置顶总金额
	public float zdzfy(int id, Timestamp begintime, Timestamp endtime) {
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
		String hql = "select SUM(totalprice) from Top " + sb.toString() + " and proxy.id = " + id;
		float zongjine = (float) hqlDAO.unique(hql);
		return zongjine;
	}
	// 得到代理轮播总金额
	public float lbzfy(int id, Timestamp begintime, Timestamp endtime) {
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
		String hql = "select SUM(totalprice) from SylbRecord " + sb.toString() + " and proxy.id = " + id;
		float zongjine = (float) hqlDAO.unique(hql);
		return zongjine;
	}
	
	// 得到代理领卡总金额
		public float lkzfy(int id, Timestamp begintime, Timestamp endtime) {
			StringBuffer sb = new StringBuffer(" where 1=1 ");
			List paramList = new ArrayList();
			if (begintime != null) {
				sb.append(" and takeTime>=?");
				paramList.add(begintime);
			}
			if (endtime != null) {
				sb.append(" and takeTime<=?");
				paramList.add(endtime);
			}
			String hql = "select SUM(fee) from ProxyCard " + sb.toString() + " and proxyId = " + id;
			float zongjine = (float) hqlDAO.unique(hql);
			return zongjine;
		}
}
