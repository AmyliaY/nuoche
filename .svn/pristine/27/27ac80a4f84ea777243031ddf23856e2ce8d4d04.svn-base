package com.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Proxy;

/**
 	* A data access object (DAO) providing persistence and search support for Proxy entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.pojo.Proxy
  * @author MyEclipse Persistence Tools 
 */
public class ProxyDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(ProxyDAO.class);
		//property constants
	public static final String TEL = "tel";
	public static final String PASSWORD = "password";
	public static final String LEVEL = "level";
	public static final String REALNAME = "realname";
	public static final String BIRTHDAY = "birthday";
	public static final String PARENT_ID = "parentId";
	public static final String SUM_CARD = "sumCard";
	public static final String SUM_ACTIVE = "sumActive";
	public static final String NO_ACTIVE = "noActive";
	public static final String TOTAL_AMOUNT = "totalAmount";
	public static final String YI_CASH = "yiCash";
	public static final String KE_CASH = "keCash";
	public static final String STATUS = "status";
	public static final String OPENID = "openid";
	public static final String A1 = "a1";
	public static final String A2 = "a2";
	public static final String B1 = "b1";
	public static final String B2 = "b2";



	protected void initDao() {
		//do nothing
	}
    
    public void save(Proxy transientInstance) {
        log.debug("saving Proxy instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Proxy persistentInstance) {
        log.debug("deleting Proxy instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Proxy findById( java.lang.Integer id) {
        log.debug("getting Proxy instance with id: " + id);
        try {
            Proxy instance = (Proxy) getHibernateTemplate()
                    .get("com.pojo.Proxy", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Proxy instance) {
        log.debug("finding Proxy instance by example");
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
      log.debug("finding Proxy instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Proxy as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByTel(Object tel
	) {
		return findByProperty(TEL, tel
		);
	}
	
	public List findByPassword(Object password
	) {
		return findByProperty(PASSWORD, password
		);
	}
	
	public List findByLevel(Object level
	) {
		return findByProperty(LEVEL, level
		);
	}
	
	public List findByRealname(Object realname
	) {
		return findByProperty(REALNAME, realname
		);
	}
	
	public List findByBirthday(Object birthday
	) {
		return findByProperty(BIRTHDAY, birthday
		);
	}
	
	public List findByParentId(Object parentId
	) {
		return findByProperty(PARENT_ID, parentId
		);
	}
	
	public List findBySumCard(Object sumCard
	) {
		return findByProperty(SUM_CARD, sumCard
		);
	}
	
	public List findBySumActive(Object sumActive
	) {
		return findByProperty(SUM_ACTIVE, sumActive
		);
	}
	
	public List findByNoActive(Object noActive
	) {
		return findByProperty(NO_ACTIVE, noActive
		);
	}
	
	public List findByTotalAmount(Object totalAmount
	) {
		return findByProperty(TOTAL_AMOUNT, totalAmount
		);
	}
	
	public List findByYiCash(Object yiCash
	) {
		return findByProperty(YI_CASH, yiCash
		);
	}
	
	public List findByKeCash(Object keCash
	) {
		return findByProperty(KE_CASH, keCash
		);
	}
	
	public List findByStatus(Object status
	) {
		return findByProperty(STATUS, status
		);
	}
	
	public List findByOpenid(Object openid
	) {
		return findByProperty(OPENID, openid
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
		log.debug("finding all Proxy instances");
		try {
			String queryString = "from Proxy";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Proxy merge(Proxy detachedInstance) {
        log.debug("merging Proxy instance");
        try {
            Proxy result = (Proxy) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Proxy instance) {
        log.debug("attaching dirty Proxy instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Proxy instance) {
        log.debug("attaching clean Proxy instance");
        try {
                      	getHibernateTemplate().lock(instance, LockMode.NONE);
                        log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static ProxyDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (ProxyDAO) ctx.getBean("ProxyDAO");
	}
}