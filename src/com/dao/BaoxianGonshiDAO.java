package com.dao;

import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.BaoxianGonshi;

/**
 * A data access object (DAO) providing persistence and search support for
 * BaoxianGonshi entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.BaoxianGonshi
 * @author MyEclipse Persistence Tools
 */

public class BaoxianGonshiDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(BaoxianGonshiDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String LOGO = "logo";
	public static final String STATUS = "status";

	protected void initDao() {
		// do nothing
	}

	public void save(BaoxianGonshi transientInstance) {
		log.debug("saving BaoxianGonshi instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(BaoxianGonshi persistentInstance) {
		log.debug("deleting BaoxianGonshi instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public BaoxianGonshi findById(java.lang.Integer id) {
		log.debug("getting BaoxianGonshi instance with id: " + id);
		try {
			BaoxianGonshi instance = (BaoxianGonshi) getHibernateTemplate()
					.get("com.pojo.BaoxianGonshi", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(BaoxianGonshi instance) {
		log.debug("finding BaoxianGonshi instance by example");
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
		log.debug("finding BaoxianGonshi instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from BaoxianGonshi as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByName(Object name) {
		return findByProperty(NAME, name);
	}

	public List findByLogo(Object logo) {
		return findByProperty(LOGO, logo);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findAll() {
		log.debug("finding all BaoxianGonshi instances");
		try {
			String queryString = "from BaoxianGonshi";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public BaoxianGonshi merge(BaoxianGonshi detachedInstance) {
		log.debug("merging BaoxianGonshi instance");
		try {
			BaoxianGonshi result = (BaoxianGonshi) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(BaoxianGonshi instance) {
		log.debug("attaching dirty BaoxianGonshi instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(BaoxianGonshi instance) {
		log.debug("attaching clean BaoxianGonshi instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BaoxianGonshiDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (BaoxianGonshiDAO) ctx.getBean("BaoxianGonshiDAO");
	}
}