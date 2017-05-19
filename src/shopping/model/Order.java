package shopping.model;

/**
 * Order entity. @author MyEclipse Persistence Tools
 */

public class Order implements java.io.Serializable {

	// Fields

	private String oid;
	private String username;
	private String pid;
	private Double price;
	private String ptotal;
	private String ostate;
	private String obuytime;
	private String odelivertime;

	// Constructors

	/** default constructor */
	public Order() {
	}

	/** minimal constructor */
	public Order(String oid) {
		this.oid = oid;
	}

	/** full constructor */
	public Order(String oid, String username, String pid, Double price,
			String ptotal, String ostate, String obuytime, String odelivertime) {
		this.oid = oid;
		this.username = username;
		this.pid = pid;
		this.price = price;
		this.ptotal = ptotal;
		this.ostate = ostate;
		this.obuytime = obuytime;
		this.odelivertime = odelivertime;
	}

	// Property accessors

	public String getOid() {
		return this.oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPid() {
		return this.pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getPtotal() {
		return this.ptotal;
	}

	public void setPtotal(String ptotal) {
		this.ptotal = ptotal;
	}

	public String getOstate() {
		return this.ostate;
	}

	public void setOstate(String ostate) {
		this.ostate = ostate;
	}

	public String getObuytime() {
		return this.obuytime;
	}

	public void setObuytime(String obuytime) {
		this.obuytime = obuytime;
	}

	public String getOdelivertime() {
		return this.odelivertime;
	}

	public void setOdelivertime(String odelivertime) {
		this.odelivertime = odelivertime;
	}

}