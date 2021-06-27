package com.Anurag.demo.dto;

public class AdminAnalysisDetails {

	private String tid;
	private String tname;
	private String tphno;
	private String customers;
	private String amount;
	public AdminAnalysisDetails(String tid, String tname, String tphno, String customers, String amount) {
		super();
		this.tid = tid;
		this.tname = tname;
		this.tphno = tphno;
		this.customers = customers;
		this.amount = amount;
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
	public String getTphno() {
		return tphno;
	}
	public void setTphno(String tphno) {
		this.tphno = tphno;
	}
	public String getCustomers() {
		return customers;
	}
	public void setCustomers(String customers) {
		this.customers = customers;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "AdminAnalysisDetails [tid=" + tid + ", tname=" + tname + ", tphno=" + tphno + ", customers=" + customers
				+ ", amount=" + amount + "]";
	}
	
	
	
}
