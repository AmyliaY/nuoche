package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Top;

/**
 * A data access object (DAO) providing persistence and search support for Top
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.pojo.Top
 * @author MyEclipse Persistence Tools
 */
public class TopDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(TopDAO.class);
	// property constants
	public static final String DAYS = "days";
	public static final String DANJIA = "danjia";
	public static final String TOTALPRICE = "totalprice";

	protected void initDao() {
		// do nothing
	}

	public void save(Top transientInstance) {
		log.debug("saving Top instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Top persistentInstance) {
		log.debug("deleting Top instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Top findById(java.lang.Integer id) {
		log.debug("getting Top instance with id: " + id);
		try {
			Top instance = (Top) getHibernateTemplate().get("com.pojo.Top", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Top instance) {
		log.debug("finding Top instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Top instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from Top as model where model." + propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByDays(Object days) {
		return findByProperty(DAYS, days);
	}

	public List findByDanjia(Object danjia) {
		return findByProperty(DANJIA, danjia);
	}

	public List findByTotalprice(Object totalprice) {
		return findByProperty(TOTALPRICE, totalprice);
	}

	public List findAll() {
		log.debug("finding all Top instances");
		try {
			String queryString = "from Top";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Top merge(Top detachedInstance) {
		log.debug("merging Top instance");
		try {
			Top result = (Top) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Top instance) {
		log.debug("attaching dirty Top instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Top instance) {
		log.debug("attaching clean Top instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TopDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TopDAO) ctx.getBean("TopDAO");
	}
}