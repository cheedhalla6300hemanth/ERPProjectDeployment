package com.klef.jfsd.erp.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="forget_otp")
public class ForgetbyOTP {
	  @Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	  private int oid;
	  @Column(name="faculty_email",length=50)
	  private String femail;
	  @Column(name="faculty_otp",length=50)
	  private int fotp;
	  @Column(name="student_email",length=50)
	  private String semail;
	  @Column(name="student_otp",length=50)
	  private int sotp;
	  @Column(name="parent_username",length=50)
	  private String pusername;
	  @Column(name="parent_otp",length=50)
	  private int potp;
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getFemail() {
		return femail;
	}
	public void setFemail(String femail) {
		this.femail = femail;
	}
	public int getFotp() {
		return fotp;
	}
	public void setFotp(int fotp) {
		this.fotp = fotp;
	}
	public String getSemail() {
		return semail;
	}
	public void setSemail(String semail) {
		this.semail = semail;
	}
	public int getSotp() {
		return sotp;
	}
	public void setSotp(int sotp) {
		this.sotp = sotp;
	}
	public String getPusername() {
		return pusername;
	}
	public void setPusername(String pusername) {
		this.pusername = pusername;
	}
	public int getPotp() {
		return potp;
	}
	public void setPotp(int potp) {
		this.potp = potp;
	}
	  

}
