package action;

import java.util.Hashtable;
import java.util.List;

import model.Activity;
import model.ActSession;
import model.User;
import service.ActivityService;

public class AllActivitiesAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private ActivityService activityService;
	
	public String execute(){
		Hashtable<Activity, List<ActSession>> actHash = activityService.allActivities();

		if(actHash != null){
			this.request().getSession().setAttribute("activities", actHash);	
			System.out.println("show all acts suc");
		}
		
		User user = (User)request().getSession().getAttribute("user");
		if(user.getIdentity() == 1){
			return "member";
		}else{
			return "waiter";
		}
	}

	public ActivityService getActivityService() {
		return activityService;
	}

	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}

}
