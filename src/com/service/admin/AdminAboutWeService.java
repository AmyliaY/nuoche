package com.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AboutweDAO;
import com.pojo.Aboutwe;

/**
 * 
 * @author 全恒
 *
 */

@Service
public class AdminAboutWeService {

	@Autowired
	private AboutweDAO aboutweDAO;
	
	
	public String getDesc() {
		List<Aboutwe> desc = aboutweDAO.findAll();
		
		if(desc!= null && desc.size()>0){
			return desc.get(0).getAwdesc();
		}
		return null;
	}

	public boolean edit(String desc) {
		List aboutwe = aboutweDAO.findAll();
		if(aboutwe != null && aboutwe.size()>0){
			Aboutwe aboutwe2 = (Aboutwe)aboutwe.get(0);
			aboutwe2.setAwdesc(desc);
			aboutweDAO.save(aboutwe2);
			return true;
		}else{
			Aboutwe aboutwe3 = new Aboutwe();
			aboutwe3.setAwdesc(desc);
			aboutweDAO.save(aboutwe3);
			return true;
		}
	}

}
