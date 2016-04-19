package action;

import java.util.Hashtable;
import java.util.List;

import model.Activity;
import model.ActSession;
import service.ActivityService;

public class QueryActivityStaticsAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private ActivityService activityService;
	
	public String execute(){
		Hashtable<Activity, List<ActSession>> actHash = activityService.allActivities();
		
		if(actHash != null){
			this.request().getSession().setAttribute("actHash", actHash);			
			System.out.println("show all acts suc");
		}else{
			this.request().getSession().setAttribute("actHash", null);
		}
		
		return null;
	}

	public ActivityService getActivityService() {
		return activityService;
	}

	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}

}
