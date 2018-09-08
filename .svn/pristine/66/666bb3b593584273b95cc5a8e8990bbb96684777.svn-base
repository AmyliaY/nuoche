package com.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.User;

/**
 	* A data access object (DAO) providing persistence and search support for User entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.pojo.User
  * @author MyEclipse Persistence Tools 
 */
public class UserDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(UserDAO.class);
		//property constants
	public static final String PLATE_NUMBER = "plateNumber";
	public static final String QRCODE = "qrcode";
	public static final String HEADIMAGE = "headimage";
	public static final String OVERDUE = "overdue";
	public static final String NAME = "name";
	public static final String SEX = "sex";
	public static final String ADDRESS = "address";
	public static final String ROLE = "role";
	public static final String FREQUENCY = "frequency";
	public static final String BEINUOCHE = "beinuoche";
	public static final String TEL = "tel";
	public static final String TUIJIANREN = "tuijianren";
	public static final String KETIXIAN = "ketixian";
	public static final String YITIXIAN = "yitixian";
	public static final String WEITIXIAN = "weitixian";
	public static final String CHEPAIQIANZHUI = "chepaiqianzhui";
	public static final String A1 = "a1";
	public static final String A2 = "a2";
	public static final String B1 = "b1";
	public static final String B2 = "b2";



	protected void initDao() {
		//do nothing
	}
    
    public void save(User transientInstance) {
        log.debug("saving User instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(User persistentInstance) {
        log.debug("deleting User instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public User findById( java.lang.Integer id) {
        log.debug("getting User instance with id: " + id);
        try {
            User instance = (User) getHibernateTemplate()
                    .get("com.pojo.User", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(User instance) {
        log.debug("finding User instance by example");
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
      log.debug("finding User instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from User as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByPlateNumber(Object plateNumber
	) {
		return findByProperty(PLATE_NUMBER, plateNumber
		);
	}
	
	public List findByQrcode(Object qrcode
	) {
		return findByProperty(QRCODE, qrcode
		);
	}
	
	public List findByHeadimage(Object headimage
	) {
		return findByProperty(HEADIMAGE, headimage
		);
	}
	
	public List findByOverdue(Object overdue
	) {
		return findByProperty(OVERDUE, overdue
		);
	}
	
	public List findByName(Object name
	) {
		return findByProperty(NAME, name
		);
	}
	
	public List findBySex(Object sex
	) {
		return findByProperty(SEX, sex
		);
	}
	
	public List findByAddress(Object address
	) {
		return findByProperty(ADDRESS, address
		);
	}
	
	public List findByRole(Object role
	) {
		return findByProperty(ROLE, role
		);
	}
	
	public List findByFrequency(Object frequency
	) {
		return findByProperty(FREQUENCY, frequency
		);
	}
	
	public List findByBeinuoche(Object beinuoche
	) {
		return findByProperty(BEINUOCHE, beinuoche
		);
	}
	
	public List findByTel(Object tel
	) {
		return findByProperty(TEL, tel
		);
	}
	
	public List findByTuijianren(Object tuijianren
	) {
		return findByProperty(TUIJIANREN, tuijianren
		);
	}
	
	public List findByKetixian(Object ketixian
	) {
		return findByProperty(KETIXIAN, ketixian
		);
	}
	
	public List findByYitixian(Object yitixian
	) {
		return findByProperty(YITIXIAN, yitixian
		);
	}
	
	public List findByWeitixian(Object weitixian
	) {
		return findByProperty(WEITIXIAN, weitixian
		);
	}
	
	public List findByChepaiqianzhui(Object chepaiqianzhui
	) {
		return findByProperty(CHEPAIQIANZHUI, chepaiqianzhui
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
		log.debug("finding all User instances");
		try {
			String queryString = "from User";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public User merge(User detachedInstance) {
        log.debug("merging User instance");
        try {
            User result = (User) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(User instance) {
        log.debug("attaching dirty User instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(User instance) {
        log.debug("attaching clean User instance");
        try {
                      	getHibernateTemplate().lock(instance, LockMode.NONE);
                        log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static UserDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (UserDAO) ctx.getBean("UserDAO");
	}
}