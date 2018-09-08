package com.service.daili;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.ProxyDAO;
import com.pojo.Proxy;
import com.pojo.Proxychongzhi;
import com.pojo.User;
import com.util.T2DMa;


/**
 * 查仕龙-代理充值Action
 * @author dell
 *
 */


@Service
public class DailiChongzhipayService {

	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private ProxyDAO proxyDAO;
	
	/**
	 * 新增一条充值记录
	 * @param proxyid
	 * @param fee
	 * @param dingdanhao
	 * @param time
	 */
	
	public void addpay(int proxyid, double fee, String dingdanhao, Timestamp time) {
		
		/*String idhql="from Proxy where id=?";	
		List list =  hqlDAO.query(idhql, proxyid);
		if (list.size()>0)
		{
		Proxy proxy = (Proxy) list.get(0);
		int id = proxy.getId();*/
		String hql="insert into proxychongzhi (proxy,time,fee,orderid,status) value (?,?,?,?,?)";
		
		hqlDAO.executeSql(hql, proxyid,time,fee,dingdanhao,(short)0);
		
		
	
		
	}

	/**
	 * c根据订单号创建二维码
	 * @param encoderContent
	 * @param dingdanhao
	 * @param path
	 * @return
	 */

	public String doCreate2(String encoderContent, String dingdanhao, String path) {
		T2DMa ma  =new T2DMa();
		String imgPath = path+File.separator+dingdanhao+".png";
		//System.out.println(encoderContent);
		//System.out.println("图片最终路径："+imgPath);
		ma.encoderQRCode(encoderContent, imgPath, "png");//二维码对应的网站，图片的路径，图片的格式
		//System.out.println(encoderContent);
		String returnimg = dingdanhao+".png";
		return returnimg;
	}

	/**
	 * 查询充值金额进行支付金额匹配
	 * @param orderid
	 * @return
	 */
	
	public Proxychongzhi getdetailByOrderid(String orderid) {
		String hql = "from Proxychongzhi  where orderid = ?";
		
		List<Proxychongzhi> list =hqlDAO.findByHQL(hql,orderid);
		
			Proxychongzhi proxychongzhi = list.get(0);
			  return proxychongzhi;
		
		
	}

	/**
	 * 修改充值状态
	 * @param orderid
	 */
	
	public void updateStatusByOrderid(String orderid) {
		//  付款成功时间
		Timestamp updatetime = new Timestamp(System.currentTimeMillis());
		String hql = "update Proxychongzhi set status=1,time=? where orderid=?";
		hqlDAO.zsg(hql,updatetime,orderid);
	}
	
	
	/**
	 * 将充值成功的金额写入代理表
	 * @param trade_no
	 */
	public void updatecash(String trade_no) {

		String hql1 = "from Proxychongzhi  where orderid = ?";
		List<Proxychongzhi> list =hqlDAO.findByHQL(hql1,trade_no);
		if(list.size()>0){
		Proxychongzhi proxychongzhi = list.get(0);
		Proxy proxy=proxychongzhi.getProxy();
		double fee=proxychongzhi.getFee();
		
		if(proxy.getKeCash()!=null){
			
			proxy.setKeCash(proxy.getKeCash()+fee);
			
		
		}
		else{
			proxy.setKeCash(fee);
		}
		if(proxy.getTotalAmount()!=null){
			proxy.setTotalAmount(proxy.getTotalAmount()+fee);
		}
		else{
			
			proxy.setTotalAmount(fee);
		}
		
			proxyDAO.save(proxy);
		
		}
		
	}

	
	/**
	 * 根据订单号查支付状态
	 */
	public int getStatusByOrderid(String orderid){
		String hql = "from Proxychongzhi where orderid = ?";
		List list = hqlDAO.findByHQL(hql, orderid);
		if(list.size()>0){
			Proxychongzhi proxychongzhi = (Proxychongzhi)list.get(0);
			int status = proxychongzhi.getStatus();
			return status;
		}
		else
			return 0;
		
	}
	
	
	
}
