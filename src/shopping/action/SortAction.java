package shopping.action;

import java.util.List;
import java.util.UUID;

import shopping.model.Sort;
import shopping.service.SortService;

public class SortAction extends SuperAction{
	private String sid;
	private String stype;
	private String sname;
	private String result;
	private Sort sort;
	private SortService sortservice;
	private List<Sort> sortlist;
	
	
	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public List<Sort> getSortlist() {
		return sortlist;
	}

	public void setSortlist(List<Sort> sortlist) {
		this.sortlist = sortlist;
	}

	public Sort getSort() {
		return sort;
	}

	public void setSort(Sort sort) {
		this.sort = sort;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getStype() {
		return stype;
	}

	public void setStype(String stype) {
		this.stype = stype;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public SortService getSortservice() {
		return sortservice;
	}

	public void setSortservice(SortService sortservice) {
		this.sortservice = sortservice;
	}

	public String addSort(){
		if(sortservice.getSortDAO().findBySname(sname).size()!=0)
			result="have";
		else {
			sort=new Sort();
			sort.setSid(UUID.randomUUID().toString());
			sort.setSname(sname);
			sort.setStype(stype);
			sortservice.getSortDAO().merge(sort);
			result="success";
		}
		
		return "AjaxResult";
	}
	
	public String searchSort(){
		sortlist=sortservice.getSortDAO().findsort(sname);
		return "AjaxResult";
	}
	
	public String delsort(){
		sort=sortservice.getSortDAO().findById(sid);
		if(sort!=null)
			sortservice.getSortDAO().delete(sort);
		return "AjaxResult";
	}
	
	public String getAllsort(){
		sortlist=sortservice.getSortDAO().findAll();
		return "AjaxResult";
	}
}
