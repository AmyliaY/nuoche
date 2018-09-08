package com.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.MSongs;

/**
 * A data access object (DAO) providing persistence and search support for
 * MSongs entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.MSongs
 * @author MyEclipse Persistence Tools
 */

public class MSongsDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(MSongsDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String FILENAME = "filename";
	public static final String STATUS = "status";

	protected void initDao() {
		// do nothing
	}

	public void save(MSongs transientInstance) {
		log.debug("saving MSongs instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void delete(MSongs persistentInstance) {
		log.debug("deleting MSongs instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public MSongs findById(java.lang.Integer id) {
		log.debug("getting MSongs instance with id: " + id);
		try {
			MSongs instance = (MSongs) getHibernateTemplate().get(
					"com.pojo.MSongs", id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findByExample(MSongs instance) {
		log.debug("finding MSongs instance by example");
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
		log.debug("finding MSongs instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from MSongs as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByFilename(Object filename) {
		return findByProperty(FILENAME, filename);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findAll() {
		log.debug("finding all MSongs instances");
		try {
			String queryString = "from MSongs";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public MSongs merge(MSongs detachedInstance) {
		log.debug("merging MSongs instance");
		try {
			MSongs result = (MSongs) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void attachDirty(MSongs instance) {
		log.debug("attaching dirty MSongs instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void attachClean(MSongs instance) {
		log.debug("attaching clean MSongs instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public static MSongsDAO getFromApplicationContext(ApplicationContext ctx) {
		return (MSongsDAO) ctx.getBean("MSongsDAO");
	}
}