package com.klef.jfsd.erp.model;

import java.sql.Blob;

import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "course_table")
public class Course {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "course_id")
	private int cid;
	@Column(name="course_handout",nullable = false)
	   private Blob chandout;
	@Column(name="course_code",nullable=false,length = 50)
    private String ccode;
    @Column(name="course_title",nullable=false,length = 50)
	private String ctitle;
    @Column(name="course_branch",nullable=false,length = 50)
	private String cbranch;
    @Column(name="course_program",nullable=false,length = 50)
	private String cprogram;
    @Column(name="course_academicyear",nullable=false,length = 50)
	private String cacademicyear;
    @Column(name="course_semester",nullable=false,length = 50)
	private String csemester;
    @Column(name="course_year",nullable=false,length = 50)
	private int cyear;
    @Column(name="course_credits",nullable=false,length = 50)
	private int ccredits;
	@Column(name="course_coordinator",nullable=false,length = 50)
	private String ccoordinator;
	

   
    
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCcode() {
		return ccode;
	}
	public void setCcode(String ccode) {
		this.ccode = ccode;
	}
	public String getCtitle() {
		return ctitle;
	}
	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}
	public String getCbranch() {
		return cbranch;
	}
	public void setCbranch(String cbranch) {
		this.cbranch = cbranch;
	}
	public String getCprogram() {
		return cprogram;
	}
	public void setCprogram(String cprogram) {
		this.cprogram = cprogram;
	}
	public String getCacademicyear() {
		return cacademicyear;
	}
	public void setCacademicyear(String cacademicyear) {
		this.cacademicyear = cacademicyear;
	}
	public String getCsemester() {
		return csemester;
	}
	public void setCsemester(String csemester) {
		this.csemester = csemester;
	}
	public int getCyear() {
		return cyear;
	}
	public void setCyear(int cyear) {
		this.cyear = cyear;
	}
	public int getCcredits() {
		return ccredits;
	}
	public void setCcredits(int ccredits) {
		this.ccredits = ccredits;
	}
	public String getCcoordinator() {
		return ccoordinator;
	}
	public Blob getChandout() {
		return chandout;
	}
	public void setChandout(Blob chandout) {
		this.chandout = chandout;
	}
	public void setCcoordinator(String ccoordinator) {
		this.ccoordinator = ccoordinator;
	}
	
	
	




	
}
