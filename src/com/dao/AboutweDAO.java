package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Aboutwe;

/**
 * A data access object (DAO) providing persistence and search support for
 * Aboutwe entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.Aboutwe
 * @author MyEclipse Persistence Tools
 */
public class AboutweDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(AboutweDAO.class);
	// property constants
	public static final String AWDESC = "awdesc";

	protected void initDao() {
		// do nothing
	}

	public void save(Aboutwe transientInstance) {
		log.debug("saving Aboutwe instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Aboutwe persistentInstance) {
		log.debug("deleting Aboutwe instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Aboutwe findById(java.lang.Integer id) {
		log.debug("getting Aboutwe instance with id: " + id);
		try {
			Aboutwe instance = (Aboutwe) getHibernateTemplate().get("com.pojo.Aboutwe", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Aboutwe instance) {
		log.debug("finding Aboutwe instance by example");
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
		log.debug("finding Aboutwe instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from Aboutwe as model where model." + propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByAwdesc(Object awdesc) {
		return findByProperty(AWDESC, awdesc);
	}

	public List findAll() {
		log.debug("finding all Aboutwe instances");
		try {
			String queryString = "from Aboutwe";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Aboutwe merge(Aboutwe detachedInstance) {
		log.debug("merging Aboutwe instance");
		try {
			Aboutwe result = (Aboutwe) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Aboutwe instance) {
		log.debug("attaching dirty Aboutwe instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Aboutwe instance) {
		log.debug("attaching clean Aboutwe instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static AboutweDAO getFromApplicationContext(ApplicationContext ctx) {
		return (AboutweDAO) ctx.getBean("AboutweDAO");
	}
}