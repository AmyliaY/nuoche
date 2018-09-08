package com.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Business;

/**
 * A data access object (DAO) providing persistence and search support for
 * Business entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.pojo.Business
 * @author MyEclipse Persistence Tools
 */
public class BusinessDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(BusinessDAO.class);
	// property constants
	public static final String OPENID = "openid";
	public static final String A1 = "a1";
	public static final String A2 = "a2";
	public static final String B1 = "b1";
	public static final String B2 = "b2";
	public static final String SHOPTYPE = "shoptype";
	public static final String SHOPNAME = "shopname";
	public static final String SHOPLOGO = "shoplogo";
	public static final String SHOPADDR = "shopaddr";
	public static final String SHOP_DESC = "shopDesc";
	public static final String REALNAME = "realname";
	public static final String GENDER = "gender";
	public static final String TEL = "tel";
	public static final String STATUS = "status";
	public static final String EMAIL = "email";
	public static final String LONGITUDE = "longitude";
	public static final String LATITUDE = "latitude";

	protected void initDao() {
		// do nothing
	}

	public void save(Business transientInstance) {
		log.debug("saving Business instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Business persistentInstance) {
		log.debug("deleting Business instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Business findById(java.lang.Integer id) {
		log.debug("getting Business instance with id: " + id);
		try {
			Business instance = (Business) getHibernateTemplate().get("com.pojo.Business", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Business instance) {
		log.debug("finding Business instance by example");
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
		log.debug("finding Business instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from Business as model where model." + propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByOpenid(Object openid) {
		return findByProperty(OPENID, openid);
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

	public List findByShoptype(Object shoptype) {
		return findByProperty(SHOPTYPE, shoptype);
	}

	public List findByShopname(Object shopname) {
		return findByProperty(SHOPNAME, shopname);
	}

	public List findByShoplogo(Object shoplogo) {
		return findByProperty(SHOPLOGO, shoplogo);
	}

	public List findByShopaddr(Object shopaddr) {
		return findByProperty(SHOPADDR, shopaddr);
	}

	public List findByShopDesc(Object shopDesc) {
		return findByProperty(SHOP_DESC, shopDesc);
	}

	public List findByRealname(Object realname) {
		return findByProperty(REALNAME, realname);
	}

	public List findByGender(Object gender) {
		return findByProperty(GENDER, gender);
	}

	public List findByTel(Object tel) {
		return findByProperty(TEL, tel);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findByEmail(Object email) {
		return findByProperty(EMAIL, email);
	}

	public List findByLongitude(Object longitude) {
		return findByProperty(LONGITUDE, longitude);
	}

	public List findByLatitude(Object latitude) {
		return findByProperty(LATITUDE, latitude);
	}

	public List findAll() {
		log.debug("finding all Business instances");
		try {
			String queryString = "from Business";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Business merge(Business detachedInstance) {
		log.debug("merging Business instance");
		try {
			Business result = (Business) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Business instance) {
		log.debug("attaching dirty Business instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Business instance) {
		log.debug("attaching clean Business instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static BusinessDAO getFromApplicationContext(ApplicationContext ctx) {
		return (BusinessDAO) ctx.getBean("BusinessDAO");
	}
}