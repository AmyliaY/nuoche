package com.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.ProxyCashDAO;
import com.dao.ProxyDAO;
import com.dao.UserDAO;
import com.dao.VipCashDAO;
import com.pojo.Proxy;
import com.pojo.ProxyCash;
import com.pojo.User;
import com.pojo.VipCash;
import com.util.StringUtil;

/**
 * 后台管理 管理
 * 
 * @author 唐仁鑫 2018.3.26
 * 
 */
@Service
public class AdminTixianService {

	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private ProxyCashDAO cashDAO;
	@Autowired
	private VipCashDAO vipCashDAO;
	@Autowired
	private ProxyDAO proxyDAO;
	@Autowired
	private UserDAO userDAO;
	
	public Map findDlTxRequestFenye(int size, int page, String keywords) {
		StringBuffer sb=new StringBuffer(" where 1=1");
		List paramList=new ArrayList();
		if(StringUtil.isNotNull(keywords) && keywords.trim().length()>0)
		{
			sb.append(" and proxy.realname like ?");
			paramList.add("%"+keywords+"%");
			sb.append(" or proxy.openid like ?");
			paramList.add("%"+keywords+"%");
		}
		String hqlsum="select count(*) from ProxyCash "+sb.toString() +" and status = 0";
		int sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
		int count=sum%size==0 ? sum/size :sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		String hql="from ProxyCash"+sb.toString()+" and status = 0 order by time desc";
		List<ProxyCash> list=hqlDAO.pageQuery(hql, size, page,paramList.toArray());
		Map map=new HashMap();
		map.put("size", size);
		map.put("page", page);
		map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}
	
	public void dodailitixianrequest(int id, int dowhat) {
		ProxyCash proxyCash = cashDAO.findById(id);
		System.out.println(id);
		Proxy proxy = proxyCash.getProxy();
		System.out.println(proxy.getTel());
		if(dowhat==1)
		{	//  同意
			proxyCash.setStatus((short)1);
			cashDAO.save(proxyCash);
			if(proxy.getYiCash()!=null&&proxyCash.getCash()!=null){
				proxy.setYiCash(proxy.getYiCash()+proxyCash.getCash());
			}
			else{
				proxy.setYiCash(proxyCash.getCash());
			}
			proxyDAO.save(proxy);
		}else
		{	//  拒绝
			proxyCash.setStatus((short)2);
			cashDAO.save(proxyCash);
			if(proxy.getKeCash()!=null&&proxyCash.getCash()!=null){
				proxy.setKeCash(proxy.getKeCash()+proxyCash.getCash());
			}
			else{
				proxy.setKeCash(proxyCash.getCash());
			}
			proxyDAO.save(proxy);
		}

	}

	public Map findDlTxFenye(int size, int page, String keywords) {
		StringBuffer sb=new StringBuffer(" where 1=1");
		List paramList=new ArrayList();
		if(StringUtil.isNotNull(keywords) && keywords.trim().length()>0)
		{
			sb.append(" and proxy.realname like ?");
			paramList.add("%"+keywords+"%");
			sb.append(" or proxy.openid like ?");
			paramList.add("%"+keywords+"%");
		}
		String hqlsum="select count(*) from ProxyCash"+sb.toString();
		int sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
		int count=sum%size==0 ? sum/size :sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		String hql="from ProxyCash"+sb.toString()+" order by time desc";
		List<ProxyCash> list=hqlDAO.pageQuery(hql, size, page,paramList.toArray());
		Map map=new HashMap();
		map.put("size", size);
		map.put("page", page);
		map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}

	public Map findVipTxFenye(int size, int page, String keywords) {
		StringBuffer sb=new StringBuffer(" where 1=1");
		List paramList=new ArrayList();
		if(StringUtil.isNotNull(keywords) && keywords.trim().length()>0)
		{
			sb.append(" and user.name like ?");
			paramList.add("%"+keywords+"%");
			sb.append(" or user.openid like ?");
			paramList.add("%"+keywords+"%");
		}
		String hqlsum="select count(*) from VipCash"+sb.toString();
		int sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
		int count=sum%size==0 ? sum/size :sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		String hql="from VipCash"+sb.toString()+" order by time desc";
		List<VipCash> list=hqlDAO.pageQuery(hql, size, page,paramList.toArray());
		Map map=new HashMap();
		map.put("size", size);
		map.put("page", page);
		map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}

	public Map findVipTxRequestFenye(int size, int page, String keywords) {
		StringBuffer sb=new StringBuffer(" where 1=1");
		List paramList=new ArrayList();
		if(StringUtil.isNotNull(keywords) && keywords.trim().length()>0)
		{
			sb.append(" and user.name like ?");
			paramList.add("%"+keywords+"%");
			sb.append(" or user.weixinUser.openid like ?");
			paramList.add("%"+keywords+"%");
		}
		String hqlsum="select count(*) from VipCash"+sb.toString() +" and status = 0";
		int sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
		int count=sum%size==0 ? sum/size :sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		String hql="from VipCash"+sb.toString()+" and status = 0 order by time desc";
		List<VipCash> list=hqlDAO.pageQuery(hql, size, page,paramList.toArray());
		Map map=new HashMap();
		map.put("size", size);
		map.put("page", page);
		map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}
	public void doviptixianrequest(int id, int dowhat) {
		VipCash vipCash = vipCashDAO.findById(id);
		User user = vipCash.getUser();
		if(dowhat==1)
		{  //同意提现
			vipCash.setStatus((short)1);
			if(user.getYitixian()!=null)
			{
				user.setYitixian(user.getYitixian()+vipCash.getCash());
				user.setWeitixian(user.getWeitixian()-vipCash.getCash());
			}else
			{
				user.setYitixian(vipCash.getCash());
				user.setWeitixian(user.getWeitixian()-vipCash.getCash());
			}
			vipCashDAO.save(vipCash);
			userDAO.save(user);
		}else
		{//  拒绝提现
			vipCash.setStatus((short)2);
			if(user.getKetixian()!=null&&user.getWeitixian()!=null)
			{
				user.setKetixian(user.getKetixian()+vipCash.getCash());
				user.setWeitixian(user.getWeitixian()-vipCash.getCash());
			}else
			{
				user.setKetixian(vipCash.getCash());
				user.setWeitixian(vipCash.getCash());
			}
			vipCashDAO.save(vipCash);
			userDAO.save(user);
		}

	}
	

	
	
	
	
	
	
	
	
}
