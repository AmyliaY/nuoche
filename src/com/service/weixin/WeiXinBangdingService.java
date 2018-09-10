package com.service.weixin;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.ProxyDAO;
import com.dao.UserDAO;
import com.dao.WeixinUserDAO;
import com.pojo.Proxy;
import com.pojo.User;
import com.pojo.WeixinUser;

@Service
public class WeiXinBangdingService {

	@Autowired
	private HqlDAO hqldao;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private WeixinUserDAO wxdao;
	@Autowired
	private ProxyDAO proxyDAO;

	// 查询该二维码是否被绑定，是否付款 状态为：1 已付款未绑定的才能绑定
	public int findbyqrid(String qrid) {
		String hql = "from User where qrcode=?";
		System.out.println(qrid);
		List list = hqldao.pageQuery(hql, 1, 1, qrid);
		if (list.size() == 0)
			return 0;
		User user = (User) list.get(0);
		Short overdue = user.getOverdue();
		if (overdue == 1) {
			return 1;
			// 该二维码未被绑定，可以绑定
		}
		if (overdue == 0) {
			return 0;
			// 该二维码未付款，无法绑定
		}
		if (overdue == 2) {
			return 2;
			// 该二维码付款，绑定
		}
		Date endTime = user.getOverdueTime();
		if (overdue == 3 || endTime != null
				&& endTime.getTime() < System.currentTimeMillis()) {
			return 3;
			// 该二维码已过期
		}
		return -1;
	}

	/**
	 * 绑定
	 * @param qrid
	 *            二维码编号
	 * @param chepaihao
	 *            车牌号
	 * @param name
	 *            姓名
	 * @param tel
	 *            电话
	 * @param wx
	 *            微信OpenID
	 * @return
	 */
	public User bangding(String qrid, String chepaihao, String name,
			String tel, String wx) {
		String hql = "from User where qrcode =?";
		List list = hqldao.pageQuery(hql, 1, 1, qrid);
		User user = new User();
		if(list.get(0)!=null){
		user = (User) list.get(0);
		}
		user.setName(name);
		user.setPlateNumber(chepaihao);
		user.setTel(tel);
		user.setOverdue((short) 2);
		WeixinUser wxuser = wxdao.findById(wx);
		user.setWeixinUser(wxuser);
		Calendar c = Calendar.getInstance();
		c.add(Calendar.YEAR, 1);
		user.setOverdueTime(new Timestamp(c.getTimeInMillis()));
		userDAO.merge(user);
		Proxy proxy = user.getProxy();
		int sumActive = 0;
		if (proxy != null) {
			if (proxy.getSumActive() == null)
				sumActive = 0;
			else
			    sumActive = proxy.getSumActive();
			proxy.setNoActive(proxy.getNoActive() - 1);
			proxy.setSumActive(sumActive + 1);
			proxyDAO.save(proxy);
		}
		return user;
	}

	// 判断是否绑定
	public int panduan(String wx) {
		String hql = "from User where weixinUser.openid = ?";
		List list = hqldao.query(hql, wx);
		if (list.size() > 0)
			return 1;
		return 0;
	}
}
