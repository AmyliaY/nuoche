package com.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Userinfo;

/**
 	* A data access object (DAO) providing persistence and search support for Userinfo entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.pojo.Userinfo
  * @author MyEclipse Persistence Tools 
 */
public class UserinfoDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(UserinfoDAO.class);
		//property constants
	public static final String USERS_NAME = "usersName";
	public static final String USERS_PHONE = "usersPhone";
	public static final String USERS_AREA = "usersArea";
	public static final String USERS_HEADIMG = "usersHeadimg";
	public static final String USERS_STATUS = "usersStatus";
	public static final String USERS_GENDER = "usersGender";
	public static final String USERS_REFERRER = "usersReferrer";
	public static final String USERS_REMARK = "usersRemark";
	public static final String USERS_INTEGRAL = "usersIntegral";
	public static final String USERS_TYPE = "usersType";
	public static final String USERS_PASSWORD = "usersPassword";
	public static final String USERS_CODE = "usersCode";
	public static final String USERS_PAYPWD = "usersPaypwd";



	protected void initDao() {
		//do nothing
	}
    
    public void save(Userinfo transientInstance) {
        log.debug("saving Userinfo instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Userinfo persistentInstance) {
        log.debug("deleting Userinfo instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Userinfo findById( java.lang.Integer id) {
        log.debug("getting Userinfo instance with id: " + id);
        try {
            Userinfo instance = (Userinfo) getHibernateTemplate()
                    .get("com.pojo.Userinfo", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Userinfo instance) {
        log.debug("finding Userinfo instance by example");
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
      log.debug("finding Userinfo instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Userinfo as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByUsersName(Object usersName
	) {
		return findByProperty(USERS_NAME, usersName
		);
	}
	
	public List findByUsersPhone(Object usersPhone
	) {
		return findByProperty(USERS_PHONE, usersPhone
		);
	}
	
	public List findByUsersArea(Object usersArea
	) {
		return findByProperty(USERS_AREA, usersArea
		);
	}
	
	public List findByUsersHeadimg(Object usersHeadimg
	) {
		return findByProperty(USERS_HEADIMG, usersHeadimg
		);
	}
	
	public List findByUsersStatus(Object usersStatus
	) {
		return findByProperty(USERS_STATUS, usersStatus
		);
	}
	
	public List findByUsersGender(Object usersGender
	) {
		return findByProperty(USERS_GENDER, usersGender
		);
	}
	
	public List findByUsersReferrer(Object usersReferrer
	) {
		return findByProperty(USERS_REFERRER, usersReferrer
		);
	}
	
	public List findByUsersRemark(Object usersRemark
	) {
		return findByProperty(USERS_REMARK, usersRemark
		);
	}
	
	public List findByUsersIntegral(Object usersIntegral
	) {
		return findByProperty(USERS_INTEGRAL, usersIntegral
		);
	}
	
	public List findByUsersType(Object usersType
	) {
		return findByProperty(USERS_TYPE, usersType
		);
	}
	
	public List findByUsersPassword(Object usersPassword
	) {
		return findByProperty(USERS_PASSWORD, usersPassword
		);
	}
	
	public List findByUsersCode(Object usersCode
	) {
		return findByProperty(USERS_CODE, usersCode
		);
	}
	
	public List findByUsersPaypwd(Object usersPaypwd
	) {
		return findByProperty(USERS_PAYPWD, usersPaypwd
		);
	}
	

	public List findAll() {
		log.debug("finding all Userinfo instances");
		try {
			String queryString = "from Userinfo";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Userinfo merge(Userinfo detachedInstance) {
        log.debug("merging Userinfo instance");
        try {
            Userinfo result = (Userinfo) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Userinfo instance) {
        log.debug("attaching dirty Userinfo instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Userinfo instance) {
        log.debug("attaching clean Userinfo instance");
        try {
                      	getHibernateTemplate().lock(instance, LockMode.NONE);
                        log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static UserinfoDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (UserinfoDAO) ctx.getBean("UserinfoDAO");
	}
}