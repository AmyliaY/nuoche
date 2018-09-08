package com.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.JiayouJilu;

/**
 * A data access object (DAO) providing persistence and search support for
 * JiayouJilu entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.JiayouJilu
 * @author MyEclipse Persistence Tools
 */

public class JiayouJiluDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(JiayouJiluDAO.class);
	// property constants
	public static final String PRICE = "price";
	public static final String ZHEKOU = "zhekou";
	public static final String YINFU = "yinfu";
	public static final String SHIFU = "shifu";
	public static final String YUER = "yuer";

	protected void initDao() {
		// do nothing
	}

	public void save(JiayouJilu transientInstance) {
		log.debug("saving JiayouJilu instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(JiayouJilu persistentInstance) {
		log.debug("deleting JiayouJilu instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public JiayouJilu findById(java.lang.Integer id) {
		log.debug("getting JiayouJilu instance with id: " + id);
		try {
			JiayouJilu instance = (JiayouJilu) getHibernateTemplate().get(
					"com.pojo.JiayouJilu", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(JiayouJilu instance) {
		log.debug("finding JiayouJilu instance by example");
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
		log.debug("finding JiayouJilu instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from JiayouJilu as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByPrice(Object price) {
		return findByProperty(PRICE, price);
	}

	public List findByZhekou(Object zhekou) {
		return findByProperty(ZHEKOU, zhekou);
	}

	public List findByYinfu(Object yinfu) {
		return findByProperty(YINFU, yinfu);
	}

	public List findByShifu(Object shifu) {
		return findByProperty(SHIFU, shifu);
	}

	public List findByYuer(Object yuer) {
		return findByProperty(YUER, yuer);
	}

	public List findAll() {
		log.debug("finding all JiayouJilu instances");
		try {
			String queryString = "from JiayouJilu";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public JiayouJilu merge(JiayouJilu detachedInstance) {
		log.debug("merging JiayouJilu instance");
		try {
			JiayouJilu result = (JiayouJilu) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(JiayouJilu instance) {
		log.debug("attaching dirty JiayouJilu instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(JiayouJilu instance) {
		log.debug("attaching clean JiayouJilu instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static JiayouJiluDAO getFromApplicationContext(ApplicationContext ctx) {
		return (JiayouJiluDAO) ctx.getBean("JiayouJiluDAO");
	}
}