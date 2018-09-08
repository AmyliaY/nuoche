package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.VipCash;

/**
 * A data access object (DAO) providing persistence and search support for
 * VipCash entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.VipCash
 * @author MyEclipse Persistence Tools
 */
public class VipCashDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(VipCashDAO.class);
	// property constants
	public static final String CASH = "cash";
	public static final String ORDER_ID = "orderId";
	public static final String ORDER_WX = "orderWx";
	public static final String STATUS = "status";
	public static final String A1 = "a1";
	public static final String A2 = "a2";
	public static final String B1 = "b1";
	public static final String B2 = "b2";

	protected void initDao() {
		// do nothing
	}

	public void save(VipCash transientInstance) {
		log.debug("saving VipCash instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(VipCash persistentInstance) {
		log.debug("deleting VipCash instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public VipCash findById(java.lang.Integer id) {
		log.debug("getting VipCash instance with id: " + id);
		try {
			VipCash instance = (VipCash) getHibernateTemplate().get("com.pojo.VipCash", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(VipCash instance) {
		log.debug("finding VipCash instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding VipCash instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from VipCash as model where model." + propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCash(Object cash) {
		return findByProperty(CASH, cash);
	}

	public List findByOrderId(Object orderId) {
		return findByProperty(ORDER_ID, orderId);
	}

	public List findByOrderWx(Object orderWx) {
		return findByProperty(ORDER_WX, orderWx);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findByA1(Object a1) {
		return findByProperty(A1, a1);
	}

	public List findByA2(Object a2) {
		return findByProperty(A2, a2);
	}

	public List findByB1(Object b1) {
		return findByProperty(B1, b1);
	}

	public List findByB2(Object b2) {
		return findByProperty(B2, b2);
	}

	public List findAll() {
		log.debug("finding all VipCash instances");
		try {
			String queryString = "from VipCash";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public VipCash merge(VipCash detachedInstance) {
		log.debug("merging VipCash instance");
		try {
			VipCash result = (VipCash) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(VipCash instance) {
		log.debug("attaching dirty VipCash instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(VipCash instance) {
		log.debug("attaching clean VipCash instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static VipCashDAO getFromApplicationContext(ApplicationContext ctx) {
		return (VipCashDAO) ctx.getBean("VipCashDAO");
	}
}