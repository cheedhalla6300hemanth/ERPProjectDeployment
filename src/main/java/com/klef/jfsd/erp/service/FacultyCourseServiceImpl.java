package com.klef.jfsd.erp.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.erp.model.Course;
import com.klef.jfsd.erp.model.Faculty;
import com.klef.jfsd.erp.model.FacultyCourse;
import com.klef.jfsd.erp.repository.CourseRepository;
import com.klef.jfsd.erp.repository.FacultyCourseRepository;
import com.klef.jfsd.erp.repository.FacultyRepository;

@Service
public class FacultyCourseServiceImpl implements FacultyCourseService {

    @Autowired
    private FacultyRepository facultyRepository;

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private FacultyCourseRepository facultyCourseRepository;

    @Override
    public List<Faculty> getAllFaculties() {
        return facultyRepository.findAll();
    }

    @Override
    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }
    @Override
    public String assignCourseToFaculty(String fname, String ctitle, String ctype, String section, String roomno) {
        Optional<Faculty> facultyOpt = facultyRepository.findByFname(fname);
        Optional<Course> courseOpt = courseRepository.findByCtitle(ctitle);

        if (facultyOpt.isPresent() && courseOpt.isPresent()) {
            Faculty faculty = facultyOpt.get();
            Course course = courseOpt.get();

            if (facultyCourseRepository.findByCourse_CidAndFaculty_FidAndCtypeAndSectionAndRoomno(
                    course.getCid(), faculty.getFid(), ctype, section, roomno) != null) {
                return "Course is already assigned to the faculty with the same details.";
            }

            FacultyCourse facultyCourse = new FacultyCourse();
            facultyCourse.setFaculty(faculty);
            facultyCourse.setCourse(course);
            facultyCourse.setCtype(ctype);
            facultyCourse.setSection(section);
            facultyCourse.setRoomno(roomno);

            facultyCourseRepository.save(facultyCourse);
            return "Course assigned successfully.";
        }
        return "Faculty or Course not found.";
    }

    @Override
    public Faculty getFacultyWithCourses(int facultyId) {
        Optional<Faculty> facultyOpt = facultyRepository.findById(facultyId);
        return facultyOpt.orElse(null);
    }

    @Override
    public List<FacultyCourse> getAllFacultyCourses() {
        return facultyCourseRepository.findAll();
    }

    @Override
    public void deleteAssignedCourse(int mid) {
        if (facultyCourseRepository.existsById(mid)) {
            facultyCourseRepository.deleteByMid(mid);
        }
    
    }
    
    
    
}
