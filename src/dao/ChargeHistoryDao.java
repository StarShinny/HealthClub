package dao;

import java.util.List;

import model.ChargeHistory;

public interface ChargeHistoryDao {

	//显示用户缴费记录
	public List<ChargeHistory> findChargeHistories(String cardId);
	
	//用户付费
	public boolean addChargeHistory(ChargeHistory chargeHistory);
}
