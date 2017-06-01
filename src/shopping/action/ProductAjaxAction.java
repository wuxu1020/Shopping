package shopping.action;

import java.util.List;

import shopping.json.JsonUtil;
import shopping.model.Product;
import shopping.service.ProductService;

public class ProductAjaxAction {
	private String searchvalue;
	private String searchresult;
	private Integer maxpage;
	private Integer page;
	private ProductService productservice;
	


	public void setSearchvalue(String searchvalue) {
		this.searchvalue = searchvalue;
	}


	public String getSearchresult() {
		return searchresult;
	}


	public void setSearchresult(String searchresult) {
		this.searchresult = searchresult;
	}


	public Integer getMaxpage() {
		return maxpage;
	}


	public void setMaxpage(Integer maxpage) {
		this.maxpage = maxpage;
	}


	public Integer getPage() {
		return page;
	}


	public void setPage(Integer page) {
		this.page = page;
	}


	public void setProductservice(ProductService productservice) {
		this.productservice = productservice;
	}


	public String showproduct(){
		int perpage=10;
		List<Product> plist;
		if(searchvalue.equals("")||searchvalue==null){
			plist=productservice.getProductDAO().findAll();
		}
		else {
			plist=productservice.getProductDAO().findByPropertyV("pname", searchvalue);
			
		}
		maxpage=(plist.size()+perpage-1)/perpage;
		int i=(page-1)*perpage;
		if(i<plist.size()){
			int toindex=(i+perpage)<=plist.size()?i+10:plist.size();
			searchresult=JsonUtil.listToJson(plist.subList(i, toindex));
		}
		return "AjaxResult";
	}
	
	public String newproduct(){
		List<Product> plist=productservice.getProductDAO().getNewProduct();
		searchresult=JsonUtil.listToJson(plist);
		return "AjaxResult";
	}
	
	public String hotproduct(){
		List<Product> plist=productservice.getProductDAO().getHotProduct();
		searchresult=JsonUtil.listToJson(plist);
		return "AjaxResult";
	}
}
