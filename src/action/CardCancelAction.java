package action;

import model.Card;
import service.CardService;

public class CardCancelAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private CardService cardService;
	private Card card;
	
	public String execute(){
		boolean isCanceled = cardService.cancelCard(card);
		
		if(isCanceled){
			System.out.println("card canceled suc");
		}else{
			System.out.println("card canceled fail");
		}
		
		return SUCCESS;
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
}
