package com.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.JiayouZhekou;

/**
 * A data access object (DAO) providing persistence and search support for
 * JiayouZhekou entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.JiayouZhekou
 * @author MyEclipse Persistence Tools
 */

public class JiayouZhekouDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(JiayouZhekouDAO.class);
	// property constants
	public static final String ONAME = "oname";
	public static final String OSTYLE = "ostyle";
	public static final String OPRICE = "oprice";
	public static final String ODETAIL = "odetail";
	public static final String OSTATUS = "ostatus";
	public static final String ZHEKOU = "zhekou";

	protected void initDao() {
		// do nothing
	}

	public void save(JiayouZhekou transientInstance) {
		log.debug("saving JiayouZhekou instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(JiayouZhekou persistentInstance) {
		log.debug("deleting JiayouZhekou instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public JiayouZhekou findById(java.lang.Integer id) {
		log.debug("getting JiayouZhekou instance with id: " + id);
		try {
			JiayouZhekou instance = (JiayouZhekou) getHibernateTemplate().get(
					"com.pojo.JiayouZhekou", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(JiayouZhekou instance) {
		log.debug("finding JiayouZhekou instance by example");
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
		log.debug("finding JiayouZhekou instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from JiayouZhekou as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByOname(Object oname) {
		return findByProperty(ONAME, oname);
	}

	public List findByOstyle(Object ostyle) {
		return findByProperty(OSTYLE, ostyle);
	}

	public List findByOprice(Object oprice) {
		return findByProperty(OPRICE, oprice);
	}

	public List findByOdetail(Object odetail) {
		return findByProperty(ODETAIL, odetail);
	}

	public List findByOstatus(Object ostatus) {
		return findByProperty(OSTATUS, ostatus);
	}

	public List findByZhekou(Object zhekou) {
		return findByProperty(ZHEKOU, zhekou);
	}

	public List findAll() {
		log.debug("finding all JiayouZhekou instances");
		try {
			String queryString = "from JiayouZhekou";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public JiayouZhekou merge(JiayouZhekou detachedInstance) {
		log.debug("merging JiayouZhekou instance");
		try {
			JiayouZhekou result = (JiayouZhekou) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(JiayouZhekou instance) {
		log.debug("attaching dirty JiayouZhekou instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(JiayouZhekou instance) {
		log.debug("attaching clean JiayouZhekou instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static JiayouZhekouDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (JiayouZhekouDAO) ctx.getBean("JiayouZhekouDAO");
	}
}