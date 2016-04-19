package action;

import service.UserService;
import model.User;

public class UpdateUserAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private User user;
	private UserService userService;
	
	public String execute(){
		System.out.println("updateUserAction is executing");
		User tmp = (User)this.request().getSession().getAttribute("user");
		
		user.setCard_id(tmp.getCard_id());
		user.setCard_type(tmp.getCard_type());
		user.setIdentity(1);
		
		boolean result = userService.updateUser(user);
		if(result){
			System.out.println("user updated");
		}else{
			System.out.println("user updated");
		}
		return null;
	}
	
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
	public UserService getUserService() {
		return userService;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
}
