package action;

import java.util.List;

import model.Card;
import model.ChargeHistory;
import service.ChargeHistoryService;

//会员查看我的缴费信息
public class QueryPayRecordAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private ChargeHistoryService chargeHistoryService;
	
	public String execute(){
		Card card = (Card)request().getSession().getAttribute("card");
		String cardId = card.getCard_id();
		
		List<ChargeHistory> chargeHistories = chargeHistoryService.allChargeHistories(cardId);
		
		if(chargeHistories != null){
			this.request().getSession().setAttribute("chargeHistories", chargeHistories);
		}else{
			this.request().getSession().setAttribute("chargeHistories", null);
		}
		return SUCCESS;
	}

	public ChargeHistoryService getChargeHistoryService() {
		return chargeHistoryService;
	}

	public void setChargeHistoryService(ChargeHistoryService chargeHistoryService) {
		this.chargeHistoryService = chargeHistoryService;
	}

}
