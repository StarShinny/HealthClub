package action;

import model.Activity;
import service.ActivityService;

public class QueryActivityAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private ActivityService activityService;
	private String actName;
	
	public String execute(){
		Activity activity = activityService.findActivity(actName);
		
		if(activity != null){
			this.request().getSession().setAttribute("Activity", activity);
			return SUCCESS;
		}else{
			this.request().getSession().setAttribute("Activity", null);
			return ERROR;
		}
	}

	public ActivityService getActivityService() {
		return activityService;
	}

	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}

	public String getActName() {
		return actName;
	}

	public void setActName(String actName) {
		this.actName = actName;
	}
}
