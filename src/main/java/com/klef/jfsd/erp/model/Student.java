package com.klef.jfsd.erp.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="student_table")
public class Student
{
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Column(name="student_id")
   private int sid;
   @Column(name="student_image",nullable = false)
   private Blob simage;
   @Column(name="student_name",nullable=false,length = 50)
   private String sname;
   @Column(name="student_fname",nullable=false,length = 50)
   private String sfathername;
   @Column(name="student_mname",nullable=false,length = 50)
   private String smothername;
   @Column(name="student_gender",nullable=false,length = 20)
   private String sgender;
   @Column(name="student_dob",nullable=false,length = 20)
   private String sdateofbirth;
   @Column(name="student_department",nullable=false,length = 50)
   private String sdepartment;
   @Column(name="student_email",nullable=false,unique = true,length = 50)
   private String semail;
   @Column(name="student_password",nullable=false,length = 50)
   private String spassword;
   @Column(name="student_location",nullable=false,length=50)
   private String slocation;
   @Column(name="student_contact",nullable=false,unique = true,length = 20)
   private String scontact;
   @Column(name="student_religion",nullable=false,length = 20)
   private String sreligion;
   @Column(name="student_status",nullable=false,length=50)
   private String sstatus;
public int getSid() {
	return sid;
}
public void setSid(int sid) {
	this.sid = sid;
}
public String getSname() {
	return sname;
}
public void setSname(String sname) {
	this.sname = sname;
}
public String getSfathername() {
	return sfathername;
}
public void setSfathername(String sfathername) {
	this.sfathername = sfathername;
}
public String getSmothername() {
	return smothername;
}
public void setSmothername(String smothername) {
	this.smothername = smothername;
}
public String getSgender() {
	return sgender;
}
public void setSgender(String sgender) {
	this.sgender = sgender;
}
public String getSdateofbirth() {
	return sdateofbirth;
}
public void setSdateofbirth(String sdateofbirth) {
	this.sdateofbirth = sdateofbirth;
}
public String getSdepartment() {
	return sdepartment;
}
public void setSdepartment(String sdepartment) {
	this.sdepartment = sdepartment;
}
public String getSemail() {
	return semail;
}
public void setSemail(String semail) {
	this.semail = semail;
}
public String getSpassword() {
	return spassword;
}
public Blob getSimage() {
	return simage;
}
public void setSimage(Blob simage) {
	this.simage = simage;
}
public void setSpassword(String spassword) {
	this.spassword = spassword;
}
public String getSlocation() {
	return slocation;
}
public void setSlocation(String slocation) {
	this.slocation = slocation;
}
public String getScontact() {
	return scontact;
}
public void setScontact(String scontact) {
	this.scontact = scontact;
}
public String getSreligion() {
	return sreligion;
}
public void setSreligion(String sreligion) {
	this.sreligion = sreligion;
}
public String getSstatus() {
	return sstatus;
}
public void setSstatus(String sstatus) {
	this.sstatus = sstatus;
}

}
