package com.Anurag.demo.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class TransactionMaster {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int transid;
	private String paymentmode;
	private String transactionid;
	
	
	
	public int getTransid() {
		return transid;
	}

	public void setTransid(int transid) {
		this.transid = transid;
	}

	public String getPaymentmode() {
		return paymentmode;
	}

	public void setPaymentmode(String paymentmode) {
		this.paymentmode = paymentmode;
	}



	public String getTransactionid() {
		return transactionid;
	}



	public void setTransactionid(String transactionid) {
		this.transactionid = transactionid;
	}



	public CustomerMaster getCustomer123() {
		return customer123;
	}



	public void setCustomer123(CustomerMaster customer123) {
		this.customer123 = customer123;
	}



	@Override
	public String toString() {
		return "TransactionMaster [transid=" + transid + ", paymentmode=" + paymentmode + ", transactionid="
				+ transactionid + ", customer123=" + customer123 + "]";
	}



	@ManyToOne(cascade = CascadeType.ALL)
	private CustomerMaster customer123;
	
	
	
}
