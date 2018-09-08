package com.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.JiayouStation;

/**
 * A data access object (DAO) providing persistence and search support for
 * JiayouStation entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.pojo.JiayouStation
 * @author MyEclipse Persistence Tools
 */

public class JiayouStationDAO extends HibernateDaoSupport {
	private static final Logger log = LoggerFactory
			.getLogger(JiayouStationDAO.class);
	// property constants
	public static final String AID = "aid";
	public static final String GNAME = "gname";
	public static final String GADDRESS = "gaddress";
	public static final String GCODE = "gcode";
	public static final String GPICTURE = "gpicture";
	public static final String GDESCRIBE = "gdescribe";
	public static final String GSTATUS = "gstatus";
	public static final String GZUOBIAOX = "gzuobiaox";
	public static final String GZUOBIAOY = "gzuobiaoy";
	public static final String UID = "uid";
	public static final String TOKEN = "token";

	protected void initDao() {
		// do nothing
	}

	public void save(JiayouStation transientInstance) {
		log.debug("saving JiayouStation instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(JiayouStation persistentInstance) {
		log.debug("deleting JiayouStation instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public JiayouStation findById(java.lang.Integer id) {
		log.debug("getting JiayouStation instance with id: " + id);
		try {
			JiayouStation instance = (JiayouStation) getHibernateTemplate()
					.get("com.pojo.JiayouStation", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(JiayouStation instance) {
		log.debug("finding JiayouStation instance by example");
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
		log.debug("finding JiayouStation instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from JiayouStation as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByAid(Object aid) {
		return findByProperty(AID, aid);
	}

	public List findByGname(Object gname) {
		return findByProperty(GNAME, gname);
	}

	public List findByGaddress(Object gaddress) {
		return findByProperty(GADDRESS, gaddress);
	}

	public List findByGcode(Object gcode) {
		return findByProperty(GCODE, gcode);
	}

	public List findByGpicture(Object gpicture) {
		return findByProperty(GPICTURE, gpicture);
	}

	public List findByGdescribe(Object gdescribe) {
		return findByProperty(GDESCRIBE, gdescribe);
	}

	public List findByGstatus(Object gstatus) {
		return findByProperty(GSTATUS, gstatus);
	}

	public List findByGzuobiaox(Object gzuobiaox) {
		return findByProperty(GZUOBIAOX, gzuobiaox);
	}

	public List findByGzuobiaoy(Object gzuobiaoy) {
		return findByProperty(GZUOBIAOY, gzuobiaoy);
	}

	public List findByUid(Object uid) {
		return findByProperty(UID, uid);
	}

	public List findByToken(Object token) {
		return findByProperty(TOKEN, token);
	}

	public List findAll() {
		log.debug("finding all JiayouStation instances");
		try {
			String queryString = "from JiayouStation";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public JiayouStation merge(JiayouStation detachedInstance) {
		log.debug("merging JiayouStation instance");
		try {
			JiayouStation result = (JiayouStation) getHibernateTemplate()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(JiayouStation instance) {
		log.debug("attaching dirty JiayouStation instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(JiayouStation instance) {
		log.debug("attaching clean JiayouStation instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static JiayouStationDAO getFromApplicationContext(
			ApplicationContext ctx) {
		return (JiayouStationDAO) ctx.getBean("JiayouStationDAO");
	}
}