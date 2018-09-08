package com.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Yuyue;

/**
 	* A data access object (DAO) providing persistence and search support for Yuyue entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.pojo.Yuyue
  * @author MyEclipse Persistence Tools 
 */
public class YuyueDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(YuyueDAO.class);
		//property constants
	public static final String PAY = "pay";
	public static final String PAY_TYPE = "payType";
	public static final String STATUS = "status";
	public static final String ORDER_WX = "orderWx";
	public static final String RETURN_WX = "returnWx";
	public static final String BUYER_COMMENT = "buyerComment";
	public static final String IS_COMMENT = "isComment";



	protected void initDao() {
		//do nothing
	}
    
    public void save(Yuyue transientInstance) {
        log.debug("saving Yuyue instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Yuyue persistentInstance) {
        log.debug("deleting Yuyue instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Yuyue findById( java.lang.Integer id) {
        log.debug("getting Yuyue instance with id: " + id);
        try {
            Yuyue instance = (Yuyue) getHibernateTemplate()
                    .get("com.pojo.Yuyue", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Yuyue instance) {
        log.debug("finding Yuyue instance by example");
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
      log.debug("finding Yuyue instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Yuyue as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByPay(Object pay
	) {
		return findByProperty(PAY, pay
		);
	}
	
	public List findByPayType(Object payType
	) {
		return findByProperty(PAY_TYPE, payType
		);
	}
	
	public List findByStatus(Object status
	) {
		return findByProperty(STATUS, status
		);
	}
	
	public List findByOrderWx(Object orderWx
	) {
		return findByProperty(ORDER_WX, orderWx
		);
	}
	
	public List findByReturnWx(Object returnWx
	) {
		return findByProperty(RETURN_WX, returnWx
		);
	}
	
	public List findByBuyerComment(Object buyerComment
	) {
		return findByProperty(BUYER_COMMENT, buyerComment
		);
	}
	
	public List findByIsComment(Object isComment
	) {
		return findByProperty(IS_COMMENT, isComment
		);
	}
	

	public List findAll() {
		log.debug("finding all Yuyue instances");
		try {
			String queryString = "from Yuyue";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Yuyue merge(Yuyue detachedInstance) {
        log.debug("merging Yuyue instance");
        try {
            Yuyue result = (Yuyue) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Yuyue instance) {
        log.debug("attaching dirty Yuyue instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Yuyue instance) {
        log.debug("attaching clean Yuyue instance");
        try {
                      	getHibernateTemplate().lock(instance, LockMode.NONE);
                        log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static YuyueDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (YuyueDAO) ctx.getBean("YuyueDAO");
	}
}