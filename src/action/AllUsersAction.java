package action;

import java.util.List;

import model.User;
import service.UserService;

public class AllUsersAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private UserService userService;
	
	public String execute(){
		List<User> users = userService.allUsers();
		this.request().getSession().setAttribute("users", users);
		
		return SUCCESS;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
}
