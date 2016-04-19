package action;

import java.util.List;

import model.User;
import service.UserService;

public class QueryUserStaticsAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private UserService userService;
	
	public String execute(){
		List<User> users = userService.findUsers();
		
		if(users != null){
			this.request().getSession().setAttribute("Users", users);
			return SUCCESS;
		}else{
			this.request().getSession().setAttribute("Users", null);
			return ERROR;
		}
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
}
