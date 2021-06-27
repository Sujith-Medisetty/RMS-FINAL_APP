package com.Anurag.demo.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class AdminMaster {
	
	@Id
	@Column(length=20)
	private String aid;
	private String aname;
	private String apno;
	private String apass;
	


	public String getAid() {
		return aid;
	}
	
	public void setAid(String aid) {
		this.aid = aid;
	}
	
	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getAphno() {
		return apno;
	}

	public void setAphno(String apno) {
		this.apno = apno;
	}

	public String getApass() {
		return apass;
	}

	public void setApass(String apass) {
		this.apass = apass;
	}

	public LocationMaster getLocation() {
		return location;
	}

	public void setLocation(LocationMaster location) {
		this.location = location;
	}
	
	

	@Override
	public String toString() {
		return "AdminMaster [aid=" + aid + ", aname=" + aname + ", apno=" + apno + ", apass=" + apass + ", location="
				+ location + "]";
	}



	@ManyToOne(cascade = CascadeType.ALL)
	private LocationMaster location;
	

}
