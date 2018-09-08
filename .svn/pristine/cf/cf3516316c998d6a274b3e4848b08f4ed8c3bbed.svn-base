package com.service.weixin;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.JiayouEmpDAO;
import com.dao.JiayouJiluDAO;
import com.dao.JiayouStationYuerDAO;
import com.dao.JiayouYouhuijuanDAO;
import com.dao.JiayouZhekouDAO;
import com.dao.VipDAO;
import com.dao.WeixinUserDAO;
import com.pojo.JiayouEmp;
import com.pojo.JiayouJilu;
import com.pojo.JiayouStation;
import com.pojo.JiayouStationYuer;
import com.pojo.JiayouYouhuijuan;
import com.pojo.JiayouZhekou;
import com.pojo.Proxy;
import com.pojo.User;
import com.pojo.Vip;
import com.pojo.WeixinUser;
import com.util.StringUtil;

@Service
public class WeixinJiayouService {

	@Autowired
	private HqlDAO hqlDAO;

	@Autowired
	private JiayouEmpDAO jiayouEmpDAO;

	@Autowired
	private JiayouZhekouDAO jiayouZhekouDAO;

	@Autowired
	private JiayouJiluDAO jiayouJiluDAO;

	@Autowired
	private JiayouStationYuerDAO jiayouStationYuerDAO;

	@Autowired
	private WeixinUserDAO weixinUserDAO;

	@Autowired
	private JiayouYouhuijuanDAO jiayouYouhuijuanDAO;
	
	@Autowired
	private VipDAO  vipDAO;

	/**
	 * 根据员工id找员工
	 * 
	 * @param id
	 * @return
	 */
	public JiayouEmp findEmpById(int id) {
		return jiayouEmpDAO.findById(id);
	}

	/**
	 * 根据加员工编号找加油站
	 * 
	 * @param empid
	 * @return
	 */
	public JiayouStation findStationByEmpId(int empid) {
		JiayouEmp emp = findEmpById(empid);
		JiayouStation jiayouStation = emp.getJiayouStation();
		return jiayouStation;
	}

	/**
	 * 根据加油站获取油列表
	 * 
	 * @param stationId
	 *            加油站编号
	 * @return
	 */
	public List getAllYou(int stationId) {
		String hql = "from JiayouZhekou where jiayouStation.gid=? and jiayouStation.gstatus=1 and ostatus=1";
		List list = hqlDAO.findByHQL(hql, stationId);
		return list;
	}

	/**
	 * 获取可用余额
	 * 
	 * @param stationId
	 *            加油站
	 * @param openId
	 *            微信openId
	 * @return
	 */
	public Float getYuerByStation(int stationId, String openId) {
		String hql = "from JiayouStationYuer where weixinUser.openid=? and jiayouStation.gid=?";
		List list = hqlDAO.pageQuery(hql, 1, 1, openId, stationId);
		if (list.size() > 0) {
			JiayouStationYuer jiayouStationYuer = (JiayouStationYuer) list
					.get(0);
			Float money = jiayouStationYuer.getMoney();
			return (money == null ? 0.0F : money);
		}

		return 0.0F;

	}

	/**
	 * 根据油编号，找油
	 * 
	 * @param id
	 *            编号
	 * @return
	 */
	public JiayouZhekou getYouById(int id) {
		JiayouZhekou jiayouZhekou = jiayouZhekouDAO.findById(id);
		return jiayouZhekou;
	}

	/**
	 * 保存加油记录
	 * 
	 * @param jiayouJilu
	 */
	public void addJiayoujilu(JiayouJilu jiayouJilu) {
		jiayouJiluDAO.save(jiayouJilu);

	}

	/**
	 * 根据订单号获取订单记录
	 * 
	 * @param orderid
	 * @return
	 */
	public JiayouJilu getOrderById(String orderid) {
		String hql = "from JiayouJilu where orderid=?";
		List list = hqlDAO.pageQuery(hql, 1, 1, orderid);
		if (list.size() > 0)
			return (JiayouJilu) list.get(0);
		return null;
	}

	/**
	 * 修改加油记录
	 * 
	 * @param jiayouJilu
	 */
	public void update(JiayouJilu jiayouJilu) {
		jiayouJiluDAO.merge(jiayouJilu);
	}

