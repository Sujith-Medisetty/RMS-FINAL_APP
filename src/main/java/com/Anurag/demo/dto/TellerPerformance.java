package com.Anurag.demo.dto;

public class TellerPerformance {

	private String tid;
	private String tname;
	private String customers;
	private String amount;
	public TellerPerformance(String tid, String tname, String customers, String amount) {
		super();
		this.tid = tid;
		this.tname = tname;
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
		return "TellerPerformance [tid=" + tid + ", tname=" + tname + ", customers=" + customers + ", amount=" + amount
				+ "]";
	}
	
	
	
}
