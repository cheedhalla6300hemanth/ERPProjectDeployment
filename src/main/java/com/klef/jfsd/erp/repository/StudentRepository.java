package com.klef.jfsd.erp.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.erp.model.Student;

import jakarta.transaction.Transactional;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer>
{

	@Query("select s from Student s where s.semail=?1 and s.spassword=?2 ")
	public Student checkstudentlogin(String semail,String spassword);
	@Query("select s from Student s where s.semail=?1 and s.spassword=?2 ")
	public Student checkdelete(String semail,String spassword);
	@Query("select s from Student s where s.semail=?1")
	public Student checkstudent(String semail);
	
	@Query("update Student s set s.sstatus=?1 where s.sid=?2")
	@Modifying
	@Transactional
	
	public int updatestudentstatus(String sstatus,int sid);
	
	Optional<Student> findBySemail(String semail);
	
	 @Query("SELECT COUNT(s) FROM Student s WHERE s.sgender = 'MALE'")
	   public long countMaleStudents();

	    @Query("SELECT COUNT(s) FROM Student s WHERE s.sgender = 'FEMALE'")
	   public long countFemaleStudents();
	    
	    
	
	
}
