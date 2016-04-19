package model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class UsageStatic {

	private int id;
	private String site;
	private int site_num;
	private double site_rate;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	
	public int getSite_num() {
		return site_num;
	}
	public void setSite_num(int site_num) {
		this.site_num = site_num;
	}
	
	public double getSite_rate() {
		return site_rate;
	}
	public void setSite_rate(double site_rate) {
		this.site_rate = site_rate;
	}
	
}
