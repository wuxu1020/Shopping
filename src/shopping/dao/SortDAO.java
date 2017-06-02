package shopping.dao;

import java.util.List;

import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

import shopping.model.Sort;

/**
 * A data access object (DAO) providing persistence and search support for Sort
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see shopping.model.Sort
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class SortDAO {
	private static final Logger log = LoggerFactory.getLogger(SortDAO.class);
	// property constants
	public static final String STYPE = "stype";
	public static final String SNAME = "sname";

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	protected void initDao() {
		// do nothing
	}

	public void save(Sort transientInstance) {
		log.debug("saving Sort instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Sort persistentInstance) {
		log.debug("deleting Sort instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Sort findById(java.lang.String id) {
		log.debug("getting Sort instance with id: " + id);
		try {
			Sort instance = (Sort) getCurrentSession().get("shopping.model.Sort", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(Sort instance) {
		log.debug("finding Sort instance by example");
		try {
			List results = getCurrentSession().createCriteria("shopping.model.Sort")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Sort instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Sort as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	
	public List findsort(Object value) {
		
		try {
			String queryString = "from Sort as model where model.sname like '%"+value+"%'";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByStype(Object stype) {
		return findByProperty(STYPE, stype);
	}

	public List findBySname(Object sname) {
		return findByProperty(SNAME, sname);
	}

	public List findAll() {
		log.debug("finding all Sort instances");
		try {
			String queryString = "from Sort";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Sort merge(Sort detachedInstance) {
		log.debug("merging Sort instance");
		try {
			Sort result = (Sort) getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Sort instance) {
		log.debug("attaching dirty Sort instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Sort instance) {
		log.debug("attaching clean Sort instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static SortDAO getFromApplicationContext(ApplicationContext ctx) {
		return (SortDAO) ctx.getBean("SortDAO");
	}
}