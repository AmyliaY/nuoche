package com.service.weixin;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.dao.ChongzhiHuafeiDAO;
import com.dao.HqlDAO;
import com.dao.MovecarDAO;
import com.dao.TemplatemessageDAO;
import com.dao.UserDAO;
import com.dao.WeixinUserDAO;
import com.pojo.Applydetail;
import com.pojo.ChongzhiHuafei;
import com.pojo.Movecar;
import com.pojo.Templatemessage;
import com.pojo.User;
import com.pojo.WeixinUser;
import com.sun.java_cup.internal.internal_error;

@Service
public class WeiXinMoveCarService {
	@Autowired
	private HqlDAO hqldao;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private TemplatemessageDAO tdao;
	@Autowired
	private WeixinUserDAO wxDAO;
	@Autowired
	private MovecarDAO movecarDAO;
	@Autowired
	private WeixinUserDAO weixinUserDAO;
	@Autowired
	private ChongzhiHuafeiDAO huafeiDAO;
	
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
		WeiXinMoveCarService carService = context.getBean(WeiXinMoveCarService.class);
		carService.changeMinute("e7afe4566ef141968138ede058764133");
		
	}
	
	public User findbyqrid(String qrid) {
		String hql="from User where qrcode = ?";
		List list = hqldao.pageQuery(hql, 1,1,qrid);
		if (list.size()>0)
		{
			User user = (User) list.get(0);
			return user;
		}
		return null;
		
	}

	public String messageIdCX(int i) {
		String hql = "from Templatemessage where id =" + i;
		List list = hqldao.query(hql);
		Templatemessage t = (Templatemessage) list.get(0);
		String mid = t.getTpweixinId();
		
		
		
		return mid;
	}

	public void addUser(String weixinhao) {
		User user = new User();
		String hql="from WeixinUser where openid = ?";
		List list = hqldao.pageQuery(hql, 1,1, weixinhao);
		WeixinUser wu = (WeixinUser) list.get(0);
		user.setWeixinUser(wu);
		Date date = new Date();       
		Timestamp registtime = new Timestamp(date.getTime());
		user.setCreated(registtime);
	}

	public void addWeixinUser(String weixinhao) {
		
	}

	public int addNCJL(String wxh,String user_wx,String wz) {
		Movecar mc = new Movecar();
		User wxuser = new User();
		String hql="from User where openid = ?";
		List list = hqldao.pageQuery(hql,1,1,wxh);
		User usercar = (User) list.get(0);
		
		
		/*String hql2="from User where openid = "+"'"+user_wx+"'";
		List list2 = hqldao.query(hql2);
		if (list2.size()==0){
			String sql= "insert into User (openid) values (?)";
			hqldao.executeSql(sql, user_wx);
		}
		
		String hql3="from User where openid = "+"'"+user_wx+"'";
		list2 = hqldao.query(hql3);
		User user = (User) list2.get(0);
		wxuser = user;*/
		
		
	 
		Date date = new Date();       
		Timestamp registtime = new Timestamp(date.getTime());
		
		Movecar movecar = new Movecar();
		movecar.setUserByCar(usercar);
		movecar.setTime(registtime);
		movecar.setAddr(wz);
		
		//申请挪车
		try {
			WeixinUser weixinUser = wxDAO.findById(user_wx);
			movecar.setUserByUser(weixinUser);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		movecar.setStatus((short)2);
		movecarDAO.save(movecar);
		
		
		//String sql= "insert into movecar (time,addr, car,`user`,status) values (?,?,?,?,2)";
		//hqldao.executeSql(sql, registtime,wz,user_wx,usercar.getId());
		
		int mcid = -1;
		String hqlmc ="from Movecar where time = ?";
		List list3 = hqldao.pageQuery(hqlmc, 1, 1, registtime);
		movecar = (Movecar) list3.get(0);
		mcid = movecar.getId();
		return mcid;
	}


	public void xiugaiStauts(String mobilephone) {
		String hql="from User where tel = ?";
		List list = hqldao.query(hql,mobilephone);
		User user = (User) list.get(0);
		Integer uid = user.getId();
		//System.out.println("uid="+uid);
		//String sql= "UPDATE  movecar SET status = 0 where car=?";
		//hqldao.executeSql(sql, uid);
		String hql2 = "from Movecar where userByCar.id=? order by id desc";
		List list2  = hqldao.pageQuery(hql2, 1, 1, uid);
		if (list2.size()>0)
		{
			Movecar movecar = (Movecar) list2.get(0);
			movecar.setStatus((short)0);
			movecarDAO.merge(movecar);
		}
	}

	public int cxzt(String mcid) {
		int id = Integer.parseInt(mcid);
		Movecar mc = movecarDAO.findById(id);
		if (mc.getStatus() == 0) {
			return 1;
		}
		return 0;
	}
	
	public User findUserByOpen(String openid)
	{
		String hql = "from User where weixinUser.openid=?";
		List list = hqldao.pageQuery(hql, 1, 1, openid);
		if (list.size()>0)
			return (User) list.get(0);
		
		return null;
	}

	public void xiugaiStauts2(String wx) {
		String hql="from User where openid = "+"'"+wx+"'";
		List list = hqldao.query(hql);
		User user = (User) list.get(0);
		Integer uid = user.getId();
		String sql= "UPDATE  movecar SET status = 0 where car=?";
		hqldao.executeSql(sql, uid);
		
	
	
	}

	public User findBywxh(String weixinhao) {
		// TODO Auto-generated method stub
		String hql="from User where openid = ?";
		List list = hqldao.pageQuery(hql, 1, 1, weixinhao);
		if (list.size()>0)
		{
			User user = (User) list.get(0);
			return user;
		}
		return null;
	}

	public WeixinUser findBywxh1(String weixinhao) {
		// TODO Auto-generated method stub
		String hql="from WeixinUser where openid = ?";
		List list = hqldao.pageQuery(hql, 1, 1, weixinhao);
		if (list.size()>0)
		{
			WeixinUser user = (WeixinUser) list.get(0);
			return user;//1
		}
		return null;
	}

	public void addTEL(String wxh, String tel) {
		WeixinUser wxuser = findBywxh1(wxh);
		if (wxuser!=null) {
			wxuser.setWxtel(tel);
			wxDAO.save(wxuser);
			
		}
		
		
	}

	public void huiCall(String wxh, String fee_time) {
		// TODO Auto-generated method stub
		WeixinUser wxuser = findBywxh1(wxh);
		if (wxuser!=null) {
			int t = wxuser.getTimeLeft();
			int f =Integer.parseInt(fee_time);
			t=t-f;
			wxuser.setTimeLeft(t);
			wxDAO.save(wxuser);
			
		}
	}

	/**
	 * 生成订单号
	 * 全恒
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

	/**
	 * 生成订单
	 * 全恒
	 * @param account
	 * @param orderid
	 * @param sum
	 * @param weixinhao
	 * @return
	 */
	public Timestamp doAddOrder(String account, String orderid, String sum, String weixinhao) {
		//  生成订单时间  今晚添加account
		Timestamp createtime = new Timestamp(System.currentTimeMillis());
		ChongzhiHuafei czhf = new ChongzhiHuafei();
		czhf.setCreated(createtime);
		czhf.setOrderId(orderid);
		czhf.setStatus((short)0);//0未付款
		czhf.setTotalFee(Double.parseDouble(sum));
		czhf.setMinuteNum(Integer.parseInt(account));
		czhf.setOpenid(weixinhao);
		huafeiDAO.save(czhf);
		return createtime;
	}

	/**
	 * 根据orderid查充值话费订单
	 * @param orderid
	 * @return
	 */
	public ChongzhiHuafei getdetailByOrderid(String orderid) {
		List list = huafeiDAO.findByOrderId(orderid);
		if(list!=null && list.size()>0){
			return (ChongzhiHuafei)list.get(0);
		}
		return null;
	}

	/**
	 * 修改剩余分钟数
	 * 	全恒
	 * @param openid
	 * @param account
	 */
	public void changeMinute(String orderid) {
		//  付款成功时间
		Timestamp updatetime = new Timestamp(System.currentTimeMillis());
		String hql = "update ChongzhiHuafei set status=1,updated=? where orderId=?";
		hqldao.zsg(hql,updatetime,orderid);
		//查询订单对应的openid，和WeixinUser
		List list = huafeiDAO.findByOrderId(orderid);
		if(list != null && list.size()>0){
			ChongzhiHuafei chongzhiHuafei = (ChongzhiHuafei)list.get(0);
			String openid = chongzhiHuafei.getOpenid();
			int account = chongzhiHuafei.getMinuteNum();
			System.out.println("openid:"+openid);
			//修改weixinuser的剩余分钟数
			WeixinUser weixinUser = weixinUserDAO.findById(openid);
			if(weixinUser != null){
				Integer timeleft = weixinUser.getTimeLeft();
				if(timeleft == null){
					timeleft = 0;
				}
				timeleft += account;
				System.out.println("timeleft:"+timeleft);
				weixinUser.setTimeLeft(timeleft);
				weixinUserDAO.merge(weixinUser);
			}
		}
	}

}
