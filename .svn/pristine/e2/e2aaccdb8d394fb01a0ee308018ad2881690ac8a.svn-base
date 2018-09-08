package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.BaoxianBaodanGonshi;

/**
 * A data access object (DAO) providing persistence and search support for
 * BaoxianBaodanGonshi entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.BaoxianBaodanGonshi
 * @author MyEclipse Persistence Tools
 */

public class BaoxianBaodanGonshiDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(BaoxianBaodanGonshiDAO.class);
	// property constants
	public static final String MONEY = "money";
	public static final String STATUS = "status";

	protected void initDao() {
		// do nothing
	}

	public void save(BaoxianBaodanGonshi transientInstance) {
		log.debug("saving BaoxianBaodanGonshi instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(BaoxianBaodanGonshi persistentInstance) {
		log.debug("deleting BaoxianBaodanGonshi instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public BaoxianBaodanGonshi findById(java.lang.Integer id) {
		log.debug("getting BaoxianBaodanGonshi instance with id: " + id);
		try {
			BaoxianBaodanGonshi instance = (BaoxianBaodanGonshi) getHibernateTemplate()
					.get("com.pojo.BaoxianBaodanGonshi", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(BaoxianBaodanGonshi instance) {
		log.debug("finding BaoxianBaodanGonshi instance by example");
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
		log.debug("finding BaoxianBaodanGonshi instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from BaoxianBaodanGonshi as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMoney(Object money) {
		return findByProperty(MONEY, money);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findAll() {
		log.debug("finding all BaoxianBaodanGonshi instances");
		try {
			String queryString = "from BaoxianBaodanGonshi";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public BaoxianBaodanGonshi merge(BaoxianBaodanGonshi detachedInstance) {
		log.debug("merging BaoxianBaodanGonshi instance");
		try {
			BaoxianBaodanGonshi result = (BaoxianBaodanGonshi) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(BaoxianBaodanGonshi instance) {
		log.debug("attaching dirty BaoxianBaodanGonshi instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(BaoxianBaodanGonshi instance) {
		log.debug("attaching clean BaoxianBaodanGonshi instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BaoxianBaodanGonshiDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (BaoxianBaodanGonshiDAO) ctx.getBean("BaoxianBaodanGonshiDAO");
	}
}