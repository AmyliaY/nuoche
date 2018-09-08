package com.service.back;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.LunboMusicDAO;
import com.pojo.LunboMusic;
import com.util.StringUtil;

@Service
public class LunboimgMusicService {
	@Autowired
	private LunboMusicDAO lunboimgDAO;
	
	@Autowired
	private HqlDAO hqlDAO;
	public Map lunboimglisting(int size, int page, String keywords) {
		StringBuffer sb=new StringBuffer(" where 1=1 ");
		List paramList=new ArrayList();
		if(StringUtil.isNotNull(keywords) && keywords.trim().length()>0)
		{
			sb.append(" and cimgTitle like ?");
			paramList.add("%"+keywords+"%");
		}
		String hqlsum="select count(*) from LunboMusic"+sb.toString();
		int sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
		int count=sum%size==0 ? sum/size :sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		String hql="from LunboMusic "+sb.toString()+" order by cimgTime desc";
		List list=hqlDAO.pageQuery(hql, size, page,paramList.toArray());
		Map map=new HashMap();
		map.put("size", size);
		map.put("page", page);
		map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}
	public LunboMusic updatestatus(int id) {
		LunboMusic LunboMusic=lunboimgDAO.findById(id);
		int status=LunboMusic.getCimgStatus();
		if(LunboMusic!=null)
			LunboMusic.setCimgStatus(1-status);
			lunboimgDAO.save(LunboMusic);
		return LunboMusic;
	}
	public void plupdatestatus(int type, String qiyong, String jinyong) {
		if(type==1){
			String hql="update LunboMusic set cimgStatus=1 where cimgId in("+qiyong+")";
			hqlDAO.bulkUpdate(hql);
		}else{
			String hql="update LunboMusic set cimgStatus=0 where cimgId in("+jinyong+")";
			hqlDAO.bulkUpdate(hql);
		}
		
	}
	public LunboMusic editlunboimgview(int id) {
		LunboMusic LunboMusic=lunboimgDAO.findById(id);
		if(LunboMusic!=null)
			lunboimgDAO.findAll();
		return LunboMusic;
	}
	public void editlunboimg(int id, int cimtype,String cimgurl, String cimgtitle, String cimages, String cdescribe, Timestamp cimgTime,String desc) {
		LunboMusic lunbo=lunboimgDAO.findById(id);
		if(lunbo!=null)
			lunbo.setCimgTitle(cimgtitle);
			lunbo.setCimages("/admin/images/lunboimg/"+cimages);
			if(cimtype==0){
				lunbo.setCimgType(0);
				lunbo.setCimgDescribe(cdescribe);
				lunbo.setCimgUrl("");
			}
			if(cimtype==1){
				lunbo.setCimgType(1);
				lunbo.setCimgUrl(cimgurl);
				lunbo.setCimgDescribe("");
			}
			if(cimtype==2){
				lunbo.setCimgType(2);
				lunbo.setCimgUrl(desc);
				lunbo.setCimgDescribe("");
			}
			lunbo.setCimgTime(cimgTime);
		lunboimgDAO.save(lunbo);
		
	}
	public void addlunboimg(String cimgtitle, String cimgstatus,
			String cimgtype, String cimages, String cimgurl, String cimgdescribe) {
		LunboMusic lunbo=new LunboMusic();
		lunbo.setCimgTitle(cimgtitle);
		lunbo.setCimgStatus(Integer.parseInt(cimgstatus));
		lunbo.setCimgType(Integer.parseInt(cimgtype));
		lunbo.setCimages("/admin/images/lunboimg/"+cimages);
		lunbo.setCimgUrl(cimgurl);
		lunbo.setCimgDescribe(cimgdescribe);
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString=sdf.format(date);
		Timestamp cimgTime=Timestamp.valueOf(dateString);
		lunbo.setCimgTime(cimgTime);
		lunboimgDAO.save(lunbo);
		
	}
	public boolean deletelunbo(int id) {
		LunboMusic lunbo=lunboimgDAO.findById(id);
		if(lunbo!=null){
			lunboimgDAO.delete(lunbo);
			return true;
		}
		return false;
		
	}
	public void pldelete(String shanchu) {
		String hql="delete from LunboMusic where cimgId in("+shanchu+")";
		hqlDAO.bulkUpdate(hql);
		
	}

}
