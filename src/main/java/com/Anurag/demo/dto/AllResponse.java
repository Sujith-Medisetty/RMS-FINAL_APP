package com.Anurag.demo.dto;

import java.sql.Date;

public class AllResponse {
	
	private String tid;
    private  String tname;
    private String tpno;
    private int cid;
    private String cname;
    private String cpno;
    private String jobname;
    private String jobprice;
    private String Discount;
    private String gst;
    private String amount;
    private String PaymentMode;
    private String lname;
    private String lpno;
    private Date date;
	public AllResponse(String tid, String tname, String tpno, int cid, String cname, String cpno, String jobname,
			String jobprice, String discount, String gst, String amount,String PaymentMode, String lname, String lpno, Date date) {
		super();
		this.tid = tid;
		this.tname = tname;
		this.tpno = tpno;
		this.cid = cid;
		this.cname = cname;
		this.cpno = cpno;
		this.jobname = jobname;
		this.jobprice = jobprice;
		Discount = discount;
		this.gst = gst;
		this.amount = amount;
		this.PaymentMode=PaymentMode;
		this.lname = lname;
		this.lpno = lpno;
		this.date = date;
	}
	public String getPaymentMode()
	{
		return PaymentMode;
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
		return Discount;
	}
	public void setDiscount(String discount) {
		Discount = discount;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "AllResponse [tid=" + tid + ", tname=" + tname + ", tpno=" + tpno + ", cid=" + cid + ", cname=" + cname
				+ ", cpno=" + cpno + ", jobname=" + jobname + ", jobprice=" + jobprice + ", Discount=" + Discount
				+ ", gst=" + gst + ", amount=" + amount + ",PaymentMode=" + PaymentMode +", lname=" + lname + ", lpno=" + lpno + ", date=" + date
				+ "]";
	}

    

}
