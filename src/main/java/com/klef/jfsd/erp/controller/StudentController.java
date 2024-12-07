
package com.klef.jfsd.erp.controller;
import java.sql.Blob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.erp.model.ForgetbyOTP;
import com.klef.jfsd.erp.model.Student;
import com.klef.jfsd.erp.repository.StudentRepository;
import com.klef.jfsd.erp.service.AdminService;
import com.klef.jfsd.erp.service.StudentService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private StudentRepository studentRepository;
	
	 @GetMapping("/studentlogin")
	    public ModelAndView studentlogin() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("studentlogin");
			return mv; // 
	    }
	 @GetMapping("/studenthome")
	    public ModelAndView studenthome() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("studenthome");
			return mv; // 
	    }
	 @GetMapping("/studentprofile")
	    public ModelAndView studentprofile() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("studentprofile");
			return mv; // 
	    }
	 @GetMapping("/contactus")
	    public ModelAndView stu() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("contactus");
			return mv; // 
	    }
	 @GetMapping("/mailsuccess")
	    public ModelAndView mailsuccess() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("mailsucess");
			return mv; // 
	    }
	 @PostMapping("sendemailbystudent") 
	   public ModelAndView sendEmailbystudent(HttpServletRequest request) throws Exception  
	   { 
	       String name = request.getParameter("name"); 
	       String toemail = request.getParameter("email"); 
	       String subject = request.getParameter("subject"); 
	       String msg = request.getParameter("message"); 
	 
	        MimeMessage mimeMessage = mailSender.createMimeMessage(); 
	        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true); 
	         
	        int otp = (int)(Math.random() * 99999); // random number generation         
	 
	        helper.setTo(toemail); 
	        helper.setSubject(subject); 
	        helper.setFrom("jfsdspringbooterp@gmail.com"); 
	 
	        String htmlContent =  
	                   "<h3>Contact Form Details</h3>" + 
	                   "<p><strong>Name:</strong> " + name + "</p>" + 
	                   "<p><strong>Email:</strong> " + toemail + "</p>" + 
	                   "<p><strong>Subject:</strong> " + subject + "</p>" + 
	                   "<p><strong>Message:</strong> " + msg + "</p>" + 
	                   "<p><strong>OTP:</strong> " + otp + "</p>"; 
	 
	 
	           helper.setText(htmlContent, true); 
	           mailSender.send(mimeMessage); 
	          
	           ModelAndView mv = new ModelAndView("mailsuccess"); 
	           mv.addObject("message", "Email Sent Successfully"); 
	 
	           return mv; 
	   } 
	
	    @GetMapping("/student")
	    public ModelAndView student() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("student");
			return mv; 
	    }
	    @GetMapping("/studentregistration")
	    public ModelAndView studentregistration() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("studentregistration");
			return mv; 
	    }
	    @PostMapping("insertstudent")
		 public ModelAndView insertstudent(HttpServletRequest request,@RequestParam("simage") MultipartFile file) throws Exception {
		     // Retrieve parameters from the request
		     String sname = request.getParameter("sname");
		     String sfathername = request.getParameter("sfathername");
		     String smothername = request.getParameter("smothername");
		     String sgender = request.getParameter("sgender");
		     String sdateofbirth = request.getParameter("sdateofbirth");
		     String sdepartment = request.getParameter("sdepartment");
		     String semail = request.getParameter("semail");
		     String spassword = request.getParameter("spassword");
		     String slocation = request.getParameter("slocation");
		     String scontact = request.getParameter("scontact");
		     String sreligion = request.getParameter("sreligion");
		     String sstatus = "Registered"; // Default status
		     
		     byte[] bytes = file.getBytes();
			  Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

		     // Create a new Student object
		     Student s= new Student();
		     s.setSimage(blob);
		    s.setSname(sname);
		    s.setSfathername(sfathername);
		    s.setSmothername(smothername);
		    s.setSgender(sgender);
		    s.setSdateofbirth(sdateofbirth);
		    s.setSdepartment(sdepartment);
		    s.setSemail(semail);
		    s.setSpassword(spassword);
		    s.setSlocation(slocation);
		    s.setScontact(scontact);
		    s.setSreligion(sreligion);
		    s.setSstatus(sstatus);
		     
		     // Call the service to register the student
		     String msg = adminService.StudentRegistration(s);
		     
		     // Prepare the ModelAndView for success page
		     ModelAndView mv = new ModelAndView("sregsuccess");
		     mv.addObject("message", msg);

		     return mv;
		 }
	    @GetMapping("displaystudentimage")
	    public ResponseEntity<byte[]> displaystudentimage(@RequestParam("sid") int sid) throws Exception
	    {
	     Student student =  adminService.displaystudentybyId(sid);
	      byte [] imageBytes = null;
	      imageBytes = student.getSimage().getBytes(1,(int) student.getSimage().length());

	      return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	      
	    // Response Body, HTTP Status Code, Headers
	    }

	    @PostMapping("/checkstudentlogin")
	    @ResponseBody
	    public ModelAndView checkstudentlogin(HttpServletRequest request)
	    {
	      ModelAndView mv = new ModelAndView();
	      String semail=request.getParameter("semail");
	      String spassword=request.getParameter("spassword");
	      Student student=studentService.checkstudentlogin(semail, spassword);
	      
	      if(student!=null)
	      {
	    	  HttpSession session= request.getSession();
			  session.setAttribute("s", student); 
			  session.setMaxInactiveInterval(180);
	    		mv.setViewName("student");
	    	  return mv;
	      }
	      else {
	          // Check for wrong credentials or status message
	          if (student == null) {
	              // Additional check for password or email issue
	              student = studentRepository.checkstudentlogin(semail, spassword);
	              if (student == null) {
	                  mv.setViewName("studentlogin");
	                  mv.addObject("message", "Wrong credentials, please try again.");
	              } else if ("Registered".equals(student.getSstatus())) {
	                  mv.setViewName("studentlogin");
	                  mv.addObject("message", "Still awaiting Admin's permission.");
	              } else if ("Rejected".equals(student.getSstatus())) {
	                  mv.setViewName("studentlogin");
	                  mv.addObject("message", "You have been rejected by Admin.");
	              }
	          }
	          return mv;
	      }
	  }
	    @GetMapping("/logoutu")
	    public ModelAndView logoutu(HttpServletRequest request) {
	    	HttpSession session =request.getSession();
			session.removeAttribute("s");
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("logoutu");
			return mv; 
	    }
	    
	    //update
	    @GetMapping("updatestudent")
		public ModelAndView updatestudent() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updatestudent") ;
		return mv;
		}
	    @PostMapping("updatestudentprofile")
	    public ModelAndView updatestudentprofile(HttpServletRequest request) {
	        ModelAndView mv = new ModelAndView();
	        
	        try {
	            int sid = Integer.parseInt(request.getParameter("sid"));
	            String sname = request.getParameter("sname");
	            String sfathername = request.getParameter("sfathername");
	            String smothername = request.getParameter("smothername");
	            String sgender = request.getParameter("sgender");
	            String sdateofbirth = request.getParameter("sdateofbirth");
	            String sdepartment = request.getParameter("sdepartment");
	          
	            String spassword = request.getParameter("spassword");
	            String slocation = request.getParameter("slocation");
	            String scontact = request.getParameter("scontact");
	            String sreligion = request.getParameter("sreligion");

	            Student student = new Student();
	            student.setSid(sid);
	            student.setSname(sname);
	            student.setSfathername(sfathername);
	            student.setSmothername(smothername);
	            student.setSgender(sgender);
	            student.setSdateofbirth(sdateofbirth);
	            student.setSdepartment(sdepartment);
	           
	            student.setSpassword(spassword);
	            student.setSlocation(slocation);
	            student.setScontact(scontact);
	            student.setSreligion(sreligion);

	            String msg = studentService.updatestudentprofile(student);
	            
	            Student stu= adminService.displaystudentybyId(sid);
	            
	            HttpSession session = request.getSession();
	            session.setAttribute("s", stu); // "student" is session variable
	            
	            mv.setViewName("updatesuccesss");
	            mv.addObject("message", msg);
	        } catch(Exception e) {
	            mv.setViewName("updateerrors");
	            mv.addObject("message", e);
	        }
	        
	        return mv;
	    }
	    
	    //forget paassword
	    @GetMapping("/sforgetpassword")
	    public ModelAndView studentf() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("sforgetpassword");
			return mv;
	    }
	    @PostMapping("ssendemail")
	    public ModelAndView sendEmail(HttpServletRequest request) throws Exception
	    {
	   
	    String toemail = request.getParameter("semail");
	    String subject = "To Reset Password";

	    String msg ="Type OTP For Conformation";

	    MimeMessage mimeMessage = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);

	    int otp = (int)(Math.random() * 99999);
	    ForgetbyOTP f= new ForgetbyOTP();
	    f.setSemail(toemail);
	    f.setSotp(otp);
	    String message = studentService.send(f);
	    helper.setTo(toemail);
	    			
	    helper.setFrom("jfsdspringbooterp@gmail.com");
	    String htmlContent =
	    "<h3>Account Verfication</h3>" +
	    
	    "<p><strong>Email:</strong> " + toemail + "</p>" +
	    "<p><strong>Subject:</strong> " + subject + "</p>" +
	    "<p><strong>Message:</strong> " + msg + "</p>" +
	    "<p><strong>OTP:</strong> " + otp + "</p>";
	    helper.setText(htmlContent, true);
	    mailSender.send(mimeMessage);

	    ModelAndView mv = new ModelAndView("stypeotp");
	    mv.addObject("message", "Email Sent Successfully");
	    return mv;
	    }
	    @GetMapping("/stypeotp")
	    public ModelAndView studento() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("stypeotp");
			return mv; // 
	    }
	    @PostMapping("/sverify")
	    @ResponseBody
	    public ModelAndView checkadminlogin(HttpServletRequest request)
	    {
	      ModelAndView mv = new ModelAndView();
	      String semail=request.getParameter("semail");
	      int sotp =Integer.parseInt(request.getParameter("sotp"));
	      ForgetbyOTP f=studentService.checkstudentotp(semail, sotp);
	      
	      if(f!=null)
	      {
	    	 
	    		mv.setViewName("sretypepassword");
	    	  return mv;
	      }
	      else
	      {
	    	  mv.setViewName("stypeotp");
	    	  mv.addObject("message", "OTP WRONG");
	    	  return mv;
	    	  
	      }
	    }
	    @PostMapping("/resetpassword")
	    public String resetPassword(@RequestParam("email") String email,
	                                @RequestParam("password") String password,
	                                @RequestParam("confirmPassword") String confirmPassword,
	                                Model model) {
	        if (!password.equals(confirmPassword)) {
	            model.addAttribute("error", "Passwords do not match.");
	            return "sretypepassword";
	        }
	        boolean isReset = studentService.updatePassword(email, password);
	        if (isReset) {
	            model.addAttribute("message", "Password reset successfully.");
	            return "studentlogin";
	        } else {
	            model.addAttribute("error", "Invalid email or unable to reset password.");
	            return "sretypepassword";
	        }
	    }
	    

}
