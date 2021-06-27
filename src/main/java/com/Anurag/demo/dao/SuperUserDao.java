package com.Anurag.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.Anurag.demo.model.SuperUser;

public interface SuperUserDao extends JpaRepository<SuperUser, String> {

	@Query("select count(*) from SuperUser where sid=?1 and spass=?2")
	int findBySuperUser(String sid, String spass);

	
}
