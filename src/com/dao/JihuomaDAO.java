package com.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Jihuoma;

/**
 * A data access object (DAO) providing persistence and search support for
 * Jihuoma entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.Jihuoma
 * @author MyEclipse Persistence Tools
 */
public class JihuomaDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(JihuomaDAO.class);
	// property constants
	public static final String MESSAGE = "message";
	public static final String PHONE = "phone";

	protected void initDao() {
		// do nothing
	}

	public void save(Jihuoma transientInstance) {
		log.debug("saving Jihuoma instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Jihuoma persistentInstance) {
		log.debug("deleting Jihuoma instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Jihuoma findById(java.lang.Integer id) {
		log.debug("getting Jihuoma instance with id: " + id);
		try {
			Jihuoma instance = (Jihuoma) getHibernateTemplate().get(
					"com.pojo.Jihuoma", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Jihuoma instance) {
		log.debug("finding Jihuoma instance by example");
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
		log.debug("finding Jihuoma instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Jihuoma as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMessage(Object message) {
		return findByProperty(MESSAGE, message);
	}

	public List findByPhone(Object phone) {
		return findByProperty(PHONE, phone);
	}

	public List findAll() {
		log.debug("finding all Jihuoma instances");
		try {
			String queryString = "from Jihuoma";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Jihuoma merge(Jihuoma detachedInstance) {
		log.debug("merging Jihuoma instance");
		try {
			Jihuoma result = (Jihuoma) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Jihuoma instance) {
		log.debug("attaching dirty Jihuoma instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Jihuoma instance) {
		log.debug("attaching clean Jihuoma instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static JihuomaDAO getFromApplicationContext(ApplicationContext ctx) {
		return (JihuomaDAO) ctx.getBean("JihuomaDAO");
	}
}