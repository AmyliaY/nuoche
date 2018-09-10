package com.service.weixin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AboutweDAO;
import com.pojo.Aboutwe;

/**
 * 
 * @author 全恒
 * 关于我们
 */
@Service
public class WeixinAboutWeService {

	@Autowired
	private AboutweDAO aboutweDAO;

	/**
	 * 关于我们
	 * @return
	 */
	public String getDesc() {
		List aboutwe = aboutweDAO.findAll();
		if(aboutwe != null && aboutwe.size()>0){
			Aboutwe aboutwe2 = (Aboutwe)aboutwe.get(0);
			return aboutwe2.getAwdesc();
		}
		return null;
	}
}