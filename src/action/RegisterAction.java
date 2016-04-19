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

public class RegisterAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private UserService userService;
	private CardService cardService;
	private ActivityService activityService;
	private User user;
	
	public String execute(){
		if(userService == null || cardService == null){
			System.out.println("userService or cardService is null");
		}
		
		int cardType = user.getCard_type();
		Card card = cardService.createCard(cardType);
		if(user.getCard_type() == 1){
			card.setActive_charge(70);
		}else{
			card.setActive_charge(100);
		}
		
		user.setCard_id(card.getCard_id());
		user.setIdentity(1);
		
		boolean isSuccess = userService.registerUser(user);
		if(isSuccess){
			Hashtable<Activity, List<ActSession>> actHash = activityService.allActivities();
			
			this.request().getSession().setAttribute("activities", actHash);
			this.request().getSession().setAttribute("card", card);
			this.request().getSession().setAttribute("user",user);
			return SUCCESS;
		}else{
			return INPUT;
		}
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		System.out.println("userService is setted in registerAction");
		this.userService = userService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		System.out.println("user is setted in registerAction");
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
