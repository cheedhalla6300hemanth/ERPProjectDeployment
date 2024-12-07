package com.klef.jfsd.erp.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.erp.model.Course;
import com.klef.jfsd.erp.model.FacultyCourse;
import com.klef.jfsd.erp.model.ForgetbyOTP;
import com.klef.jfsd.erp.model.Student;
import com.klef.jfsd.erp.model.TimeTable;
import com.klef.jfsd.erp.repository.CourseRepository;
import com.klef.jfsd.erp.repository.FacultyCourseRepository;
import com.klef.jfsd.erp.repository.ForgetbyOTPRepository;
import com.klef.jfsd.erp.repository.StudentRepository;
import com.klef.jfsd.erp.repository.TimeTableRepository;
import com.klef.jfsd.erp.repository.TimeTableStudentRepository;

@Service
public class StudentServiceImpl implements StudentService{
    @Autowired
	private StudentRepository studentRepository;
    @Autowired
    private TimeTableStudentRepository timeTableStudentRepository;
    @Autowired
    private TimeTableRepository timeTableRepository;
    
    @Autowired
    private CourseRepository courseRepository;
    
    @Autowired
    private FacultyCourseRepository facultyCourseRepository;
    
    @Autowired
    private ForgetbyOTPRepository forgetbyOTPRepository;
    
    @Override
    public Student checkstudentlogin(String semail, String spassword) {
        Student student = studentRepository.checkstudentlogin(semail, spassword);
        if (student != null) {
            if ("Accepted".equals(student.getSstatus())) {
                return student;
            } else if ("Registered".equals(student.getSstatus())) {
                return null; 
            } else if ("Rejected".equals(student.getSstatus())) {
                return null; 
            }
        }
        return null;
    }

	@Override
	public String updatestudentprofile(Student s) {
	    // Fetch the student by ID
	    Student stu = studentRepository.findById(s.getSid()).get();
	    
	    // Update the student fields
	    stu.setSname(s.getSname());
	    stu.setSfathername(s.getSfathername());
	    stu.setSmothername(s.getSmothername());
	    stu.setSgender(s.getSgender());
	    stu.setSdateofbirth(s.getSdateofbirth());
	    stu.setSdepartment(s.getSdepartment());
	    stu.setSpassword(s.getSpassword());
	    stu.setSlocation(s.getSlocation());
	    stu.setScontact(s.getScontact());
	    stu.setSreligion(s.getSreligion());

	    studentRepository.save(stu);
	    
	    return "Student Updated Successfully";
	}
	
  //course registration 
	@Override
    public List<TimeTable> filterTimetablebys(String academicYear, int year, String semester, String branch) {
        return timeTableRepository.findByTtacademicyearAndTtyearAndTtsemesterAndTtcbranch(academicYear, year, semester, branch);
    }
	@Override
    public List<Course> filterCourses(int year, String semester) {
        return courseRepository.findByCyearAndCsemester(year, semester);
    }
	@Override
    public List<FacultyCourse> getAllFacultyCourses() {
        return facultyCourseRepository.findAll();
    }
	
	//forget password
	@Override
	public String send(ForgetbyOTP f) {
		forgetbyOTPRepository.save(f);
		return null;
	}
	@Override
	public ForgetbyOTP checkstudentotp(String semail, int sotp) {
		
		return forgetbyOTPRepository.checkstudentotp(semail, sotp);
	}
	@Override
    public boolean updatePassword(String semail, String spassword) {
        Optional<Student> user = studentRepository.findBySemail(semail);
        if (user.isPresent()) {
            Student s= user.get();
            s.setSpassword(spassword);
            studentRepository.save(s);
            return true;
        }
        return false;
    }
	
//chart
    @Override
    public Long getMaleStudentCount() {
        return studentRepository.countMaleStudents();
    }

    @Override
    public Long getFemaleStudentCount() {
        return studentRepository.countFemaleStudents();
    }
    

}
