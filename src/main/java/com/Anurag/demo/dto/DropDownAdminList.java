package com.Anurag.demo.dto;

public class DropDownAdminList {
	
	private String aid;
	private String aname;
	private String apass;
	private String apno;
	private String location_lid;
	
	public DropDownAdminList(String aid, String aname, String apass, String apno, String location_lid) {
		super();
		this.aid = aid;
		this.aname = aname;
		this.apass = apass;
		this.apno = apno;
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

	public String getApass() {
		return apass;
	}

	public void setApass(String apass) {
		this.apass = apass;
	}

	public String getApno() {
		return apno;
	}

	public void setApno(String apno) {
		this.apno = apno;
	}

	public String getLocation_lid() {
		return location_lid;
	}

	public void setLocation_lid(String location_lid) {
		this.location_lid = location_lid;
	}

	@Override
	public String toString() {
		return "DropDownAdminList [aid=" + aid + ", aname=" + aname + ", apass=" + apass + ", apno=" + apno
				+ ", location_lid=" + location_lid + "]";
	}
	

}
