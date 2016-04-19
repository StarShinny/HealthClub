package action;

import model.Participation;
import service.ParticipationService;

public class DeleteParticipationAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private ParticipationService participationService;	
	private Participation participation;
	
	public String execute(){
		boolean isPartDeleted = participationService.DeleteParticipation(participation);
		
		if(isPartDeleted){
			System.out.println("participation deleted suc");
		}else{
			System.out.println("participation deleted fail");
		}
		
		return null;
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
}
