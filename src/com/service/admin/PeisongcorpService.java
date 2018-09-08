package com.service.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.PeisongCorpDAO;
import com.pojo.PeisongCorp;
import com.util.StringUtil;


/**
 * 配送管理Service
 * @author dell
 *
 */


@Service
public class PeisongcorpService {
	
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private PeisongCorpDAO peisongcorpDAO;
	
	
	/**
	 * 遍历所以物流公司信息
	 * @param size
	 * @param page
	 * @param keywords
	 * @return
	 */
	public Map corplisting(int size, int page, String keywords) {
		StringBuffer sb = new StringBuffer(" where 1=1 ");
		List paramList=new ArrayList();
		if(StringUtil.isNotNull(keywords) && keywords.trim().length()>0)
		{
			sb.append(" and (pscchinesename like ? or pscenglishname like ?)");
			paramList.add("%"+keywords+"%");
			paramList.add("%"+keywords+"%");
		}
		String hqlsum="select count(*) from PeisongCorp"+sb.toString();
		int sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
		int count=sum%size==0 ? sum/size: sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		String hql="from PeisongCorp"+sb.toString()+" order by id desc";
		List list=hqlDAO.pageQuery(hql, size, page,paramList.toArray());
		Map map=new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);
		map.put("list", list);
		return map;
	}
	
/**
 * 修改物流公司的状态
 * @param id
 * @return
 */
	public PeisongCorp updatestatus(int id) {
		PeisongCorp corp=peisongcorpDAO.findById(id);
		int status=corp.getPscstatus();
		if(corp!=null)
			corp.setPscstatus((short)(1-status));
			peisongcorpDAO.save(corp);
		return corp;
		
	}
	
	/**
	 * 编辑物流公司信息
	 * @param id
	 * @return
	 */
	
	public PeisongCorp editcorplisting(int id) {
		PeisongCorp  peisongcorp = peisongcorpDAO.findById(id);
		if (peisongcorp != null) {
			peisongcorpDAO.findAll();
			
		}
		return peisongcorp;
	}
	
	/**
	 * 
	 * @param id
	 * @param chinesename
	 * @param englishname
	 * @param pscurl
	 * @param pscdetail
	 */
	public void editcorp(int id,  String chinesename, String englishname, String pscurl, String pscdetail) {
		PeisongCorp corp=peisongcorpDAO.findById(id);
		if(corp!=null)
            corp.setPscchinesename(chinesename);
			corp.setPscenglishname(englishname);
			corp.setPscurl(pscurl);
			corp.setPscdesc(pscdetail);
			peisongcorpDAO.save(corp);
		
	}
	
	
	/**
	 * 新增物流公司
	 * @param chinesename
	 * @param englishname
	 * @param pscstatsu
	 * @param pscurl
	 * @param pscdetail
	 */
	public void addcorp(String chinesename, String englishname, int pscstatsu,
			String pscurl, String pscdetail) {
		PeisongCorp corp=new PeisongCorp();
		corp.setPscchinesename(chinesename);
		corp.setPscenglishname(englishname);
		corp.setPscstatus((short)pscstatsu);
		corp.setPscurl(pscurl);
		corp.setPscdesc(pscdetail);
		peisongcorpDAO.save(corp);
		
	}
}
