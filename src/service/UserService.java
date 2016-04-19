package service;

import java.util.List;

import model.User;

public interface UserService {

	//用户登录
	public User loginUser(String name,String password,int identity);
	
	//查找用户家属信息
	public List<User> findFamily(String card_id);
	
	//用户注册
	public boolean registerUser(User user);
	
	//添加家属信息
	public boolean addFamily(User user);
	
	//更新用户信息
	public boolean updateUser(User user);
	
	//查找所有用户
	public List<User> findUsers();
	
	//搜索用户
	public User findUser(String cardId);

	public List<User> allUsers();
}
