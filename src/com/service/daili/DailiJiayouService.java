package com.service.daili;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.JiayouEmpDAO;
import com.dao.JiayouStationDAO;
import com.dao.JiayouYouhuijuanDAO;
import com.dao.JiayouZhekouDAO;
import com.pojo.JiayouEmp;
import com.pojo.JiayouStation;
import com.pojo.JiayouYouhuijuan;
import com.pojo.JiayouZhekou;
import com.pojo.User;
import com.pojo.WeixinUser;
import com.sun.java_cup.internal.parse_action;
import com.util.StringUtil;

/**
 * 代理加油站管理
 * 
 * @author lgh
 * 
 */

@Service
public class DailiJiayouService {

	@Autowired
	private HqlDAO hqlDAO;

	@Autowired
	private HqlDAO hqldao;

	@Autowired
	private JiayouStationDAO jiayouStationDAO;

	@Autowired
	private JiayouEmpDAO jiayouEmpDAO;

	@Autowired
	private JiayouZhekouDAO jiayouZhekouDAO;
	
	@Autowired
	private JiayouYouhuijuanDAO jiayouYouhuijuanDAO;

	/**
	 * 根据代理获取所有加油站
	 * 
	 * @param proxyId
	 * @return
	 */
	public List getStationByProxy(int proxyId) {
		String hql = "from JiayouStation where proxy.id=?";
		List list = hqlDAO.findByHQL(hql, proxyId);
		return list;
	}

	/**
	 * 新增加油站
	 * 
	 * @param jiayouStation
	 */
	public void addStation(JiayouStation jiayouStation) {
		jiayouStationDAO.save(jiayouStation);
	}

	/**
	 * 根据加油站id查找加油站
	 * 
	 * @param id
	 * @return
	 */
	public JiayouStation getStationById(int id) {
		return jiayouStationDAO.findById(id);
	}

	/**
	 * 修改加油站
	 * 
	 * @param jiayouStation
	 */
	public void updateStation(JiayouStation jiayouStation) {
		jiayouStationDAO.merge(jiayouStation);
	}

	/**
	 * 加油记录
	 * 
	 * @param beginTime
	 *            开始时间
	 * @param endTime
	 *            结束时间
	 * @param station
	 *            加油站
	 * @param empid
	 *            员工编号
	 * @param orderId
	 *            订单号
	 * @param page
	 * @param size
	 * @return
	 */
	public Map jiayoujilu(int proxy, String beginTime, String endTime,
			String station, String empid, String orderId, int page, int size) {

		Map map = new HashMap();
		List listParam = new ArrayList();

		StringBuffer sb = new StringBuffer(" where 1=1 ");
		if (StringUtil.isNotNull(beginTime)) {
			sb.append(" and time>=?");
			listParam.add(java.sql.Timestamp.valueOf(beginTime + " 00:00:00"));
		}

		if (StringUtil.isNotNull(endTime)) {
			sb.append(" and time<=?");
			listParam.add(java.sql.Timestamp.valueOf(endTime + " 23:59:59"));
		}

		if (StringUtil.isDigit(station)) {
			sb.append(" and jiayouZhekou.jiayouStation.gid=?");
			listParam.add(Integer.parseInt(station));
		} else {
			sb.append(" and jiayouZhekou.jiayouStation.proxy.id=?");
			listParam.add(proxy);
		}

		if (StringUtil.isDigit(empid))

		{
			sb.append(" and emp.geid=? ");
			listParam.add(Integer.parseInt(empid));
		}

		if (StringUtil.isNotNull(orderId)) {
			sb.append(" and orderid=?");
			listParam.add(orderId);
		}

		String hqlSum = "select count(*) from JiayouJilu " + sb.toString();
		int sum = (int) hqldao.unique(hqlSum, listParam.toArray());
		System.out.println("sum=" + sum);
		int count = sum % size == 0 ? sum / size : sum / size + 1;
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;

		String hql = "from JiayouJilu " + sb.toString();
		List list = hqldao.pageQuery(hql, size, page, listParam.toArray());
		map.put("list", list);
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);

