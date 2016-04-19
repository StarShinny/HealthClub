package action;

import java.util.Hashtable;
import java.util.List;

import model.ActSession;
import model.Activity;
import model.Participation;
import service.ActivityService;
import service.ParticipationService;


public class AllParticipationsAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private ParticipationService participationService;
	private ActivityService activityService;
	private Participation participation;
	
	public String execute(){
		Hashtable<Activity, List<ActSession>> actHash = activityService.allActivities();
		this.request().getSession().setAttribute("activities", actHash);
		
		List<Participation> parts = participationService.allParticipations();
		this.request().getSession().setAttribute("parts", parts);
		return SUCCESS;
	}

	public ParticipationService getParticipationService() {
		return participationService;
	}

	public void setParticipationService(ParticipationService participationService) {
		this.participationService = participationService;
	}

	public Participation getParticipation() {
		return participation;
	}

	public void setParticipation(Participation participation) {
		this.participation = participation;
	}

	public ActivityService getActivityService() {
		return activityService;
	}

	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}

}
