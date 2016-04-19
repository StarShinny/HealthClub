package service.impl;

import java.util.List;

import dao.ReservationDao;
import model.Reservation;
import service.ReservationService;

public class ReservationServiceImpl implements ReservationService{

	private ReservationDao reservationDao;
	
	@Override
	public List<Reservation> allReservations(String cardId) {
		// TODO Auto-generated method stub
		return reservationDao.findReservations(cardId);
	}

	@Override
	public boolean addReservation(Reservation reservation) {
		// TODO Auto-generated method stub
		return reservationDao.addReservation(reservation);
	}

	public ReservationDao getReservationDao() {
		return reservationDao;
	}

	public void setReservationDao(ReservationDao reservationDao) {
		this.reservationDao = reservationDao;
	}

}
