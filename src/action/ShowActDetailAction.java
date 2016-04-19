package action;

import java.util.List;

import model.ActSession;
import model.Activity;
import service.ActSessionService;
import service.ActivityService;

public class ShowActDetailAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private ActivityService activityService;
	private ActSessionService actSessionService;
	
	public String execute(){
		int act_id = Integer.parseInt(request().getParameter("act_id"));
		Activity activity = activityService.findActivity(act_id);
		
		List<ActSession> actSessions = actSessionService.findSessions(act_id);
		
		this.request().getSession().setAttribute("activity", activity);
		this.request().getSession().setAttribute("actSessions", actSessions);
		
		return SUCCESS;
	}

	public ActivityService getActivityService() {
		return activityService;
	}

	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}

	public ActSessionService getActSessionService() {
		return actSessionService;
	}

	public void setActSessionService(ActSessionService actSessionService) {
		this.actSessionService = actSessionService;
	}
	
}