		return map;
	}

	public Map getAllGasEmpInfo(int page, int size, int gid, String gestatus) {

		Map map = new HashMap();
		List listParam = new ArrayList();

		StringBuffer sb = new StringBuffer();
		if (gid != 0) {
			sb.append("and gid=?");
			listParam.add(gid);
		}
		if ("1".equals(gestatus)) {
			sb.append("and gestatus=1");

		}

		String hql = "select count(*) from JiayouEmp where 1=1" + sb.toString();
		int count = 0;
		if (listParam.isEmpty())
			count = (int) hqldao.unique(hql);
		else
			count = (int) hqldao.unique(hql, listParam.toArray());
		int totalPage = count % size == 0 ? count / size : count / size + 1;

		if (page > totalPage) {
			page = totalPage;
		}
		if (page < 1) {
			page = 1;
		}
		String hql2 = "from JiayouEmp where 1=1 " + sb.toString()
				+ " order by getime desc ";
		List<JiayouEmp> gelist = null;
		if (listParam.isEmpty())
			gelist = hqldao.pageQuery(hql2, page, size);
		else
			gelist = hqldao.pageQuery(hql2, size, page, listParam.toArray());
		SimpleDateFormat dateformat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		map.put("page", page);
		map.put("maxPage", totalPage);
		if (gelist.size() > 0) {
			// for (JiayouEmp jiayouEmp : gelist)
			// jiayouEmp.setGetime(dateformat.format(jiayouEmp.getGetime()));
			map.put("geList", gelist);

			return map;
		} else
			return map;

	}

	public Integer getEmp(String empName) {
		System.out.println("-------" + empName);
		String hql = "from JiayouEmp where gename=?";
		List<JiayouEmp> JiayouEmp = hqldao.findByHQL(hql, empName);
		Integer empId = JiayouEmp.get(0).getGeid();
		if (empId != null) {
			return empId;
		} else {
			return null;
		}
	}

	public int updateJiayouEmp(int geid, String gename, String gecard,
			String geaddress, String genumber) {

		Object[] objects = new Object[5];
		objects[0] = gename;
		objects[1] = gecard;
		objects[2] = geaddress;
		objects[3] = genumber;
		objects[4] = geid;
		String hql = "update JiayouEmp set gename = ? , gecard = ? , geadress = ? , genumber = ? where geid = ?";
		int i = hqldao.update(hql, objects);
		return i;
	}

	public List getAllGs() {
		String hql = " from JiayouStation where gstatus=1";
		List<JiayouStation> list = hqldao.findByHQL(hql);
		return list;

	}

	public void addJiayouEmp(String gename, String genumber, String gecard,
			String geaddress, int gid) {
		JiayouEmp JiayouEmp = new JiayouEmp();

		JiayouStation JiayouStation = jiayouStationDAO.findById(gid);
		JiayouEmp.setJiayouStation(JiayouStation);
		JiayouEmp.setGename(gename);
		JiayouEmp.setGeadress(geaddress);
		JiayouEmp.setGenumber(genumber);
		JiayouEmp.setGecard(gecard);
		Timestamp now = new Timestamp(System.currentTimeMillis());
		JiayouEmp.setGetime(now);
		JiayouEmp.setGeover(now);
		JiayouEmp.setGestatus(1);
		JiayouEmp.setGepeople(0);
		JiayouEmp.setGerating((float) 0);
		jiayouEmpDAO.save(JiayouEmp);

	}

	public int updateGestatus(int gestatus, int geid) {

		Timestamp now = new Timestamp(System.currentTimeMillis());
		Object[] object = new Object[3];
		object[0] = gestatus;
		object[1] = now;
		object[2] = geid;

		if (gestatus == 1) {
			String hql = "update JiayouEmp set gestatus = ? , getime = ? where geid = ?";
			int i = hqldao.update(hql, object);
			return i;
		} else {
			String hql = "update JiayouEmp set gestatus = ? , geover = ? where geid = ?";
			int i = hqldao.update(hql, object);
			return i;
		}

	}

	public void addQrCode(String gecode, String gecode2, int geid) {
		JiayouEmp JiayouEmp = jiayouEmpDAO.findById(geid);
		JiayouEmp.setGecode(gecode);
		JiayouEmp.setGecode2(gecode2);
		jiayouEmpDAO.save(JiayouEmp);

	}

	public JiayouEmp getSimpleInfo(int geid) {
		String hql = "from JiayouEmp where geid = ?";
		List<JiayouEmp> list = hqldao.findByHQL(hql, geid);
		System.out.println(list);
		if (list.size() > 0)
			return list.get(0);
		return null;

	}

	public int updateRating(int geid, int rating) {
		String hql = "update  JiayouEmp set gepeople = gepeople + 1 , gerating = (gerating*(gepeople-1) + ?)/gepeople where geid = ?";
		Object[] object = new Object[2];
		object[0] = (float) rating;
		object[1] = geid;
		int i = hqldao.update(hql, object);
		return i;
	}

	public List<JiayouZhekou> getAllOilInfo(int flag, int ostation) {
		String hql;
		List oilList = null;
		if (flag == 0) {
			if (ostation == 0) {
				hql = "from JiayouZhekou  ";
				oilList = hqldao.findByHQL(hql);
			} else {
				hql = "from JiayouZhekou where jiayouStation.gid = ?";
				oilList = hqldao.findByHQL(hql, ostation);
			}
		} else {
			if (ostation == 0) {
				hql = "from JiayouZhekou where ostatus=1 ";
				oilList = hqldao.findByHQL(hql);
			} else {
				hql = "from JiayouZhekou where ostatus=1 and jiayouStation.gid = ?";
				oilList = hqldao.findByHQL(hql, ostation);
			}
		}

		if (oilList.size() > 0)
			return oilList;
		else
			return null;
	}

	public List getOilInfo(int ostation) {

		String hql = "select oname ,oprice,oid  from JiayouZhekou where ostatus=1 and jiayouStation.gid = ?";
		List list = hqldao.findByHQL(hql, ostation);

		if (list.size() > 0)
			return list;
		else
			return null;
	}

	/**
	 * 添加油
	 * 
	 * @param oname
	 * @param oprice
	 * @param odetail
	 * @param ostyle
	 * @param gid
	 * @param zhekou
	 */
	public void addOil(String oname, Float oprice, String odetail, int ostyle,
			int gid, float zhekou) {
		JiayouZhekou oil = new JiayouZhekou();
		oil.setOname(oname);
		oil.setOprice(oprice);
		oil.setOdetail(odetail);
		oil.setOstatus(1);
		oil.setOstyle(ostyle);
		oil.setZhekou(zhekou);
		JiayouStation gasStation = jiayouStationDAO.findById(gid);
		oil.setJiayouStation(gasStation);
		jiayouZhekouDAO.save(oil);

	}

	public int updateOil(String oname, Float oprice, String odetail, int oid,
			int ostyle, float zhekou) {
		Object[] objects = new Object[6];
		objects[0] = oname;
		objects[1] = oprice;
		objects[2] = odetail;
		objects[3] = ostyle;
		objects[4] = zhekou;
		objects[5] = oid;

		String hql = "update JiayouZhekou set oname = ? , oprice = ? , odetail = ? ,ostyle = ? , zhekou=? where oid = ?";
		int i = hqldao.update(hql, objects);
		return i;
	}

	public int updateOstatus(int oid, int ostatus) {
		if (ostatus == 1)
			ostatus = 0;
		else
			ostatus = 1;
		Object[] objects = new Object[2];
		objects[0] = ostatus;
		objects[1] = oid;
		String hql = "update JiayouZhekou set ostatus = ? where oid = ?";
		int i = hqldao.update(hql, objects);
		return i;
	}

	/**
	 * @param gid  加油站
	 * @param date
	 *            多少天没有来加油用户
	 * @return
	 */
	public Map getLastJiayouUser(String gid,int date, int page, int size) {
		long t = System.currentTimeMillis() - date * 24L * 3600 * 1000;
		Date d = new Date(t);
		Map map = new HashMap();
		List listParam = new ArrayList();
		StringBuffer sb = new StringBuffer();

		
		sb.append("and lastJiayouTime<?");
		listParam.add(d);
		
		if (StringUtil.isDigit(gid))
		{
			sb.append(" and  jiayouStation.gid=?");
			listParam.add(Integer.parseInt(gid));
		}

		String hql = "select count(*) from WeixinUser where 1=1"
				+ sb.toString();
		System.out.println("hql="+hql);
		int sum = 0;
		if (listParam.isEmpty())
			sum = (int) hqldao.unique(hql);
		else
			sum = (int) hqldao.unique(hql, listParam.toArray());
		int count = sum % size == 0 ? sum / size : sum / size + 1;

		if (page > count) {
			page = count;
		}
		if (page < 1) {
			page = 1;
		}
		String hql2 = "from WeixinUser where 1=1 " + sb.toString()
				+ " order by lastJiayouTime asc";

		List list = hqldao.pageQuery(hql2, size, page, listParam.toArray());
		map.put("list", list);
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);

		return map;

	}
	
	/**
	 * 
	 * @param date      发给哪个些用户：多少天没有加没油
	 * @param money     优惠卷金额
	 * @param youMoney  配套使用的油金额 
	 * @param countDate 优惠卷有效期
	 */
	public void fahongbao(String gid,String type,int date, float money, float youMoney, int countDate)
	{
		long t = System.currentTimeMillis() - date * 24L * 3600 * 1000;
		Date d = new Date(t);
		Map map = new HashMap();
		List listParam = new ArrayList();
		StringBuffer sb = new StringBuffer();

		sb.append("and lastJiayouTime<?");
		listParam.add(d);
		
		if (StringUtil.isDigit(gid))
		{
			sb.append(" and  jiayouStation.gid=?");
			listParam.add(Integer.parseInt(gid));
		}
		
		
		String hql = "from WeixinUser where 1=1 " + sb.toString()
		+ " order by lastJiayouTime asc";
		
		List<WeixinUser> list = hqldao.findByHQL(hql, listParam.toArray());
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DATE, countDate);
		for (WeixinUser u: list) {
			 JiayouYouhuijuan jiayouYouhuijuan = new JiayouYouhuijuan();
			 jiayouYouhuijuan.setMoney(money);
			 jiayouYouhuijuan.setYoumoney(youMoney);
			 jiayouYouhuijuan.setWeixinUser(u);
			 jiayouYouhuijuan.setType(Integer.parseInt(type));
			 jiayouYouhuijuan.setTime(new Timestamp(c.getTimeInMillis()));
			 jiayouYouhuijuanDAO.save(jiayouYouhuijuan);
		}
		
	}

		public int updateSomeStatus(float vlimit, int vfanxian, int vfanxian2,
				int vipgrade) {
			Object[] obj = new Object[4];
			obj[0] = vlimit;
			obj[1] = vfanxian;
			obj[2] = vfanxian2;
			obj[3] = vipgrade;
			String hql = "update Vip set vlimit =? ,vfanxian =? ,vfanxian2= ? where vipgrade = ?";
			int i = hqldao.update(hql, obj);
			return i;
		}

		public Map getVipList(int page, int size, int status) {
			Map map = new HashMap();
			System.out.println("status="+status);
			String hql = "select count(*) from Vip where vstatus = ?";
			if (status==-100)
				hql = "select count(*) from Vip";
			int count = 0;
			
			if (status==-100)
			    count = (int) hqldao.unique(hql);
			else
				count = (int) hqldao.unique(hql, status);
			int totalPage = count % size == 0 ? count / size : count / size + 1;
			if (page > totalPage) {
				page = totalPage;
			}
			if (page < 1) {
				page = 1;
			}
			String hql2 = "select count(*) from Vip where vstatus = -1";
			int count2 = 0;
			count2 = (int) hqldao.unique(hql2);
			String hql3 = "select user from Vip where vstatus = ?";
			if (status==-100)
				hql3 = "select user  from Vip";
			List<WeixinUser> list = null;
			
			if (status==-100)
			     list = hqldao.pageQuery(hql3, size, page);
			else
				 list = hqldao.pageQuery(hql3, size, page, status);
			System.out.println(list);
			System.out.println(status);
			System.out.println(page);
			System.out.println(size);
			map.put("userlist", list);
			map.put("totalPage", totalPage);
			map.put("page", page);
			map.put("count2", count);
			return map;
		}

	public Map getVipByMoney(float money, int i) {
		Map map = new HashMap();

		String hql = null;
		if (i == 1) {

			hql = "select user from Vip where utotalcz > ? and vstatus = 1 order by utotalcz";
			List<User> list = hqldao.findByHQL(hql, money);
			map.put("userlist", list);
			if (list.size() > 0)
				return map;
			return null;
		} else {

			hql = "from User where utotalxf > ?  and vip.vstatus = 1 order by utotalxf";
			List<User> list = hqldao.findByHQL(hql, money);
			map.put("userlist", list);

			if (list.size() > 0)
				return map;
			return null;
		}
	}
	
	/**
	 * 修改用户状态
	 * @param vstatus
	 * @param vid
	 * @return
	 */
	public int updatevipstatus(int vstatus, int vid) {

		Object[] obj = new Object[2];
		obj[0] = vstatus;
		obj[1] = vid;
		String hql = "";
	
		if(vstatus!=1)
		 hql = "update Vip set vstatus = ? where vid = ?";
		else
			 hql = "update Vip set vstatus = ? ,vxiaofei = 0 ,vdays = 0 where vid = ?";
		int i = hqldao.update(hql, obj);

		return i;
	}

	
	/**
	 * 修改VIP用户等级
	 * @param uid
	 * @param ostyle
	 * @param vgrade
	 * @param vfanxian
	 * @param vfanxian2
	 * @param vlimit
	 * @return
	 */
	public int updategrade(String uid, int ostyle, int vgrade, int vfanxian,
			int vfanxian2, float vlimit) {

		Object[] obj = new Object[6];
		obj[0] = ostyle;
		obj[1] = vgrade;

		obj[2] = vfanxian;
		obj[3] = vfanxian2;
		obj[4] = vlimit;
		obj[5] = uid;

		String hql = "update Vip set ostyle = ? , vipgrade = ? ,vfanxian =?,vfanxian2 = ?,vlimit = ? where uid = ?";
		int i = hqldao.update(hql, obj);

		return i;
	}
		

}
