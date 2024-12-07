package com.klef.jfsd.erp.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.erp.model.Parent;
import com.klef.jfsd.erp.model.Student;

@Repository
public interface ParentRepository extends JpaRepository<Parent, Integer> {


	@Query("select s from Student s where s.semail=?1 and s.scontact=?2 ")
	public Student checkstudentpresent(String semail,String scontact);
	@Query("select p from Parent p where p.pusername=?1 and p.ppassword=?2")
	public Parent checkparentlogin(String puseranme,String ppassword);
	
	Optional<Parent> findBySemail(String semail);
	
}
