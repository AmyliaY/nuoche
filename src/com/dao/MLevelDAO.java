package com.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.MLevel;

/**
 * A data access object (DAO) providing persistence and search support for
 * MLevel entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.MLevel
 * @author MyEclipse Persistence Tools
 */

public class MLevelDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(MLevelDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String ZHEKOU = "zhekou";
	public static final String STATUS = "status";

	protected void initDao() {
		// do nothing
	}

	public void save(MLevel transientInstance) {
		log.debug("saving MLevel instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void delete(MLevel persistentInstance) {
		log.debug("deleting MLevel instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public MLevel findById(java.lang.Integer id) {
		log.debug("getting MLevel instance with id: " + id);
		try {
			MLevel instance = (MLevel) getHibernateTemplate().get(
					"com.pojo.MLevel", id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findByExample(MLevel instance) {
		log.debug("finding MLevel instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding MLevel instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from MLevel as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByZhekou(Object zhekou) {
		return findByProperty(ZHEKOU, zhekou);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findAll() {
		log.debug("finding all MLevel instances");
		try {
			String queryString = "from MLevel";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public MLevel merge(MLevel detachedInstance) {
		log.debug("merging MLevel instance");
		try {
			MLevel result = (MLevel) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void attachDirty(MLevel instance) {
		log.debug("attaching dirty MLevel instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void attachClean(MLevel instance) {
		log.debug("attaching clean MLevel instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public static MLevelDAO getFromApplicationContext(ApplicationContext ctx) {
		return (MLevelDAO) ctx.getBean("MLevelDAO");
	}
}