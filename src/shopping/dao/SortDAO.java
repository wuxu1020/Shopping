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
		try {
			getCurrentSession().save(transientInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void delete(Sort persistentInstance) {
		try {
			getCurrentSession().delete(persistentInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Sort findById(java.lang.String id) {
		try {
			Sort instance = (Sort) getCurrentSession().get("shopping.model.Sort", id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findByExample(Sort instance) {
		try {
			List results = getCurrentSession().createCriteria("shopping.model.Sort")
					.add(Example.create(instance)).list();
			return results;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		try {
			String queryString = "from Sort as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	
	public List findsort(Object value) {
		
		try {
			String queryString = "from Sort as model where model.sname like '%"+value+"%'";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
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
		try {
			String queryString = "from Sort";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Sort merge(Sort detachedInstance) {
		try {
			Sort result = (Sort) getCurrentSession().merge(detachedInstance);
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void attachDirty(Sort instance) {
		try {
			getCurrentSession().saveOrUpdate(instance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void attachClean(Sort instance) {
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public static SortDAO getFromApplicationContext(ApplicationContext ctx) {
		return (SortDAO) ctx.getBean("SortDAO");
	}
}