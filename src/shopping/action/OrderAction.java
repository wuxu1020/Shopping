package shopping.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import shopping.model.Order;
import shopping.service.OrderService;

public class OrderAction extends SuperAction{
	private List<String> uid;
	private List<String> pid;
	private List<String> ptitle;
	private List<Double> price;
	private List<Integer> ptotal;
	private OrderService orderservice;
	
	public OrderService getOrderservice() {
		return orderservice;
	}
	public void setOrderservice(OrderService orderservice) {
		this.orderservice = orderservice;
	}
	public List<String> getUid() {
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
	}
	
	public String addtoorder(){
		Date nowTime=new Date();
		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		String ntime=time.format(nowTime);
		if(uid!=null&&uid.size()>0){
		for(int i=0;i<uid.size();i++){
			Order order=new Order();
			order.setOid(UUID.randomUUID().toString());
			order.setUsername(uid.get(i));
			order.setPid(pid.get(i));
			order.setPrice(price.get(i));
			order.setOstate("Î´·¢»õ");
			order.setPtotal(ptotal.get(i));
			order.setObuytime(ntime);
			orderservice.getOrderDAO().merge(order);
		}
		return "ToUserPay";
		}
		return "ToCart";
	}
}
