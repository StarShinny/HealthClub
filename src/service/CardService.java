package service;

import model.Card;

public interface CardService {
	//添加新的卡
	public Card createCard(int cardType);
	
	//根据卡号查找卡
	public Card findCard(String cardId);
	
	//激活卡
	public boolean activeCard(Card card);
	
	//取消卡
	public boolean cancelCard(Card card);
	
	//恢复卡
	public boolean renewCard(Card card);
}
