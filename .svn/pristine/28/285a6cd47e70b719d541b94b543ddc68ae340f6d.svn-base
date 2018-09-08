package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.BaoxianBaodan;

/**
 * A data access object (DAO) providing persistence and search support for
 * BaoxianBaodan entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.BaoxianBaodan
 * @author MyEclipse Persistence Tools
 */

public class BaoxianBaodanDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(BaoxianBaodanDAO.class);
	// property constants
	public static final String NAME = "name";
	public static final String MONEY = "money";
	public static final String NOMIANPEI = "nomianpei";

	protected void initDao() {
		// do nothing
	}

	public void save(BaoxianBaodan transientInstance) {
		log.debug("saving BaoxianBaodan instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(BaoxianBaodan persistentInstance) {
		log.debug("deleting BaoxianBaodan instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public BaoxianBaodan findById(java.lang.Integer id) {
		log.debug("getting BaoxianBaodan instance with id: " + id);
		try {
			BaoxianBaodan instance = (BaoxianBaodan) getHibernateTemplate()
					.get("com.pojo.BaoxianBaodan", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(BaoxianBaodan instance) {
		log.debug("finding BaoxianBaodan instance by example");
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
		log.debug("finding BaoxianBaodan instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from BaoxianBaodan as model where model."
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

	public List findByMoney(Object money) {
		return findByProperty(MONEY, money);
	}

	public List findByNomianpei(Object nomianpei) {
		return findByProperty(NOMIANPEI, nomianpei);
	}

	public List findAll() {
		log.debug("finding all BaoxianBaodan instances");
		try {
			String queryString = "from BaoxianBaodan";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public BaoxianBaodan merge(BaoxianBaodan detachedInstance) {
		log.debug("merging BaoxianBaodan instance");
		try {
			BaoxianBaodan result = (BaoxianBaodan) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(BaoxianBaodan instance) {
		log.debug("attaching dirty BaoxianBaodan instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(BaoxianBaodan instance) {
		log.debug("attaching clean BaoxianBaodan instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BaoxianBaodanDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (BaoxianBaodanDAO) ctx.getBean("BaoxianBaodanDAO");
	}
}