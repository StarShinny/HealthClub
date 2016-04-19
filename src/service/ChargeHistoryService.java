package service;

import java.util.List;

import model.ChargeHistory;

public interface ChargeHistoryService {

	//显示所有缴费记录
	public List<ChargeHistory> allChargeHistories(String cardId);
	
	//付费
	public boolean pay(ChargeHistory chargeHistory);
}
