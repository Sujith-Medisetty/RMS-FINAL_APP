package com.Anurag.demo.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class SuperUser {

	@Id
	private String sid;
	private String sname;
	private String spno;
	private String spass;
	
	
	
	public String getSpass() {
		return spass;
	}
	public void setSpass(String spass) {
		this.spass = spass;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSpno() {
		return spno;
	}
	public void setSpno(String spno) {
		this.spno = spno;
	}
	@Override
	public String toString() {
		return "SuperUser [sid=" + sid + ", sname=" + sname + ", spno=" + spno + ", spass=" + spass + "]";
	}

	
		
	
}
