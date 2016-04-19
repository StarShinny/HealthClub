package model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class CardStateStatic {

	private int id;
	private int state;
	private int state_num;
	private double state_rate;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	public int getState_num() {
		return state_num;
	}
	public void setState_num(int state_num) {
		this.state_num = state_num;
	}
	
	public double getState_rate() {
		return state_rate;
	}
	public void setState_rate(double state_rate) {
		this.state_rate = state_rate;
	}
	
}
