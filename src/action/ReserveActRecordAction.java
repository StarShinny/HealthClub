package action;

import java.util.List;

import model.Card;
import model.Reservation;
import service.ReservationService;

public class ReserveActRecordAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private ReservationService reservationService;
	
	public String execute(){
		Card card = (Card)request().getSession().getAttribute("card");
		String cardId = card.getCard_id();
		
		System.out.println("用户卡号为："+cardId);
		
		List<Reservation> reservations = reservationService.allReservations(cardId);
		
		if(reservations != null){
			this.request().getSession().setAttribute("reservations", reservations);
		}else{
			this.request().getSession().setAttribute("reservations", null);
		}
		return SUCCESS;
	}

	public ReservationService getReservationService() {
		return reservationService;
	}

	public void setReservationService(ReservationService reservationService) {
		this.reservationService = reservationService;
	}
}
