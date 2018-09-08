package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.SylbRecord;

/**
 * A data access object (DAO) providing persistence and search support for
 * SylbRecord entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.SylbRecord
 * @author MyEclipse Persistence Tools
 */
public class SylbRecordDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(SylbRecordDAO.class);
	// property constants
	public static final String DAYS = "days";
	public static final String DANJIA = "danjia";
	public static final String TOTALPRICE = "totalprice";

	protected void initDao() {
		// do nothing
	}

	public void save(SylbRecord transientInstance) {
		log.debug("saving SylbRecord instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(SylbRecord persistentInstance) {
		log.debug("deleting SylbRecord instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public SylbRecord findById(java.lang.Integer id) {
		log.debug("getting SylbRecord instance with id: " + id);
		try {
			SylbRecord instance = (SylbRecord) getHibernateTemplate().get("com.pojo.SylbRecord", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(SylbRecord instance) {
		log.debug("finding SylbRecord instance by example");
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
		log.debug("finding SylbRecord instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from SylbRecord as model where model." + propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByDays(Object days) {
		return findByProperty(DAYS, days);
	}

	public List findByDanjia(Object danjia) {
		return findByProperty(DANJIA, danjia);
	}

	public List findByTotalprice(Object totalprice) {
		return findByProperty(TOTALPRICE, totalprice);
	}

	public List findAll() {
		log.debug("finding all SylbRecord instances");
		try {
			String queryString = "from SylbRecord";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public SylbRecord merge(SylbRecord detachedInstance) {
		log.debug("merging SylbRecord instance");
		try {
			SylbRecord result = (SylbRecord) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(SylbRecord instance) {
		log.debug("attaching dirty SylbRecord instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(SylbRecord instance) {
		log.debug("attaching clean SylbRecord instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static SylbRecordDAO getFromApplicationContext(ApplicationContext ctx) {
		return (SylbRecordDAO) ctx.getBean("SylbRecordDAO");
	}
}