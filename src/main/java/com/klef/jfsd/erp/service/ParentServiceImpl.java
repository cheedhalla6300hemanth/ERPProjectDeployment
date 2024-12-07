package com.klef.jfsd.erp.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.erp.model.ForgetbyOTP;
import com.klef.jfsd.erp.model.Parent;
import com.klef.jfsd.erp.model.Student;
import com.klef.jfsd.erp.repository.ForgetbyOTPRepository;
import com.klef.jfsd.erp.repository.ParentRepository;
import com.klef.jfsd.erp.repository.StudentRepository;


@Service
public class ParentServiceImpl implements ParentService {

	 @Autowired
		private ParentRepository parentRepository;
	    @Autowired
		private StudentRepository studentRepository;
	    @Autowired
	    private ForgetbyOTPRepository forgetbyOTPRepository;
	    
	@Override
	public Student checkstudentpresent(String semail, String scontact) {
		return parentRepository.checkstudentpresent(semail, scontact);
	}
	@Override
	public String addparent(Parent p) {
		// TODO Auto-generated method stub
		parentRepository.save(p);
		return "Parent Added Successfully By checking";
	}
	@Override
	public Parent checkparentlogin( String puseranme, String ppassword) {
		// TODO Auto-generated method stub
		return parentRepository.checkparentlogin( puseranme, ppassword);
	}
	@Override
	public Student checkstudent(String semail) {
		// TODO Auto-generated method stub
		return studentRepository.checkstudent(semail);
	}
	@Override
	public String updateparentprofile(Parent p) {
		// Fetch the existing Parent entity using the parent ID
		Parent parent = parentRepository.findById(p.getPid()).get(); 

		// Update the Parent fields with the new values from the incoming Parent object (p)
		parent.setPusername(p.getPusername());
		parent.setPpassword(p.getPpassword());
		parent.setPgender(p.getPgender());
		parent.setPdateofbirth(p.getPdateofbirth());
		parent.setPrelation(p.getPrelation());
		parent.setPaddress(p.getPaddress());
		parent.setPcontact(p.getPcontact()); // Make sure this does not violate unique constraints

		// Save the updated Parent entity back to the database
		parentRepository.save(parent);

		// Return a success message
		return "Parent Updated Successfully";

	}
	@Override
	public Parent getParentById(int pid) {
		 return parentRepository.findById(pid).orElse(null);
	}
	@Override
	public String sendp(ForgetbyOTP f) {
		forgetbyOTPRepository.save(f);
		return null;
	}
	@Override
	public ForgetbyOTP checkparentotp(String semail, int potp) {
		return forgetbyOTPRepository.checkparentotp(semail, potp);
	}
	@Override
	public boolean updatePasswordp(String semail, String ppassword) {
		 Optional<Parent> user = parentRepository.findBySemail(semail);
	        if (user.isPresent()) {
	            Parent p= user.get();
	            p.setPpassword(ppassword);
	            parentRepository.save(p);
	            return true;
	        }
	        return false;
	}

}
