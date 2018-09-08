package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Carouselimages;

/**
 * A data access object (DAO) providing persistence and search support for
 * Carouselimages entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.Carouselimages
 * @author MyEclipse Persistence Tools
 */

public class CarouselimagesDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(CarouselimagesDAO.class);
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

	public void save(Carouselimages transientInstance) {
		log.debug("saving Carouselimages instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Carouselimages persistentInstance) {
		log.debug("deleting Carouselimages instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Carouselimages findById(java.lang.Integer id) {
		log.debug("getting Carouselimages instance with id: " + id);
		try {
			Carouselimages instance = (Carouselimages) getHibernateTemplate()
					.get("com.pojo.Carouselimages", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Carouselimages instance) {
		log.debug("finding Carouselimages instance by example");
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
		log.debug("finding Carouselimages instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from Carouselimages as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
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
		log.debug("finding all Carouselimages instances");
		try {
			String queryString = "from Carouselimages";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Carouselimages merge(Carouselimages detachedInstance) {
		log.debug("merging Carouselimages instance");
		try {
			Carouselimages result = (Carouselimages) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Carouselimages instance) {
		log.debug("attaching dirty Carouselimages instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Carouselimages instance) {
		log.debug("attaching clean Carouselimages instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static CarouselimagesDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (CarouselimagesDAO) ctx.getBean("CarouselimagesDAO");
	}
}