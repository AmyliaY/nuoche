package com.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Service;

/**
 	* A data access object (DAO) providing persistence and search support for Service entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.pojo.Service
  * @author MyEclipse Persistence Tools 
 */
public class ServiceDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(ServiceDAO.class);
		//property constants
	public static final String TITLE = "title";
	public static final String SERVICE_DESC = "serviceDesc";
	public static final String SHICHANG_PRICE = "shichangPrice";
	public static final String YUYUE_PRICE = "yuyuePrice";
	public static final String IMAGE = "image";
	public static final String NUM = "num";
	public static final String PINGLUN_NUM = "pinglunNum";
	public static final String TIME = "time";
	public static final String STATUS = "status";
	public static final String IS_ZHIDING = "isZhiding";
	public static final String SCORE = "score";



	protected void initDao() {
		//do nothing
	}
    
    public void save(Service transientInstance) {
        log.debug("saving Service instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Service persistentInstance) {
        log.debug("deleting Service instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Service findById( java.lang.Integer id) {
        log.debug("getting Service instance with id: " + id);
        try {
            Service instance = (Service) getHibernateTemplate()
                    .get("com.pojo.Service", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Service instance) {
        log.debug("finding Service instance by example");
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
      log.debug("finding Service instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Service as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByTitle(Object title
	) {
		return findByProperty(TITLE, title
		);
	}
	
	public List findByServiceDesc(Object serviceDesc
	) {
		return findByProperty(SERVICE_DESC, serviceDesc
		);
	}
	
	public List findByShichangPrice(Object shichangPrice
	) {
		return findByProperty(SHICHANG_PRICE, shichangPrice
		);
	}
	
	public List findByYuyuePrice(Object yuyuePrice
	) {
		return findByProperty(YUYUE_PRICE, yuyuePrice
		);
	}
	
	public List findByImage(Object image
	) {
		return findByProperty(IMAGE, image
		);
	}
	
	public List findByNum(Object num
	) {
		return findByProperty(NUM, num
		);
	}
	
	public List findByPinglunNum(Object pinglunNum
	) {
		return findByProperty(PINGLUN_NUM, pinglunNum
		);
	}
	
	public List findByTime(Object time
	) {
		return findByProperty(TIME, time
		);
	}
	
	public List findByStatus(Object status
	) {
		return findByProperty(STATUS, status
		);
	}
	
	public List findByIsZhiding(Object isZhiding
	) {
		return findByProperty(IS_ZHIDING, isZhiding
		);
	}
	
	public List findByScore(Object score
	) {
		return findByProperty(SCORE, score
		);
	}
	

	public List findAll() {
		log.debug("finding all Service instances");
		try {
			String queryString = "from Service";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Service merge(Service detachedInstance) {
        log.debug("merging Service instance");
        try {
            Service result = (Service) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Service instance) {
        log.debug("attaching dirty Service instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Service instance) {
        log.debug("attaching clean Service instance");
        try {
                      	getHibernateTemplate().lock(instance, LockMode.NONE);
                        log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static ServiceDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (ServiceDAO) ctx.getBean("ServiceDAO");
	}
}