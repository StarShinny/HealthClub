package service.impl;

import java.util.List;

import dao.ParticipationDao;
import model.Participation;
import service.ParticipationService;

public class ParticipationServiceImpl implements ParticipationService{

	private ParticipationDao participationDao;
	
	@Override
	public List<Participation> allParticipations(String cardId) {
		// TODO Auto-generated method stub
		return participationDao.findParticipations(cardId);
	}
	
	@Override
	public List<Participation> allParticipations() {
		// TODO Auto-generated method stub
		return participationDao.findParticipations();
	}

	@Override
	public boolean AddParticipation(Participation participation) {
		// TODO Auto-generated method stub
		return participationDao.addParticipation(participation);
	}

	@Override
	public boolean ModifyParticipation(Participation participation) {
		// TODO Auto-generated method stub
		return participationDao.updateParticipation(participation);
	}

	@Override
	public boolean DeleteParticipation(Participation participation) {
		// TODO Auto-generated method stub
		return participationDao.deleteParticipation(participation);
	}

	public ParticipationDao getParticipationDao() {
		return participationDao;
	}

	public void setParticipationDao(ParticipationDao participationDao) {
		this.participationDao = participationDao;
	}

}
