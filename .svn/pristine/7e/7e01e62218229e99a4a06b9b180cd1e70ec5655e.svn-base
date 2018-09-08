package com.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.LunboMusic;

/**
 * A data access object (DAO) providing persistence and search support for
 * LunboMusic entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.LunboMusic
 * @author MyEclipse Persistence Tools
 */

public class LunboMusicDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(LunboMusicDAO.class);
	// property constants
	public static final String CIMG_TITLE = "cimgTitle";
	public static final String CIMG_DESCRIBE = "cimgDescribe";
	public static final String CIMAGES = "cimages";
	public static final String CIMG_URL = "cimgUrl";
	public static final String CIMG_STATUS = "cimgStatus";
	public static final String CIMG_TYPE = "cimgType";

	protected void initDao() {
		// do nothing
	}

	public void save(LunboMusic transientInstance) {
		log.debug("saving LunboMusic instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void delete(LunboMusic persistentInstance) {
		log.debug("deleting LunboMusic instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public LunboMusic findById(java.lang.Integer id) {
		log.debug("getting LunboMusic instance with id: " + id);
		try {
			LunboMusic instance = (LunboMusic) getHibernateTemplate().get(
					"com.pojo.LunboMusic", id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findByExample(LunboMusic instance) {
		log.debug("finding LunboMusic instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding LunboMusic instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from LunboMusic as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findByCimgTitle(Object cimgTitle) {
		return findByProperty(CIMG_TITLE, cimgTitle);
	}

	public List findByCimgDescribe(Object cimgDescribe) {
		return findByProperty(CIMG_DESCRIBE, cimgDescribe);
	}

	public List findByCimages(Object cimages) {
		return findByProperty(CIMAGES, cimages);
	}

	public List findByCimgUrl(Object cimgUrl) {
		return findByProperty(CIMG_URL, cimgUrl);
	}

	public List findByCimgStatus(Object cimgStatus) {
		return findByProperty(CIMG_STATUS, cimgStatus);
	}

	public List findByCimgType(Object cimgType) {
		return findByProperty(CIMG_TYPE, cimgType);
	}

	public List findAll() {
		log.debug("finding all LunboMusic instances");
		try {
			String queryString = "from LunboMusic";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public LunboMusic merge(LunboMusic detachedInstance) {
		log.debug("merging LunboMusic instance");
		try {
			LunboMusic result = (LunboMusic) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void attachDirty(LunboMusic instance) {
		log.debug("attaching dirty LunboMusic instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void attachClean(LunboMusic instance) {
		log.debug("attaching clean LunboMusic instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public static LunboMusicDAO getFromApplicationContext(ApplicationContext ctx) {
		return (LunboMusicDAO) ctx.getBean("LunboMusicDAO");
	}
}