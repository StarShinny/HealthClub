package action;

import model.User;
import service.UserService;

public class ModifyUserInfoAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private UserService userService;
	private User user;
	
	
	public String execute(){
		boolean isUserModified = userService.updateUser(user);
		
		if(isUserModified){
			System.out.println("user modified suc");
		}else{
			System.out.println("user modified fail");
		}
		
		return null;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
