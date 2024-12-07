package com.klef.jfsd.erp.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@Entity
@Table(name = "parent_table")
public class Parent {

	   @Id
	   @GeneratedValue(strategy = GenerationType.IDENTITY)
	   @Column(name="parent_id")
	   private int pid;
	   @Column(name="parent_image",nullable = false)
	   private Blob pimage;
	   @Column(name="student_email",nullable=false,length = 50)
	   private String semail;
	   @Column(name="student_contact",nullable=false,length = 20)
	   private String scontact;
	   @Column(name="parent_username",nullable=false,length = 50,unique = true)
	   private String pusername;
	   @Column(name="parent_password",nullable=false,length = 50,unique = true)
	   private String ppassword;
	   @Column(name="parent_gender",nullable=false,length = 20)
	   private String pgender;
	   @Column(name="parent_dob",nullable=false,length = 20)
	   private String pdateofbirth;
	   @Column(name="parent_relation",nullable=false,length=50)
	   private String prelation;
	   @Column(name="parent_address",nullable=false,length=50)
	   private String paddress;
	   @Column(name="parent_contact",nullable=false,unique = true,length = 20)
	   private String pcontact;
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getSemail() {
		return semail;
	}
	public void setSemail(String semail) {
		this.semail = semail;
	}
	public String getScontact() {
		return scontact;
	}
	public void setScontact(String scontact) {
		this.scontact = scontact;
	}
	public String getPusername() {
		return pusername;
	}
	public void setPusername(String pusername) {
		this.pusername = pusername;
	}
	public String getPpassword() {
		return ppassword;
	}
	public void setPpassword(String ppassword) {
		this.ppassword = ppassword;
	}
	public String getPgender() {
		return pgender;
	}
	public void setPgender(String pgender) {
		this.pgender = pgender;
	}
	public String getPdateofbirth() {
		return pdateofbirth;
	}
	public void setPdateofbirth(String pdateofbirth) {
		this.pdateofbirth = pdateofbirth;
	}
	public String getPrelation() {
		return prelation;
	}
	public void setPrelation(String prelation) {
		this.prelation = prelation;
	}
	public String getPaddress() {
		return paddress;
	}
	public void setPaddress(String paddress) {
		this.paddress = paddress;
	}
	public String getPcontact() {
		return pcontact;
	}
	public Blob getPimage() {
		return pimage;
	}
	public void setPimage(Blob pimage) {
		this.pimage = pimage;
	}
	public void setPcontact(String pcontact) {
		this.pcontact = pcontact;
	}
	   
}
