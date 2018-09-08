package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Applydetail;

/**
 * A data access object (DAO) providing persistence and search support for
 * Applydetail entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.Applydetail
 * @author MyEclipse Persistence Tools
 */
public class ApplydetailDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(ApplydetailDAO.class);
	// property constants
	public static final String ORDER_ID = "orderId";
	public static final String ORDER_WX = "orderWx";
	public static final String CARD_NUM = "cardNum";
	public static final String POST_FEE = "postFee";
	public static final String CARD_FEE = "cardFee";
	public static final String TOTAL_FEE = "totalFee";
	public static final String STATUS = "status";
	public static final String SHIPPING_CODE = "shippingCode";
	public static final String BUYER = "buyer";
	public static final String BUYER_ADDR = "buyerAddr";
	public static final String BUYER_TEL = "buyerTel";
	public static final String A1 = "a1";
	public static final String A2 = "a2";
	public static final String B1 = "b1";
	public static final String B2 = "b2";

	protected void initDao() {
		// do nothing
	}

	public void save(Applydetail transientInstance) {
		log.debug("saving Applydetail instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Applydetail persistentInstance) {
		log.debug("deleting Applydetail instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Applydetail findById(java.lang.Integer id) {
		log.debug("getting Applydetail instance with id: " + id);
		try {
			Applydetail instance = (Applydetail) getHibernateTemplate().get("com.pojo.Applydetail", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Applydetail instance) {
		log.debug("finding Applydetail instance by example");
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
		log.debug("finding Applydetail instance with property: " + propertyName + ", value: " + value);
		try {
			String queryString = "from Applydetail as model where model." + propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByOrderId(Object orderId) {
		return findByProperty(ORDER_ID, orderId);
	}

	public List findByOrderWx(Object orderWx) {
		return findByProperty(ORDER_WX, orderWx);
	}

	public List findByCardNum(Object cardNum) {
		return findByProperty(CARD_NUM, cardNum);
	}

	public List findByPostFee(Object postFee) {
		return findByProperty(POST_FEE, postFee);
	}

	public List findByCardFee(Object cardFee) {
		return findByProperty(CARD_FEE, cardFee);
	}

	public List findByTotalFee(Object totalFee) {
		return findByProperty(TOTAL_FEE, totalFee);
	}

	public List findByStatus(Object status) {
		return findByProperty(STATUS, status);
	}

	public List findByShippingCode(Object shippingCode) {
		return findByProperty(SHIPPING_CODE, shippingCode);
	}

	public List findByBuyer(Object buyer) {
		return findByProperty(BUYER, buyer);
	}

	public List findByBuyerAddr(Object buyerAddr) {
		return findByProperty(BUYER_ADDR, buyerAddr);
	}

	public List findByBuyerTel(Object buyerTel) {
		return findByProperty(BUYER_TEL, buyerTel);
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
		log.debug("finding all Applydetail instances");
		try {
			String queryString = "from Applydetail";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Applydetail merge(Applydetail detachedInstance) {
		log.debug("merging Applydetail instance");
		try {
			Applydetail result = (Applydetail) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Applydetail instance) {
		log.debug("attaching dirty Applydetail instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Applydetail instance) {
		log.debug("attaching clean Applydetail instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ApplydetailDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ApplydetailDAO) ctx.getBean("ApplydetailDAO");
	}
}