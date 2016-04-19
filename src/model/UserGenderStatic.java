package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_gender_static")
public class UserGenderStatic {

	private int id;
	private String gender;
	private int gender_num;
	private double gender_rate;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public int getGender_num() {
		return gender_num;
	}
	public void setGender_num(int gender_num) {
		this.gender_num = gender_num;
	}
	
	public double getGender_rate() {
		return gender_rate;
	}
	public void setGender_rate(double gender_rate) {
		this.gender_rate = gender_rate;
	}
	
}
