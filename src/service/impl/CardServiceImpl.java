package service.impl;

import java.util.Random;

import dao.CardDao;
import model.Card;
import service.CardService;

public class CardServiceImpl implements CardService{
	private CardDao cardDao;
	
	@Override
	public Card createCard(int cardType) {
		// TODO Auto-generated method stub
		Card card = new Card();
		String card_id = null;
		double monthly_charge = 0;
		double active_charge = 0;
		
		if(cardType == 1){
			card_id = "S"+generateRandom();
			monthly_charge = 40;
			active_charge = 75;
		}else{
			card_id = "F"+generateRandom();
			monthly_charge = 55;
			monthly_charge = 100;
		}
		
		card.setCard_id(card_id);
		card.setCard_state(1);
		card.setMonthly_charge(monthly_charge);
		card.setActive_charge(active_charge);
		
		return cardDao.save(card);
	}
	
	//生成6位不重复随机数
	private int generateRandom(){
		int[] array = {0,1,2,3,4,5,6,7,8,9};
		Random rand = new Random();
		for (int i = 10; i > 1; i--) {
		    int index = rand.nextInt(i);
		    int tmp = array[index];
		    array[index] = array[i - 1];
		    array[i - 1] = tmp;
		}
		int result = 0;
		for(int i = 0; i < 6; i++)
		    result = result * 10 + array[i];
		return result;
	}
	
	@Override
	public Card findCard(String cardId) {
		// TODO Auto-generated method stub
		return cardDao.find(cardId);
	}

	@Override
	public boolean activeCard(Card card) {
		// TODO Auto-generated method stub
		card.setCard_state(4);
		return cardDao.updateCard(card);
	}

	@Override
	public boolean cancelCard(Card card) {
		// TODO Auto-generated method stub
		card.setCard_state(2);
		return cardDao.updateCard(card);
	}

	@Override
	public boolean renewCard(Card card) {
		// TODO Auto-generated method stub
		card.setCard_state(4);
		return cardDao.updateCard(card);
	}

	public CardDao getCardDao() {
		return cardDao;
	}

	public void setCardDao(CardDao cardDao) {
		this.cardDao = cardDao;
	}
	
}
