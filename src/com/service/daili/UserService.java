package com.service.daili;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.ProxyDAO;
import com.dao.UserDAO;
import com.pojo.Proxy;
import com.pojo.User;
import com.util.StringUtil;

/*
 * 张嘉雄    3月25
 * 
 * */
@Service
public class UserService {

	@Autowired
	private UserDAO userdao;

	@Autowired
	HqlDAO hqlDAO;
	
	@Autowired
	private ProxyDAO  proxyDAO;

	// 查询所有用户
	public Map userlisting(int page, int size, int type, int tel) throws ParseException {
		StringBuffer sb = new StringBuffer(" where 1=1 ");
		List paramList = new ArrayList();
		String hqlsum = null;
		int sum = 0;
		String hql = null;
		List list = null;
        Proxy proxy = proxyDAO.findById(tel);
        
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String date1 = df.format(date);
		Date date3 = addAndSubtractDaysByGetTime(date, 3);
		String date5 = df.format(date3);
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Timestamp date2 = new Timestamp(format.parse(date1).getTime());
		Timestamp date4 = new Timestamp(format.parse(date5).getTime());
		
		int level = proxy.getLevel();
		System.out.println("level="+level);
		if (type == 1) {
			hqlsum = "select count(*) from User where proxy=" + tel;
			if (level>=2)
				hqlsum = "select count(*) from User where proxy"+level+"="+tel;
			sum = (int) hqlDAO.unique(hqlsum, paramList.toArray());
			hql = "from User where proxy=" + tel + "order by id asc";
			if (level>=2)
				hql = "from User where proxy"+level+"=" + tel + "order by id asc";
			list = hqlDAO.pageQuery(hql, size, page, paramList.toArray());
		}

		if (type == 2) {
			hqlsum = "select count(*) from User where proxy=" + tel + " and overdue=3";
			if (level>=2)
				hqlsum = "select count(*) from User where proxy"+level+"=" + tel + " and overdue=3";
			sum = (int) hqlDAO.unique(hqlsum, paramList.toArray());
			hql = "from User where proxy=" + tel + " and overdue=3 order by id asc";
			
			if (level>=2)
				hql = "from User where proxy"+level+"=" + tel + " and overdue=3 order by id asc";
			
			list = hqlDAO.pageQuery(hql, size, page, paramList.toArray());
		}
		// 即将过期查询
		if (type == 3) {

			hqlsum = "select count(*) from User where overdue_time between '"+date2+"' and '"+date4+"' and proxy=" + tel;
			if (level>=2)
				hqlsum = "select count(*) from User where overdue_time between '"+date2+"' and '"+date4+"' and proxy"+level+"=" + tel;
			
			sum = (int) hqlDAO.unique(hqlsum, paramList.toArray());
			hql = "from User where overdue_time between '"+date2+"' and '"+date4+"' and proxy=" + tel + "order by id asc";
			if (level>=2)
				hql = "from User where overdue_time between '"+date2+"' and '"+date4+"' and proxy"+level+"=" + tel + "order by id asc";
			
			list = hqlDAO.pageQuery(hql, size, page, paramList.toArray());
		}
		if (type == 4) {
			hqlsum = "select count(*) from User where proxy=" + tel + " and overdue=2";
			if (level>=2)
				hqlsum = "select count(*) from User where proxy"+level+"=" + tel + " and overdue=2";
			
			
			sum = (int) hqlDAO.unique(hqlsum, paramList.toArray());
			hql = "from User where proxy=" + tel + " and overdue=2 order by id asc";
			
			if (level>=2)
				hql = "from User where proxy"+level+"=" + tel + " and overdue=2 order by id asc";
			 
			list = hqlDAO.pageQuery(hql, size, page, paramList.toArray());
		}
		
		//查所有下线代理
		String hqlProxy = "from Proxy where parentId=?";
        List proxys = hqlDAO.findByHQL(hqlProxy, tel);
        

		int count = sum % size == 0 ? sum / size : sum / size + 1;
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;
		Map map = new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("list", list);
		map.put("sum", sum);
		map.put("count", count);
		map.put("type", type);
		map.put("proxys", proxys);
		return map;
	}

