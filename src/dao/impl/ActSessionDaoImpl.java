package dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import model.ActSession;
import model.Activity;
import dao.ActSessionDao;
import dao.ActivityDao;

public class ActSessionDaoImpl implements ActSessionDao{
	
	@Override
	public boolean addSession(ActSession actSession) {
		try {
			Configuration cfg = new Configuration().configure();
			@SuppressWarnings("deprecation")
			SessionFactory sessionFactory = cfg.buildSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(actSession);
			transaction.commit();
			session.close();
			sessionFactory.close();
			System.out.println("actSession saved");
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<ActSession> findSessions(int actId) {
		try{			
			Configuration cfg = new Configuration().configure();
			@SuppressWarnings("deprecation")
			SessionFactory sessionFactory = cfg.buildSessionFactory();
			Session session = sessionFactory.openSession();
			
			String	hql = "from model.ActSession sess where sess.act_id='"+actId+"'";			
			Query query = session.createQuery(hql);
			
			List list = query.list();
			
			if(list.size() == 0){
				return null;
			}else{
				return list;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public boolean updateSession(ActSession actSession) {
		try {
			Configuration config = new Configuration().configure();
			@SuppressWarnings("deprecation")
			SessionFactory sessionFactory = config.buildSessionFactory();
			Session session=sessionFactory.openSession();
			Transaction tx=session.beginTransaction();
			session.update(actSession);
			tx.commit();
			session.close();
			sessionFactory.close();
			
			System.out.println("actSession updated successfully");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteSession(ActSession actSession) {
		try {
			Configuration cfg = new Configuration().configure();
			@SuppressWarnings("deprecation")
			SessionFactory sessionFactory = cfg.buildSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.delete(actSession);
			transaction.commit();
			session.close();
			sessionFactory.close();
			System.out.println("actSession deleted");
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
