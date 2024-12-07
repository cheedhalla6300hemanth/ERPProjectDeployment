package com.klef.jfsd.erp.service;


import com.klef.jfsd.erp.model.ForgetbyOTP;
import com.klef.jfsd.erp.model.Parent;
import com.klef.jfsd.erp.model.Student;


public interface ParentService {

	public Parent checkparentlogin(String puseranme,String ppassword);
	public Student checkstudent(String semail);
	public Student checkstudentpresent(String semail,String scontact);
	public String addparent(Parent p);
	public String updateparentprofile(Parent p);
	public Parent getParentById(int pid);
	
	//forget password
    public String sendp(ForgetbyOTP f);
    public ForgetbyOTP checkparentotp(String semail,int potp);
    public boolean updatePasswordp(String semail, String ppassword);
}
