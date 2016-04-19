package service;

import java.util.List;

import model.ActSession;

public interface ActSessionService {

	//添加场次
	public boolean addSession(ActSession session);
	
	//显示活动的所有场次
	public List<ActSession> findSessions(int actId);
	public List<ActSession> findSessions(String actName);
	
	//修改场次
	public boolean modifySession(ActSession session);
	
	//删除场次
	public boolean deleteSession(ActSession session);
}
