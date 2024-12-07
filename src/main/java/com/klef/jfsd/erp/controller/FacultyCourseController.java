package com.klef.jfsd.erp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.klef.jfsd.erp.service.FacultyCourseService;

@Controller
public class FacultyCourseController {

    @Autowired
    private FacultyCourseService facultyCourseService;

    @GetMapping("/assigncourse")
    public String showAssignPage(Model model) {
        model.addAttribute("facultyList", facultyCourseService.getAllFaculties());
        model.addAttribute("courseList", facultyCourseService.getAllCourses());
        return "assign-course";
    }

    @PostMapping("/assigncourse")
    public String assignCourseToFaculty(
            @RequestParam("fname") String fname,
            @RequestParam("ctitle") String ctitle,
            @RequestParam("ctype") String ctype,
            @RequestParam("section") String section,
            @RequestParam("roomno") String roomno,
            Model model) {

        String message = facultyCourseService.assignCourseToFaculty(fname, ctitle, ctype, section, roomno);

        if (message.equals("Course assigned successfully.")) {
            return "redirect:/viewassignedcourses";
        } else {
            model.addAttribute("message", message);
            model.addAttribute("facultyList", facultyCourseService.getAllFaculties());
            model.addAttribute("courseList", facultyCourseService.getAllCourses());
            return "assign-course";
        }
    }

    @GetMapping("/viewassignedcourses")
    public String viewFacultyCourses(Model model) {
        model.addAttribute("facultyCourseList", facultyCourseService.getAllFacultyCourses());
        return "view-faculty-courses";
    }

    @GetMapping("/deleteassignedcourse")
    public String deleteFacultyCourses(Model model) {
        model.addAttribute("facultyCourseList", facultyCourseService.getAllFacultyCourses());
        return "deletefacultycourse";
    }

    @GetMapping("/deleteasso")
    public String deleteOperationC(@RequestParam("mid") int mid) {
        facultyCourseService.deleteAssignedCourse(mid);
        return "redirect:/deleteassignedcourse";
    }
}
