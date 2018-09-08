package com.service.back;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.PaypresentDAO;
import com.dao.PayrecordsDAO;
import com.pojo.Paypresent;
import com.pojo.Payrecords;
import com.util.StringUtil;

@Service
public class ChongzhirecordService {
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private PayrecordsDAO payrecordsDAO;
	@Autowired
	private PaypresentDAO paypresentDAO;
	public Map chongzhilisting(int size, int page, String cztype, String czstatus, Timestamp begintime, Timestamp endtime, String keywords) {
		StringBuffer sb=new StringBuffer(" where 1=1 ");
		List paramList=new ArrayList();
		if(StringUtil.isNotNull(cztype) && cztype.trim().length()>0)
		{
			if(Integer.parseInt(cztype)==3){
				sb.append(" and prType=?");
				paramList.add(Integer.parseInt(cztype));
			}
		}
		if(StringUtil.isNotNull(cztype) && cztype.trim().length()>0)
		{
			if(Integer.parseInt(cztype)==0)
			{
				sb.append(" and prType=1 or prType=2");
			}
		}
		if(StringUtil.isNotNull(czstatus) && czstatus.trim().length()>0)
		{
			sb.append(" and prStatus=?");
			paramList.add(Integer.parseInt(czstatus));
		}
		if(begintime!=null)
		{
			sb.append(" and prTime>=?");
			paramList.add(begintime);
		}
		if(endtime!=null)
		{
			sb.append(" and prTime<=?");
			paramList.add(endtime);
		}
		if(StringUtil.isNotNull(keywords) && keywords.trim().length()>0)
		{
			sb.append(" and (userinfo.usersName like ? or prDingdanhao=?)");
			paramList.add("%"+keywords+"%");
			paramList.add(keywords);
		}
		String hqlsum="select count(*) from Payrecords"+sb.toString();
		int sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
		int count=sum%size==0 ? sum/size : sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		String hql="from Payrecords"+sb.toString()+" order by prTime desc";
		System.out.println();
		List list=hqlDAO.pageQuery(hql, size, page,paramList.toArray());
		Map map=new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);
		map.put("list", list);
		return map;
	}
	public boolean deletechongchi(int id) {
		Payrecords payrecords=payrecordsDAO.findById(id);
		if(payrecords!=null){
			payrecordsDAO.delete(payrecords);
			return true;
		}
		return false;
	}
	public void pldelete(String payid) {
		String hql="delete from Payrecords where prId in("+payid+")";
		hqlDAO.bulkUpdate(hql);
	}
	public Map ChongZhiYouHui(int size, int page) {
		String hqlsum="select count(*) from Paypresent";
		int sum=(int) hqlDAO.unique(hqlsum);
		int count=sum%size==0 ? sum/size :sum/size+1;
		if(page <1 )page=1;
		if(page>count) page=count;
		String hql="from Paypresent";
		List list=hqlDAO.pageQuery(hql, size, page);
		Map map=new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);
		map.put("list", list);
		return map;
		
	}
	public void setqujian(int ppmin, int ppmax, int ppPresent, int ppstatus) {
		Paypresent paypresent=new Paypresent();
		paypresent.setPpMax(ppmax);
		paypresent.setPpMin(ppmin);
		paypresent.setPpPresent(ppPresent);
		paypresent.setPpStatus(ppstatus);
		paypresentDAO.save(paypresent);
		
	}
	public Paypresent updatestatus(int id) {
		Paypresent paypresent=paypresentDAO.findById(id);
		int status=paypresent.getPpStatus();
		paypresent.setPpStatus(1-status);
		paypresentDAO.save(paypresent);
		return paypresent;
		
	}
	public boolean deleteYouhui(int id) {
		Paypresent paypresent=paypresentDAO.findById(id);
		if(paypresent!=null){
			paypresentDAO.delete(paypresent);
			return true;
		}
		return false;
	}

}
