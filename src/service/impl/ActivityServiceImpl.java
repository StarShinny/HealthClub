package service.impl;

import java.util.Hashtable;
import java.util.List;

import dao.ActivityDao;
import dao.ActSessionDao;
import model.Activity;
import model.ActSession;
import service.ActivityService;

public class ActivityServiceImpl implements ActivityService{
	private ActivityDao activityDao;
	private ActSessionDao actSessionDao;
	
	@Override
	public int addActivity(Activity activity) {
		// TODO Auto-generated method stub
		int act_id = activityDao.addActivity(activity);
		
		return act_id;
	}

	@Override
	public Hashtable<Activity, List<ActSession>> allActivities() {
		// TODO Auto-generated method stub
		List<Activity> actList = activityDao.findActivities();
		Hashtable<Activity, List<ActSession>> actHash = new Hashtable<Activity, List<ActSession>>(0);
		
		if(actList != null){
			System.out.println(actList.size()+" of actlst");
			for(Activity activity:actList){
				int actId = activity.getAct_id();
				List<ActSession> sessions = actSessionDao.findSessions(actId);
				
				actHash.put(activity, sessions);
			}
		}
		
		return actHash;
	}

	@Override
	public Activity findActivity(String actName) {
		// TODO Auto-generated method stub
		Activity activity = activityDao.findActivity(actName);
		
		return activity;
	}

	@Override
	public Activity findActivity(int act_id) {
		// TODO Auto-generated method stub
		return activityDao.findActivity(act_id);
	}
	
	@Override
	public boolean modifyActivity(Activity activity) {
		// TODO Auto-generated method stub
		boolean isModified = activityDao.updateActivity(activity);
		
		return isModified;
	}

	@Override
	public boolean deleteActivity(Activity activity) {
		
		//先删除该活动所有场次，再删除该活动
		int actId = activity.getAct_id();
		List<ActSession> sessions = actSessionDao.findSessions(actId);
		
		if(sessions != null){
			for(ActSession session:sessions){
				actSessionDao.deleteSession(session);
			}
		}
			
		boolean isDeleted = activityDao.deleteActivity(activity);
		return isDeleted;
	}

	public ActivityDao getActivityDao() {
		return activityDao;
	}

	public void setActivityDao(ActivityDao activityDao) {
		this.activityDao = activityDao;
	}

	public ActSessionDao getActSessionDao() {
		return actSessionDao;
	}

	public void setActSessionDao(ActSessionDao actSessionDao) {
		this.actSessionDao = actSessionDao;
	}
	
}
