package action;

import java.text.SimpleDateFormat;
import java.util.Date;

import model.ChargeHistory;
import service.ChargeHistoryService;

public class PayAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private ChargeHistoryService chargeHistoryService;
	private ChargeHistory chargeHistory;
	
	public String execute(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
		String date = format.format(new Date());		
		chargeHistory.setCharge_time(date);
		
		boolean isPayAdded = chargeHistoryService.pay(chargeHistory);
		
		if(isPayAdded){
			System.out.println("Paid suc");
		}else{
			System.out.println("Paid fail");
		}
		
		return SUCCESS;
	}

	public ChargeHistoryService getChargeHistoryService() {
		return chargeHistoryService;
	}

	public void setChargeHistoryService(ChargeHistoryService chargeHistoryService) {
		this.chargeHistoryService = chargeHistoryService;
	}

	public ChargeHistory getChargeHistory() {
		return chargeHistory;
	}

	public void setChargeHistory(ChargeHistory chargeHistory) {
		this.chargeHistory = chargeHistory;
	}
	
}
