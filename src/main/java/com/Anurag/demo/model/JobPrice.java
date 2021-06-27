package com.Anurag.demo.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;

@Entity
public class JobPrice {

	@Id
	@Column(length=20)
	private String jobid;
	private String jobname;
	private int jobprice;
	
	public JobPrice(String jobid, String jobname, int jobprice, List<HistoryMaster> historymaster) {
		super();
		this.jobid = jobid;
		this.jobname = jobname;
		this.jobprice = jobprice;
		this.historymaster = historymaster;
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

	public int getJobprice() {
		return jobprice;
	}

	public void setJobprice(int jobprice) {
		this.jobprice = jobprice;
	}

	public List<HistoryMaster> getHistorymaster() {
		return historymaster;
	}

	public void setHistorymaster(List<HistoryMaster> historymaster) {
		this.historymaster = historymaster;
	}

	@OneToMany(mappedBy = "job",cascade = CascadeType.ALL)
	private List<HistoryMaster> historymaster;
	
	
}
