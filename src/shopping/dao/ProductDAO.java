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

import shopping.model.Product;

/**
 * A data access object (DAO) providing persistence and search support for
 * Product entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see shopping.model.Product
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class ProductDAO {
	private static final Logger log = LoggerFactory.getLogger(ProductDAO.class);
	// property constants
	public static final String PNAME = "pname";
	public static final String PRICE = "price";
	public static final String PSTOCK = "pstock";
	public static final String PTYPE = "ptype";
	public static final String PMPIC = "pmpic";
	public static final String PDPIC = "pdpic";
	public static final String PDETAIL = "pdetail";
	public static final String PDESCRIPTION = "pdescription";
	public static final String PSALES = "psales";

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

	public void save(Product transientInstance) {
		try {
			getCurrentSession().save(transientInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void delete(Product persistentInstance) {
		try {
			getCurrentSession().delete(persistentInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Product findById(java.lang.String id) {
		try {
			Product instance = (Product) getCurrentSession().get(
					"shopping.model.Product", id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		try {
			String queryString = "from Product as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List getHotProduct() {
		try {
			String queryString = "from Product as model order by model.psales desc";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setMaxResults(10);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List getNewProduct() {
		try {
			String queryString = "from Product as model order by model.uptime desc";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setMaxResults(10);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public List findByPropertyV(String propertyName, Object value) {
		
		try {
			String queryString = "from Product as model where model.ptype like '%"+value+"%' or model."
					+ propertyName + " like ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, "%"+value+"%");
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public List findByPname(Object pname) {
		return findByProperty(PNAME, pname);
	}

	public List findByPrice(Object price) {
		return findByProperty(PRICE, price);
	}

	public List findByPstock(Object pstock) {
		return findByProperty(PSTOCK, pstock);
	}

	public List findByPtype(Object ptype) {
		return findByProperty(PTYPE, ptype);
	}

	public List findByPmpic(Object pmpic) {
		return findByProperty(PMPIC, pmpic);
	}

	public List findByPdpic(Object pdpic) {
		return findByProperty(PDPIC, pdpic);
	}

	public List findByPdetail(Object pdetail) {
		return findByProperty(PDETAIL, pdetail);
	}

	public List findByPdescription(Object pdescription) {
		return findByProperty(PDESCRIPTION, pdescription);
	}

	public List findByPsales(Object psales) {
		return findByProperty(PSALES, psales);
	}

	public List findAll() {
		try {
			String queryString = "from Product";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Product merge(Product detachedInstance) {
		try {
			Product result = (Product) getCurrentSession().merge(
					detachedInstance);
			return result;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void attachDirty(Product instance) {
		try {
			getCurrentSession().saveOrUpdate(instance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void attachClean(Product instance) {
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public static ProductDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ProductDAO) ctx.getBean("ProductDAO");
	}
}