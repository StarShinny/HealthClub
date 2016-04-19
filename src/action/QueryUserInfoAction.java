package action;

import java.util.List;

import model.ChargeHistory;
import model.Participation;
import model.User;
import service.ChargeHistoryService;
import service.ParticipationService;
import service.UserService;

public class QueryUserInfoAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private UserService userService;
	private ChargeHistoryService chargeHistoryService;
	private ParticipationService participationService;
	private String cardId;
	
	public String execute(){
		User user = userService.findUser(cardId);
		
		if(user != null){
			List<ChargeHistory> chargeHistories = chargeHistoryService.allChargeHistories(cardId);
			List<Participation> participations = participationService.allParticipations(cardId);
			
			this.request().getSession().setAttribute("User", user);
			this.request().getSession().setAttribute("ChargeHistories", chargeHistories);
			this.request().getSession().setAttribute("Participations", participations);
			
			if(user.getCard_type() == 2){
				List<User> families = userService.findFamily(cardId);
				this.request().getSession().setAttribute("families", families);
			}else{
				this.request().getSession().setAttribute("families", null);
			}
			
			return SUCCESS;
		}else{
			this.request().getSession().setAttribute("User", null);
			this.request().getSession().setAttribute("ChargeHistories", null);
			this.request().getSession().setAttribute("Participations", null);
			
			return "usererror";
		}
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public ChargeHistoryService getChargeHistoryService() {
		return chargeHistoryService;
	}

	public void setChargeHistoryService(ChargeHistoryService chargeHistoryService) {
		this.chargeHistoryService = chargeHistoryService;
	}

	public ParticipationService getParticipationService() {
		return participationService;
	}

	public void setParticipationService(ParticipationService participationService) {
		this.participationService = participationService;
	}

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	
}
