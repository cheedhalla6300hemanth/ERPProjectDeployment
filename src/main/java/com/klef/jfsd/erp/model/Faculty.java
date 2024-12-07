package com.klef.jfsd.erp.model;

import java.sql.Blob;

import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="faculty_table")
public class Faculty
{
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Column(name="faculty_id")
   private int fid;
   @Column(name="faculty_image",nullable = false)
   private Blob fimage;
   @Column(name="faculty_name",nullable=false,length = 50)
   private String fname;
   @Column(name="faculty_fname",nullable=false,length = 50)
   private String ffathername;
   @Column(name="faculty_mname",nullable=false,length = 50)
   private String fmothername;
   @Column(name="faculty_gender",nullable=false,length = 20)
   private String fgender;
   @Column(name="faculty_dob",nullable=false,length = 20)
   private String fdateofbirth;
   @Column(name="faculty_department",nullable=false,length = 50)
   private String fdepartment;
   @Column(name="faculty_salary",nullable=false)
   private double fsalary;
   @Column(name="faculty_email",nullable=false,unique = true,length = 50)
   private String femail;
   @Column(name="faculty_password",nullable=false,length = 50)
   private String fpassword;
   @Column(name="faculty_location",nullable=false,length=50)
   private String flocation;
   @Column(name="faculty_contact",nullable=false,unique = true,length = 20)
   private String fcontact;
   @Column(name = "faculty_maritalstatus",length=10,nullable = false)
  	private String fmaritalstatus;
   @Column(name="faculty_religion",nullable=false,length = 20)
   private String freligion;
   @Column(name="faculty_status",nullable=false,length=50)
   private String fstatus;
   @Column(name="faculty_resume",nullable = false)
   private Blob fresume;
   @Column(name="faculty_linkedin",length = 200,nullable=false)
   private String furl;
   

   
   
   
   
   
public int getFid() {
	return fid;
}
public void setFid(int fid) {
	this.fid = fid;
}
public String getFname() {
	return fname;
}
public void setFname(String fname) {
	this.fname = fname;
}
public String getFfathername() {
	return ffathername;
}
public void setFfathername(String ffathername) {
	this.ffathername = ffathername;
}
public String getFmothername() {
	return fmothername;
}
public void setFmothername(String fmothername) {
	this.fmothername = fmothername;
}
public String getFgender() {
	return fgender;
}
public void setFgender(String fgender) {
	this.fgender = fgender;
}
public String getFdateofbirth() {
	return fdateofbirth;
}
public void setFdateofbirth(String fdateofbirth) {
	this.fdateofbirth = fdateofbirth;
}
public String getFdepartment() {
	return fdepartment;
}
public void setFdepartment(String fdepartment) {
	this.fdepartment = fdepartment;
}
public double getFsalary() {
	return fsalary;
}
public void setFsalary(double fsalary) {
	this.fsalary = fsalary;
}
public String getFemail() {
	return femail;
}
public void setFemail(String femail) {
	this.femail = femail;
}
public String getFpassword() {
	return fpassword;
}
public void setFpassword(String fpassword) {
	this.fpassword = fpassword;
}
public String getFlocation() {
	return flocation;
}
public void setFlocation(String flocation) {
	this.flocation = flocation;
}
public String getFcontact() {
	return fcontact;
}
public void setFcontact(String fcontact) {
	this.fcontact = fcontact;
}
public String getFmaritalstatus() {
	return fmaritalstatus;
}
public void setFmaritalstatus(String fmaritalstatus) {
	this.fmaritalstatus = fmaritalstatus;
}
public Blob getFimage() {
	return fimage;
}
public void setFimage(Blob fimage) {
	this.fimage = fimage;
}
public Blob getFresume() {
	return fresume;
}
public void setFresume(Blob fresume) {
	this.fresume = fresume;
}
public String getFurl() {
	return furl;
}
public void setFurl(String furl) {
	this.furl = furl;
}
public String getFreligion() {
	return freligion;
}
public void setFreligion(String freligion) {
	this.freligion = freligion;
}

public String getFstatus() {
	return fstatus;
}
public void setFstatus(String fstatus) {
	this.fstatus = fstatus;
}
 
     
}
