package com.Anurag.demo.dto;

public class LocationResponse {

	private String lid;
	private String lname;
	private String lpno;
	public LocationResponse(String lid, String lname, String lpno) {
		super();
		this.lid = lid;
		this.lname = lname;
		this.lpno = lpno;
	}
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
		return "LocationResponse [lid=" + lid + ", lname=" + lname + ", lpno=" + lpno + "]";
	}
	
	
	
}
