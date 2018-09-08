package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Uamessages;

/**
 * A data access object (DAO) providing persistence and search support for
 * Uamessages entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.Uamessages
 * @author MyEclipse Persistence Tools
 */

public class UamessagesDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(UamessagesDAO.class);
	// property constants
	public static final String USERS_ID = "usersId";
	public static final String ADMIN_ID = "adminId";
	public static final String MEFANGXIANG = "mefangxiang";
	public static final String SMDETAIL = "smdetail";
	public static final String MESTATUS = "mestatus";

	protected void initDao() {
		// do nothing
	}

	public void save(Uamessages transientInstance) {
		log.debug("saving Uamessages instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Uamessages persistentInstance) {
		log.debug("deleting Uamessages instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Uamessages findById(java.lang.Integer id) {
		log.debug("getting Uamessages instance with id: " + id);
		try {
			Uamessages instance = (Uamessages) getHibernateTemplate().get(
					"com.pojo.Uamessages", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Uamessages instance) {
		log.debug("finding Uamessages instance by example");
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
		log.debug("finding Uamessages instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Uamessages as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUsersId(Object usersId) {
		return findByProperty(USERS_ID, usersId);
	}

	public List findByAdminId(Object adminId) {
		return findByProperty(ADMIN_ID, adminId);
	}

	public List findByMefangxiang(Object mefangxiang) {
		return findByProperty(MEFANGXIANG, mefangxiang);
	}

	public List findBySmdetail(Object smdetail) {
		return findByProperty(SMDETAIL, smdetail);
	}

	public List findByMestatus(Object mestatus) {
		return findByProperty(MESTATUS, mestatus);
	}

	public List findAll() {
		log.debug("finding all Uamessages instances");
		try {
			String queryString = "from Uamessages";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Uamessages merge(Uamessages detachedInstance) {
		log.debug("merging Uamessages instance");
		try {
			Uamessages result = (Uamessages) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Uamessages instance) {
		log.debug("attaching dirty Uamessages instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Uamessages instance) {
		log.debug("attaching clean Uamessages instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static UamessagesDAO getFromApplicationContext(ApplicationContext ctx) {
		return (UamessagesDAO) ctx.getBean("UamessagesDAO");
	}
}