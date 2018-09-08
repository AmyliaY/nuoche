package com.service.back;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.util.StringUtil;

@Service
public class GoodsZiyingService {
	
	@Autowired
	private HqlDAO hqlDAO;
	

	public Map zygoodsview(int size, int page,String gttid, String keywords,
			String minprice, String maxprice, String gstate) {
		StringBuffer sb = new StringBuffer(" where 1=1 ");
		List paramList = new ArrayList();
		if (StringUtil.isNotNull(gttid) && gttid.trim().length() > 0) {
			sb.append(" and goodstwotype.gttId=?");
			paramList.add(Integer.parseInt(gttid));
		}
		if (StringUtil.isNotNull(gstate) && gstate.trim().length() > 0) {
			sb.append(" and gstatus = ?");
			paramList.add(Integer.parseInt(gstate));
		}
		if (StringUtil.isNotNull(keywords) && keywords.trim().length() > 0) {
			sb.append(" and gname like ?");
			paramList.add("%" + keywords + "%");
		}
		if (StringUtil.isNotNull(minprice) && minprice.trim().length() > 0) {
			sb.append(" and gprice>=?");
			paramList.add(Double.parseDouble(minprice));
		}
		if (StringUtil.isNotNull(maxprice) && maxprice.trim().length() > 0) {
			sb.append(" and gprice<=?");
			paramList.add(Double.parseDouble(maxprice));
		}

		String hqlsum = "select count(*) from Goods" + sb.toString()+ " and gziying=1";
		int sum = (int) hqlDAO.unique(hqlsum, paramList.toArray());
		int count = sum % size == 0 ? sum / size : sum / size + 1;
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;
		String hql = "from Goods" + sb.toString()
				+ " and gziying=1 order by gid desc";
		List list = hqlDAO.pageQuery(hql, size, page, paramList.toArray());
		Map map = new HashMap();
		map.put("page", page);
		map.put("gstate", gstate);
		map.put("size", size);
		map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		map.put("keywords", keywords);
		return map;
	}


	public List getzyTwotypegoods() {
		String hql = "from Goodstwotype gt,Goods go where gt.gttId=go.goodstwotype.gttId and go.gstatus=? group by gt.gttId";
		List list = hqlDAO.query(hql, 1);
		if (list.size() > 0)
			return list;
		return null;
	}

	


}
