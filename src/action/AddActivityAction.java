package action;

import model.ActSession;
import model.Activity;
import service.ActSessionService;
import service.ActivityService;

//服务员制定活动安排
public class AddActivityAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	private ActivityService activityService;
	private ActSessionService actSessionService;
	private Activity activity;
	private ActSession actSession;
	private String date;
	private String session1;
	private String session2;
	private String session3;
	private String session4;
	private String session5;
	private String session6;
	
	public String execute(){
		int act_id = activityService.addActivity(activity);
		actSession.setAct_id(act_id);
		
		int session_id = 1;
		
		if(session1 != null){
			String time = date+session1;
			actSession.setTime(time);
			actSession.setSession_id(session_id);
			actSessionService.addSession(actSession);
			session_id++;
		}
		if(session2 != null){
			String time = date+session2;
			actSession.setTime(time);
			actSession.setSession_id(session_id);
			actSessionService.addSession(actSession);
			session_id++;
		}
		if(session3 != null){
			String time = date+session3;
			actSession.setTime(time);
			actSession.setSession_id(session_id);
			actSessionService.addSession(actSession);
			session_id++;
		}
		if(session4 != null){
			String time = date+session4;
			actSession.setTime(time);
			actSession.setSession_id(session_id);
			actSessionService.addSession(actSession);
			session_id++;
		}
		if(session5 != null){
			String time = date+session5;
			actSession.setTime(time);
			actSession.setSession_id(session_id);
			actSessionService.addSession(actSession);
			session_id++;
		}
		if(session6 != null){
			String time = date+session6;
			actSession.setTime(time);
			actSession.setSession_id(session_id);
			actSessionService.addSession(actSession);
		}
		return null;
	}

	public ActivityService getActivityService() {
		return activityService;
	}

	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}

	public Activity getActivity() {
		return activity;
	}

	public void setActivity(Activity activity) {
		this.activity = activity;
	}

	public ActSession getActSession() {
		return actSession;
	}

	public void setActSession(ActSession actSession) {
		this.actSession = actSession;
	}

	public String getSession1() {
		return session1;
	}

	public void setSession1(String session1) {
		this.session1 = session1;
	}

	public String getSession2() {
		return session2;
	}

	public void setSession2(String session2) {
		this.session2 = session2;
	}

	public String getSession3() {
		return session3;
	}

	public void setSession3(String session3) {
		this.session3 = session3;
	}

	public String getSession4() {
		return session4;
	}

	public void setSession4(String session4) {
		this.session4 = session4;
	}

	public String getSession5() {
		return session5;
	}

	public void setSession5(String session5) {
		this.session5 = session5;
	}

	public String getSession6() {
		return session6;
	}

	public void setSession6(String session6) {
		this.session6 = session6;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public ActSessionService getActSessionService() {
		return actSessionService;
	}

	public void setActSessionService(ActSessionService actSessionService) {
		this.actSessionService = actSessionService;
	}

}
