package com.Anurag.demo.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class LocationMaster {

	@Id
	@Column(length=20)
	private String lid;
	private String lname;
	private String lpno;
	
	public String getLid() {
		return lid;
	}
	public void setLid(String lid) {
		this.lid = lid;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getLpno() {
		return lpno;
	}
	public void setLpno(String lpno) {
		this.lpno = lpno;
	}
	
	@Override
	public String toString() {
		return "LocationMaster [lid=" + lid + ", lname=" + lname + ", lpno=" + lpno + "]";
	}
	
	@OneToMany(mappedBy="location",cascade = CascadeType.ALL)
	private List<TellerMaster> tellermaster=new ArrayList<>();
	

	@OneToMany(mappedBy="location",cascade = CascadeType.ALL)
	private List<AdminMaster> adminmaster;
	

	
}
