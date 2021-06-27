package com.Anurag.demo.dto;

public class AdminDetails {

	private String aid;
	private String aname;
	private String apno;
	private String apass;
	private String location_lid;
	public AdminDetails(String aid, String aname, String apno, String apass, String location_lid) {
		super();
		this.aid = aid;
		this.aname = aname;
		this.apno = apno;
		this.apass = apass;
		this.location_lid = location_lid;
	}
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
	public String getApno() {
		return apno;
	}
	public void setApno(String apno) {
		this.apno = apno;
	}
	public String getApass() {
		return apass;
	}
	public void setApass(String apass) {
		this.apass = apass;
	}
	public String getLocation_lid() {
		return location_lid;
	}
	public void setLocation_lid(String location_lid) {
		this.location_lid = location_lid;
	}
	@Override
	public String toString() {
		return "AdminDetails [aid=" + aid + ", aname=" + aname + ", apno=" + apno + ", apass=" + apass
				+ ", location_lid=" + location_lid + "]";
	}
	
	
	
}
