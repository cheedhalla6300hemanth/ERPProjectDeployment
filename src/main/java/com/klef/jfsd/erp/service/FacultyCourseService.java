package com.klef.jfsd.erp.service;

import com.klef.jfsd.erp.model.Course;
import com.klef.jfsd.erp.model.Faculty;
import com.klef.jfsd.erp.model.FacultyCourse;

import java.util.List;

public interface FacultyCourseService {
    List<Faculty> getAllFaculties();
    List<Course> getAllCourses();
    String assignCourseToFaculty(String fname, String ctitle,String ctype, String section,String roomno );
    public Faculty getFacultyWithCourses(int facultyId);
    List<FacultyCourse> getAllFacultyCourses();
    void deleteAssignedCourse(int mid);
    
  

}
