package dao;

import java.util.List;

import model.Reservation;

public interface ReservationDao {

	//查找用户预订
	public List<Reservation> findReservations(String cardId);
	
	//添加预订
	public boolean addReservation(Reservation reservation);
}
