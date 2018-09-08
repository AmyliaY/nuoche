package com.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.JiayouPrinter;

/**
 * A data access object (DAO) providing persistence and search support for
 * JiayouPrinter entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.JiayouPrinter
 * @author MyEclipse Persistence Tools
 */

public class JiayouPrinterDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(JiayouPrinterDAO.class);
	// property constants
	public static final String GSID = "gsid";
	public static final String PSTATUS = "pstatus";
	public static final String MCODE = "mcode";
	public static final String MSIGN = "msign";
	public static final String PNAME = "pname";
	public static final String PSIGN = "psign";

	protected void initDao() {
		// do nothing
	}

	public void save(JiayouPrinter transientInstance) {
		log.debug("saving JiayouPrinter instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(JiayouPrinter persistentInstance) {
		log.debug("deleting JiayouPrinter instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public JiayouPrinter findById(java.lang.Integer id) {
		log.debug("getting JiayouPrinter instance with id: " + id);
		try {
			JiayouPrinter instance = (JiayouPrinter) getHibernateTemplate()
					.get("com.pojo.JiayouPrinter", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(JiayouPrinter instance) {
		log.debug("finding JiayouPrinter instance by example");
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
		log.debug("finding JiayouPrinter instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from JiayouPrinter as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByGsid(Object gsid) {
		return findByProperty(GSID, gsid);
	}

	public List findByPstatus(Object pstatus) {
		return findByProperty(PSTATUS, pstatus);
	}

	public List findByMcode(Object mcode) {
		return findByProperty(MCODE, mcode);
	}

	public List findByMsign(Object msign) {
		return findByProperty(MSIGN, msign);
	}

	public List findByPname(Object pname) {
		return findByProperty(PNAME, pname);
	}

	public List findByPsign(Object psign) {
		return findByProperty(PSIGN, psign);
	}

	public List findAll() {
		log.debug("finding all JiayouPrinter instances");
		try {
			String queryString = "from JiayouPrinter";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public JiayouPrinter merge(JiayouPrinter detachedInstance) {
		log.debug("merging JiayouPrinter instance");
		try {
			JiayouPrinter result = (JiayouPrinter) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(JiayouPrinter instance) {
		log.debug("attaching dirty JiayouPrinter instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(JiayouPrinter instance) {
		log.debug("attaching clean JiayouPrinter instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static JiayouPrinterDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (JiayouPrinterDAO) ctx.getBean("JiayouPrinterDAO");
	}
}