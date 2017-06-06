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
	private Integer ptotal;
	private String ostate;
	private String obuytime;
	private String odelivertime;
	private String oaddress;
	private String ptitle;
	private String pmpic;
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
			Integer ptotal, String ostate, String obuytime, String odelivertime,
			String oaddress,String ptitle,String pmpic) {
		this.oid = oid;
		this.username = username;
		this.pid = pid;
		this.price = price;
		this.ptotal = ptotal;
		this.ostate = ostate;
		this.obuytime = obuytime;
		this.odelivertime = odelivertime;
		this.oaddress=oaddress;
		this.ptitle=ptitle;
		this.pmpic=pmpic;
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

	public Integer getPtotal() {
		return this.ptotal;
	}

	public void setPtotal(Integer ptotal) {
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

	public String getOaddress() {
		return oaddress;
	}

	public void setOaddress(String oaddress) {
		this.oaddress = oaddress;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPmpic() {
		return pmpic;
	}

	public void setPmpic(String pmpic) {
		this.pmpic = pmpic;
	}
	
}