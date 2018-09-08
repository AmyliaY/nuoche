package com.dao;

import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.PeisongCorp;

/**
 	* A data access object (DAO) providing persistence and search support for PeisongCorp entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.pojo.PeisongCorp
  * @author MyEclipse Persistence Tools 
 */
public class PeisongCorpDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(PeisongCorpDAO.class);
		//property constants
	public static final String PSCCHINESENAME = "pscchinesename";
	public static final String PSCENGLISHNAME = "pscenglishname";
	public static final String PSCURL = "pscurl";
	public static final String PSCDESC = "pscdesc";
	public static final String PSCSTATUS = "pscstatus";
	public static final String A1 = "a1";
	public static final String A2 = "a2";
	public static final String B1 = "b1";
	public static final String B2 = "b2";



	protected void initDao() {
		//do nothing
	}
    
    public void save(PeisongCorp transientInstance) {
        log.debug("saving PeisongCorp instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(PeisongCorp persistentInstance) {
        log.debug("deleting PeisongCorp instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public PeisongCorp findById( java.lang.Integer id) {
        log.debug("getting PeisongCorp instance with id: " + id);
        try {
            PeisongCorp instance = (PeisongCorp) getHibernateTemplate()
                    .get("com.pojo.PeisongCorp", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(PeisongCorp instance) {
        log.debug("finding PeisongCorp instance by example");
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
      log.debug("finding PeisongCorp instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from PeisongCorp as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByPscchinesename(Object pscchinesename
	) {
		return findByProperty(PSCCHINESENAME, pscchinesename
		);
	}
	
	public List findByPscenglishname(Object pscenglishname
	) {
		return findByProperty(PSCENGLISHNAME, pscenglishname
		);
	}
	
	public List findByPscurl(Object pscurl
	) {
		return findByProperty(PSCURL, pscurl
		);
	}
	
	public List findByPscdesc(Object pscdesc
	) {
		return findByProperty(PSCDESC, pscdesc
		);
	}
	
	public List findByPscstatus(Object pscstatus
	) {
		return findByProperty(PSCSTATUS, pscstatus
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
		log.debug("finding all PeisongCorp instances");
		try {
			String queryString = "from PeisongCorp";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public PeisongCorp merge(PeisongCorp detachedInstance) {
        log.debug("merging PeisongCorp instance");
        try {
            PeisongCorp result = (PeisongCorp) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(PeisongCorp instance) {
        log.debug("attaching dirty PeisongCorp instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(PeisongCorp instance) {
        log.debug("attaching clean PeisongCorp instance");
        try {
                      	getHibernateTemplate().lock(instance, LockMode.NONE);
                        log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static PeisongCorpDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (PeisongCorpDAO) ctx.getBean("PeisongCorpDAO");
	}
}