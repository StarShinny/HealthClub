package dao;

import model.Card;

public interface CardDao {
	//添加卡
	public Card save(Card card);
	
	//查找卡
	public Card find(String cardId);
	
	//更新卡
	public boolean updateCard(Card card);
}
