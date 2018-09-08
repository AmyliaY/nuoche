package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Goodsorderdetail;

/**
 * A data access object (DAO) providing persistence and search support for
 * Goodsorderdetail entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.Goodsorderdetail
 * @author MyEclipse Persistence Tools
 */

public class GoodsorderdetailDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(GoodsorderdetailDAO.class);
	// property constants
	public static final String OD_NUM = "odNum";
	public static final String OD_COST = "odCost";

	protected void initDao() {
		// do nothing
	}

	public void save(Goodsorderdetail transientInstance) {
		log.debug("saving Goodsorderdetail instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Goodsorderdetail persistentInstance) {
		log.debug("deleting Goodsorderdetail instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Goodsorderdetail findById(java.lang.Integer id) {
		log.debug("getting Goodsorderdetail instance with id: " + id);
		try {
			Goodsorderdetail instance = (Goodsorderdetail) getHibernateTemplate()
					.get("com.pojo.Goodsorderdetail", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Goodsorderdetail instance) {
		log.debug("finding Goodsorderdetail instance by example");
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
		log.debug("finding Goodsorderdetail instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Goodsorderdetail as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByOdNum(Object odNum) {
		return findByProperty(OD_NUM, odNum);
	}

	public List findByOdCost(Object odCost) {
		return findByProperty(OD_COST, odCost);
	}

	public List findAll() {
		log.debug("finding all Goodsorderdetail instances");
		try {
			String queryString = "from Goodsorderdetail";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Goodsorderdetail merge(Goodsorderdetail detachedInstance) {
		log.debug("merging Goodsorderdetail instance");
		try {
			Goodsorderdetail result = (Goodsorderdetail) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Goodsorderdetail instance) {
		log.debug("attaching dirty Goodsorderdetail instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Goodsorderdetail instance) {
		log.debug("attaching clean Goodsorderdetail instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static GoodsorderdetailDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (GoodsorderdetailDAO) ctx.getBean("GoodsorderdetailDAO");
	}
}