package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.ProxyCard;

/**
 * A data access object (DAO) providing persistence and search support for
 * ProxyCard entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.ProxyCard
 * @author MyEclipse Persistence Tools
 */
public class ProxyCardDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(ProxyCardDAO.class);
	// property constants
	public static final String PROXY_ID = "proxyId";
	public static final String TAKE_TIME = "takeTime";
	public static final String NUM = "num";
	public static final String FEE = "fee";
	public static final String ADMIN = "admin";

	protected void initDao() {
		// do nothing
	}

	public void save(ProxyCard transientInstance) {
		log.debug("saving ProxyCard instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ProxyCard persistentInstance) {
		log.debug("deleting ProxyCard instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ProxyCard findById(java.lang.Integer id) {
		log.debug("getting ProxyCard instance with id: " + id);
		try {
			ProxyCard instance = (ProxyCard) getHibernateTemplate().get("com.pojo.ProxyCard", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(ProxyCard instance) {
		log.debug("finding ProxyCard instance by example");
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
		log.debug("finding ProxyCard instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from ProxyCard as model where model." + propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByProxyId(Object proxyId) {
		return findByProperty(PROXY_ID, proxyId);
	}

	public List findByTakeTime(Object takeTime) {
		return findByProperty(TAKE_TIME, takeTime);
	}

	public List findByNum(Object num) {
		return findByProperty(NUM, num);
	}

	public List findByFee(Object fee) {
		return findByProperty(FEE, fee);
	}

	public List findByAdmin(Object admin) {
		return findByProperty(ADMIN, admin);
	}

	public List findAll() {
		log.debug("finding all ProxyCard instances");
		try {
			String queryString = "from ProxyCard";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ProxyCard merge(ProxyCard detachedInstance) {
		log.debug("merging ProxyCard instance");
		try {
			ProxyCard result = (ProxyCard) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(ProxyCard instance) {
		log.debug("attaching dirty ProxyCard instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ProxyCard instance) {
		log.debug("attaching clean ProxyCard instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ProxyCardDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ProxyCardDAO) ctx.getBean("ProxyCardDAO");
	}
}