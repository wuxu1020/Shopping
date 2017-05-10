package shopping.service;

import shopping.dao.UserDAO;
import shopping.model.User;

public class UserService {
	public UserDAO userDAO;

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	public boolean cheakLogin(String u,String p){
		User user=userDAO.findById(u);
		if(user!=null){
			if(user.getPassword().equals(p))
				return true;
		}
		return false;
	}
	
	public boolean cheakusername(String u){
		if(userDAO.findById(u)==null)
			return true;
		return false;
	}
}
