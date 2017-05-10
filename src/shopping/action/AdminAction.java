package shopping.action;

import java.util.List;

import shopping.model.User;
import shopping.service.AdminService;
import shopping.service.UserService;

public class AdminAction extends SuperAction{
	private String username;
	private String password;
	private AdminService adminservice;
	private UserService userservice;
	
	public UserService getUserservice() {
		return userservice;
	}
	public void setUserservice(UserService userservice) {
		this.userservice = userservice;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public AdminService getAdminservice() {
		return adminservice;
	}
	public void setAdminservice(AdminService adminservice) {
		this.adminservice = adminservice;
	}
	
	public String cheaklogin(){
		if(adminservice.cheaklogin(username, password))
			return "AdminLoginSuccess";
		return "AdminLoginFailed";
	}
	public String getUser(){
		List<User> userlist=userservice.userDAO.findAll();
		request.setAttribute("userlist", userlist);
		return "AdminUser";
	}
	
}
