package shopping.model;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */

public class Product implements java.io.Serializable {

	// Fields

	private String pid;
	private String pname;
	private Double price;
	private Integer pstock;
	private String ptype;
	private String pmpic;
	private String pdpic;
	private String pdetail;
	private String pdescription;
	private Integer psales;
	private String uptime;

	// Constructors

	/** default constructor */
	public Product() {
	}

	/** minimal constructor */
	public Product(String pid) {
		this.pid = pid;
	}

	/** full constructor */
	public Product(String pid, String pname, Double price, Integer pstock,
			String ptype, String pmpic, String pdpic, String pdetail,
			String pdescription, Integer psales,String uptime) {
		this.pid = pid;
		this.pname = pname;
		this.price = price;
		this.pstock = pstock;
		this.ptype = ptype;
		this.pmpic = pmpic;
		this.pdpic = pdpic;
		this.pdetail = pdetail;
		this.pdescription = pdescription;
		this.psales = psales;
		this.uptime=uptime;
	}

	// Property accessors
    
	public String getPid() {
		return this.pid;
	}

	public String getUptime() {
		return uptime;
	}

	public void setUptime(String uptime) {
		this.uptime = uptime;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getPstock() {
		return this.pstock;
	}

	public void setPstock(Integer pstock) {
		this.pstock = pstock;
	}

	public String getPtype() {
		return this.ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public String getPmpic() {
		return this.pmpic;
	}

	public void setPmpic(String pmpic) {
		this.pmpic = pmpic;
	}

	public String getPdpic() {
		return this.pdpic;
	}

	public void setPdpic(String pdpic) {
		this.pdpic = pdpic;
	}

	public String getPdetail() {
		return this.pdetail;
	}

	public void setPdetail(String pdetail) {
		this.pdetail = pdetail;
	}

	public String getPdescription() {
		return this.pdescription;
	}

	public void setPdescription(String pdescription) {
		this.pdescription = pdescription;
	}

	public Integer getPsales() {
		return this.psales;
	}

	public void setPsales(Integer psales) {
		this.psales = psales;
	}

}