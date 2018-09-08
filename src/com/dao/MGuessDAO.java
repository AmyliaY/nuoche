package com.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.MGuess;

/**
 * A data access object (DAO) providing persistence and search support for
 * MGuess entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.MGuess
 * @author MyEclipse Persistence Tools
 */

public class MGuessDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(MGuessDAO.class);
	// property constants
	public static final String LAST_STATUS = "lastStatus";

	protected void initDao() {
		// do nothing
	}

	public void save(MGuess transientInstance) {
		log.debug("saving MGuess instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void delete(MGuess persistentInstance) {
		log.debug("deleting MGuess instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public MGuess findById(java.lang.Integer id) {
		log.debug("getting MGuess instance with id: " + id);
		try {
			MGuess instance = (MGuess) getHibernateTemplate().get(
					"com.pojo.MGuess", id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findByExample(MGuess instance) {
		log.debug("finding MGuess instance by example");
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
		log.debug("finding MGuess instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from MGuess as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findByLastStatus(Object lastStatus) {
		return findByProperty(LAST_STATUS, lastStatus);
	}

	public List findAll() {
		log.debug("finding all MGuess instances");
		try {
			String queryString = "from MGuess";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public MGuess merge(MGuess detachedInstance) {
		log.debug("merging MGuess instance");
		try {
			MGuess result = (MGuess) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void attachDirty(MGuess instance) {
		log.debug("attaching dirty MGuess instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void attachClean(MGuess instance) {
		log.debug("attaching clean MGuess instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public static MGuessDAO getFromApplicationContext(ApplicationContext ctx) {
		return (MGuessDAO) ctx.getBean("MGuessDAO");
	}
}