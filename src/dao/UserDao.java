package dao;

import java.util.List;

import model.User;

public interface UserDao {
	//保存用户
	public boolean save(User user);	
	
	//查找用户
	public User find(String name,String password,int identity);
	
	//查找家属
	public List<User> find(String card_id);
	
	//查找持卡者
	public User findCardHolder(String card_id);
	
	//更新用户信息
	public boolean update(User user);
	
	//查找所有用户
	public List<User> findUsers();

	public List<User> all();
}
