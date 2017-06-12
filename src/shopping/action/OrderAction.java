package shopping.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import shopping.model.Cart;
import shopping.model.Order;
import shopping.model.Product;
import shopping.service.CartService;
import shopping.service.OrderService;
import shopping.service.ProductService;

public class OrderAction extends SuperAction{
	/*private List<String> uid;
	private List<String> pid;
	private List<String> ptitle;
	private List<Double> price;
	private List<Integer> ptotal;*/
	private List<String> cid;
	private String oaddress;
	private String oid;
	private OrderService orderservice;
	private CartService cartservice;
	private ProductService productservice;
	
	
	
	
	public void setProductservice(ProductService productservice) {
		this.productservice = productservice;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public List<String> getCid() {
		return cid;
	}
	public void setCid(List<String> cid) {
		this.cid = cid;
	}
	public void setCartservice(CartService cartservice) {
		this.cartservice = cartservice;
	}
	public String getOaddress() {
		return oaddress;
	}
	public void setOaddress(String oaddress) {
		this.oaddress = oaddress;
	}
	
	public void setOrderservice(OrderService orderservice) {
		this.orderservice = orderservice;
	}
	/*public List<String> getUid() {
		return uid;
	}
	public void setUid(List<String> uid) {
		this.uid = uid;
	}
	public List<String> getPid() {
		return pid;
	}
	public void setPid(List<String> pid) {
		this.pid = pid;
	}
	public List<String> getPtitle() {
		return ptitle;
	}
	public void setPtitle(List<String> ptitle) {
		this.ptitle = ptitle;
	}
	public List<Double> getPrice() {
		return price;
	}
	public void setPrice(List<Double> price) {
		this.price = price;
	}
	public List<Integer> getPtotal() {
		return ptotal;
	}
	public void setPtotal(List<Integer> ptotal) {
		this.ptotal = ptotal;
	}*/
	
	public String addtoorder(){
		Date nowTime=new Date();
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		String ntime=time.format(nowTime);
		if(cid!=null&&cid.size()>0){
			List<Cart> olist=new ArrayList<Cart>();
			for(int j=0;j<cid.size();j++){
				Cart cart=cartservice.getCartDAO().findById(cid.get(j));
				if(cart!=null){
					olist.add(cart);
				}
			}
		for(int i=0;i<olist.size();i++){
			Order order=new Order();
			order.setOid(UUID.randomUUID().toString());
			order.setUsername(olist.get(i).getUid());
			order.setPid(olist.get(i).getPid());
			order.setPrice(olist.get(i).getPrice());
			order.setOstate("未发货");
			order.setPtotal(olist.get(i).getPtotal());
			order.setPtitle(olist.get(i).getPtitle());
			order.setPmpic(olist.get(i).getPmpic());
			order.setObuytime(ntime);
			order.setOaddress(oaddress);
			orderservice.getOrderDAO().merge(order);
			cartservice.getCartDAO().delete(olist.get(i));
			
			Product product = productservice.getProductDAO().findById(olist.get(i).getPid());
			if(product!=null){
				product.setPstock(product.getPstock()-1>=0?product.getPstock()-1:0);
				if(product.getPsales()==null)
					product.setPsales(1);
				else product.setPsales(product.getPsales()+1);
				productservice.getProductDAO().merge(product);
			}
		}
		}
		return "ToCart";
	}
	
	public String usershoworder(){
		String username=(String)session.getAttribute("UID");
		if(username!=null){
		List<Order> orderlist=orderservice.getOrderDAO().findByUsername(username);
		request.setAttribute("orderlist", orderlist);
		}
		return "ToUserOrder";
	}
	
	public String showorder(){
		List<Order> orderlist=orderservice.getOrderDAO().findAll();
		request.setAttribute("orderlist", orderlist);
		return "ToAdminOrder";
	}
	
	public String deliver(){
		Order order=orderservice.getOrderDAO().findById(oid);
		if(order!=null){
			order.setOstate("已发货");
			orderservice.getOrderDAO().merge(order);
		}
		return "AjaxResult";
	}
	
	public String subfinish(){
		Order order=orderservice.getOrderDAO().findById(oid);
		if(order!=null){
			order.setOstate("已完成");
			orderservice.getOrderDAO().merge(order);
		}
		return "AjaxResult";
	}
}
