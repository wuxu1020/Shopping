package shopping.model;

/**
 * Sort entity. @author MyEclipse Persistence Tools
 */

public class Sort implements java.io.Serializable {

	// Fields

	private String sid;
	private String stype;
	private String sname;

	// Constructors

	/** default constructor */
	public Sort() {
	}

	/** minimal constructor */
	public Sort(String sid) {
		this.sid = sid;
	}

	/** full constructor */
	public Sort(String sid, String stype, String sname) {
		this.sid = sid;
		this.stype = stype;
		this.sname = sname;
	}

	// Property accessors

	public String getSid() {
		return this.sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getStype() {
		return this.stype;
	}

	public void setStype(String stype) {
		this.stype = stype;
	}

	public String getSname() {
		return this.sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

}