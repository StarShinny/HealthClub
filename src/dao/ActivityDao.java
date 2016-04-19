package dao;

import java.util.List;

import model.Activity;

public interface ActivityDao {

	//添加活动
	public int addActivity(Activity activity);
	
	//查找所有活动
	public List<Activity> findActivities();
	
	//查询活动具体信息
	public Activity findActivity(int actId);
	public Activity findActivity(String actName);
	
	//更新活动
	public boolean updateActivity(Activity activity);
	
	//删除活动
	public boolean deleteActivity(Activity activity);
}
