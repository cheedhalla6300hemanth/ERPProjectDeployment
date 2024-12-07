package com.klef.jfsd.erp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.erp.model.TimeTable;
import com.klef.jfsd.erp.service.AdminService;
import com.klef.jfsd.erp.service.FacultyCourseService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class TimeTableController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private FacultyCourseService facultyCourseService;

	/*
	 * @GetMapping("addtott") public ModelAndView addtott() { ModelAndView mv=new
	 * ModelAndView(); mv.setViewName("addtott"); return mv; }
	 */	
	@GetMapping("/addtott")
    public String addtott(Model model) {
        model.addAttribute("facultyList", facultyCourseService.getAllFaculties());
        model.addAttribute("courseList", facultyCourseService.getAllCourses());
        return "addtott";
    }
	@PostMapping("inserttimetable")
	public ModelAndView inserttimetable(HttpServletRequest request) {
	  
		
		 String ttacademicyear = request.getParameter("ttacademicyear");
		    int ttyear = Integer.parseInt(request.getParameter("ttyear"));
		    String ttsemester = request.getParameter("ttsemester");
		    String ttcbranch = request.getParameter("ttcbranch");
		    String ttccode = request.getParameter("ttccode");
		    String ttctitle = request.getParameter("ttctitle");
		    String tttype = request.getParameter("tttype");
		    String ttday = request.getParameter("ttday");
		    int tthour = Integer.parseInt(request.getParameter("tthour"));

		    TimeTable tt = new TimeTable();

		    tt.setTtacademicyear(ttacademicyear);
		    tt.setTtyear(ttyear);
		    tt.setTtsemester(ttsemester);
		    tt.setTtcbranch(ttcbranch);
		    tt.setTtccode(ttccode);
		    tt.setTtctitle(ttctitle);
		    tt.setTttype(tttype);
		    tt.setTtday(ttday);
		    tt.setTthour(tthour);

		    String msg = adminService.addtotimetable(tt);
		    ModelAndView mv = new ModelAndView(msg.startsWith("Error") ? "addtott" : "ttaddsuccess");
		    mv.addObject("message", msg);
		    

		    return mv;
	}
	
	
	 @GetMapping("viewtt")
	 public ModelAndView viewtt() 
	 { 
		 ModelAndView mv = new ModelAndView();
		 mv.setViewName("viewtt");
		 Map<String, Map<Integer, String>> timetableData = adminService.getTimetable();
		 mv.addObject("timetable", timetableData);
		 return mv;
		 }
	 
	 @GetMapping("filtertt")
	 public String loadFilterPage() {
	     return "filtertt";
	 }
	 
	 @GetMapping("filtertimetable")
	 public ModelAndView filterTimetable(
	     @RequestParam("ttacademicyear") String ttacademicyear,
	     @RequestParam("ttyear") int ttyear,
	     @RequestParam("ttsemester") String ttsemester,
	     @RequestParam("ttcbranch") String ttcbranch) 
	 {
	     ModelAndView mv = new ModelAndView();
	     List<TimeTable> filteredTimetable = adminService.filterTimetable(ttacademicyear,ttyear, ttsemester, ttcbranch);

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

	     mv.addObject("timetable", timetableMap);
	     mv.setViewName("viewtt");
	     return mv;
	 }
	
	 
	
}
