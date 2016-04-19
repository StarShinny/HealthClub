package action;

import java.text.SimpleDateFormat;
import java.util.Date;

import model.Card;
import model.ChargeHistory;
import service.CardService;
import service.ChargeHistoryService;

public class CardActiveAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private CardService cardService;
	private ChargeHistoryService chargeHistoryService;
	private Card card;
	private String account;
	
	public String execute(){
		boolean isActived = cardService.activeCard(card);
		
		if(isActived){
			System.out.println("card actived suc");
		}else{
			System.out.println("card actived fail");
		}
		
		ChargeHistory chargeHistory = new ChargeHistory();
		chargeHistory.setCard_id(card.getCard_id());
		chargeHistory.setPayment(card.getActive_charge());
		chargeHistory.setAccount(account);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
		String date = format.format(new Date());		
		chargeHistory.setCharge_time(date);
		
		chargeHistoryService.pay(chargeHistory);
		return SUCCESS;
	}

	public CardService getCardService() {
		return cardService;
	}

	public void setCardService(CardService cardService) {
		this.cardService = cardService;
	}

	public ChargeHistoryService getChargeHistoryService() {
		return chargeHistoryService;
	}

	public void setChargeHistoryService(ChargeHistoryService chargeHistoryService) {
		this.chargeHistoryService = chargeHistoryService;
	}

	public Card getCard() {
		return card;
	}

	public void setCard(Card card) {
		this.card = card;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}
	
}
