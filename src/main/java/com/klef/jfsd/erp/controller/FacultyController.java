package com.klef.jfsd.erp.controller;
import java.sql.Blob;
import java.util.List;

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

import com.klef.jfsd.erp.model.Faculty;
import com.klef.jfsd.erp.model.ForgetbyOTP;
import com.klef.jfsd.erp.model.Student;
import com.klef.jfsd.erp.repository.FacultyRepository;
import com.klef.jfsd.erp.service.AdminService;
import com.klef.jfsd.erp.service.FacultyCourseService;
import com.klef.jfsd.erp.service.FacultyService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class FacultyController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private FacultyService facultyService;
	@Autowired
	private FacultyCourseService facultyCourseService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private FacultyRepository facultyRepository;
	
	  @GetMapping("/facultylogin")
	    public ModelAndView facultylogin() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("facultylogin");
			return mv; // 
	    }
	  @GetMapping("/facultyhome")
	    public ModelAndView facultyhome() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("facultyhome");
			return mv; // 
	    }
	 @GetMapping("/facultyprofile")
	    public ModelAndView facultyprofile() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("facultyprofile");
			return mv; // 
	    }
	  @GetMapping("/facultyregistration")
	    public ModelAndView facultyregistration() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("facultyregistration");
			return mv; 
	    }
	  @PostMapping("insertfaculty")
		 public ModelAndView insertfaculty(HttpServletRequest request,@RequestParam("fimage") MultipartFile file,@RequestParam("fresume") MultipartFile rfile) throws Exception{
		     // Retrieve parameters from the request
		     String fname = request.getParameter("fname");
		     String ffathername = request.getParameter("ffathername");
		     String fmothername = request.getParameter("fmothername");
		     String fgender = request.getParameter("fgender");
		     String fdateofbirth = request.getParameter("fdateofbirth");
		     String fdepartment = request.getParameter("fdepartment");
		     double fsalary= Double.parseDouble(request.getParameter("fsalary"));
		     String femail = request.getParameter("femail");
		     String fpassword = request.getParameter("fpassword");
		     String flocation = request.getParameter("flocation");
		     String fcontact = request.getParameter("fcontact");
		     String fmaritalstatus=request.getParameter("fmaritalstatus");
		     String freligion = request.getParameter("freligion");
		     String fstatus = "Registered"; // Default status
		     String furl = request.getParameter("furl");
		     
		     byte[] bytes = file.getBytes();
			  Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
			  byte[] rbytes = rfile.getBytes();
			  Blob rblob = new javax.sql.rowset.serial.SerialBlob(rbytes);

		     // Create a new faculty object
		    Faculty  f= new Faculty();
		    f.setFimage(blob);
		    f.setFname(fname);
		    f.setFfathername(ffathername);
		    f.setFmothername(fmothername);
		    f.setFgender(fgender);
		    f.setFdateofbirth(fdateofbirth);
		    f.setFdepartment(fdepartment);
		    f.setFsalary(fsalary);
		    f.setFemail(femail);
		    f.setFpassword(fpassword);
		    f.setFlocation(flocation);
		    f.setFcontact(fcontact);
		    f.setFmaritalstatus(fmaritalstatus);
		    f.setFresume(rblob);
		    f.setFurl(furl);
		    f.setFreligion(freligion);
		    f.setFstatus(fstatus);
		    
		     // Call the service to register the faculty
		     String msg = adminService.FacultyRegistration(f);
		     
		     // Prepare the ModelAndView for success page
		     ModelAndView mv = new ModelAndView("sregsuccess");
		     mv.addObject("message", msg);

		     return mv;
		 }
	  
	  @GetMapping("displayfacultyimage")
	    public ResponseEntity<byte[]> displayfacultyimage(@RequestParam("fid") int fid) throws Exception
	    {
	     Faculty faculty =  adminService.displayfacultybyId(fid);
	      byte [] imageBytes = null;
	      imageBytes = faculty.getFimage().getBytes(1,(int) faculty.getFimage().length());

	      return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	      
	    // Response Body, HTTP Status Code, Headers
	    }
	    
	    @GetMapping("displayfacultyresume")
	    public ResponseEntity<byte[]> displayfacultyresume(@RequestParam("fid") int fid) throws Exception
	    {
	     Faculty faculty =  adminService.displayfacultybyId(fid);
	      byte [] resumeBytes = null;
	      resumeBytes = faculty.getFresume().getBytes(1,(int) faculty.getFresume().length());

	      return ResponseEntity.ok().contentType(MediaType.APPLICATION_PDF).body(resumeBytes);
	      
	    // Response Body, HTTP Status Code, Headers
	    }
	  @PostMapping("/checkfacultylogin")
	    @ResponseBody
	    public ModelAndView checkfacultylogin(HttpServletRequest request)
	    {
	      ModelAndView mv = new ModelAndView();
	      String femail=request.getParameter("femail");
	      String fpassword=request.getParameter("fpassword");
	      Faculty faculty=facultyService.checkfacultylogin(femail, fpassword);
	      
	      if(faculty!=null)
	      {
	    	  HttpSession session= request.getSession();
			  session.setAttribute("f", faculty);//"employee" is session variable 
			  session.setMaxInactiveInterval(180);
	    		mv.setViewName("faculty");
	    	  return mv;
	      }
	      else {
	          // Check for wrong credentials or status message
	          if (faculty == null) {
	              // Additional check for password or email issue
	        	  faculty  = facultyRepository.checkfacultylogin(femail,fpassword);
	              if (faculty  == null) {
	                  mv.setViewName("facultylogin");
	                  mv.addObject("message", "Wrong credentials, please try again.");
	              } else if ("Registered".equals(faculty.getFstatus())) {
	                  mv.setViewName("facultylogin");
	                  mv.addObject("message", "Still awaiting Admin's permission.");
	              } else if ("Rejected".equals(faculty.getFstatus())) {
	                  mv.setViewName("facultylogin");
	                  mv.addObject("message", "You have been rejected by Admin.");
	              }
	          }
	          return mv;
	      }
	  }
	  @GetMapping("/logoutf")
	    public ModelAndView logoutf(HttpServletRequest request) {
	    	HttpSession session =request.getSession();
			session.removeAttribute("f"); 
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("logoutf");
			return mv; 
	    }
	  @GetMapping("viewallstudentsbyf")
	     public ModelAndView viewallstudentsbyf()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Student> studentlist = facultyService.viewallstudents();
	       mv.setViewName("viewallstudentsbyf");
	       mv.addObject("studentlist",studentlist);
	       return mv;
	     }
	  
	  //delete
	  @GetMapping("deletestudentbyf")
	    public ModelAndView deletestudentbyf()
	    {
	      ModelAndView mv = new ModelAndView();
	      List<Student> studentlist = adminService.viewallstudents();
	      mv.setViewName("deletestudentbyf");
	      mv.addObject("studentlist",studentlist);
	      return mv;
	    }
	    @GetMapping("deletes")
	    public String deleteoperations(@RequestParam("id") int sid) {
	    	
	    	facultyService.deletestudent(sid);
	    	return "redirect:/deletestudentbyf";
	    }
	    
	    
	    @GetMapping("/delete")
	    public ModelAndView delete() {
	     	ModelAndView mv=new ModelAndView();
	    		mv.setViewName("delete");
	    		return mv;  
	    }
	    @PostMapping("/checkdelete")
	    @ResponseBody
	    public ModelAndView checkdelete(HttpServletRequest request)
	    {
	      ModelAndView mv = new ModelAndView();
	      String semail=request.getParameter("semail");
	      String spassword=request.getParameter("spassword");
	      Student student=facultyService.checkdelete(semail, spassword);
	      
	      if(student!=null)
	      {
	    		mv.setViewName("laststeptod");
	    		  mv.addObject("student", student); 
	    	  return mv;
	      }
	      else
	      {
	    	  mv.setViewName("delete");
	    	  mv.addObject("message", "Wrong password");
	    	  return mv;
	    	  
	      }
	    }
	    
	    //update 
	    @GetMapping("updatefaculty")
	 		public ModelAndView updatefaculty() {
	 		ModelAndView mv = new ModelAndView();
	 		mv.setViewName("updatefaculty") ;
	 		return mv;
	 		}
	    @PostMapping("updatefacultyprofile")
	    public ModelAndView updatefacultyprofile(HttpServletRequest request) {
	        ModelAndView mv = new ModelAndView();
	        
	        try {
	            int fid = Integer.parseInt(request.getParameter("fid"));
	            String fname = request.getParameter("fname");
	            String ffathername = request.getParameter("ffathername");
	            String fmothername = request.getParameter("fmothername");
	            String fgender = request.getParameter("fgender");
	            String fdateofbirth = request.getParameter("fdateofbirth");
	            String fdepartment = request.getParameter("fdepartment");
	            double fsalary = Double.parseDouble(request.getParameter("fsalary"));
	            String femail = request.getParameter("femail");
	            String fpassword = request.getParameter("fpassword");
	            String flocation = request.getParameter("flocation");
	            String fcontact = request.getParameter("fcontact");
	            String fmaritalstatus = request.getParameter("fmaritalstatus");
	            String freligion = request.getParameter("freligion");

	            Faculty faculty = new Faculty();
	            faculty.setFid(fid);
	            faculty.setFname(fname);
	            faculty.setFfathername(ffathername);
	            faculty.setFmothername(fmothername);
	            faculty.setFgender(fgender);
	            faculty.setFdateofbirth(fdateofbirth);
	            faculty.setFdepartment(fdepartment);
	            faculty.setFsalary(fsalary);
	            faculty.setFemail(femail);
	            faculty.setFpassword(fpassword);
	            faculty.setFlocation(flocation);
	            faculty.setFcontact(fcontact);
	            faculty.setFmaritalstatus(fmaritalstatus);
	            faculty.setFreligion(freligion);

	            String msg = facultyService.updatefacultyprofile(faculty);
	            
	            Faculty fac= adminService.displayfacultybyId(fid);
	            
	            HttpSession session = request.getSession();
	            session.setAttribute("f", fac); // "faculty" is session variable
	            
	            mv.setViewName("updatesuccessf");
	            mv.addObject("message", msg);
	        } catch (Exception e) {
	            mv.setViewName("updateerrorf");
	            mv.addObject("message", e.getMessage());
	        }
	        
	        return mv;
	    }

	    
	    @GetMapping("/mycourses")
	    public String myCourses(Model model, HttpSession session) {
	        Faculty faculty = (Faculty) session.getAttribute("f");
	        if (faculty != null) {
	            Integer facultyId = faculty.getFid(); // Assuming Faculty has a getFid() method
	            Faculty facultyDetails = facultyCourseService.getFacultyWithCourses(facultyId);
	            model.addAttribute("faculty", facultyDetails);
	            model.addAttribute("facultyCourseList", facultyCourseService.getAllFacultyCourses());
	        }
	        return "mycourses";
	    }

	  //forget paassword
	    @GetMapping("/fforgetpassword")
	    public ModelAndView facultyf() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("fforgetpassword");
			return mv;
	    }
	    @PostMapping("fsendemail")
	    public ModelAndView sendEmail(HttpServletRequest request) throws Exception
	    {
	   
	    String toemail = request.getParameter("femail");
	    String subject = "To Reset Password";

	    String msg ="Type OTP For Conformation";

	    MimeMessage mimeMessage = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);

	    int otp = (int)(Math.random() * 999999);
	    ForgetbyOTP f= new ForgetbyOTP();
	    f.setFemail(toemail);
	    f.setFotp(otp);
	    String message = facultyService.sendf(f);
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

	    ModelAndView mv = new ModelAndView("ftypeotp");
	    mv.addObject("message", "Email Sent Successfully");
	    return mv;
	    }
	    @GetMapping("/ftypeotp")
	    public ModelAndView facultyo() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("ftypeotp");
			return mv; // 
	    }
	    @PostMapping("/fverify")
	    @ResponseBody
	    public ModelAndView checkadminlogin(HttpServletRequest request)
	    {
	      ModelAndView mv = new ModelAndView();
	      String femail=request.getParameter("femail");
	      int fotp =Integer.parseInt(request.getParameter("fotp"));
	      ForgetbyOTP f=facultyService.checkfacultyotp(femail, fotp);
	      
	      if(f!=null)
	      {
	    	 
	    		mv.setViewName("fretypepassword");
	    	  return mv;
	      }
	      else
	      {
	    	  mv.setViewName("ftypeotp");
	    	  mv.addObject("message", "OTP WRONG");
	    	  return mv;
	    	  
	      }
	    }
	    @PostMapping("/fresetpassword")
	    public String resetPassword(@RequestParam("email") String email,
	                                @RequestParam("password") String password,
	                                @RequestParam("confirmPassword") String confirmPassword,
	                                Model model) {
	        if (!password.equals(confirmPassword)) {
	            model.addAttribute("error", "Passwords do not match.");
	            return "fretypepassword";
	        }
	        boolean isReset = facultyService.updatePasswordf(email, password);
	        if (isReset) {
	            model.addAttribute("message", "Password reset successfully.");
	            return "facultylogin";
	        } else {
	            model.addAttribute("error", "Invalid email or unable to reset password.");
	            return "fretypepassword";
	        }
	    }
}
