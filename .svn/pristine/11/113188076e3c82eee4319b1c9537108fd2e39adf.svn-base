package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.TelParam;

/**
 	* A data access object (DAO) providing persistence and search support for TelParam entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.pojo.TelParam
  * @author MyEclipse Persistence Tools 
 */
public class TelParamDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(TelParamDAO.class);
		//property constants
	public static final String CALLEDNUMBER = "callednumber";
	public static final String CALLINGNUMBER = "callingnumber";
	public static final String MD5KEY = "md5key";
	public static final String STATUS = "status";
	public static final String APPID = "appid";
	public static final String RETURN_URL = "returnUrl";
	public static final String A1 = "a1";
	public static final String A2 = "a2";
	public static final String B1 = "b1";
	public static final String B2 = "b2";



	protected void initDao() {
		//do nothing
	}
    
    public void save(TelParam transientInstance) {
        log.debug("saving TelParam instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(TelParam persistentInstance) {
        log.debug("deleting TelParam instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public TelParam findById( java.lang.Integer id) {
        log.debug("getting TelParam instance with id: " + id);
        try {
            TelParam instance = (TelParam) getHibernateTemplate()
                    .get("com.pojo.TelParam", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(TelParam instance) {
        log.debug("finding TelParam instance by example");
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
      log.debug("finding TelParam instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from TelParam as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByCallednumber(Object callednumber
	) {
		return findByProperty(CALLEDNUMBER, callednumber
		);
	}
	
	public List findByCallingnumber(Object callingnumber
	) {
		return findByProperty(CALLINGNUMBER, callingnumber
		);
	}
	
	public List findByMd5key(Object md5key
	) {
		return findByProperty(MD5KEY, md5key
		);
	}
	
	public List findByStatus(Object status
	) {
		return findByProperty(STATUS, status
		);
	}
	
	public List findByAppid(Object appid
	) {
		return findByProperty(APPID, appid
		);
	}
	
	public List findByReturnUrl(Object returnUrl
	) {
		return findByProperty(RETURN_URL, returnUrl
		);
	}
	
	public List findByA1(Object a1
	) {
		return findByProperty(A1, a1
		);
	}
	
	public List findByA2(Object a2
	) {
		return findByProperty(A2, a2
		);
	}
	
	public List findByB1(Object b1
	) {
		return findByProperty(B1, b1
		);
	}
	
	public List findByB2(Object b2
	) {
		return findByProperty(B2, b2
		);
	}
	

	public List findAll() {
		log.debug("finding all TelParam instances");
		try {
			String queryString = "from TelParam";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public TelParam merge(TelParam detachedInstance) {
        log.debug("merging TelParam instance");
        try {
            TelParam result = (TelParam) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(TelParam instance) {
        log.debug("attaching dirty TelParam instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(TelParam instance) {
        log.debug("attaching clean TelParam instance");
        try {
                      	getHibernateTemplate().lock(instance, LockMode.NONE);
                        log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static TelParamDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (TelParamDAO) ctx.getBean("TelParamDAO");
	}
}