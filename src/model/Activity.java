package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "activity")
public class Activity {
	private int act_id;
	private String act_name;
	private String act_desc;
	private int session_count;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getAct_id() {
		return act_id;
	}
	public void setAct_id(int act_id) {
		this.act_id = act_id;
	}
	
	public String getAct_name() {
		return act_name;
	}
	public void setAct_name(String act_name) {
		this.act_name = act_name;
	}
	
	public String getAct_desc() {
		return act_desc;
	}
	public void setAct_desc(String act_desc) {
		this.act_desc = act_desc;
	}
	
	public int getSession_count() {
		return session_count;
	}
	public void setSession_count(int session_count) {
		this.session_count = session_count;
	}
	
}
