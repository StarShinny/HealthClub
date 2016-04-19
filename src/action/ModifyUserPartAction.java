package action;

import model.Participation;
import service.ParticipationService;

public class ModifyUserPartAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private ParticipationService participationService;	
	private Participation participation;
	
	public String execute(){
		boolean isPartModified = participationService.ModifyParticipation(participation);
		
		if(isPartModified){
			System.out.println("participation modified suc");
		}else{
			System.out.println("participation modiefied fail");
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
