package com.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.JiayouEmp;

/**
 * A data access object (DAO) providing persistence and search support for
 * JiayouEmp entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.JiayouEmp
 * @author MyEclipse Persistence Tools
 */

public class JiayouEmpDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(JiayouEmpDAO.class);
	// property constants
	public static final String GENAME = "gename";
	public static final String GECARD = "gecard";
	public static final String GENUMBER = "genumber";
	public static final String GEADRESS = "geadress";
	public static final String GESTATUS = "gestatus";
	public static final String GECODE = "gecode";
	public static final String GECODE2 = "gecode2";
	public static final String GERATING = "gerating";
	public static final String GEPEOPLE = "gepeople";

	protected void initDao() {
		// do nothing
	}

	public void save(JiayouEmp transientInstance) {
		log.debug("saving JiayouEmp instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(JiayouEmp persistentInstance) {
		log.debug("deleting JiayouEmp instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public JiayouEmp findById(java.lang.Integer id) {
		log.debug("getting JiayouEmp instance with id: " + id);
		try {
			JiayouEmp instance = (JiayouEmp) getHibernateTemplate().get(
					"com.pojo.JiayouEmp", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(JiayouEmp instance) {
		log.debug("finding JiayouEmp instance by example");
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
		log.debug("finding JiayouEmp instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from JiayouEmp as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByGename(Object gename) {
		return findByProperty(GENAME, gename);
	}

	public List findByGecard(Object gecard) {
		return findByProperty(GECARD, gecard);
	}

	public List findByGenumber(Object genumber) {
		return findByProperty(GENUMBER, genumber);
	}

	public List findByGeadress(Object geadress) {
		return findByProperty(GEADRESS, geadress);
	}

	public List findByGestatus(Object gestatus) {
		return findByProperty(GESTATUS, gestatus);
	}

	public List findByGecode(Object gecode) {
		return findByProperty(GECODE, gecode);
	}

	public List findByGecode2(Object gecode2) {
		return findByProperty(GECODE2, gecode2);
	}

	public List findByGerating(Object gerating) {
		return findByProperty(GERATING, gerating);
	}

	public List findByGepeople(Object gepeople) {
		return findByProperty(GEPEOPLE, gepeople);
	}

	public List findAll() {
		log.debug("finding all JiayouEmp instances");
		try {
			String queryString = "from JiayouEmp";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public JiayouEmp merge(JiayouEmp detachedInstance) {
		log.debug("merging JiayouEmp instance");
		try {
			JiayouEmp result = (JiayouEmp) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(JiayouEmp instance) {
		log.debug("attaching dirty JiayouEmp instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(JiayouEmp instance) {
		log.debug("attaching clean JiayouEmp instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static JiayouEmpDAO getFromApplicationContext(ApplicationContext ctx) {
		return (JiayouEmpDAO) ctx.getBean("JiayouEmpDAO");
	}
}