package com.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Goods;

/**
 * A data access object (DAO) providing persistence and search support for Goods
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.pojo.Goods
 * @author MyEclipse Persistence Tools
 */

public class GoodsDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(GoodsDAO.class);
	// property constants
	public static final String GNAME = "gname";
	public static final String GPRICE = "gprice";
	public static final String GVIPPRICE = "gvipprice";
	public static final String GDETAIL = "gdetail";
	public static final String GSTATUS = "gstatus";
	public static final String GIMAGES = "gimages";
	public static final String GDANWEI = "gdanwei";
	public static final String GSELLNUM = "gsellnum";
	public static final String GCOLLECTIONSNUM = "gcollectionsnum";
	public static final String GZHONGCHOU = "gzhongchou";
	public static final String GZIYING = "gziying";

	protected void initDao() {
		// do nothing
	}

	public void save(Goods transientInstance) {
		log.debug("saving Goods instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Goods persistentInstance) {
		log.debug("deleting Goods instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Goods findById(java.lang.Integer id) {
		log.debug("getting Goods instance with id: " + id);		
		try {
			Goods instance = (Goods) getHibernateTemplate().get(
					"com.pojo.Goods", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Goods instance) {
		log.debug("finding Goods instance by example");
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
		log.debug("finding Goods instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Goods as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByGname(Object gname) {
		return findByProperty(GNAME, gname);
	}

	public List findByGprice(Object gprice) {
		return findByProperty(GPRICE, gprice);
	}

	public List findByGvipprice(Object gvipprice) {
		return findByProperty(GVIPPRICE, gvipprice);
	}

	public List findByGdetail(Object gdetail) {
		return findByProperty(GDETAIL, gdetail);
	}

	public List findByGstatus(Object gstatus) {
		return findByProperty(GSTATUS, gstatus);
	}

	public List findByGimages(Object gimages) {
		return findByProperty(GIMAGES, gimages);
	}

	public List findByGdanwei(Object gdanwei) {
		return findByProperty(GDANWEI, gdanwei);
	}

	public List findByGsellnum(Object gsellnum) {
		return findByProperty(GSELLNUM, gsellnum);
	}

	public List findByGcollectionsnum(Object gcollectionsnum) {
		return findByProperty(GCOLLECTIONSNUM, gcollectionsnum);
	}

	public List findByGziying(Object gziying) {
		return findByProperty(GZIYING, gziying);
	}

	public List findAll() {
		log.debug("finding all Goods instances");
		try {
			String queryString = "from Goods";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Goods merge(Goods detachedInstance) {
		log.debug("merging Goods instance");
		try {
			Goods result = (Goods) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Goods instance) {
		log.debug("attaching dirty Goods instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Goods instance) {
		log.debug("attaching clean Goods instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static GoodsDAO getFromApplicationContext(ApplicationContext ctx) {
		return (GoodsDAO) ctx.getBean("GoodsDAO");
	}
}