package service;

import java.util.List;

import model.Participation;

public interface ParticipationService {

	//显示用户所有活动记录
	public List<Participation> allParticipations(String cardId);
	
	//添加活动记录
	public boolean AddParticipation(Participation participation);
	
	//修改活动记录
	public boolean ModifyParticipation(Participation participation);
	
	//删除活动记录
	public boolean DeleteParticipation(Participation participation);
	//添加活动记录
	public List<Participation> allParticipations();
}
