package com.Anurag.demo.dao;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.Anurag.demo.dto.TellerAndLocationResponse;
import com.Anurag.demo.model.TellerMaster;


public interface TellerMasterDao extends JpaRepository<TellerMaster, String> {
	
	@Query("select count(*) from TellerMaster where tid=?1 and tpass=?2")
	int findByTeller(String tid, String tpass);

	
	
	
	  @Query("Select new  com.Anurag.demo.dto.TellerAndLocationResponse(t.tid,t.tname,t.tpno,l.lid,l.lname,l.lpno) from LocationMaster l inner join l.tellermaster t where tid=?1 ")
	  public TellerAndLocationResponse getTellerAndLocationInfo(String tid);
	  

	  @Query("select date from CustomerMaster where cid=?1")
      public Date getDate(int cid);
	  
	  
}
