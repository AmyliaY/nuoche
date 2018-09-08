package com.service.daili;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.ProxyDAO;
import com.pojo.Proxy;

@Service
public class JCCSService {

	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private ProxyDAO proxyDAO;
	public void updatevipprice(int proxyid, String vipprice) {
		Proxy proxy = proxyDAO.findById(proxyid);
		proxy.setVipprice(vipprice);
		proxyDAO.save(proxy);
	}
	public void updatezidailiprice(int proxyid, String zidailiprice) {
		Proxy proxy = proxyDAO.findById(proxyid);
		proxy.setZidailiprice(zidailiprice);
		proxyDAO.save(proxy);
		
	}
}
