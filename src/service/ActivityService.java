package service;

import java.util.Hashtable;
import java.util.List;

import model.Activity;
import model.ActSession;

public interface ActivityService {

	//添加活动,并返回该活动的id
	public int addActivity(Activity activity);
	
	//查找现有的所有活动
	public Hashtable<Activity, List<ActSession>> allActivities();
	
	//查找活动
	public Activity findActivity(String actName);
	public Activity findActivity(int act_id);
	
	//修改活动
	public boolean modifyActivity(Activity activity);
	
	//删除活动
	public boolean deleteActivity(Activity activity);

}
