package dao;

import java.util.List;

import model.Participation;

public interface ParticipationDao {

	//显示用户活动记录
	public List<Participation> findParticipations(String cardId);
	
	//添加活动记录
	public boolean addParticipation(Participation participation);
	
	//修改活动记录
	public boolean updateParticipation(Participation participation);
	
	//删除活动记录
	public boolean deleteParticipation(Participation participation);

	public List<Participation> findParticipations();
}
