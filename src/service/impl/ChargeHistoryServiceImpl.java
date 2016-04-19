package service.impl;

import java.util.List;

import dao.ChargeHistoryDao;
import model.ChargeHistory;
import service.ChargeHistoryService;

public class ChargeHistoryServiceImpl implements ChargeHistoryService{

	private ChargeHistoryDao chargeHistoryDao;
	
	@Override
	public List<ChargeHistory> allChargeHistories(String cardId) {
		// TODO Auto-generated method stub
		return chargeHistoryDao.findChargeHistories(cardId);
	}

	@Override
	public boolean pay(ChargeHistory chargeHistory) {
		// TODO Auto-generated method stub
		return chargeHistoryDao.addChargeHistory(chargeHistory);
	}

	public ChargeHistoryDao getChargeHistoryDao() {
		return chargeHistoryDao;
	}

	public void setChargeHistoryDao(ChargeHistoryDao chargeHistoryDao) {
		this.chargeHistoryDao = chargeHistoryDao;
	}

}