	// 更新加油站-用户 的余额
	public void updateYuer(JiayouJilu jiayouJilu) {

		float shifu = jiayouJilu.getShifu(); // 实付
		float yinfu = jiayouJilu.getYinfu(); // 应付
		float yuer = shifu - yinfu; // 多付
		Float yuer2 = jiayouJilu.getYuer();
		if (yuer2 == null)
			yuer2 = 0.0F;
		// if (yuer==0 && yuer2==0) return;

		String hql = "from JiayouStationYuer where weixinUser.openid=? and jiayouStation.gid=?";
		List list = hqlDAO.pageQuery(hql, 1, 1, jiayouJilu.getWeixinUser()
				.getOpenid(), jiayouJilu.getJiayouZhekou().getJiayouStation()
				.getGid());
		JiayouStationYuer jiayouStationYuer = null;
		if (list.size() > 0) {
			jiayouStationYuer = (JiayouStationYuer) list.get(0);
		} else {
			jiayouStationYuer = new JiayouStationYuer();
			jiayouStationYuer.setJiayouStation(jiayouJilu.getJiayouZhekou()
					.getJiayouStation());
			jiayouStationYuer.setWeixinUser(jiayouJilu.getWeixinUser());
		}

		Float oldYuer = jiayouStationYuer.getMoney();
		if (oldYuer == null)
			oldYuer = 0.0f;
		jiayouStationYuer.setMoney(oldYuer + yuer - yuer2);
		jiayouStationYuerDAO.merge(jiayouStationYuer);

		WeixinUser user = jiayouJilu.getWeixinUser();
		user.setLastJiayouTime(new Date());

		Float old_money = user.getTotalJiayouMoney();
		if (old_money == null)
			old_money = 0.0F;
		user.setTotalJiayouMoney(old_money + shifu);

		weixinUserDAO.merge(user);

		// 送余额（区分VIP和普通用户)
		Vip vip = user.getVip();
		if (vip != null) {
			
			

		} else {
			
			JiayouStation station = jiayouJilu.getJiayouZhekou().getJiayouStation();
			Float c = station.getChai_fanxian();
			Float q = station.getQiyou_fanxian();
			Integer type = jiayouJilu.getJiayouZhekou().getOstyle();
			float money = 0;
			if (type==2)
			{
				money = jiayouJilu.getShifu()*q; //汽油
			}
			else 
			{
				money = jiayouJilu.getShifu()*c; //柴油
			}
			
			Float oldMoney = jiayouStationYuer.getMoney();
			if (oldMoney==null)
				oldMoney = 0.0F;
			jiayouStationYuer.setMoney(oldMoney+money);
			jiayouStationYuerDAO.merge(jiayouStationYuer);


		}

		// 修改红包
		int payType = jiayouJilu.getPayType();
		//System.out.println("payType=" + payType);
		if (payType == 3) {
			String idsStr = jiayouJilu.getYouhuijuan_ids();
			System.out.println("idsStr=" + idsStr);
			if (StringUtil.isNotNull(idsStr)) {
				String hqlUpdate = "update JiayouYouhuijuan set status=1 where id in ("
						+ idsStr + ")";
				hqlDAO.bulkUpdate(hqlUpdate);
				System.out.println("come in");
			}
		}
	}

	/**
	 * 获取红包
	 * 
	 * @param type
	 * @param weixinUser
	 * @return
	 */
	public List getRedBag(String type, WeixinUser weixinUser) {
		String hql = "from JiayouYouhuijuan where status=0 and type=? and weixinUser.openid=? and time>?";
		List list = hqlDAO.findByHQL(hql, Integer.parseInt(type), weixinUser
				.getOpenid(), new Timestamp(System.currentTimeMillis()));
		return list;
	}

	public List getAllYou(Integer gid, String type) {
		String hql = "from JiayouZhekou where jiayouStation.gid=? and jiayouStation.gstatus=1 and ostatus=1 and ostyle=?";
		List list = hqlDAO.findByHQL(hql, gid, Integer.parseInt(type));
		return list;
	}

	/**
	 * 统计红包金额
	 * 
	 * @param redbag
	 *            红包
	 * @param money
	 *            消费金额
	 * @return 红包金额 -1 优惠卷已使用 -2 优惠卷已过期 -3 金额不正确
	 * 
	 */
	public float getRedBagMoney(String redbag, float money) {
		if (redbag.endsWith(","))
			redbag = redbag.substring(0, redbag.length() - 1);
		String hql = "from JiayouYouhuijuan where id in (" + redbag + ")";
		float hongbaoSum = 0;
		float limitSum = 0;
		List<JiayouYouhuijuan> list = hqlDAO.findByHQL(hql);
		for (JiayouYouhuijuan o : list) {
			if (o.getStatus() == 1)
				return -1;
			Date dbDate = o.getTime();
			Date nowDate = new Date();
			if (dbDate.getTime() < nowDate.getTime())
				return -2;

			hongbaoSum += o.getMoney();
			limitSum += o.getYoumoney();
		}

		if (limitSum > hongbaoSum + money)
			return -3;

		return hongbaoSum;
	}

	/**
	 * 根据用户获取代理
	 * 
	 * @param weixinUser
	 * @return
	 */
	public Proxy getProxyByUser(WeixinUser weixinUser) {
		
		weixinUser = findWeixinUserByIdNocache(weixinUser.getOpenid());
		return weixinUser.getJiayouStation().getProxy();
		
	}

	public WeixinUser findWeixinUserByIdNocache(String openid) {
		String hql = "from WeixinUser where openid=?";
		List list = hqlDAO.pageQuery(hql, 1, 1, openid);
		if (list.size() > 0)
			return (WeixinUser) list.get(0);
		return null;
	}

	public Vip addVip(String  openid,String companyname,int ostyle,int vipgrade,float vlimit,int vfanxian,int vfanxian2) {
		Vip vip = new Vip();
		vip.setOstyle(ostyle);
		WeixinUser user = weixinUserDAO.findById(openid);
		if(user.getVip()!=null)
			return null;
		vip.setVfanxian(vfanxian);
		vip.setVfanxian2(vfanxian2);
		vip.setVcompany(companyname);
		vip.setUser(user);
		vip.setVstatus(0);
		vip.setOstyle(ostyle);
		vip.setVipgrade(vipgrade);
		vip.setVdays(0);
		vip.setVlimit(vlimit);
		vip.setVxiaofei(0f);
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		vip.setVdate(timestamp);
		vipDAO.save(vip);
		
		return vip;
	}

}
