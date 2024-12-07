package com.klef.jfsd.erp.service;

import java.util.List;
import java.util.Map;

import com.klef.jfsd.erp.model.Admin;
import com.klef.jfsd.erp.model.Course;
import com.klef.jfsd.erp.model.Faculty;
import com.klef.jfsd.erp.model.Parent;
import com.klef.jfsd.erp.model.Student;
import com.klef.jfsd.erp.model.TimeTable;

public interface AdminService {

	public Admin checkadminlogin(String uname,String pwd);
	//insert
	public String StudentRegistration(Student s);
	public String FacultyRegistration(Faculty f);
	public String addcourse(Course c);
	public String addtotimetable(TimeTable t);
	
	//view
	public List<Faculty> viewallfacultys();
	public List<Student> viewallstudents();
	public List<Course> viewallcourses();
	public List<Parent> viewallparents();
	public Map<String, Map<Integer, String>> getTimetable();
	public List<TimeTable> filterTimetable(String academicYear,int year, String semester, String branch);

	//delete
	public String deletefaculty(int fid);
	public String deletestudent(int sid);
	public String deletecourse(int cid);
	public String deleteparent(int pid);
	
	//update
	public String updateStudent(Student s) ;
	public String updateFaculty(Faculty f);
	public String updateParent(Parent p);
	public String updateCourse(Course c);
	
	//by id
	public Student displaystudentybyId(int sid);
	public Faculty displayfacultybyId(int fid);
	public Parent displayparentbyId(int pid);
	public Course displaycoursebyId(int cid);
	
	//status updating
	public String updatestudentstatus(String sstatus,int sid);
	public String updatefacultystatus(String fstatus,int fid);
	
	//chart
	Long getMaleStudentCount();
    Long getFemaleStudentCount();
    Long getMaleFacultyCount();
    Long getFemaleFacultyCount();
	
	
}
