package action;

import service.ParticipationService;
import model.Participation;

public class AddParticipationAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	private ParticipationService participationService;
	private Participation participation;
	
	public String execute(){
		boolean isPartAdded = participationService.AddParticipation(participation);
		
		if(isPartAdded){
			System.out.println("Participation added suc");
		}else{
			System.out.println("Participation added fail");
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
