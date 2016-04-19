package action;

import model.User;
import service.UserService;

public class AddFamilyAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private UserService userService;
	private User user;
	
	public String execute(){
		User tmp = (User)this.request().getSession().getAttribute("user");
		String cardId = tmp.getCard_id();
		
		user.setCard_id(cardId);
		user.setIdentity(1);
		user.setCard_type(2);
		user.setRelationship("family");
		
		boolean isAdded = userService.addFamily(user);
		if(isAdded){
			System.out.println("added success");
		}else{
			System.out.println("added error");
		}
		return null;
	}

	public UserService getUserService() {
		
		return userService;
	}

	public void setUserService(UserService userService) {
		System.out.println("userService is setted in UserManageAction");
		this.userService = userService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		System.out.println("user is setted in UserManageAction");
		System.out.println(user.getName());
		this.user = user;
	}
	
}
