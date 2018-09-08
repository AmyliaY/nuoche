package com.dao;

import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.WeixinUser;

/**
 * A data access object (DAO) providing persistence and search support for
 * WeixinUser entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.WeixinUser
 * @author MyEclipse Persistence Tools
 */
public class WeixinUserDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(WeixinUserDAO.class);
	// property constants
	public static final String TJR = "tjr";
	public static final String STATUS = "status";
	public static final String NICKNAME = "nickname";
	public static final String HEADIMAGE = "headimage";
	public static final String TUIJIANREN = "tuijianren";

	protected void initDao() {
		// do nothing
	}

	public void save(WeixinUser transientInstance) {
		log.debug("saving WeixinUser instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(WeixinUser persistentInstance) {
		log.debug("deleting WeixinUser instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public WeixinUser findById(java.lang.String id) {
		log.debug("getting WeixinUser instance with id: " + id);
		try {
			WeixinUser instance = (WeixinUser) getHibernateTemplate().get("com.pojo.WeixinUser", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			//throw re;
		}
		return null;
	}

	public List findByExample(WeixinUser instance) {
		log.debug("finding WeixinUser instance by example");
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
		log.debug("finding WeixinUser instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from WeixinUser as model where model." + propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByTjr(Object tjr) {
		return findByProperty(TJR, tjr);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findByNickname(Object nickname) {
		return findByProperty(NICKNAME, nickname);
	}

	public List findByHeadimage(Object headimage) {
		return findByProperty(HEADIMAGE, headimage);
	}

	public List findByTuijianren(Object tuijianren) {
		return findByProperty(TUIJIANREN, tuijianren);
	}

	public List findAll() {
		log.debug("finding all WeixinUser instances");
		try {
			String queryString = "from WeixinUser";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public WeixinUser merge(WeixinUser detachedInstance) {
		log.debug("merging WeixinUser instance");
		try {
			WeixinUser result = (WeixinUser) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(WeixinUser instance) {
		log.debug("attaching dirty WeixinUser instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(WeixinUser instance) {
		log.debug("attaching clean WeixinUser instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static WeixinUserDAO getFromApplicationContext(ApplicationContext ctx) {
		return (WeixinUserDAO) ctx.getBean("WeixinUserDAO");
	}
}