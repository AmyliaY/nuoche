package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.SylbImages;

/**
 	* A data access object (DAO) providing persistence and search support for SylbImages entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.pojo.SylbImages
  * @author MyEclipse Persistence Tools 
 */
public class SylbImagesDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(SylbImagesDAO.class);
		//property constants
	public static final String IMAGE = "image";
	public static final String TITLE = "title";
	public static final String STATUS = "status";
	public static final String DETAIL = "detail";
	public static final String TYPE = "type";
	public static final String PROXY = "proxy";
	public static final String A1 = "a1";
	public static final String A2 = "a2";
	public static final String B1 = "b1";
	public static final String B2 = "b2";



	protected void initDao() {
		//do nothing
	}
    
    public void save(SylbImages transientInstance) {
        log.debug("saving SylbImages instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(SylbImages persistentInstance) {
        log.debug("deleting SylbImages instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public SylbImages findById( java.lang.Integer id) {
        log.debug("getting SylbImages instance with id: " + id);
        try {
            SylbImages instance = (SylbImages) getHibernateTemplate()
                    .get("com.pojo.SylbImages", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(SylbImages instance) {
        log.debug("finding SylbImages instance by example");
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
      log.debug("finding SylbImages instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from SylbImages as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByImage(Object image
	) {
		return findByProperty(IMAGE, image
		);
	}
	
	public List findByTitle(Object title
	) {
		return findByProperty(TITLE, title
		);
	}
	
	public List findByStatus(Object status
	) {
		return findByProperty(STATUS, status
		);
	}
	
	public List findByDetail(Object detail
	) {
		return findByProperty(DETAIL, detail
		);
	}
	
	public List findByType(Object type
	) {
		return findByProperty(TYPE, type
		);
	}
	
	public List findByProxy(Object proxy
	) {
		return findByProperty(PROXY, proxy
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
		log.debug("finding all SylbImages instances");
		try {
			String queryString = "from SylbImages";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public SylbImages merge(SylbImages detachedInstance) {
        log.debug("merging SylbImages instance");
        try {
            SylbImages result = (SylbImages) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(SylbImages instance) {
        log.debug("attaching dirty SylbImages instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(SylbImages instance) {
        log.debug("attaching clean SylbImages instance");
        try {
                      	getHibernateTemplate().lock(instance, LockMode.NONE);
                        log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static SylbImagesDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (SylbImagesDAO) ctx.getBean("SylbImagesDAO");
	}
}