package com.klef.jfsd.erp.service;

import java.util.List;

import com.klef.jfsd.erp.model.Course;
import com.klef.jfsd.erp.model.FacultyCourse;
import com.klef.jfsd.erp.model.ForgetbyOTP;
import com.klef.jfsd.erp.model.Student;
import com.klef.jfsd.erp.model.TimeTable;

public interface StudentService {

	public Student checkstudentlogin(String semail,String spassword);
	public String updatestudentprofile(Student s);
	
	//course registration
	List<Course> filterCourses(int year, String semester);
    List<TimeTable> filterTimetablebys(String academicYear, int year, String semester, String branch);
    public List<FacultyCourse> getAllFacultyCourses();
	
    //forget password
    public String send(ForgetbyOTP f);
    public ForgetbyOTP checkstudentotp(String semail,int sotp);
    public boolean updatePassword(String semail, String spassword);
    
    //chart 
    Long getMaleStudentCount();
    Long getFemaleStudentCount();
    
}
