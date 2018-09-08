package com.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Goodsorders;

/**
 * A data access object (DAO) providing persistence and search support for
 * Goodsorders entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.Goodsorders
 * @author MyEclipse Persistence Tools
 */

public class GoodsordersDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(GoodsordersDAO.class);
	// property constants
	public static final String OR_STATUS = "orStatus";
	public static final String OR_PRICE = "orPrice";
	public static final String OR_YUNFEI = "orYunfei";
	public static final String OR_REMARK = "orRemark";
	public static final String OR_TOTALNUM = "orTotalnum";
	public static final String OR_ORDERNUMBER = "orOrdernumber";
	public static final String OR_PAYTYPE = "orPaytype";
	public static final String OR_THREEPAY = "orThreepay";
	public static final String OR_JIFEN = "orJifen";
	public static final String OR_RECIPIENT = "orRecipient";
	public static final String OR_PEISONGTYPE = "orPeisongtype";
	public static final String OR_SHOPPINGZHEKOU = "orShoppingzhekou";

	protected void initDao() {
		// do nothing
	}

	public void save(Goodsorders transientInstance) {
		log.debug("saving Goodsorders instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Goodsorders persistentInstance) {
		log.debug("deleting Goodsorders instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Goodsorders findById(java.lang.Integer id) {
		log.debug("getting Goodsorders instance with id: " + id);
		try {
			Goodsorders instance = (Goodsorders) getHibernateTemplate().get(
					"com.pojo.Goodsorders", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Goodsorders instance) {
		log.debug("finding Goodsorders instance by example");
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
		log.debug("finding Goodsorders instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Goodsorders as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByOrStatus(Object orStatus) {
		return findByProperty(OR_STATUS, orStatus);
	}

	public List findByOrPrice(Object orPrice) {
		return findByProperty(OR_PRICE, orPrice);
	}

	public List findByOrYunfei(Object orYunfei) {
		return findByProperty(OR_YUNFEI, orYunfei);
	}

	public List findByOrRemark(Object orRemark) {
		return findByProperty(OR_REMARK, orRemark);
	}

	public List findByOrTotalnum(Object orTotalnum) {
		return findByProperty(OR_TOTALNUM, orTotalnum);
	}

	public List findByOrOrdernumber(Object orOrdernumber) {
		return findByProperty(OR_ORDERNUMBER, orOrdernumber);
	}

	public List findByOrPaytype(Object orPaytype) {
		return findByProperty(OR_PAYTYPE, orPaytype);
	}

	public List findByOrThreepay(Object orThreepay) {
		return findByProperty(OR_THREEPAY, orThreepay);
	}

	public List findByOrJifen(Object orJifen) {
		return findByProperty(OR_JIFEN, orJifen);
	}

	public List findByOrRecipient(Object orRecipient) {
		return findByProperty(OR_RECIPIENT, orRecipient);
	}

	public List findByOrPeisongtype(Object orPeisongtype) {
		return findByProperty(OR_PEISONGTYPE, orPeisongtype);
	}

	public List findByOrShoppingzhekou(Object orShoppingzhekou) {
		return findByProperty(OR_SHOPPINGZHEKOU, orShoppingzhekou);
	}

	public List findAll() {
		log.debug("finding all Goodsorders instances");
		try {
			String queryString = "from Goodsorders";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Goodsorders merge(Goodsorders detachedInstance) {
		log.debug("merging Goodsorders instance");
		try {
			Goodsorders result = (Goodsorders) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Goodsorders instance) {
		log.debug("attaching dirty Goodsorders instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Goodsorders instance) {
		log.debug("attaching clean Goodsorders instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static GoodsordersDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (GoodsordersDAO) ctx.getBean("GoodsordersDAO");
	}
}