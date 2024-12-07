package com.klef.jfsd.erp.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.klef.jfsd.erp.model.Course;
import com.klef.jfsd.erp.model.TimeTable;
import com.klef.jfsd.erp.service.AdminService;
import com.klef.jfsd.erp.service.StudentService;

@Controller
public class TimeTableStudentController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private StudentService studentService;
	
	 //student
	 @GetMapping("selectfortt")
	 public String load() {
	     return "selectfortt";
	 }
	 @GetMapping("studentcourseregistration")
	 public String studentcourseregistration(Model model) {
		 model.addAttribute("facultycourseList", studentService.getAllFacultyCourses());
	     return "studentcourseregistration";
	 }
	 
	 @GetMapping("/viewtimetablestructure")
	    public String showage(@RequestParam String ttacademicyear,
	                                             @RequestParam int ttyear,
	                                             @RequestParam String ttsemester,
	                                             @RequestParam String ttcbranch,
	                                             Model model) {
	       
		 List<TimeTable> filteredTimetable = studentService.filterTimetablebys(ttacademicyear,ttyear, ttsemester, ttcbranch);
		 Map<String, Map<Integer, String>> timetableMap = new HashMap<>();
	     for (TimeTable tt : filteredTimetable) {
	    	 String combinedValue = tt.getTtccode();
	         String type = tt.getTttype();
	         String firstLetterOfType = (type != null && !type.isEmpty()) ? type.substring(0, 1).toUpperCase() : "N/A";
	         combinedValue += " (" + firstLetterOfType + ")"; 
	         timetableMap
	             .computeIfAbsent(tt.getTtday(), k -> new HashMap<>())
	             .put(tt.getTthour(), combinedValue);
	     }
	        // Fetch courses based on year and semester
	        List<Course> courses = studentService.filterCourses(ttyear, ttsemester);

	        
	        model.addAttribute("timetable", timetableMap);
	        model.addAttribute("courses", courses);
	        return "studentcourseregistration";
	    }

 
	
	
	    }
