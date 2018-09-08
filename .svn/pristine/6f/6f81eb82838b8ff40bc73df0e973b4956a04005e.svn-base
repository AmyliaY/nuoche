package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Movecar;

/**
 * A data access object (DAO) providing persistence and search support for
 * Movecar entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.Movecar
 * @author MyEclipse Persistence Tools
 */
public class MovecarDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(MovecarDAO.class);
	// property constants
	public static final String ADDR = "addr";
	public static final String STATUS = "status";

	protected void initDao() {
		// do nothing
	}

	public void save(Movecar transientInstance) {
		log.debug("saving Movecar instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Movecar persistentInstance) {
		log.debug("deleting Movecar instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Movecar findById(java.lang.Integer id) {
		log.debug("getting Movecar instance with id: " + id);
		try {
			Movecar instance = (Movecar) getHibernateTemplate().get("com.pojo.Movecar", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Movecar instance) {
		log.debug("finding Movecar instance by example");
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
		log.debug("finding Movecar instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from Movecar as model where model." + propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByAddr(Object addr) {
		return findByProperty(ADDR, addr);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findAll() {
		log.debug("finding all Movecar instances");
		try {
			String queryString = "from Movecar";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Movecar merge(Movecar detachedInstance) {
		log.debug("merging Movecar instance");
		try {
			Movecar result = (Movecar) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Movecar instance) {
		log.debug("attaching dirty Movecar instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Movecar instance) {
		log.debug("attaching clean Movecar instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static MovecarDAO getFromApplicationContext(ApplicationContext ctx) {
		return (MovecarDAO) ctx.getBean("MovecarDAO");
	}
}