package dao;

import java.util.List;

import model.ActSession;

public interface ActSessionDao {

	//添加场次
	public boolean addSession(ActSession session);
	
	//查找场次
	public List<ActSession> findSessions(int actId);
	
	//更新场次
	public boolean updateSession(ActSession session);
	
	//删除场次
	public boolean deleteSession(ActSession session);
}
