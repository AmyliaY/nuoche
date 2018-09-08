package com.service.back;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.HqlDAO;
import com.dao.PaypresentDAO;
import com.dao.PayrecordsDAO;
import com.dao.UserinfoDAO;
import com.dao.WeixinUserDAO;
import com.pojo.Paypresent;
import com.pojo.Payrecords;
import com.pojo.Userinfo;
import com.pojo.WeixinUser;
import com.util.StringUtil;

@Service
public class UsersService {
	
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private  UserinfoDAO userinfoDAO;
	
	@Autowired
	private PaypresentDAO paypresentDAO;
	
	
	@Autowired
	private WeixinUserDAO weixinuserDAO;
	
	
	
	
	
	@Autowired
	private PayrecordsDAO payrecordsDAO;
	public Map userlisting(int page, int size, int type, Timestamp begintime, Timestamp endtime, String keywords) {
		StringBuffer sb=new StringBuffer(" where 1=1 ");
		List paramList=new ArrayList();
		if(begintime!=null)
		{
			sb.append(" and usersCreatetime>=? ");
			paramList.add(begintime);
		}
		if(endtime!=null)
		{
			sb.append(" and usersCreatetime<=? ");
			paramList.add(endtime);
		}
		if(StringUtil.isNotNull(keywords) && keywords.trim().length()>0)
		{
			String regex = "^1[3|4|5|7|8][0-9]\\d{4,8}$";
			Pattern p = Pattern.compile(regex);
			Matcher m = p.matcher(keywords);
			if (m.matches()) {
				sb.append("and usersPhone = ?");
				paramList.add(keywords);
			}else {
				sb.append("and usersName like ? ");
				paramList.add("%"+keywords+"%");
			}
			
		}
		String hqlsum=null;
		int sum=0;
		String hql=null;
		List list=null;
		if(type==1)
		{
			hqlsum="select count(*) from Userinfo "+sb.toString()+" order by usersCreatetime desc";
			sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
			hql="from Userinfo "+sb.toString()+" order by usersCreatetime desc";
			list=hqlDAO.pageQuery(hql, size, page,paramList.toArray());
		}
		if(type==2)
		{
			hqlsum="select count(*) from Userinfo "+sb.toString()+" and usersType=0 order by usersCreatetime desc";
			sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
			hql="from Userinfo "+sb.toString()+" and usersType=0 order by usersCreatetime desc";
			list=hqlDAO.pageQuery(hql, size, page,paramList.toArray());
		}
		if(type==3)
		{
			hqlsum="select count(*) from Userinfo "+sb.toString()+" and usersType=1 order by usersCreatetime desc";
			sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
			hql="from Userinfo "+sb.toString()+" and usersType=1 order by usersCreatetime desc";
			list=hqlDAO.pageQuery(hql, size, page, paramList.toArray());
		}
		int count=sum%size==0 ? sum/size : sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		Map map=new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("list", list);
		map.put("sum", sum);
		map.put("count", count);
		map.put("type", type);
		return map;
	}
	public Userinfo xiugaistatus(int id) {
		Userinfo userinfo=userinfoDAO.findById(id);
		int status=userinfo.getUsersStatus();
		if(userinfo!=null)
			userinfo.setUsersStatus(1-status);
			userinfoDAO.save(userinfo);
		return userinfo;
	}
	public Userinfo xiugaitype(int id) {
		Userinfo userinfo=userinfoDAO.findById(id);
		int type=userinfo.getUsersType();
		if(userinfo!=null)
			userinfo.setUsersType(1-type);
			userinfoDAO.save(userinfo);
		return userinfo;
	}
	public Map jifencord(int size, int page, int id) {
		System.out.println("service");
		String hqlsum="select count(*) from Payrecords where userinfo.usersId=? order by prTime desc";
		int sum=(int) hqlDAO.unique(hqlsum, id);
		System.out.println("sum:"+sum);
		int count=sum%size==0 ? sum/size : sum/size+1;
		if(page<1)page=1;
		if(page>count) page=count;
		String hql="from Payrecords where userinfo.usersId=? order by prTime desc";
		List list=hqlDAO.pageQuery(hql, size, page, id);
		Map map=new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}
	public Userinfo findByidUser(int id) {
		Userinfo users=userinfoDAO.findById(id);
		
		return users;
	}
	public Userinfo userschongzhiview(int id) {
		return userinfoDAO.findById(id);
	}
	public boolean userschongzhi(int id, Double price) {
		Userinfo users=userinfoDAO.findById(id);
		Double oldprice=users.getUsersIntegral();
		if(users!=null){
			
			//新增一条充值记录
			Payrecords payrecords=new Payrecords();
			String ddh=UUID.randomUUID().toString();	//订单号
			String dd=ddh.replaceAll("\\-", "");	//把 uuid 中 的 - 去掉
			
			payrecords.setPrDingdanhao(dd);	
			payrecords.setPrMoney(price);	
			payrecords.setPrStatus(1);	//后台充值 状态
			Date date=new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time=sdf.format(date);
			payrecords.setPrTime(Timestamp.valueOf(time));
			payrecords.setPrType(3);	//充值成功
			payrecords.setUserinfo(users);
			
			//赠送积分
			int money = 0;
			List<Paypresent> list = paypresentDAO.findByPpStatus(1);
			for (Paypresent p : list)
			{
				int min = p.getPpMin();
				int max = p.getPpMax();
				if (price>=min && price<=max)
				{
					money = p.getPpPresent();
					break;
				}
			}
			//System.out.println("mm="+money);
			payrecords.setPrPresent(money);
			
			payrecordsDAO.save(payrecords);
			
			users.setUsersIntegral(price+oldprice+money);
			userinfoDAO.save(users);
			return true;
		}
		return false;
	}
	/**
	 * 
	 * @param mobile
	 * @return list
	 */
	public List findByMobile(String mobile)
	{
		System.out.println(mobile);

		List list = userinfoDAO.findByUsersPhone(mobile);
		return list;
	}
	
