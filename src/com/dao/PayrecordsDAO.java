package com.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Payrecords;

/**
 * A data access object (DAO) providing persistence and search support for
 * Payrecords entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.Payrecords
 * @author MyEclipse Persistence Tools
 */
public class PayrecordsDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(PayrecordsDAO.class);
	// property constants
	public static final String PR_MONEY = "prMoney";
	public static final String PR_TYPE = "prType";
	public static final String PR_DINGDANHAO = "prDingdanhao";
	public static final String PR_STATUS = "prStatus";
	public static final String PR_PRESENT = "prPresent";

	protected void initDao() {
		// do nothing
	}

	public void save(Payrecords transientInstance) {
		log.debug("saving Payrecords instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Payrecords persistentInstance) {
		log.debug("deleting Payrecords instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Payrecords findById(java.lang.Integer id) {
		log.debug("getting Payrecords instance with id: " + id);
		try {
			Payrecords instance = (Payrecords) getHibernateTemplate().get(
					"com.pojo.Payrecords", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Payrecords instance) {
		log.debug("finding Payrecords instance by example");
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
		log.debug("finding Payrecords instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Payrecords as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByPrMoney(Object prMoney) {
		return findByProperty(PR_MONEY, prMoney);
	}

	public List findByPrType(Object prType) {
		return findByProperty(PR_TYPE, prType);
	}

	public List findByPrDingdanhao(Object prDingdanhao) {
		return findByProperty(PR_DINGDANHAO, prDingdanhao);
	}

	public List findByPrStatus(Object prStatus) {
		return findByProperty(PR_STATUS, prStatus);
	}

	public List findByPrPresent(Object prPresent) {
		return findByProperty(PR_PRESENT, prPresent);
	}

	public List findAll() {
		log.debug("finding all Payrecords instances");
		try {
			String queryString = "from Payrecords";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Payrecords merge(Payrecords detachedInstance) {
		log.debug("merging Payrecords instance");
		try {
			Payrecords result = (Payrecords) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Payrecords instance) {
		log.debug("attaching dirty Payrecords instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Payrecords instance) {
		log.debug("attaching clean Payrecords instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static PayrecordsDAO getFromApplicationContext(ApplicationContext ctx) {
		return (PayrecordsDAO) ctx.getBean("PayrecordsDAO");
	}
}