package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Proxychongzhi;

/**
 	* A data access object (DAO) providing persistence and search support for Proxychongzhi entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.pojo.Proxychongzhi
  * @author MyEclipse Persistence Tools 
 */
public class ProxychongzhiDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(ProxychongzhiDAO.class);
		//property constants
	public static final String FEE = "fee";
	public static final String STATUS = "status";
	public static final String ORDERID = "orderid";
	public static final String ORDERWX = "orderwx";



	protected void initDao() {
		//do nothing
	}
    
    public void save(Proxychongzhi transientInstance) {
        log.debug("saving Proxychongzhi instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Proxychongzhi persistentInstance) {
        log.debug("deleting Proxychongzhi instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Proxychongzhi findById( java.lang.Integer id) {
        log.debug("getting Proxychongzhi instance with id: " + id);
        try {
            Proxychongzhi instance = (Proxychongzhi) getHibernateTemplate()
                    .get("com.pojo.Proxychongzhi", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Proxychongzhi instance) {
        log.debug("finding Proxychongzhi instance by example");
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
      log.debug("finding Proxychongzhi instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Proxychongzhi as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByFee(Object fee
	) {
		return findByProperty(FEE, fee
		);
	}
	
	public List findByStatus(Object status
	) {
		return findByProperty(STATUS, status
		);
	}
	
	public List findByOrderid(Object orderid
	) {
		return findByProperty(ORDERID, orderid
		);
	}
	
	public List findByOrderwx(Object orderwx
	) {
		return findByProperty(ORDERWX, orderwx
		);
	}
	

	public List findAll() {
		log.debug("finding all Proxychongzhi instances");
		try {
			String queryString = "from Proxychongzhi";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Proxychongzhi merge(Proxychongzhi detachedInstance) {
        log.debug("merging Proxychongzhi instance");
        try {
            Proxychongzhi result = (Proxychongzhi) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Proxychongzhi instance) {
        log.debug("attaching dirty Proxychongzhi instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Proxychongzhi instance) {
        log.debug("attaching clean Proxychongzhi instance");
        try {
                      	getHibernateTemplate().lock(instance, LockMode.NONE);
                        log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static ProxychongzhiDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (ProxychongzhiDAO) ctx.getBean("ProxychongzhiDAO");
	}
}