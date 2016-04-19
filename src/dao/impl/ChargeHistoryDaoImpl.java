package dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import model.Activity;
import model.ChargeHistory;
import dao.ChargeHistoryDao;

public class ChargeHistoryDaoImpl implements ChargeHistoryDao{

	@Override
	public List<ChargeHistory> findChargeHistories(String cardId) {
		try{			
			Configuration cfg = new Configuration().configure();
			@SuppressWarnings("deprecation")
			SessionFactory sessionFactory = cfg.buildSessionFactory();
			Session session = sessionFactory.openSession();
			
			String	hql = "from model.ChargeHistory as charge where charge.card_id='"+cardId+"'";			
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
	public boolean addChargeHistory(ChargeHistory chargeHistory) {
		try {
			Configuration cfg = new Configuration().configure();
			@SuppressWarnings("deprecation")
			SessionFactory sessionFactory = cfg.buildSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(chargeHistory);
			transaction.commit();
			session.close();
			sessionFactory.close();
			System.out.println("chargeHistory saved");
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
