package com.klef.jfsd.erp.service;

import java.util.List;
import com.klef.jfsd.erp.model.Faculty;
import com.klef.jfsd.erp.model.ForgetbyOTP;
import com.klef.jfsd.erp.model.Student;

public interface FacultyService {

	public Faculty checkfacultylogin(String femail,String fpassword);
	//view
	public List<Faculty> viewallfacultys();
	public List<Student> viewallstudents();
	//delete
	public String deletestudent(int sid);
	public Student checkdelete(String semail,String spassword);
	//update
	public String updatestudent(Student s);
	public String updatefaculty(Faculty f);
	//update profile 
	public String updatefacultyprofile(Faculty f);
	
	//forget password
    public String sendf(ForgetbyOTP f);
    public ForgetbyOTP checkfacultyotp(String femail,int fotp);
    public boolean updatePasswordf(String femail, String fpassword);

}
