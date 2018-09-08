package com.service.weixin;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ApplydetailDAO;
import com.dao.HqlDAO;
import com.dao.WeixinUserDAO;
import com.pojo.Applydetail;
import com.pojo.WeixinUser;

@Service
public class WeiXinApplyForQrcodeService {
	@Autowired
	private ApplydetailDAO applydetailDAO;
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private WeixinUserDAO weixinUserDAO;
	
	
	
	/**
	 * 生成订单号
	 * @return
	 */
	public String getAllDingdanhao() {
		String dingdanhao = null;
		// Date date=new Date();
		// SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");
		// String dataString=sdf.format(date);
		//		
		// dingdanhao="shuiguoshangcheng"+dataString;
		dingdanhao = UUID.randomUUID().toString().replaceAll("-", "");
		return dingdanhao;
	}

	public Timestamp doAddOrder(int account, String name, String tel, String address, String orderid, double sum, String weixinhao) {
		//  根据微信号找到用户
		WeixinUser weixinUser = weixinUserDAO.findById(weixinhao);
		//  生成订单时间  今晚添加account
		Timestamp createtime = new Timestamp(System.currentTimeMillis());
		Applydetail applydetail = new Applydetail();
		applydetail.setCreated(createtime);
		applydetail.setOrderId(orderid);
		applydetail.setStatus((short)1);
		applydetail.setTotalFee((double) sum);
		applydetail.setBuyer(name);
		applydetail.setBuyerAddr(address);
		applydetail.setBuyerTel(tel);
		applydetail.setCardFee((double) (sum/account));
		applydetail.setCardNum(account);
		applydetail.setWeixinUser(weixinUser);
		applydetailDAO.save(applydetail);
		return createtime;
		
	}

	public Applydetail getdetailByOrderid(String orderid) {
		String hql = "from Applydetail a where a.orderId = ?";
		
		List<Applydetail> list =hqlDAO.findByHQL(hql,orderid);
		Applydetail applydetail = list.get(0);
		return applydetail;
	}
	public void updateStatusByOrderid(String orderid) {
		//  付款成功时间
		Timestamp updatetime = new Timestamp(System.currentTimeMillis());
		String hql = "update Applydetail set status=2,updated=? where orderId=?";
		hqlDAO.zsg(hql,updatetime,orderid);
	}
	public void doCancelOrder(String orderid) {
		String hql = "delete from Applydetail where orderId=?";
		hqlDAO.zsg(hql, orderid);
	}
}
