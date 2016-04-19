package action;

import model.Activity;
import service.ActivityService;

public class DeleteActivityAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	private ActivityService activityService;
	private Activity activity;
	
	public String execute(){
		boolean isActivityDeleted = activityService.deleteActivity(activity);
		
		if(isActivityDeleted){
			System.out.println("activity deleted suc");
		}else{
			System.out.println("activity deleted fail");
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

}
