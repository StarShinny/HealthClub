package service.impl;

import java.util.List;

import dao.ActSessionDao;
import dao.ActivityDao;
import model.ActSession;
import model.Activity;
import service.ActSessionService;

public class ActSessionServiceImpl implements ActSessionService{

	private ActSessionDao actSessionDao;
	private ActivityDao activityDao;
	
	@Override
	public boolean addSession(ActSession session) {
		// TODO Auto-generated method stub
		return actSessionDao.addSession(session);
	}

	@Override
	public List<ActSession> findSessions(int actId) {
		// TODO Auto-generated method stub
		return actSessionDao.findSessions(actId);
	}

	@Override
	public List<ActSession> findSessions(String actName) {
		// TODO Auto-generated method stub
		Activity activity = activityDao.findActivity(actName);
		
		if(activity != null){
			int actId = activity.getAct_id();
			return actSessionDao.findSessions(actId);
		}else{
			return null;
		}
	}

	@Override
	public boolean modifySession(ActSession session) {
		// TODO Auto-generated method stub
		return actSessionDao.updateSession(session);
	}

	@Override
	public boolean deleteSession(ActSession session) {
		// TODO Auto-generated method stub
		return actSessionDao.deleteSession(session);
	}

	public ActSessionDao getActSessionDao() {
		return actSessionDao;
	}

	public void setActSessionDao(ActSessionDao actSessionDao) {
		this.actSessionDao = actSessionDao;
	}

	public ActivityDao getActivityDao() {
		return activityDao;
	}

	public void setActivityDao(ActivityDao activityDao) {
		this.activityDao = activityDao;
	}

}
