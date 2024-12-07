package com.klef.jfsd.erp.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.erp.model.Faculty;
import com.klef.jfsd.erp.model.ForgetbyOTP;
import com.klef.jfsd.erp.model.Student;
import com.klef.jfsd.erp.repository.FacultyRepository;
import com.klef.jfsd.erp.repository.ForgetbyOTPRepository;
import com.klef.jfsd.erp.repository.StudentRepository;
@Service
public class FacultyServiceImpl implements FacultyService{

	@Autowired
	private StudentRepository studentRepository;
	@Autowired
	private FacultyRepository facultyRepository;
	@Autowired
	private ForgetbyOTPRepository forgetbyOTPRepository;
	@Override
	public Faculty checkfacultylogin(String femail, String fpassword) {
		// TODO Auto-generated method stub
		Faculty faculty =facultyRepository.checkfacultylogin(femail, fpassword);
		if (faculty != null) {
	        if ("Accepted".equals(faculty.getFstatus())) {
	            return faculty; // Login successful
	        } else if ("Registered".equals(faculty.getFstatus())) {
	            return null; // Not yet approved by Admin
	        } else if ("Rejected".equals(faculty.getFstatus())) {
	            return null; // Rejected by Admin
	        }
	    }
	    return null;
		
	}

	@Override
	public List<Faculty> viewallfacultys() {
		// TODO Auto-generated method stub
		return facultyRepository.findAll();
	}

	@Override
	public List<Student> viewallstudents() {
		// TODO Auto-generated method stub
		return studentRepository.findAll();
	}

	@Override
	public String deletestudent(int sid) {
	studentRepository.deleteById(sid);
		return "Student Deleted Successfully by Faculty";
	}

	@Override
	public String updatestudent(Student s) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String updatefaculty(Faculty f) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Student checkdelete(String semail, String spassword) {
		// TODO Auto-generated method stub
		return studentRepository.checkdelete(semail, spassword);
	}

	@Override
	public String updatefacultyprofile(Faculty f) {
		Faculty faculty = facultyRepository.findById(f.getFid()).get();

		
		faculty.setFname(f.getFname());
		faculty.setFfathername(f.getFfathername());
		faculty.setFmothername(f.getFmothername());
		faculty.setFgender(f.getFgender());
		faculty.setFdateofbirth(f.getFdateofbirth());
		faculty.setFdepartment(f.getFdepartment());
		faculty.setFsalary(f.getFsalary());
		faculty.setFpassword(f.getFpassword());
		faculty.setFlocation(f.getFlocation());
		faculty.setFcontact(f.getFcontact());
		faculty.setFmaritalstatus(f.getFmaritalstatus());
		faculty.setFreligion(f.getFreligion());

		facultyRepository.save(faculty);

		return "Faculty Updated Successfully";

	}
//forget
	@Override
	public String sendf(ForgetbyOTP f) {
		forgetbyOTPRepository.save(f);
		return null;
	}

	@Override
	public ForgetbyOTP checkfacultyotp(String femail, int fotp) {
		return forgetbyOTPRepository.checkfacultyotp(femail, fotp);
	}

	@Override
	public boolean updatePasswordf(String femail, String fpassword) {
		 Optional<Faculty> user = facultyRepository.findByFemail(femail);
	        if (user.isPresent()) {
	            Faculty f= user.get();
	            f.setFpassword(fpassword);
	            facultyRepository.save(f);
	            return true;
	        }
	        return false;
	    }

	
}
