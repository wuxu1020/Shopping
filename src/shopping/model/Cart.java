package shopping.model;

/**
 * Cart entity. @author MyEclipse Persistence Tools
 */

public class Cart implements java.io.Serializable {

	// Fields

	private String cid;
	private String uid;
	private String pid;
	private String obuytime;
	private Integer ptotal;
	private Double price;
	private String pmpic;
	private String ptitle;

	// Constructors

	/** default constructor */
	public Cart() {
	}

	/** minimal constructor */
	public Cart(String cid) {
		this.cid = cid;
	}

	/** full constructor */
	public Cart(String cid, String uid, String pid, String obuytime,
			Integer ptotal, Double price, String pmpic, String ptitle) {
		this.cid = cid;
		this.uid = uid;
		this.pid = pid;
		this.obuytime = obuytime;
		this.ptotal = ptotal;
		this.price = price;
		this.pmpic = pmpic;
		this.ptitle = ptitle;
	}

	// Property accessors

	public String getCid() {
		return this.cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getUid() {
		return this.uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getPid() {
		return this.pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getObuytime() {
		return this.obuytime;
	}

	public void setObuytime(String obuytime) {
		this.obuytime = obuytime;
	}

	public Integer getPtotal() {
		return this.ptotal;
	}

	public void setPtotal(Integer ptotal) {
		this.ptotal = ptotal;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getPmpic() {
		return this.pmpic;
	}

	public void setPmpic(String pmpic) {
		this.pmpic = pmpic;
	}

	public String getPtitle() {
		return this.ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

}