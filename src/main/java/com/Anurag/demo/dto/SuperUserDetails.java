package com.Anurag.demo.dto;

public class SuperUserDetails {

	private String sid;
	private String sname;
	private String spno;
	private String spass;
	public SuperUserDetails(String sid, String sname, String spno, String spass) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.spno = spno;
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
	public String getSpass() {
		return spass;
	}
	public void setSpass(String spass) {
		this.spass = spass;
	}
	@Override
	public String toString() {
		return "SuperUserDetails [sid=" + sid + ", sname=" + sname + ", spno=" + spno + ", spass=" + spass + "]";
	}
	
}
