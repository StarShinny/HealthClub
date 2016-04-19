package model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="charge_history")
public class ChargeHistory {
	private int id;
	private String card_id;
	private String charge_time;
	private double payment;
	private String account;
	
	@Id
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getCard_id() {
		return card_id;
	}
	public void setCard_id(String card_id) {
		this.card_id = card_id;
	}
	
	public String getCharge_time() {
		return charge_time;
	}
	public void setCharge_time(String charge_time) {
		this.charge_time = charge_time;
	}
	
	public double getPayment() {
		return payment;
	}
	public void setPayment(double payment) {
		this.payment = payment;
	}
	
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
}
