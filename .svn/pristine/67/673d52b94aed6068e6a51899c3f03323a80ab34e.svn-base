package com.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.JiayouYouhuijuan;

/**
 * A data access object (DAO) providing persistence and search support for
 * JiayouYouhuijuan entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.JiayouYouhuijuan
 * @author MyEclipse Persistence Tools
 */

public class JiayouYouhuijuanDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(JiayouYouhuijuanDAO.class);
	// property constants
	public static final String MONEY = "money";
	public static final String YOUMONEY = "youmoney";

	protected void initDao() {
		// do nothing
	}

	public void save(JiayouYouhuijuan transientInstance) {
		log.debug("saving JiayouYouhuijuan instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(JiayouYouhuijuan persistentInstance) {
		log.debug("deleting JiayouYouhuijuan instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public JiayouYouhuijuan findById(java.lang.Integer id) {
		log.debug("getting JiayouYouhuijuan instance with id: " + id);
		try {
			JiayouYouhuijuan instance = (JiayouYouhuijuan) getHibernateTemplate()
					.get("com.pojo.JiayouYouhuijuan", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(JiayouYouhuijuan instance) {
		log.debug("finding JiayouYouhuijuan instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding JiayouYouhuijuan instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from JiayouYouhuijuan as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMoney(Object money) {
		return findByProperty(MONEY, money);
	}

	public List findByYoumoney(Object youmoney) {
		return findByProperty(YOUMONEY, youmoney);
	}

	public List findAll() {
		log.debug("finding all JiayouYouhuijuan instances");
		try {
			String queryString = "from JiayouYouhuijuan";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public JiayouYouhuijuan merge(JiayouYouhuijuan detachedInstance) {
		log.debug("merging JiayouYouhuijuan instance");
		try {
			JiayouYouhuijuan result = (JiayouYouhuijuan) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(JiayouYouhuijuan instance) {
		log.debug("attaching dirty JiayouYouhuijuan instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(JiayouYouhuijuan instance) {
		log.debug("attaching clean JiayouYouhuijuan instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static JiayouYouhuijuanDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (JiayouYouhuijuanDAO) ctx.getBean("JiayouYouhuijuanDAO");
	}
}