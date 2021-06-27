package com.Anurag.demo.dto;

import lombok.Data;

@Data
public class TellerAndLocationResponse {

String tid;
String tname;
String tpno;
String lid;
String lname;
String lpno;
public TellerAndLocationResponse(String tid, String tname, String tpno, String lid, String lname, String lpno) {
	super();
	this.tid = tid;
	this.tname = tname;
	this.tpno = tpno;
	this.lid = lid;
	this.lname = lname;
	this.lpno = lpno;
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
public String getLid() {
	return lid;
}
public void setLid(String lid) {
	this.lid = lid;
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
@Override
public String toString() {
	return "TellerAndLocationResponse [tid=" + tid + ", tname=" + tname + ", tpno=" + tpno + ", lid=" + lid + ", lname="
			+ lname + ", lpno=" + lpno + "]";
}


}
