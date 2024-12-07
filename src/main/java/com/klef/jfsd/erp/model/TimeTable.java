package com.klef.jfsd.erp.model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "admin_timetable")
public class TimeTable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ttid")
	private int ttid;

	@Column(name="academicyear",nullable=false,length = 50)
	private String ttacademicyear;
    @Column(name="year",nullable=false,length = 50)
   	private int ttyear;
    @Column(name="semester",nullable=false,length = 50)
	private String ttsemester;
    @Column(name="coursebranch",nullable=false,length = 50)
   	private String ttcbranch;
    @Column(name="coursecode",nullable=false,length = 50)
    private String ttccode;
    @Column(name="coursetitle",nullable=false,length = 50)
	private String ttctitle;
    @Column(name="type",nullable=false,length = 50)
	private String tttype;
    @Column(name="day",nullable=false,length = 50)
	private String ttday;
    @Column(name="hour",nullable=false,length = 50)
	private int tthour;
    public int getTtid() {
		return ttid;
	}
	public void setTtid(int ttid) {
		this.ttid = ttid;
	}
	public String getTtacademicyear() {
		return ttacademicyear;
	}
	public void setTtacademicyear(String ttacademicyear) {
		this.ttacademicyear = ttacademicyear;
	}
	public int getTtyear() {
		return ttyear;
	}
	public void setTtyear(int ttyear) {
		this.ttyear = ttyear;
	}
	public String getTtsemester() {
		return ttsemester;
	}
	public void setTtsemester(String ttsemester) {
		this.ttsemester = ttsemester;
	}
	public String getTtcbranch() {
		return ttcbranch;
	}
	public void setTtcbranch(String ttcbranch) {
		this.ttcbranch = ttcbranch;
	}
	public String getTtccode() {
		return ttccode;
	}
	public void setTtccode(String ttccode) {
		this.ttccode = ttccode;
	}
	public String getTtctitle() {
		return ttctitle;
	}
	public void setTtctitle(String ttctitle) {
		this.ttctitle = ttctitle;
	}
	public String getTtday() {
		return ttday;
	}
	public void setTtday(String ttday) {
		this.ttday = ttday;
	}
	public int getTthour() {
		return tthour;
	}
	public void setTthour(int tthour) {
		this.tthour = tthour;
	}
	public String getTttype() {
		return tttype;
	}
	public void setTttype(String tttype) {
		this.tttype = tttype;
	}
   
    
	
}
