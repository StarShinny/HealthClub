package action;

import model.Reservation;
import service.ReservationService;

public class ReserveActivityAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private ReservationService reservationService;
	private Reservation reservation;
	
	public String execute(){
		boolean isReserved = reservationService.addReservation(reservation);
		
		if(isReserved){
			System.out.println("Reserved suc");
		}else{
			System.out.println("Reserved fail");
		}
		
		return null;
	}

	public ReservationService getReservationService() {
		return reservationService;
	}

	public void setReservationService(ReservationService reservationService) {
		this.reservationService = reservationService;
	}

	public Reservation getReservation() {
		return reservation;
	}

	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}
	
}
