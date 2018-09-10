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
import com.pojo.User;
import com.pojo.SylbImages;
import com.util.JsonFilter;
import com.util.StringUtil;

import net.sf.json.JsonConfig;

/**
 * @author 全恒
 */

@org.springframework.stereotype.Service
public class DailiHuiyuanxufeijiluService {

	@Autowired
	private HqlDAO hqlDAO;

	
	//得到某个代理下所有会员续费记录
	public Map huiyuanxufeijilu(int id,int size, int page){
		
			//得到代理下的所有用户
			String hql1="from User where proxy.id ="+id;
			List userlist=hqlDAO.query(hql1);
			User user = new User();
			StringBuffer sb = new StringBuffer();
			if(userlist.size()>0){
				sb.append("(");
				for (int i = 0; i < userlist.size(); i++) {
					user = (User) userlist.get(i);
					sb.append(user.getId()+",");
				}
				sb.deleteCharAt(sb.length()-1);
				sb.append(")");
				
				
				System.out.println(sb);
				
				String hqlsum="select count(*) from Userxufei where user.id in "+sb+" and status = 1";
				int sum=(int) hqlDAO.unique(hqlsum);
				int count=sum%size==0 ? sum/size :sum/size+1;
				if(page<1) page=1;
				if(page>count) page=count;
				String hql="from Userxufei where user.id in "+sb+" and status = 1 order by time desc";
				List list=hqlDAO.pageQuery(hql, size, page);
				Map map=new HashMap();
				map.put("size", size);
				map.put("page", page);
				map.put("count", count);
				map.put("sum", sum);
				map.put("list", list);
				return map;
			}
			
			return null;
		}
	
	
	
}
