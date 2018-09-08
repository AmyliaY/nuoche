package com.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Paypresent;

/**
 * A data access object (DAO) providing persistence and search support for
 * Paypresent entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.Paypresent
 * @author MyEclipse Persistence Tools
 */
public class PaypresentDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(PaypresentDAO.class);
	// property constants
	public static final String PP_MIN = "ppMin";
	public static final String PP_MAX = "ppMax";
	public static final String PP_PRESENT = "ppPresent";
	public static final String PP_STATUS = "ppStatus";

	protected void initDao() {
		// do nothing
	}

	public void save(Paypresent transientInstance) {
		log.debug("saving Paypresent instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Paypresent persistentInstance) {
		log.debug("deleting Paypresent instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Paypresent findById(java.lang.Integer id) {
		log.debug("getting Paypresent instance with id: " + id);
		try {
			Paypresent instance = (Paypresent) getHibernateTemplate().get(
					"com.pojo.Paypresent", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Paypresent instance) {
		log.debug("finding Paypresent instance by example");
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
		log.debug("finding Paypresent instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Paypresent as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByPpMin(Object ppMin) {
		return findByProperty(PP_MIN, ppMin);
	}

	public List findByPpMax(Object ppMax) {
		return findByProperty(PP_MAX, ppMax);
	}

	public List findByPpPresent(Object ppPresent) {
		return findByProperty(PP_PRESENT, ppPresent);
	}

	public List findByPpStatus(Object ppStatus) {
		return findByProperty(PP_STATUS, ppStatus);
	}

	public List findAll() {
		log.debug("finding all Paypresent instances");
		try {
			String queryString = "from Paypresent";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Paypresent merge(Paypresent detachedInstance) {
		log.debug("merging Paypresent instance");
		try {
			Paypresent result = (Paypresent) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Paypresent instance) {
		log.debug("attaching dirty Paypresent instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Paypresent instance) {
		log.debug("attaching clean Paypresent instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static PaypresentDAO getFromApplicationContext(ApplicationContext ctx) {
		return (PaypresentDAO) ctx.getBean("PaypresentDAO");
	}
}