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
import com.klef.jfsd.erp.model.Parent;
import com.klef.jfsd.erp.model.Student;
import com.klef.jfsd.erp.service.AdminService;
import com.klef.jfsd.erp.service.ParentService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ParentController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private ParentService parentService;
	@Autowired
	private JavaMailSender mailSender;
	
	 @GetMapping("/parent")
	    public ModelAndView parent() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("parent");
			return mv; 
	    }
	 @GetMapping("/parentprofile")
	    public ModelAndView parentp() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("parentprofile");
			return mv; 
	    }
	 @GetMapping("/parentregister")
	    public ModelAndView parentregister() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("parentregister");
			return mv; 
	    }
	 //checking and adding
	  @PostMapping("/checkstudentpresent")
	    @ResponseBody
	    public ModelAndView checkstudentpresent(HttpServletRequest request,@RequestParam("pimage") MultipartFile file) throws Exception
	    {
	      ModelAndView mv = new ModelAndView();
	      String semail=request.getParameter("semail");
	      String scontact=request.getParameter("scontact");
	      Student studentp=parentService.checkstudentpresent(semail, scontact);
	      
	      if(studentp!=null)
	      {
	    	  
			  String ssemail = request.getParameter("semail");
			  String sscontact = request.getParameter("scontact");
			  String pusername = request.getParameter("pusername");
			  String ppassword = request.getParameter("ppassword");
			  String pgender = request.getParameter("pgender");
			  String pdateofbirth = request.getParameter("pdateofbirth");
			  String prelation = request.getParameter("prelation");
			  String paddress = request.getParameter("paddress");
			  String pcontact = request.getParameter("pcontact");
			  
			  byte[] bytes = file.getBytes();
			  Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

			  // Create a new Parent object
			  Parent p = new Parent();
			  p.setPimage(blob);
			  p.setSemail(ssemail);
			  p.setScontact(sscontact);
			  p.setPusername(pusername);
			  p.setPpassword(ppassword);
			  p.setPgender(pgender);
			  p.setPdateofbirth(pdateofbirth);
			  p.setPrelation(prelation);
			  p.setPaddress(paddress);
			  p.setPcontact(pcontact);

			  
			  String msg = parentService.addparent(p);

			  // Prepare the ModelAndView for success page
			  mv.setViewName("pregsuccess");
			  mv.addObject("message", msg);

			  return mv;

	      }
	      else
	      {
	    	  mv.setViewName("parentregister");
	    	  mv.addObject("message", "Wrong Child Details");
	    	  return mv;
	    	  
	      }
	    }
	  
	  @GetMapping("displayparentimage")
	    public ResponseEntity<byte[]> displayparentimage(@RequestParam("pid") int pid) throws Exception
	    {
	     Parent parent =  adminService.displayparentbyId(pid);
	      byte [] imageBytes = null;
	      imageBytes = parent.getPimage().getBytes(1,(int) parent.getPimage().length());

	      return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	      
	    // Response Body, HTTP Status Code, Headers
	    }
	  @GetMapping("/parentlogin")
	    public ModelAndView parentlogin() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("parentlogin");
			return mv; 
	    }
	  @PostMapping("/checkparentlogin")
	    @ResponseBody
	    public ModelAndView checkparentlogin(HttpServletRequest request)
	    {
	      ModelAndView mv = new ModelAndView();
	      String semail=request.getParameter("semail");
	      String pusername=request.getParameter("pusername");
	      String ppassword=request.getParameter("ppassword");
	      Parent parent=parentService.checkparentlogin( pusername, ppassword);
	      Student student=parentService.checkstudent(semail);
	      if(parent!=null && student!=null)
	      {
	    	  HttpSession session= request.getSession();
			  session.setAttribute("p", parent); 
			  session.setAttribute("s", student);
			  session.setMaxInactiveInterval(10);  
	    		mv.setViewName("parent");
	    	  return mv;
	      }
	      else
	      {
	    	  mv.setViewName("parentlogin");
	    	  mv.addObject("message", "Login Failed");
	    	  return mv;
	    	  
	      }
	    }
	  @GetMapping("/mychildprofile")
	    public ModelAndView mychildprofile() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("mychildprofile");
			return mv; 
	    }
	  @GetMapping("/logoutp")
	    public ModelAndView logoutp(HttpServletRequest request) {
	    	HttpSession session =request.getSession();
			session.removeAttribute("p"); 
			session.removeAttribute("s"); 
	    	ModelAndView mv=new ModelAndView();
	    	
			mv.setViewName("logoutp");
			return mv; 
	    }
	  //update
	    @GetMapping("updateparent")
		public ModelAndView updateparent() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updateparent") ;
		return mv;
		}
	    @PostMapping("updateparentprofile")
	    public ModelAndView updateparentprofile(HttpServletRequest request) {
	        ModelAndView mv = new ModelAndView();
	        
	        try {
	            int pid = Integer.parseInt(request.getParameter("pid"));
	            String semail = request.getParameter("semail");
	            String scontact = request.getParameter("scontact");
	            String pusername = request.getParameter("pusername");
	            String ppassword = request.getParameter("ppassword");
	            String pgender = request.getParameter("pgender");
	            String pdateofbirth = request.getParameter("pdateofbirth");
	            String prelation = request.getParameter("prelation");
	            String paddress = request.getParameter("paddress");
	            String pcontact = request.getParameter("pcontact");
	            
	            Parent parent = new Parent();
	            parent.setPid(pid);
	            parent.setSemail(semail);
	            parent.setScontact(scontact);
	            parent.setPusername(pusername);
	            parent.setPpassword(ppassword);
	            parent.setPgender(pgender);
	            parent.setPdateofbirth(pdateofbirth);
	            parent.setPrelation(prelation);
	            parent.setPaddress(paddress);
	            parent.setPcontact(pcontact);
	            
	            String msg = parentService.updateparentprofile(parent);
	            
	            Parent updatedParent = adminService.displayparentbyId(pid);
	            
	            HttpSession session = request.getSession();
	            session.setAttribute("p", updatedParent); // "parent" is the session variable
	            
	            mv.setViewName("updatesuccessp");
	            mv.addObject("message", msg);
	        } catch(Exception e) {
	            mv.setViewName("updateerrorp");
	            mv.addObject("message", e.getMessage());
	        }
	        
	        return mv;
	    }
	  //forget paassword
	    @GetMapping("/pforgetpassword")
	    public ModelAndView parentf() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("pforgetpassword");
			return mv;
	    }
	    @PostMapping("psendemail")
	    public ModelAndView sendEmail(HttpServletRequest request) throws Exception
	    {
	   
	    String toemail = request.getParameter("semail");
	    String subject = "To Reset Password";
        String name=request.getParameter("pusername");
	    String msg ="Type OTP For Conformation";

	    MimeMessage mimeMessage = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);

	    int otp = (int)(Math.random() * 999999);
	    ForgetbyOTP f= new ForgetbyOTP();
	    f.setSemail(toemail);
	    f.setPotp(otp);
	    f.setPusername(name);
	    
	    String message = parentService.sendp(f);
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

	    ModelAndView mv = new ModelAndView("ptypeotp");
	    mv.addObject("message", "Email Sent Successfully");
	    return mv;
	    }
	    @GetMapping("/ptypeotp")
	    public ModelAndView parento() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("ptypeotp");
			return mv; // 
	    }
	    @PostMapping("/pverify")
	    @ResponseBody
	    public ModelAndView checkadminlogin(HttpServletRequest request)
	    {
	      ModelAndView mv = new ModelAndView();
	      String semail=request.getParameter("semail");
	      int potp =Integer.parseInt(request.getParameter("potp"));
	      ForgetbyOTP f=parentService.checkparentotp(semail, potp);
	      
	      if(f!=null)
	      {
	    	 
	    		mv.setViewName("pretypepassword");
	    	  return mv;
	      }
	      else
	      {
	    	  mv.setViewName("ptypeotp");
	    	  mv.addObject("message", "OTP WRONG");
	    	  return mv;
	    	  
	      }
	    }
	    @PostMapping("/presetpassword")
	    public String resetPassword(@RequestParam("email") String email,
	                                @RequestParam("password") String password,
	                                @RequestParam("confirmPassword") String confirmPassword,
	                                Model model) {
	        if (!password.equals(confirmPassword)) {
	            model.addAttribute("error", "Passwords do not match.");
	            return "pretypepassword";
	        }
	        boolean isReset = parentService.updatePasswordp(email, password);
	        if (isReset) {
	            model.addAttribute("message", "Password reset successfully.");
	            return "parentlogin";
	        } else {
	            model.addAttribute("error", "Invalid email or unable to reset password.");
	            return "pretypepassword";
	        }
	    }
	 
	 
}
