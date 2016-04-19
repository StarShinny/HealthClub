package service;

import java.util.List;

import model.Reservation;

public interface ReservationService {

	//查找所有预定
	public List<Reservation> allReservations(String cardId);
	
	//添加预定
	public boolean addReservation(Reservation reservation);
}
