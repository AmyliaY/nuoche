package com.service.daili;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.dao.BusinessDAO;
import com.dao.HqlDAO;
import com.dao.ServiceDAO;
import com.dao.SylbImagesDAO;
import com.pojo.Business;
import com.pojo.Proxychongzhi;
import com.pojo.Service;
import com.pojo.SylbImages;
import com.pojo.SylbImages;
import com.util.JsonFilter;
import com.util.StringUtil;

import net.sf.json.JsonConfig;

/**
 * @author 全恒
 */

@org.springframework.stereotype.Service
public class DailiZhidingjiluService {

	@Autowired
	private HqlDAO hqlDAO;

	
	//得到某个代理的所有置顶记录
		public Map dailizhidingjilu(int id,int size, int page){
			StringBuffer sb=new StringBuffer(" where 1=1");
			List paramList=new ArrayList();
			String hqlsum="select count(*) from Top where proxy.id = "+id;
			int sum=(int) hqlDAO.unique(hqlsum,paramList.toArray());
			int count=sum%size==0 ? sum/size :sum/size+1;
			if(page<1) page=1;
			if(page>count) page=count;
			String hql="from Top where proxy.id ="+id+" order by created desc";
			List list=hqlDAO.pageQuery(hql, size, page,paramList.toArray());
			Map map=new HashMap();
			map.put("size", size);
			map.put("page", page);
			map.put("count", count);
			map.put("sum", sum);
			map.put("list", list);
			return map;
		}
	
	
	
}
