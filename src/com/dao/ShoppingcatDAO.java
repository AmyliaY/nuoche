package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Shoppingcat;

/**
 * A data access object (DAO) providing persistence and search support for
 * Shoppingcat entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.Shoppingcat
 * @author MyEclipse Persistence Tools
 */

public class ShoppingcatDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(ShoppingcatDAO.class);
	// property constants
	public static final String SCAT_NUM = "scatNum";

	protected void initDao() {
		// do nothing
	}

	public void save(Shoppingcat transientInstance) {
		log.debug("saving Shoppingcat instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Shoppingcat persistentInstance) {
		log.debug("deleting Shoppingcat instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Shoppingcat findById(java.lang.Integer id) {
		log.debug("getting Shoppingcat instance with id: " + id);
		try {
			Shoppingcat instance = (Shoppingcat) getHibernateTemplate().get(
					"com.pojo.Shoppingcat", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Shoppingcat instance) {
		log.debug("finding Shoppingcat instance by example");
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
		log.debug("finding Shoppingcat instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Shoppingcat as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByScatNum(Object scatNum) {
		return findByProperty(SCAT_NUM, scatNum);
	}

	public List findAll() {
		log.debug("finding all Shoppingcat instances");
		try {
			String queryString = "from Shoppingcat";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Shoppingcat merge(Shoppingcat detachedInstance) {
		log.debug("merging Shoppingcat instance");
		try {
			Shoppingcat result = (Shoppingcat) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Shoppingcat instance) {
		log.debug("attaching dirty Shoppingcat instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Shoppingcat instance) {
		log.debug("attaching clean Shoppingcat instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ShoppingcatDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (ShoppingcatDAO) ctx.getBean("ShoppingcatDAO");
	}
}