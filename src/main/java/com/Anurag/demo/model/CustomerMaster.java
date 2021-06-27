package com.Anurag.demo.model;

import java.sql.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class CustomerMaster {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cid;
	private String cname;
	private String cpno;
	private Date date;
	

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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public List<HistoryMaster> getHistorymaster() {
		return historymaster;
	}

	public void setHistorymaster(List<HistoryMaster> historymaster) {
		this.historymaster = historymaster;
	}

	public TellerMaster getTeller() {
		return teller;
	}

	public void setTeller(TellerMaster teller) {
		this.teller = teller;
	}


	
	public List<TransactionMaster> getTransactionmaster() {
		return transactionmaster;
	}

	public void setTransactionmaster(List<TransactionMaster> transactionmaster) {
		this.transactionmaster = transactionmaster;
	}

	@Override
	public String toString() {
		return "CustomerMaster [cid=" + cid + ", cname=" + cname + ", cpno=" + cpno + ", date=" + date
				+ ", historymaster=" + historymaster + ", teller=" + teller + ", transactionmaster=" + transactionmaster
				+ "]";
	}





	@OneToMany(mappedBy="customer",cascade = CascadeType.ALL)
	private List<HistoryMaster> historymaster;
	
	@ManyToOne(cascade = CascadeType.ALL)
	private TellerMaster teller;

	@OneToMany(mappedBy="customer123",cascade = CascadeType.ALL)
	private List<TransactionMaster> transactionmaster;
}
