package com.dao;

import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Province;

/**
 	* A data access object (DAO) providing persistence and search support for Province entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.pojo.Province
  * @author MyEclipse Persistence Tools 
 */
public class ProvinceDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(ProvinceDAO.class);
		//property constants
	public static final String PR_NAME = "prName";



	protected void initDao() {
		//do nothing
	}
    
    public void save(Province transientInstance) {
        log.debug("saving Province instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Province persistentInstance) {
        log.debug("deleting Province instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Province findById( java.lang.Integer id) {
        log.debug("getting Province instance with id: " + id);
        try {
            Province instance = (Province) getHibernateTemplate()
                    .get("com.pojo.Province", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Province instance) {
        log.debug("finding Province instance by example");
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
      log.debug("finding Province instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Province as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByPrName(Object prName
	) {
		return findByProperty(PR_NAME, prName
		);
	}
	

	public List findAll() {
		log.debug("finding all Province instances");
		try {
			String queryString = "from Province";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Province merge(Province detachedInstance) {
        log.debug("merging Province instance");
        try {
            Province result = (Province) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Province instance) {
        log.debug("attaching dirty Province instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Province instance) {
        log.debug("attaching clean Province instance");
        try {
                      	getHibernateTemplate().lock(instance, LockMode.NONE);
                        log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static ProvinceDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (ProvinceDAO) ctx.getBean("ProvinceDAO");
	}
}