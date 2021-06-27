package com.Anurag.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.Anurag.demo.model.AdminMaster;

public interface AdminMasterDao extends JpaRepository<AdminMaster,String>{

	@Query("select count(*) from AdminMaster where aid=?1 and apass=?2")
	int findByAdminMaster(String aid, String apass);
	
}
