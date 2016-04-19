package model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "card")
public class Card {
	private String card_id;
	private int card_state; //1代表未激活，2代表暂停，3代表停止，4代表已激活
	private String card_password;
	private double monthly_charge;
	private double active_charge;
	
	@Id
	public String getCard_id() {
		return card_id;
	}
	public void setCard_id(String card_id) {
		this.card_id = card_id;
	}
	
	public int getCard_state() {
		return card_state;
	}
	public void setCard_state(int card_state) {
		this.card_state = card_state;
	}
	
	public String getCard_password() {
		return card_password;
	}
	public void setCard_password(String card_password) {
		this.card_password = card_password;
	}
	
	public double getMonthly_charge() {
		return monthly_charge;
	}
	public void setMonthly_charge(double monthly_charge) {
		this.monthly_charge = monthly_charge;
	}
	
	public double getActive_charge() {
		return active_charge;
	}
	public void setActive_charge(double active_charge) {
		this.active_charge = active_charge;
	}
}
