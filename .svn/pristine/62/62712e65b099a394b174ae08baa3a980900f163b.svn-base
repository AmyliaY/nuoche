package com.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.JiayouStationYuer;

/**
 * A data access object (DAO) providing persistence and search support for
 * JiayouStationYuer entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.JiayouStationYuer
 * @author MyEclipse Persistence Tools
 */

public class JiayouStationYuerDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(JiayouStationYuerDAO.class);
	// property constants
	public static final String MONEY = "money";

	protected void initDao() {
		// do nothing
	}

	public void save(JiayouStationYuer transientInstance) {
		log.debug("saving JiayouStationYuer instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(JiayouStationYuer persistentInstance) {
		log.debug("deleting JiayouStationYuer instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public JiayouStationYuer findById(java.lang.Integer id) {
		log.debug("getting JiayouStationYuer instance with id: " + id);
		try {
			JiayouStationYuer instance = (JiayouStationYuer) getHibernateTemplate()
					.get("com.pojo.JiayouStationYuer", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(JiayouStationYuer instance) {
		log.debug("finding JiayouStationYuer instance by example");
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
		log.debug("finding JiayouStationYuer instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from JiayouStationYuer as model where model."
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

	public List findAll() {
		log.debug("finding all JiayouStationYuer instances");
		try {
			String queryString = "from JiayouStationYuer";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public JiayouStationYuer merge(JiayouStationYuer detachedInstance) {
		log.debug("merging JiayouStationYuer instance");
		try {
			JiayouStationYuer result = (JiayouStationYuer) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(JiayouStationYuer instance) {
		log.debug("attaching dirty JiayouStationYuer instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(JiayouStationYuer instance) {
		log.debug("attaching clean JiayouStationYuer instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static JiayouStationYuerDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (JiayouStationYuerDAO) ctx.getBean("JiayouStationYuerDAO");
	}
}