package shopping.service;

import shopping.dao.CartDAO;

public class CartService {
	private CartDAO cartDAO;

	public CartDAO getCartDAO() {
		return cartDAO;
	}

	public void setCartDAO(CartDAO cartDAO) {
		this.cartDAO = cartDAO;
	}

	
	
}
