
package action;

import java.util.Hashtable;
import java.util.List;

import model.ActSession;
import model.Activity;
import model.Card;
import model.User;
import service.ActivityService;
import service.CardService;
import service.UserService;

public class LoginAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private UserService userService;
	private CardService cardService;
	private ActivityService activityService;
	private User user;
	
	public String execute() {
		if(userService == null){
			System.out.println("userService is null");
		}

		String name = user.getName();
		String password = user.getPassword();
		int identity = user.getIdentity();
		
		if(name == "" || password == ""){
			return INPUT;
		}

		if((user = userService.loginUser(name,password,identity)) == null){
			System.out.println("user is null");
			return "inexist";
		}
		else{
			switch (identity) {
			case 1:
				String cardId = user.getCard_id();
				Card card = cardService.findCard(cardId);
				Hashtable<Activity, List<ActSession>> actHash = activityService.allActivities();
				
				this.request().getSession().setAttribute("activities", actHash);
				this.request().getSession().setAttribute("card", card);
				this.request().getSession().setAttribute("user",user);
				
				if(user.getCard_type() == 2){
					List<User> families = userService.findFamily(cardId);
					this.request().getSession().setAttribute("families", families);
				}else{
					this.request().getSession().setAttribute("families", null);
				}
				
				return "member";
			case 2:
				Hashtable<Activity, List<ActSession>> actHash2 = activityService.allActivities();
				System.out.println(actHash2.size());
				this.request().getSession().setAttribute("activities", actHash2);
				this.request().getSession().setAttribute("user",user);
				
				return "waiter";
			case 3:
				
				this.request().getSession().setAttribute("user",user);
				
				return "manager";
			default:
				return "inexist";
			}
		}
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		System.out.println("userService is setted in loginAction");
		this.userService = userService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		System.out.println("user is setted in loginAction");
		System.out.println(user.getName());
		this.user = user;
	}

	public CardService getCardService() {
		return cardService;
	}

	public void setCardService(CardService cardService) {
		this.cardService = cardService;
	}

	public ActivityService getActivityService() {
		return activityService;
	}

	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}

}
