package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_period_static")
public class UserPeriodStatic {

	private int id;
	private String period;
	private int period_num;
	private double period_rate;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	
	public int getPeriod_num() {
		return period_num;
	}
	public void setPeriod_num(int period_num) {
		this.period_num = period_num;
	}
	
	public double getPeriod_rate() {
		return period_rate;
	}
	public void setPeriod_rate(double period_rate) {
		this.period_rate = period_rate;
	}
	
}
