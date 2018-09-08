package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Goodsimages;

/**
 * A data access object (DAO) providing persistence and search support for
 * Goodsimages entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.Goodsimages
 * @author MyEclipse Persistence Tools
 */

public class GoodsimagesDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(GoodsimagesDAO.class);
	// property constants
	public static final String GIMAGES = "gimages";
	public static final String GIMG_STATUS = "gimgStatus";
	public static final String GIMG_DETAIL = "gimgDetail";

	protected void initDao() {
		// do nothing
	}

	public void save(Goodsimages transientInstance) {
		log.debug("saving Goodsimages instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Goodsimages persistentInstance) {
		log.debug("deleting Goodsimages instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Goodsimages findById(java.lang.Integer id) {
		log.debug("getting Goodsimages instance with id: " + id);
		try {
			Goodsimages instance = (Goodsimages) getHibernateTemplate().get(
					"com.pojo.Goodsimages", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Goodsimages instance) {
		log.debug("finding Goodsimages instance by example");
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
		log.debug("finding Goodsimages instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Goodsimages as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByGimages(Object gimages) {
		return findByProperty(GIMAGES, gimages);
	}

	public List findByGimgStatus(Object gimgStatus) {
		return findByProperty(GIMG_STATUS, gimgStatus);
	}

	public List findByGimgDetail(Object gimgDetail) {
		return findByProperty(GIMG_DETAIL, gimgDetail);
	}

	public List findAll() {
		log.debug("finding all Goodsimages instances");
		try {
			String queryString = "from Goodsimages";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Goodsimages merge(Goodsimages detachedInstance) {
		log.debug("merging Goodsimages instance");
		try {
			Goodsimages result = (Goodsimages) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Goodsimages instance) {
		log.debug("attaching dirty Goodsimages instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Goodsimages instance) {
		log.debug("attaching clean Goodsimages instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static GoodsimagesDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (GoodsimagesDAO) ctx.getBean("GoodsimagesDAO");
	}
}