	public Userinfo findByPhone(String tel)
	{
		List list = userinfoDAO.findByUsersPhone(tel);
		if (list.size()>0)
			return (Userinfo) list.get(0);
		
		return null;
	}
	
	public void zhuce(String weixinhao,String mobile,String password, String username)
	{
		Userinfo user=new Userinfo();
		user.setUsersPhone(mobile);
		user.setUsersPassword(password);
		//设置默认设定值
		user.setUsersName(username);//用户名
		user.setUsersArea("");//设置区县
	    user.setUsersStatus(1);//设置状态为启用
	    user.setUsersGender(1);//设置用户性别为男
	    
		Date date=new Date();
		Timestamp time=new Timestamp(date.getTime());
        user.setUsersCreatetime(time);//用户注册时间
        user.setUsersIntegral(0.0);//设置用户默认积分为0
        user.setUsersType(0);//设置用户为普通会员
        user.setUsersPaypwd("111111");
        
       
        
        userinfoDAO.save(user);
        
        if (weixinhao!=null)
        {
           WeixinUser weixinuser = weixinuserDAO.findById(weixinhao);
           if (weixinhao!=null)
        	   weixinuser.setUserinfo(user);
        }
	}

	public void zhuceWithReferrer(String weixinhao,String mobile, String password,
			String usersReferrer, String username) {
		
		System.out.println("test:   "+mobile + "\t" +password + "\t"+username +"\t" +usersReferrer);

		// TODO Auto-generated method stub
		Userinfo user=new Userinfo();
		user.setUsersPhone(mobile);
		user.setUsersPassword(password);
		//设置默认设定值
		user.setUsersName(username);//用户名
		user.setUsersArea("天元区");//设置区县
	    user.setUsersStatus(1);//设置状态为启用
	    user.setUsersGender(1);//设置用户性别为男
	    user.setUsersReferrer(usersReferrer);//推荐人
	    System.out.print(usersReferrer);
		Date date=new Date();
		Timestamp time=new Timestamp(date.getTime());
        user.setUsersCreatetime(time);//用户注册时间
        user.setUsersIntegral(0.0);//设置用户默认积分为0
        user.setUsersType(1);//设置用户为普通会员
        user.setUsersPaypwd("111111");
        
        Userinfo tujianren = findByPhone(usersReferrer);
        
        userinfoDAO.save(user);
        
     
        
        //绑定注册人的微信号
        if (weixinhao!=null)
        {
           WeixinUser weixinuser = weixinuserDAO.findById(weixinhao);
           if (weixinuser!=null && weixinhao!=null)
        	   weixinuser.setUserinfo(user);
        }
	}
	
	public Userinfo updatepws(String mobile,String password)
	{
		System.out.println("到了usersservice1");
		System.out.println(mobile);
		System.out.println(password);
		Userinfo user = (Userinfo) userinfoDAO.findByUsersPhone(mobile).get(0);
		System.out.println("到了usersservice2");
		if(user!=null)
		{
			System.out.println("到了usersservice3");
			user.setUsersPassword(password);
			userinfoDAO.save(user);
		}
		return user;
	}
	public List findByUsername(String username) {
		List list=userinfoDAO.findByUsersName(username);
		return list;
	}
	public void update(Userinfo userinfo) {
		userinfoDAO.merge(userinfo);
		
	}
	
	
}
