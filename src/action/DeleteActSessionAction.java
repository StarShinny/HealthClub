package action;

import model.ActSession;
import service.ActSessionService;

public class DeleteActSessionAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private ActSessionService actSessionService;
	private ActSession actSession;
	
	public String execute(){
		boolean isSessionDeleted = actSessionService.deleteSession(actSession);
		
		if(isSessionDeleted){
			System.out.println("session deleted suc");
		}else{
			System.out.println("session deleted fail");
		}
		
		return null;
	}

	public ActSessionService getActSessionService() {
		return actSessionService;
	}

	public void setActSessionService(ActSessionService actSessionService) {
		this.actSessionService = actSessionService;
	}

	public ActSession getActSession() {
		return actSession;
	}

	public void setActSession(ActSession actSession) {
		this.actSession = actSession;
	}
	
}
