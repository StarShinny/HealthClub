package action;

import service.UserService;

public class LogoutAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private UserService userService;
	
	public String execute(){
		request().getSession().invalidate();
		return "logout";
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
