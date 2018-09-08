package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Templatemessage;

/**
 * A data access object (DAO) providing persistence and search support for
 * Templatemessage entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.Templatemessage
 * @author MyEclipse Persistence Tools
 */
public class TemplatemessageDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(TemplatemessageDAO.class);
	// property constants
	public static final String TPTITLE = "tptitle";
	public static final String TPSTART = "tpstart";
	public static final String TPENDING = "tpending";
	public static final String TPLINK = "tplink";
	public static final String TPPARAMETERS = "tpparameters";
	public static final String TPMEANING = "tpmeaning";
	public static final String TPSTATUS = "tpstatus";
	public static final String TPWEIXIN_ID = "tpweixinId";
	public static final String TPWEIXIN_NAME = "tpweixinName";
	public static final String A1 = "a1";
	public static final String A2 = "a2";
	public static final String B1 = "b1";
	public static final String B2 = "b2";

	protected void initDao() {
		// do nothing
	}

	public void save(Templatemessage transientInstance) {
		log.debug("saving Templatemessage instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Templatemessage persistentInstance) {
		log.debug("deleting Templatemessage instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Templatemessage findById(java.lang.Integer id) {
		log.debug("getting Templatemessage instance with id: " + id);
		try {
			Templatemessage instance = (Templatemessage) getHibernateTemplate().get("com.pojo.Templatemessage", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Templatemessage instance) {
		log.debug("finding Templatemessage instance by example");
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
		log.debug("finding Templatemessage instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from Templatemessage as model where model." + propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTptitle(Object tptitle) {
		return findByProperty(TPTITLE, tptitle);
	}

	public List findByTpstart(Object tpstart) {
		return findByProperty(TPSTART, tpstart);
	}

	public List findByTpending(Object tpending) {
		return findByProperty(TPENDING, tpending);
	}

	public List findByTplink(Object tplink) {
		return findByProperty(TPLINK, tplink);
	}

	public List findByTpparameters(Object tpparameters) {
		return findByProperty(TPPARAMETERS, tpparameters);
	}

	public List findByTpmeaning(Object tpmeaning) {
		return findByProperty(TPMEANING, tpmeaning);
	}

	public List findByTpstatus(Object tpstatus) {
		return findByProperty(TPSTATUS, tpstatus);
	}

	public List findByTpweixinId(Object tpweixinId) {
		return findByProperty(TPWEIXIN_ID, tpweixinId);
	}

	public List findByTpweixinName(Object tpweixinName) {
		return findByProperty(TPWEIXIN_NAME, tpweixinName);
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
		log.debug("finding all Templatemessage instances");
		try {
			String queryString = "from Templatemessage";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Templatemessage merge(Templatemessage detachedInstance) {
		log.debug("merging Templatemessage instance");
		try {
			Templatemessage result = (Templatemessage) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Templatemessage instance) {
		log.debug("attaching dirty Templatemessage instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Templatemessage instance) {
		log.debug("attaching clean Templatemessage instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TemplatemessageDAO getFromApplicationContext(ApplicationContext ctx) {
		return (TemplatemessageDAO) ctx.getBean("TemplatemessageDAO");
	}
}