package service.impl;

import java.util.List;

import dao.UserDao;
import model.User;
import service.UserService;

public class UserServiceImpl implements UserService{

	private UserDao userDao;
	
	@Override
	public User loginUser(String name, String password,int identity) {
		// TODO Auto-generated method stub
		User user = userDao.find(name, password,identity); 
		
		if(user == null){
			System.out.println("数据库中未找到");
			return null;
		}else{
			return user;
		}
	}
	
	@Override
	public List<User> findFamily(String card_id) {
		// TODO Auto-generated method stub
		List<User> families = userDao.find(card_id);
		return families;
	}
	
	@Override
	public boolean addFamily(User user) {
		// TODO Auto-generated method stub
		boolean isAdded = userDao.save(user);
		return isAdded;
	}
	
	@Override
	public boolean updateUser(User user) {
		// TODO Auto-generated method stub
		boolean isUpdated = userDao.update(user);
		return isUpdated;
	}

	@Override
	public boolean registerUser(User user) {
		boolean isRegistered = userDao.save(user);
		return isRegistered;
	}

	@Override
	public List<User> findUsers() {
		// TODO Auto-generated method stub
		return userDao.findUsers();
	}

	@Override
	public User findUser(String cardId) {
		// TODO Auto-generated method stub
		return userDao.findCardHolder(cardId);
	}
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		System.out.println("userDao is setted");
		this.userDao = userDao;
	}

	@Override
	public List<User> allUsers() {
		// TODO Auto-generated method stub
		return userDao.all();
	}

}
