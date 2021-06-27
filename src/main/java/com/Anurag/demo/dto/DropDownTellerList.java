package com.Anurag.demo.dto;

public class DropDownTellerList {

	private String tid;
	private String tname;
	private String tpno;
	
	public DropDownTellerList(String tid, String tname, String tpno) {
		super();
		this.tid = tid;
		this.tname = tname;
		this.tpno = tpno;
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
	
	@Override
	public String toString() {
		return "DropDownTellerList [tid=" + tid + ", tname=" + tname + ", tpno=" + tpno + "]";
	}
	
}
