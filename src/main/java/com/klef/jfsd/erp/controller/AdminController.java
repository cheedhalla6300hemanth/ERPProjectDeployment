package com.klef.jfsd.erp.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.erp.model.Admin;
import com.klef.jfsd.erp.model.Course;
import com.klef.jfsd.erp.model.Faculty;
import com.klef.jfsd.erp.model.Parent;
import com.klef.jfsd.erp.model.Student;
import com.klef.jfsd.erp.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

	  @Autowired
	  private AdminService adminService;
	 @GetMapping("/")
	    public ModelAndView home() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("index");
			return mv; // 
	    }
	 @GetMapping("dashboard")
	    public ModelAndView homeg() {
	    	ModelAndView mv=new ModelAndView();
	    	 long malecount=adminService.getMaleStudentCount();
			  long femalecount=adminService.getFemaleStudentCount();
			  long fmalecount=adminService.getMaleFacultyCount();
			  long ffemalecount=adminService.getFemaleFacultyCount();
	    	 mv.addObject("malecount", malecount);
		        mv.addObject("ffemalecount", ffemalecount);
		        mv.addObject("fmalecount", fmalecount);
		        mv.addObject("femalecount", femalecount);
			mv.setViewName("dashboard");
			return mv; // 
	    }
	 @GetMapping("/mainnav")
	    public ModelAndView mainnav() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("mainnavbar");
			return mv; // 
	    }
	 @GetMapping("/adminhome")
	    public ModelAndView adminhome() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("adminhome");
			return mv; // 
	    }
	 @GetMapping("/adminprofile")
	    public ModelAndView adminprofile() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("adminprofile");
			return mv; // 
	    }
	 
	 @GetMapping("/index")
	    public ModelAndView home2() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("index");
			return mv; // 
	    }
	    @GetMapping("/aboutus")
	    public ModelAndView aboutUs() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("aboutus");
			return mv;  
	    }

	    @GetMapping("/adminlogin")
	    public ModelAndView adminLogin() {
	     	ModelAndView mv=new ModelAndView();
	    		mv.setViewName("adminlogin");
	    		return mv;  
	    }
	    @PostMapping("/checkadminlogin")
	    @ResponseBody
	    public ModelAndView checkadminlogin(HttpServletRequest request)
	    {
	      ModelAndView mv = new ModelAndView();
	      String username=request.getParameter("username");
	      String password=request.getParameter("password");
	      Admin admin=adminService.checkadminlogin(username, password);
	      
	      if(admin!=null)
	      {
	    	  //seesion
	    	  HttpSession session= request.getSession();
	    	  
			  session.setAttribute("a", admin);//"a" is session variable 
			  session.setMaxInactiveInterval(180);
			  long malecount=adminService.getMaleStudentCount();
			  long femalecount=adminService.getFemaleStudentCount();
			  mv.addObject("malecount", malecount);
		        mv.addObject("femalecount", femalecount);
	    		mv.setViewName("admin");
	    	  return mv;
	      }
	      else
	      {
	    	  mv.setViewName("adminlogin");
	    	  mv.addObject("message", "Login Failed Due to Wrong Credentials");
	    	  return mv;
	    	  
	      }
	    }
	    @GetMapping("/userlogin")
	    public ModelAndView userLogin() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("userlogin");
			return mv; 
	    }
	    
	    
	    
	    //write three
	    @GetMapping("/forgotpassword")
	    public ModelAndView forgetpassword() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("forgotpassword");
			return mv; // 
	    }
	    @GetMapping("/admin")
	    public ModelAndView adminpage() {
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("admin");				
			return mv; 
	    }
	    @GetMapping("/logout")
	    public ModelAndView logout(HttpServletRequest request) {
	    	HttpSession session =request.getSession();
			session.removeAttribute("a");
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("logout");
			
			return mv; 
	    }
	    
	    ///view
	    @GetMapping("viewallstudents")
	     public ModelAndView viewallstudents()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Student> studentlist = adminService.viewallstudents();
	       mv.setViewName("viewallstudents");
	       mv.addObject("studentlist",studentlist);
	       return mv;
	     }
	    @GetMapping("viewallfacultys")
	     public ModelAndView viewallfacultys()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Faculty> facultylist = adminService.viewallfacultys();
	       mv.setViewName("viewallfacultys");
	       mv.addObject("facultylist",facultylist);
	       return mv;
	     }
	    @GetMapping("viewallparents")
	     public ModelAndView viewallparents()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Parent> parentlist = adminService.viewallparents();
	       mv.setViewName("viewallparents");
	       mv.addObject("parentlist",parentlist);
	       return mv;
	     }
	   
	    
	    ///delete
	    @GetMapping("deletestudent")
	    public ModelAndView deletestudent()
	    {
	      ModelAndView mv = new ModelAndView();
	      List<Student> studentlist = adminService.viewallstudents();
	      mv.setViewName("deletestudent");
	      mv.addObject("studentlist",studentlist);
	      return mv;
	    }
	    @GetMapping("deletest")
	    public String deleteoperations(@RequestParam("id") int sid) {
	    	
	    	adminService.deletestudent(sid);
	    	return "redirect:/deletestudent";
	    }
	    
	    @GetMapping("deleteparent")
	    public ModelAndView deleteparent()
	    {
	      ModelAndView mv = new ModelAndView();
	      List<Parent> parentlist = adminService.viewallparents();
	      mv.setViewName("deleteparent");
	      mv.addObject("parentlist",parentlist);
	      return mv;
	    }
	    @GetMapping("deletep")
	    public String deletep(@RequestParam("id") int pid) {
	    	
	    	adminService.deleteparent(pid);
	    	return "redirect:/deleteparent";
	    }
	    
	    @GetMapping("deletefaculty")
	    public ModelAndView deletefaculty()
	    {
	      ModelAndView mv = new ModelAndView();
	      List<Faculty> facultylist = adminService.viewallfacultys();
	      mv.setViewName("deletefaculty");
	      mv.addObject("facultylist",facultylist);
	      return mv;
	    }
	    @GetMapping("deletef")
	    public String deleteoperationf(@RequestParam("id") int fid) {
	    	
	    	adminService.deletefaculty(fid);
	    	return "redirect:/deletefaculty";
	    }
	    
	    //updating the status 
	    //student
	    @GetMapping("updatestudentstatus")
	    public ModelAndView updatestudentstatus()
	    {
	      ModelAndView mv = new ModelAndView();
	      List<Student> studentlist = adminService.viewallstudents();
	      mv.setViewName("updatestudentstatus");
	      mv.addObject("studentlist",studentlist);
	      return mv;
	    }

	    @GetMapping("updatestatuss")
	    public String updatestatuss(@RequestParam("sid") int sid,@RequestParam("sstatus") String sstatus)
	    {
	     adminService.updatestudentstatus(sstatus, sid);
	     return "redirect:/updatestudentstatus";
	      
	    }
	    //faculty
	    @GetMapping("updatefacultystatus")
	    public ModelAndView updatefacultystatus()
	    {
	      ModelAndView mv = new ModelAndView();
	      List<Faculty> facultylist = adminService.viewallfacultys();
	      mv.setViewName("updatefacultystatus");
	      mv.addObject("facultylist",facultylist);
	      return mv;
	    }

	    @GetMapping("updatestatusf")
	    public String updatestatusf(@RequestParam("fid") int fid,@RequestParam("fstatus") String fstatus)
	    {
	     adminService.updatefacultystatus(fstatus, fid);
	     return "redirect:/updatefacultystatus";
	      
	    }
	    
	    
	    
	    
	    //update the student by the admin
	    
	    //file
	    @GetMapping("updatesbya")
	     public ModelAndView updates()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Student> studentlist = adminService.viewallstudents();
	       mv.setViewName("updatesbya");
	       mv.addObject("studentlist",studentlist);
	       return mv;
	     }
	    //button redirects
	    @GetMapping("/updatesby")
	    public String showUpdateForm(@RequestParam("sid") int sid, Model model) {
	        // Fetch the student details by ID
	        Student student = adminService.displaystudentybyId(sid);
	        model.addAttribute("student", student);  // Add student object to model
	        return "updatestudentbyadmin";  // Return the update form view
	    }

	    @PostMapping("/updateStudent")
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

	            String msg = adminService.updateStudent(student);
	            List<Student> studentlist = adminService.viewallstudents();
	            mv.setViewName("viewallstudents");
	            mv.addObject("studentlist",studentlist);
	            mv.addObject("message", msg);
	        } catch (Exception e) {
	            mv.setViewName("updatestudentbyadmin");
	            mv.addObject("message", e.getMessage());
	        }
	        
	        return mv;
	    }
	    
	    
	    
	    //update the faculty by admin
	    
	  //file
	    @GetMapping("updatefbya")
	     public ModelAndView updatef()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Faculty> facultylist = adminService.viewallfacultys();
	       mv.setViewName("updatefbya");
	       mv.addObject("facultylist",facultylist);
	       return mv;
	     }
	  //button redirects
	    @GetMapping("/updatefby")
	    public String updatef(@RequestParam("fid") int fid, Model model) {
	        // Fetch the faculty details by ID
	        Faculty faculty= adminService.displayfacultybyId(fid);
	        model.addAttribute("faculty", faculty);  // Add faculty object to model
	        return "updatefacultybyadmin";  // Return the update form view
	    }
	    
	    @PostMapping("/updateFaculty")
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
	            String furl=request.getParameter("furl");
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
	            faculty.setFurl(furl);
	            faculty.setFreligion(freligion);


	            String msg = adminService.updateFaculty(faculty);
	            List<Faculty> facultylist = adminService.viewallfacultys();
	            mv.setViewName("updatesuccessfbya");
	            mv.addObject("facultylist",facultylist);
	            mv.addObject("message", msg);
	        } catch (Exception e) {
	            mv.setViewName("updatefacultybyadmin");
	            mv.addObject("message", e.getMessage());
	        }
	        
	        return mv;
	    }
	    
	    //update the parent by admin
	    
		  //file
		    @GetMapping("updatepbya")
		     public ModelAndView updatep()
		     {
		       ModelAndView mv = new ModelAndView();
		       List<Parent> parentlist = adminService.viewallparents();
		       mv.setViewName("updatepbya");
		       mv.addObject("parentlist",parentlist);
		       return mv;
		     }
		  //button redirects
		    @GetMapping("/updatepby")
		    public String updatep(@RequestParam("pid") int pid, Model model) {
		        
		       Parent parent= adminService.displayparentbyId(pid);
		        model.addAttribute("parent", parent);  
		        return "updateparentbyadmin";  // Return the update form view
		    }
		    
		    @PostMapping("/updateParent")
		    public ModelAndView updateparentp(HttpServletRequest request) {
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


		            String msg = adminService.updateParent(parent);
		            List<Parent> parentlist = adminService.viewallparents();
		            mv.setViewName("updatesuccesspbya");
		            mv.addObject("parentlist",parentlist);
		            mv.addObject("message", msg);
		        } catch (Exception e) {
		            mv.setViewName("updateparentbyadmin");
		            mv.addObject("message", e.getMessage());
		        }
		        
		        return mv;
		    }
	    
		    //update the course by admin
		    
			  //file
			    @GetMapping("updatecbya")
			     public ModelAndView updatec()
			     {
			       ModelAndView mv = new ModelAndView();
			       List<Course> courselist = adminService.viewallcourses();
			       mv.setViewName("updatecbya");
			       mv.addObject("courselist",courselist);
			       return mv;
			     }
			  //button redirects
			    @GetMapping("/updatecby")
			    public String updatec(@RequestParam("cid") int cid, Model model) {
			        
			      Course course= adminService.displaycoursebyId(cid);
			        model.addAttribute("course", course);  
			        return "updatecoursebyadmin";  // Return the update form view
			    }
			    
			    @PostMapping("/updateCourse")
			    public ModelAndView updatecoursec(HttpServletRequest request) {
			        ModelAndView mv = new ModelAndView();
			        
			        try {
			        	int cid = Integer.parseInt(request.getParameter("cid"));
			        	String ccode = request.getParameter("ccode");
			        	String ctitle = request.getParameter("ctitle");
			        	String cbranch = request.getParameter("cbranch");
			        	String cprogram = request.getParameter("cprogram");
			        	String cacademicyear = request.getParameter("cacademicyear");
			        	String csemester = request.getParameter("csemester");
			        	int cyear = Integer.parseInt(request.getParameter("cyear"));
			        	int ccredits = Integer.parseInt(request.getParameter("ccredits"));
			        	String ccoordinator = request.getParameter("ccoordinator");
                        String section=request.getParameter("section");
			        	Course course = new Course();
			        	course.setCid(cid);
			        	course.setCcode(ccode);
			        	course.setCtitle(ctitle);
			        	course.setCbranch(cbranch);
			        	course.setCprogram(cprogram);
			        	course.setCacademicyear(cacademicyear);
			        	course.setCsemester(csemester);
			        	course.setCyear(cyear);
			        	course.setCcredits(ccredits);
			        	course.setCcoordinator(ccoordinator);
                       

			            String msg = adminService.updateCourse(course);
			            List<Course> courselist = adminService.viewallcourses();
			            mv.setViewName("updatesuccesscbya");
			            mv.addObject("courselist",courselist);
			            mv.addObject("message", msg);
			        } catch (Exception e) {
			            mv.setViewName("updatecoursebyadmin");
			            mv.addObject("message", e.getMessage());
			        }
			        
			        return mv;
			    }
		    
			    
		    
}
