package com.service.back;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.UamessagesDAO;
import com.dao.UserinfoDAO;
import com.pojo.Admin;
import com.pojo.Uamessages;
import com.pojo.Userinfo;
import com.util.JsonFilter;
import com.util.StringUtil;

@Service
public class MessagesService {
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private UamessagesDAO uamessagesDAO;
	@Autowired
	private UserinfoDAO userinfoDAO;
	public Map messageslisting(int size, int page, String begindate, String enddate, String keywords) {
		StringBuffer sb=new StringBuffer(" where 1=1 ");
		List paramList=new ArrayList();
		if(StringUtil.isNotNull(begindate) && begindate.trim().length()>0)
		{
			sb.append(" and metime>=?");
			paramList.add(Timestamp.valueOf(begindate+" 00:00:00"));
		}
		if(StringUtil.isNotNull(enddate) && enddate.trim().length()>0)
		{
			sb.append(" and metime<=?");
			paramList.add(Timestamp.valueOf(enddate+" 23:59:59"));
		}
		if(StringUtil.isNotNull(keywords) && keywords.trim().length()>0)
		{
			sb.append(" and userinfo.usersName like ?");
			paramList.add("%"+keywords+"%");
		}
		String hqlsum="from Uamessages "+sb.toString()+" and mefangxiang=1 group by userinfo";
		List listsum=hqlDAO.query(hqlsum, paramList.toArray());
		int sum=(int) listsum.size();
		int count=sum%size==0 ? sum/size : sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		String hql="select max(u) from Uamessages u "+sb.toString()+" and mefangxiang=1 group by userinfo.usersName";
		List list=hqlDAO.pageQuery(hql, size, page,paramList.toArray());
		Map map=new HashMap();
		map.put("sum", sum);
		map.put("size", size);
		map.put("page", page);
		map.put("list", list);
		map.put("count", count);
		return map;
	}
	public Uamessages replymessagesview(int id) {
		return uamessagesDAO.findById(id);
	}
	public void addmessages(Userinfo userinfo, String smdetail, Admin admin) {
		Uamessages msg=new Uamessages();
		msg.setSmdetail(smdetail);
		msg.setMefangxiang(0);
		msg.setMestatus(0);
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString=sdf.format(date);
		msg.setMetime(Timestamp.valueOf(dateString));
		msg.setUserinfo(userinfo);
		msg.setAdmin(admin);
		uamessagesDAO.save(msg);
		
	}
	public Userinfo findByIdUsers(int usersid) {
		return userinfoDAO.findById(usersid);
	}
	public List getAllMsgUserid(Userinfo userinfo) {
		String hql="from Uamessages where userinfo.usersId=? order by metime";
		List list=hqlDAO.query(hql, userinfo.getUsersId());
		if(list.size()>0)
			return list;
		return null;
	}
	/**
	public List getAlluMsgUserid(Userinfo userinfo) {
		String hql="from Uamessages where userinfo.usersId=? and mefangxiang=? and mestatus=?";
		List list=hqlDAO.query(hql, userinfo.getUsersId(),0,0);
		if(list.size()>0)
			return list;
		return null;
	}
	 * @param admin **/
	public void replymessages(int usersid, Admin admin) {
		String hql="update Uamessages set mestatus=? ,admin=? where userinfo.usersId=?";
		hqlDAO.bulkUpdate(hql,1,admin,usersid);
		
	}
	public void deletemsg(int status, Timestamp thisdate, Timestamp threezerodate) {
		if(status==1){
			String hql="delete Uamessages where metime>=? and metime<=?";
			hqlDAO.bulkUpdate(hql, threezerodate,thisdate);
		}else{
			String hql="delete Systemmessages where smTime>=? and smTime<=?";
			hqlDAO.bulkUpdate(hql, thisdate,threezerodate);
		}
		
	}
	public int msgtishi() {
		String hql="from Uamessages where mefangxiang=1 and mestatus=0 group by userinfo";
		List list=hqlDAO.query(hql);
		int sum= (int) list.size();
		return sum;
	}
	public List plreplymessagesview() {
		String hql="select max(u) from Uamessages u where mestatus=0 and mefangxiang=1 group by userinfo";
		List list=hqlDAO.query(hql);
		if(list.size()>0)
			return list;
		return null;
	}
	public String firstmsg(int usersid, Admin admin) {
		String hql="select max(u) from Uamessages u where mefangxiang=0 and userinfo.usersId=? order by metime";
		List list=hqlDAO.query(hql, usersid);
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json = JSONArray.fromObject(list, config).toString();
		return json;
	}
	public String getAllGoods(int gid) {
		String hql="from Goods where gid=?";
		List list=hqlDAO.query(hql, gid);
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json=JSONArray.fromObject(list,config).toString();
		return json;
	}

}
