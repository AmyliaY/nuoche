package com.service.back;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.GoodsDAO;
import com.dao.HqlDAO;
import com.pojo.Goods;
import com.util.StringUtil;

@Service
public class GoodsXiajiaService {
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private GoodsDAO goodsDAO;
	public Map xjgoodslisting(int size, int page, String gttid, String minprice, String maxprice, String keywords) {
		StringBuffer sb=new StringBuffer(" where 1=1 ");
		List paramList=new ArrayList();
		if(StringUtil.isNotNull(gttid) && gttid.trim().length()>0)
		{
			sb.append(" and goodstwotype.gttId=?");
			paramList.add(Integer.parseInt(gttid));
		}
		if(StringUtil.isNotNull(minprice) && minprice.trim().length()>0)
		{
			sb.append(" and gprice>=?");
			paramList.add(Double.parseDouble(minprice));
		}
		if(StringUtil.isNotNull(maxprice) && maxprice.trim().length()>0)
		{
			sb.append(" and gprice<=?");
			paramList.add(Double.parseDouble(maxprice));
		}
		if(StringUtil.isNotNull(keywords) && keywords.trim().length()>0)
		{
			sb.append(" and gname like ?");
			paramList.add("%"+keywords+"%");
		}
		String hqlsum="select count(*) from Goods "+sb.toString()+" and gstatus=0";
		int sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
		int count=sum%size==0 ? sum/size :sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		String hql="from Goods "+sb.toString()+" and gstatus=0 order by gid ";
		List list=hqlDAO.pageQuery(hql, size, page, paramList.toArray());
		Map map=new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("list", list);
		map.put("sum", sum);
		map.put("count", count);
		return map;
	}
	public Goods xiugaistatus(int id) {
		Goods goods=goodsDAO.findById(id);
		if(goods!=null)
			goods.setGstatus(1);
			goodsDAO.save(goods);
		return goods;
	}
	
	public void delteGoods(int id){
		Goods goods=goodsDAO.findById(id);
		System.out.println(goods.getGname());
		goodsDAO.delete(goods);
	}
	public void plxiajiagoods(String shangjia) {
		String hql="update Goods set gstatus=1 where gid in("+shangjia+")";
		hqlDAO.bulkUpdate(hql);
		
	}
	public List getAllTwotypegoods() {
		String hql="from Goodstwotype gt , Goods go where gt.gttId=go.goodstwotype.gttId and go.gstatus=? group by gt.gttId";
		List list=hqlDAO.query(hql, 0);
		if(list.size()>0)
			return list;
		return null;
	}

}
