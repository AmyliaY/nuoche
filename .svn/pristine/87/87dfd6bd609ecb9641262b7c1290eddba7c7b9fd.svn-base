package com.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.JiayouReturnYou;

/**
 * A data access object (DAO) providing persistence and search support for
 * JiayouReturnYou entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.JiayouReturnYou
 * @author MyEclipse Persistence Tools
 */

public class JiayouReturnYouDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(JiayouReturnYouDAO.class);
	// property constants
	public static final String GID = "gid";
	public static final String QIYOU = "qiyou";
	public static final String CHAIYOU = "chaiyou";
	public static final String STATUS = "status";

	protected void initDao() {
		// do nothing
	}

	public void save(JiayouReturnYou transientInstance) {
		log.debug("saving JiayouReturnYou instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(JiayouReturnYou persistentInstance) {
		log.debug("deleting JiayouReturnYou instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public JiayouReturnYou findById(java.lang.Integer id) {
		log.debug("getting JiayouReturnYou instance with id: " + id);
		try {
			JiayouReturnYou instance = (JiayouReturnYou) getHibernateTemplate()
					.get("com.pojo.JiayouReturnYou", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(JiayouReturnYou instance) {
		log.debug("finding JiayouReturnYou instance by example");
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
		log.debug("finding JiayouReturnYou instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from JiayouReturnYou as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByGid(Object gid) {
		return findByProperty(GID, gid);
	}

	public List findByQiyou(Object qiyou) {
		return findByProperty(QIYOU, qiyou);
	}

	public List findByChaiyou(Object chaiyou) {
		return findByProperty(CHAIYOU, chaiyou);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findAll() {
		log.debug("finding all JiayouReturnYou instances");
		try {
			String queryString = "from JiayouReturnYou";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public JiayouReturnYou merge(JiayouReturnYou detachedInstance) {
		log.debug("merging JiayouReturnYou instance");
		try {
			JiayouReturnYou result = (JiayouReturnYou) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(JiayouReturnYou instance) {
		log.debug("attaching dirty JiayouReturnYou instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(JiayouReturnYou instance) {
		log.debug("attaching clean JiayouReturnYou instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static JiayouReturnYouDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (JiayouReturnYouDAO) ctx.getBean("JiayouReturnYouDAO");
	}
}