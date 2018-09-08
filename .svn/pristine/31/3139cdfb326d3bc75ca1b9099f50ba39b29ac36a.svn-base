package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.ChongzhiHuafei;

/**
 * A data access object (DAO) providing persistence and search support for
 * ChongzhiHuafei entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.ChongzhiHuafei
 * @author MyEclipse Persistence Tools
 */
public class ChongzhiHuafeiDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(ChongzhiHuafeiDAO.class);
	// property constants
	public static final String OPENID = "openid";
	public static final String ORDER_ID = "orderId";
	public static final String ORDER_WX = "orderWx";
	public static final String MINUTE_NUM = "minuteNum";
	public static final String TOTAL_FEE = "totalFee";
	public static final String STATUS = "status";

	protected void initDao() {
		// do nothing
	}

	public void save(ChongzhiHuafei transientInstance) {
		log.debug("saving ChongzhiHuafei instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(ChongzhiHuafei persistentInstance) {
		log.debug("deleting ChongzhiHuafei instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public ChongzhiHuafei findById(java.lang.Integer id) {
		log.debug("getting ChongzhiHuafei instance with id: " + id);
		try {
			ChongzhiHuafei instance = (ChongzhiHuafei) getHibernateTemplate().get("com.pojo.ChongzhiHuafei", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(ChongzhiHuafei instance) {
		log.debug("finding ChongzhiHuafei instance by example");
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
		log.debug("finding ChongzhiHuafei instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from ChongzhiHuafei as model where model." + propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByOpenid(Object openid) {
		return findByProperty(OPENID, openid);
	}

	public List findByOrderId(Object orderId) {
		return findByProperty(ORDER_ID, orderId);
	}

	public List findByOrderWx(Object orderWx) {
		return findByProperty(ORDER_WX, orderWx);
	}

	public List findByMinuteNum(Object minuteNum) {
		return findByProperty(MINUTE_NUM, minuteNum);
	}

	public List findByTotalFee(Object totalFee) {
		return findByProperty(TOTAL_FEE, totalFee);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findAll() {
		log.debug("finding all ChongzhiHuafei instances");
		try {
			String queryString = "from ChongzhiHuafei";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public ChongzhiHuafei merge(ChongzhiHuafei detachedInstance) {
		log.debug("merging ChongzhiHuafei instance");
		try {
			ChongzhiHuafei result = (ChongzhiHuafei) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(ChongzhiHuafei instance) {
		log.debug("attaching dirty ChongzhiHuafei instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(ChongzhiHuafei instance) {
		log.debug("attaching clean ChongzhiHuafei instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ChongzhiHuafeiDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ChongzhiHuafeiDAO) ctx.getBean("ChongzhiHuafeiDAO");
	}
}