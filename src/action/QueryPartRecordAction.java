package action;

import java.util.List;

import service.ParticipationService;
import model.Card;
import model.Participation;

//会员查看我参加的活动记录
public class QueryPartRecordAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private ParticipationService participationService;
	
	public String execute(){
		Card card = (Card)request().getSession().getAttribute("card");
		String cardId = card.getCard_id();
		
		System.out.println("用户卡号为："+cardId);
		
		List<Participation> participations = participationService.allParticipations(cardId);
		if(participations != null){
			this.request().getSession().setAttribute("participations", participations);
		}else{
			this.request().getSession().setAttribute("participations", null);
		}
		return SUCCESS;
	}

	public ParticipationService getParticipationService() {
		return participationService;
	}

	public void setParticipationService(ParticipationService participationService) {
		this.participationService = participationService;
	}

}
