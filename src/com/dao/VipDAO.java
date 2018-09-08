package com.dao;

import java.util.List;
import java.util.Set;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Vip;



/**
 * A data access object (DAO) providing persistence and search support for User
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.pojo.User
 * @author MyEclipse Persistence Tools
 */
public class VipDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(VipDAO.class);
	// property constants


	protected void initDao() {
		// do nothing
	}

	public void save(Vip transientInstance) {
		log.debug("saving Vip instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	

	public Vip findById(java.lang.Integer id) {
		log.debug("getting User instance with id: " + id);
		try {
			Vip instance = (Vip) getHibernateTemplate().get("com.pojo.Vip",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}


}