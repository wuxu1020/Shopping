package shopping.service;

import shopping.dao.AdminDAO;
import shopping.model.Admin;

public class AdminService {
	private AdminDAO adminDAO;

	public AdminDAO getAdminDAO() {
		return adminDAO;
	}

	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}
	
	public boolean cheaklogin(String u,String p){
		Admin admin=adminDAO.findById(u);
		if(admin!=null)
			if(admin.getPassword().equals(p))
				return true;
		return false;
	}
	

}
