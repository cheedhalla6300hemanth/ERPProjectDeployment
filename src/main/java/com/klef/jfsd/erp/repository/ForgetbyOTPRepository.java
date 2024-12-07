package com.klef.jfsd.erp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.erp.model.ForgetbyOTP;
import com.klef.jfsd.erp.model.Student;

@Repository
public interface ForgetbyOTPRepository extends JpaRepository<ForgetbyOTP, Integer>{
	@Query("select o from ForgetbyOTP o where o.semail=?1 and o.sotp=?2 ")
	public ForgetbyOTP checkstudentotp(String semail,int sotp);
	@Query("select o from ForgetbyOTP o where o.femail=?1 and o.fotp=?2 ")
	public ForgetbyOTP checkfacultyotp(String femail,int fotp);
	@Query("select o from ForgetbyOTP o where o.semail=?1 and o.potp=?2 ")
	public ForgetbyOTP checkparentotp(String semail,int potp);
}
