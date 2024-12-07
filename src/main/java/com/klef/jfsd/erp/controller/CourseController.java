package com.klef.jfsd.erp.controller;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.erp.model.Course;
import com.klef.jfsd.erp.model.Student;
import com.klef.jfsd.erp.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CourseController {

	@Autowired
	private AdminService adminService;
	
	@GetMapping("addcourse")
    public ModelAndView addcourse() {
    	ModelAndView mv=new ModelAndView();
		mv.setViewName("addcourse");
		return mv; 
    }
	@PostMapping("insertcourse")
	public ModelAndView insertcourse(HttpServletRequest request,@RequestParam("chandout") MultipartFile file) throws Exception {
	  
		
		String ccode = request.getParameter("ccode");
		String ctitle = request.getParameter("ctitle");
		String cbranch = request.getParameter("cbranch");
		String cprogram = request.getParameter("cprogram");
		String cacademicyear = request.getParameter("cacademicyear");
		String csemester = request.getParameter("csemester");
		int cyear = Integer.parseInt(request.getParameter("cyear"));
		int ccredits = Integer.parseInt(request.getParameter("ccredits"));
		String ccoordinator = request.getParameter("ccoordinator");
		
		 
	     byte[] bytes = file.getBytes();
		  Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

		Course c = new Course();
		c.setChandout(blob);
		c.setCcode(ccode);
		c.setCtitle(ctitle);
		c.setCbranch(cbranch);
		c.setCprogram(cprogram);
		c.setCacademicyear(cacademicyear);
		c.setCsemester(csemester);
		c.setCyear(cyear);
		c.setCcredits(ccredits);
		c.setCcoordinator(ccoordinator);
		


	   
	    String msg = adminService.addcourse(c);

	    // Prepare the ModelAndView for success page
	    ModelAndView mv = new ModelAndView("cregsuccess");
	    mv.addObject("message", msg);

	    return mv;
	}
	
	@GetMapping("displaycoursehandout")
    public ResponseEntity<byte[]> displaycoursehandout(@RequestParam("cid") int cid) throws Exception
    {
     Course course =  adminService.displaycoursebyId(cid);
      byte [] imageBytes = null;
      imageBytes = course.getChandout().getBytes(1,(int) course.getChandout().length());

      return ResponseEntity.ok().contentType(MediaType.APPLICATION_PDF).body(imageBytes);
      
    // Response Body, HTTP Status Code, Headers
    }
	 @GetMapping("viewallcourses")
     public ModelAndView viewallcourses()
     {
       ModelAndView mv = new ModelAndView();
       List<Course> courselist = adminService.viewallcourses();
       mv.setViewName("viewallcourses");
       mv.addObject("courselist",courselist);
       return mv;
     }
	  @GetMapping("deletecourse")
	    public ModelAndView deletecourse()
	    {
	      ModelAndView mv = new ModelAndView();
	      List<Course> courselist = adminService.viewallcourses();
	      mv.setViewName("deletecourse");
	      mv.addObject("courselist",courselist);
	      return mv;
	    }
	  @GetMapping("deletec")
	    public String deleteoperationc(@RequestParam("id") int cid) {
	    	
	    	adminService.deletecourse(cid);
	    	return "redirect:/deletecourse";
	    }
	  

}
