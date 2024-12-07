package com.klef.jfsd.erp.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.erp.model.Faculty;
import com.klef.jfsd.erp.model.Student;

import jakarta.transaction.Transactional;

@Repository
public interface FacultyRepository extends JpaRepository<Faculty, Integer>{

	@Query("select f from Faculty f where f.femail=?1 and f.fpassword=?2 ")
	public Faculty checkfacultylogin(String femail,String fpassword);
	
	@Query("update Faculty f set f.fstatus=?1 where f.fid=?2")
	@Modifying
	@Transactional//to enable auto commit
	
	public int updatefacultystatus(String fstatus,int fid);
	
	
	Optional<Faculty> findByFname(String fname);
	Optional<Faculty> findByFemail(String femail);
	
	@Query("SELECT COUNT(s) FROM Faculty s WHERE s.fgender = 'MALE'")
	   public long countMaleFacultys();

	    @Query("SELECT COUNT(s) FROM Faculty s WHERE s.fgender = 'FEMALE'")
	   public long countFemaleFacultys();
	
}
