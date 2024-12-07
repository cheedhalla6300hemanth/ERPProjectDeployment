package com.klef.jfsd.erp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.erp.model.Admin;
import com.klef.jfsd.erp.model.Student;

@Repository
public interface AdminRepository extends JpaRepository<Admin, String> {

	@Query("select a from Admin a where a.username=?1 and a.password=?2  ")
	public Admin checkadminlogin(String uname,String pwd);
	
	
	
}
