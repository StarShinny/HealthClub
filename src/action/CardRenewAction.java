package action;

import model.Card;
import service.CardService;
import service.ChargeHistoryService;

public class CardRenewAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private CardService cardService;
	private ChargeHistoryService chargeHistoryService;
	private Card card;
	
	public String execute(){
		boolean isRenewed = cardService.renewCard(card);
		
		if(isRenewed){
			System.out.println("card renewed suc");
		}else{
			System.out.println("card renewed fail");
		}
		
		return null;
	}

	public CardService getCardService() {
		return cardService;
	}

	public void setCardService(CardService cardService) {
		this.cardService = cardService;
	}

	public Card getCard() {
		return card;
	}

	public void setCard(Card card) {
		this.card = card;
	}

	public ChargeHistoryService getChargeHistoryService() {
		return chargeHistoryService;
	}

	public void setChargeHistoryService(ChargeHistoryService chargeHistoryService) {
		this.chargeHistoryService = chargeHistoryService;
	}
	
}
