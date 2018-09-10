package com.service.weixin;

import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.YuyueDAO;
import com.pojo.Yuyue;

/**
 * 用户预约服务支付Service-查仕龙
 * @author dell
 *
 */


@Service
public class WeixinUserYuyueTopayService {
	@Autowired
	private HqlDAO hqlDAO;
	
	@Autowired
	private YuyueDAO yuyueDAO;
	
	
	public Yuyue findYuyueByid(int yuyueid) {
		Yuyue yuyue = yuyueDAO.findById(yuyueid);
		return yuyue;
	}
	
	public Yuyue updateStatusByOrderid(String trade_no) {
		//  付款时间
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		List<Yuyue> list = yuyueDAO.findByOrderWx(trade_no);
		Yuyue yuyue = list.get(0);
		yuyue.setStatus((short)1);
		yuyue.setTime(timestamp);
		yuyueDAO.save(yuyue);
		return yuyue;
	}

	public String updateOrderId(Yuyue yuyue) {
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		yuyue.setOrderWx(uuid);
		yuyueDAO.merge(yuyue);
		return uuid;
	}

}
