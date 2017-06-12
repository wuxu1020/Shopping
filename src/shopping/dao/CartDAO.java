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

import shopping.model.Cart;

/**
 * A data access object (DAO) providing persistence and search support for Cart
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see shopping.model.Cart
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class CartDAO {
	private static final Logger log = LoggerFactory.getLogger(CartDAO.class);
	// property constants
	public static final String UID = "uid";
	public static final String PID = "pid";
	public static final String OBUYTIME = "obuytime";
	public static final String PTOTAL = "ptotal";
	public static final String PRICE = "price";
	public static final String PMPIC = "pmpic";
	public static final String PTITLE = "ptitle";

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

	public void save(Cart transientInstance) {
		try {
			getCurrentSession().save(transientInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void delete(Cart persistentInstance) {
		try {
			getCurrentSession().delete(persistentInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Cart findById(java.lang.String id) {
		try {
			Cart instance = (Cart) getCurrentSession().get("shopping.model.Cart", id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findByExample(Cart instance) {
		try {
			List results = getCurrentSession().createCriteria("shopping.model.Cart")
					.add(Example.create(instance)).list();
			return results;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		try {
			String queryString = "from Cart as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
public List cheakcart(String uid, String pid) {
		
		try {
			String queryString = "from Cart as model where model.uid='"+uid+"' and model.pid='"+pid+"'";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findByUid(Object uid) {
		return findByProperty(UID, uid);
	}

	public List findByPid(Object pid) {
		return findByProperty(PID, pid);
	}

	public List findByObuytime(Object obuytime) {
		return findByProperty(OBUYTIME, obuytime);
	}

	public List findByPtotal(Object ptotal) {
		return findByProperty(PTOTAL, ptotal);
	}

	public List findByPrice(Object price) {
		return findByProperty(PRICE, price);
	}

	public List findByPmpic(Object pmpic) {
		return findByProperty(PMPIC, pmpic);
	}

	public List findByPtitle(Object ptitle) {
		return findByProperty(PTITLE, ptitle);
	}

	public List findAll() {
		try {
			String queryString = "from Cart";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Cart merge(Cart detachedInstance) {
		try {
			Cart result = (Cart) getCurrentSession().merge(detachedInstance);
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void attachDirty(Cart instance) {
		try {
			getCurrentSession().saveOrUpdate(instance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void attachClean(Cart instance) {
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public static CartDAO getFromApplicationContext(ApplicationContext ctx) {
		return (CartDAO) ctx.getBean("CartDAO");
	}
}