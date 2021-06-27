package com.Anurag.demo.dto;

import java.sql.Date;

public class Teller2Response {

	
	private int cid;
	private String cname;
	private String cpno;
	private String jobname;
	private String jobprice;
	private String PaymentMode;
	private String discount;
	private String gst;
	private String amount;
	private Date date;
	public Teller2Response(int cid, String cname, String cpno, String jobname, String jobprice,String PaymentMode, String discount,
			String gst, String amount, Date date) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.cpno = cpno;
		this.jobname = jobname;
		this.jobprice = jobprice;
		this.PaymentMode= PaymentMode;
		this.discount = discount;
		this.gst = gst;
		this.amount = amount;
		this.date = date;
	}
	public String getPaymentMode()
	{
		return PaymentMode;
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
	public String getCpno() {
		return cpno;
	}
	public void setCpno(String cpno) {
		this.cpno = cpno;
	}
	public String getJobname() {
		return jobname;
	}
	public void setJobname(String jobname) {
		this.jobname = jobname;
	}
	public String getJobprice() {
		return jobprice;
	}
	public void setJobprice(String jobprice) {
		this.jobprice = jobprice;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getGst() {
		return gst;
	}
	public void setGst(String gst) {
		this.gst = gst;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Teller2Response [cid=" + cid + ", cname=" + cname + ", cpno=" + cpno + ", jobname=" + jobname
				+ ", jobprice=" + jobprice + ",PaymentMode="+PaymentMode+", discount=" + discount + ", gst=" + gst + ", amount=" + amount
				+ ", date=" + date + "]";
	}

	
	
}