	// 搜索框查找
	public Map ssuserlisting(int page, int size, int type, int tel, String keywords) {
		StringBuffer sb = new StringBuffer(" where 1=1 ");
		List paramList = new ArrayList();
		String hqlsum = null;
		int sum = 0;
		String hql = null;
		List list = null;

		if (StringUtil.isNotNull(keywords) && keywords.trim().length() > 0) {
			sb.append("and name like ? ");
			paramList.add("%" + keywords + "%");
			sb.append("or plate_number like ? ");
			paramList.add("%" + keywords + "%");
			sb.append("or qrcode like ? ");
			paramList.add("%" + keywords + "%");
			sb.append("or tel like ? ");
			paramList.add("%" + keywords + "%");
			sb.append("or weixinUser.openid like ? ");
			paramList.add("%" + keywords + "%");
		}

		hqlsum = "select count(*) from User " + sb.toString() + " and proxy=" + tel;
		sum = (int) hqlDAO.unique(hqlsum, paramList.toArray());
		hql = "from User " + sb.toString() + " and proxy=" + tel + "order by id asc";
		list = hqlDAO.pageQuery(hql, size, page, paramList.toArray());

		int count = sum % size == 0 ? sum / size : sum / size + 1;
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;
		Map map = new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("list", list);
		map.put("sum", sum);
		map.put("count", count);
		map.put("type", type);
		return map;
	}

	// 得到预约用户信息
	public Map yuyueorderlisting(int size, int page, int status, Timestamp begintime, Timestamp endtime,
			String keywords) {
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
		if (StringUtil.isNotNull(keywords) && keywords.trim().length() > 0) {
			sb.append(" and user.name like ?");
			paramList.add("%" + keywords + "%");
		}

		String hqlsum = "select count(*) from Yuyue" + sb.toString();
		int sum = (int) hqlDAO.unique(hqlsum, paramList.toArray());
		int count = sum % size == 0 ? sum / size : sum / size + 1;
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;
		String hql = "from Yuyue" + sb.toString() + " order by time desc";
		List list = hqlDAO.pageQuery(hql, size, page, paramList.toArray());
		Map map = new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);
		map.put("list", list);
		return map;
	}

	// 根据id找用户
	public User findbyid(int id) {
		User user = userdao.findById(id);
		return user;
	}

	// 修改信息
	public void zsg(int id, short role, short overdue, String user_address, String user_tel, Timestamp overtime) {
		User user = userdao.findById(id);
		user.setRole(role);
		user.setOverdue(overdue);
		user.setAddress(user_address);
		user.setTel(user_tel);
		if (overtime != null)
			user.setOverdueTime(overtime);
		userdao.merge(user);
	}

	
	
	
	   
	   public static Date addAndSubtractDaysByGetTime(Date dateTime/*待处理的日期*/,int n/*加减天数*/){ 
	      
	     //日期格式 
	     SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");  
	     SimpleDateFormat dd=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");     
	      
	     //注意这里一定要转换成Long类型，要不n超过25时会出现范围溢出，从而得不到想要的日期值 
	     return new Date(dateTime.getTime() + n * 24 * 60 * 60 * 1000L); 
	   } 
	    
	   
	 public void dingqixiugaizhuangtai() throws ParseException {
		 	Date date = new Date();       
			Timestamp nousedate = new Timestamp(date.getTime());
			String hql = "update User set overdue=3 where overdue <>-1 and overdueTime <= '"+nousedate+"'";
			hqlDAO.bulkUpdate(hql);
	}

	/**
	 * 根据代理编号查找代理
	 * @param proxy
	 * @return
	 */
	public Proxy findPoxyById(int proxy) {
		return proxyDAO.findById(proxy);
	}

	/**
	 * 修改用户的代理
	 * @param proxy
	 * @param proxy2
	 * @param uid
	 * @return
	 */
	public String changeUserProxy(Proxy _proxy, int proxy, int uid) {
		Proxy proxy2 = findPoxyById(proxy);
		if (proxy2==null)
		{
			return "子代理不存在";
		}
		
		if (proxy2.getParentId().equals(_proxy.getId())==false)
		{
			return "子代理不属于本代理";
		}
		
		User user = findbyid(uid);
		int level = _proxy.getLevel(); //级别
		if (level==1)
		{
			if (user.getProxy2()!=null)
			{
				return "已设置代理";
			}
			else
			{
				user.setProxy2(proxy2);
			}
		}
		
		if (level==2)
		{
			if (user.getProxy3()!=null)
			{
				return "已设置代理";
			}
			else
			{
				user.setProxy3(proxy2);
			}
		}
		
		
		userdao.merge(user);
		
		//累计领卡
		//private Integer sumCard;
		//累计激活
		//private Integer sumActive;
		//未激活
		//private Integer noActive;
		Integer oldSumcard = proxy2.getSumCard();
		if (oldSumcard==null)
			oldSumcard = 0;
		proxy2.setSumCard(oldSumcard+1); //总领卡+1
		
		Short status = user.getOverdue();
		if (status!=null)
		{
			if (status==2)
			{
				Integer sumActive = proxy2.getSumActive();
				if (sumActive==null)
					sumActive = 0;
				proxy2.setSumActive(sumActive+1);
			}
			else
			{
				Integer noActive = proxy2.getNoActive();
				if (noActive==null)
					noActive = 0;
				proxy2.setNoActive(noActive+1);
			}
		}
		proxyDAO.merge(proxy2);
		
		return "success";
		
	}
	 

	 
	 
	 

}
