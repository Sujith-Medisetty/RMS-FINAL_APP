package com.Anurag.demo.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class HistoryMaster {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int hid;
	private int discount;
	private int gst;

	public HistoryMaster(int hid, int discount, int gst, JobPrice job, CustomerMaster customer) {
		super();
		this.hid = hid;
		this.discount = discount;
		this.gst = gst;
		this.job = job;
		this.customer = customer;
	}
	
	

	public int getHid() {
		return hid;
	}

	public void setHid(int hid) {
		this.hid = hid;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getGst() {
		return gst;
	}

	public void setGst(int gst) {
		this.gst = gst;
	}

	public JobPrice getJob() {
		return job;
	}

	public void setJob(JobPrice job) {
		this.job = job;
	}

	public CustomerMaster getCustomer() {
		return customer;
	}

	public void setCustomer(CustomerMaster customer) {
		this.customer = customer;
	}



	@Override
	public String toString() {
		return "HistoryMaster [hid=" + hid + ", discount=" + discount + ", gst=" + gst + ", job=" + job + ", customer="
				+ customer + "]";
	}



	@ManyToOne(cascade = CascadeType.ALL)
	private JobPrice job;
	
	@ManyToOne(cascade = CascadeType.ALL)
	private CustomerMaster customer;
}
