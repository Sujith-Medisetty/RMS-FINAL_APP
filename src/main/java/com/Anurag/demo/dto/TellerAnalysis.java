package com.Anurag.demo.dto;

import java.sql.Date;

public class TellerAnalysis {
	
	private int cid;
	private String cname;
	private String jobid;
	private String jobname;
	private String amount;
	private String lname;
	private Date date;
	public TellerAnalysis(int cid, String cname, String jobid, String jobname, String amount, String lname, Date date) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.jobid = jobid;
		this.jobname = jobname;
		this.amount = amount;
		this.lname = lname;
		this.date = date;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getJobid() {
		return jobid;
	}
	public void setJobid(String jobid) {
		this.jobid = jobid;
	}
	public String getJobname() {
		return jobname;
	}
	public void setJobname(String jobname) {
		this.jobname = jobname;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "TellerAnalysis [cid=" + cid + ", cname=" + cname + ", jobid=" + jobid + ", jobname=" + jobname
				+ ", amount=" + amount + ", lname=" + lname + ", date=" + date + "]";
	}
	
	
}
