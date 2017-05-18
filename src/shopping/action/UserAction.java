package shopping.action;

import shopping.model.User;
import shopping.service.UserService;

public class UserAction extends SuperAction{
	private String username;
	private String password;
	private Integer age;
	private String sex;
	private String phone;
	private UserService userservice;
	
	
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
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
	
	public String cheakLogin(){
		if(userservice.cheakLogin(username, password)){
			session.setAttribute("UID", username);
			return "LoginSuccess";
		}
		return "Loginfailed";
	}
	
	public String register(){
		if(userservice.cheakusername(username)){
			User user=new User();
			user.setUsername(username);
			user.setAge(age);
			user.setPassword(password);
			user.setPhone(phone);
			user.setSex(sex);
			userservice.userDAO.merge(user);
			return "RegisterSuccess";
		}
		return "RegisterFailed";
	}
	
	public String deluser(){
		User user=userservice.getUserDAO().findById(username);
		if(user!=null){
			userservice.getUserDAO().delete(user);
		}
		return "AjaxResult";
	}
}
