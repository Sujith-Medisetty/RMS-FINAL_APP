package com.Anurag.demo.dto;

public class TellerDetails {
	
	private String tid;
	private String tname;
	private String tpno;
	private String tpass;
	private String location_lid;
	public TellerDetails(String tid, String tname, String tpno, String tpass, String location_lid) {
		super();
		this.tid = tid;
		this.tname = tname;
		this.tpno = tpno;
		this.tpass = tpass;
		this.location_lid = location_lid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTpno() {
		return tpno;
	}
	public void setTpno(String tpno) {
		this.tpno = tpno;
	}
	public String getTpass() {
		return tpass;
	}
	public void setTpass(String tpass) {
		this.tpass = tpass;
	}
	public String getLocation_lid() {
		return location_lid;
	}
	public void setLocation_lid(String location_lid) {
		this.location_lid = location_lid;
	}
	@Override
	public String toString() {
		return "TellerDetails [tid=" + tid + ", tname=" + tname + ", tpno=" + tpno + ", tpass=" + tpass
				+ ", location_lid=" + location_lid + "]";
	}

   
}
