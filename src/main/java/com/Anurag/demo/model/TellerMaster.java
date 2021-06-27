package com.Anurag.demo.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class TellerMaster {

	@Id
	@Column(length=20)
	private String tid;
	private String tname;
	private String tpno;
	private String tpass;

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

	public String getTpass() {
		return tpass;
	}

	public void setTpass(String tpass) {
		this.tpass = tpass;
	}

	public List<CustomerMaster> getCustomermaster() {
		return customermaster;
	}

	public void setCustomermaster(List<CustomerMaster> customermaster) {
		this.customermaster = customermaster;
	}

	public LocationMaster getLocation() {
		return location;
	}

	public void setLocation(LocationMaster location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "TellerMaster [tid=" + tid + ", tname=" + tname + ", tpno=" + tpno + ", tpass=" + tpass
				+ ", customermaster=" + customermaster + ", location=" + location + "]";
	}

	
	@OneToMany(mappedBy="teller",cascade = CascadeType.ALL)
	private List<CustomerMaster> customermaster;	
	
	@ManyToOne(cascade = CascadeType.ALL)
	private LocationMaster location;

}
