package com.dao;

import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Zitiaddress;

/**
 * A data access object (DAO) providing persistence and search support for
 * Zitiaddress entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.Zitiaddress
 * @author MyEclipse Persistence Tools
 */

public class ZitiaddressDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(ZitiaddressDAO.class);
	// property constants
	public static final String ZITI_TEXT = "zitiText";
	public static final String ZITI_NAME = "zitiName";
	public static final String ZITI_PHONE = "zitiPhone";
	public static final String ZITI_STATUS = "zitiStatus";

	protected void initDao() {
		// do nothing
	}

	public void save(Zitiaddress transientInstance) {
		log.debug("saving Zitiaddress instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Zitiaddress persistentInstance) {
		log.debug("deleting Zitiaddress instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Zitiaddress findById(java.lang.Integer id) {
		log.debug("getting Zitiaddress instance with id: " + id);
		try {
			Zitiaddress instance = (Zitiaddress) getHibernateTemplate().get(
					"com.pojo.Zitiaddress", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Zitiaddress instance) {
		log.debug("finding Zitiaddress instance by example");
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
		log.debug("finding Zitiaddress instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Zitiaddress as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByZitiText(Object zitiText) {
		return findByProperty(ZITI_TEXT, zitiText);
	}

	public List findByZitiName(Object zitiName) {
		return findByProperty(ZITI_NAME, zitiName);
	}

	public List findByZitiPhone(Object zitiPhone) {
		return findByProperty(ZITI_PHONE, zitiPhone);
	}

	public List findByZitiStatus(Object zitiStatus) {
		return findByProperty(ZITI_STATUS, zitiStatus);
	}

	public List findAll() {
		log.debug("finding all Zitiaddress instances");
		try {
			String queryString = "from Zitiaddress";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Zitiaddress merge(Zitiaddress detachedInstance) {
		log.debug("merging Zitiaddress instance");
		try {
			Zitiaddress result = (Zitiaddress) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Zitiaddress instance) {
		log.debug("attaching dirty Zitiaddress instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Zitiaddress instance) {
		log.debug("attaching clean Zitiaddress instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ZitiaddressDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (ZitiaddressDAO) ctx.getBean("ZitiaddressDAO");
	}
}