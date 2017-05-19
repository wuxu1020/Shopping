package shopping.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import shopping.model.Cart;
import shopping.model.Product;
import shopping.service.CartService;
import shopping.service.ProductService;

public class CartAction extends SuperAction {
	private String uid;
	private String pid;
	private CartService cartservice;
	private ProductService productservice;
	private List<Cart> cartlist;
	
	public List<Cart> getCartlist() {
		return cartlist;
	}

	public void setCartlist(List<Cart> cartlist) {
		this.cartlist = cartlist;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public CartService getCartservice() {
		return cartservice;
	}

	public void setCartservice(CartService cartservice) {
		this.cartservice = cartservice;
	}

	public ProductService getProductservice() {
		return productservice;
	}

	public void setProductservice(ProductService productservice) {
		this.productservice = productservice;
	}

	public String addcart() {
		List<Cart> clist = cartservice.getCartDAO().cheakcart(uid, pid);
		if (clist.size() != 0) {
			Cart cart=clist.get(0);
			cart.setPtotal(cart.getPtotal()+1);
			cartservice.getCartDAO().merge(cart);
		} else {
			Product product=productservice.getProductDAO().findById(pid);
			if(product!=null){
			Cart cart = new Cart();
			Date intime = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String sDate = sdf.format(intime);
			cart.setCid(UUID.randomUUID().toString());
			cart.setPid(pid);
			cart.setUid(uid);
			cart.setObuytime(sDate);
			cart.setPtotal(1);
			cart.setPrice(product.getPrice());
			cart.setPtitle(product.getPname());
			cart.setPmpic(product.getPmpic());
			cartservice.getCartDAO().merge(cart);
			}
		}
		return "AjaxResult";
	}
	
	public String showcart(){
		cartlist=cartservice.getCartDAO().findByUid(uid);
		
		return "AjaxResult";
	}
}
