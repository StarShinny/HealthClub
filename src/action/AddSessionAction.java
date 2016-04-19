package action;

import model.ActSession;
import service.ActSessionService;

public class AddSessionAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private ActSessionService actSessionService;
	private ActSession actSession;
	
	public String execute(){
		boolean isSessionAdded = actSessionService.addSession(actSession);
		
		if(isSessionAdded){
			System.out.println("session added suc");
		}else{
			System.out.println("session added fail");
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
