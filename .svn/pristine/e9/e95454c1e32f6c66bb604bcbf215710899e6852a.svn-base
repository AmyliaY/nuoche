package com.dao;

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Comment;

/**
 	* A data access object (DAO) providing persistence and search support for Comment entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.pojo.Comment
  * @author MyEclipse Persistence Tools 
 */
public class CommentDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(CommentDAO.class);
		//property constants
	public static final String TITLE = "title";
	public static final String CONTENT = "content";
	public static final String LEVEL = "level";
	public static final String A1 = "a1";
	public static final String A2 = "a2";
	public static final String B1 = "b1";
	public static final String B2 = "b2";



	protected void initDao() {
		//do nothing
	}
    
    public void save(Comment transientInstance) {
        log.debug("saving Comment instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Comment persistentInstance) {
        log.debug("deleting Comment instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Comment findById( java.lang.Integer id) {
        log.debug("getting Comment instance with id: " + id);
        try {
            Comment instance = (Comment) getHibernateTemplate()
                    .get("com.pojo.Comment", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Comment instance) {
        log.debug("finding Comment instance by example");
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
      log.debug("finding Comment instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Comment as model where model." 
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
	
	public List findByContent(Object content
	) {
		return findByProperty(CONTENT, content
		);
	}
	
	public List findByLevel(Object level
	) {
		return findByProperty(LEVEL, level
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
		log.debug("finding all Comment instances");
		try {
			String queryString = "from Comment";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Comment merge(Comment detachedInstance) {
        log.debug("merging Comment instance");
        try {
            Comment result = (Comment) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Comment instance) {
        log.debug("attaching dirty Comment instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Comment instance) {
        log.debug("attaching clean Comment instance");
        try {
                      	getHibernateTemplate().lock(instance, LockMode.NONE);
                        log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static CommentDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (CommentDAO) ctx.getBean("CommentDAO");
	}
}