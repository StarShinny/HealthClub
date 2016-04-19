package action;

import model.Activity;
import service.ActivityService;

public class ModifyActivityAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private ActivityService activityService;
	private Activity activity;
	
	public String execute(){
		boolean isActivityModified = activityService.modifyActivity(activity);
		
		if(isActivityModified){
			System.out.println("activity modified suc");
		}else{
			System.out.println("activity modified fail");
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
