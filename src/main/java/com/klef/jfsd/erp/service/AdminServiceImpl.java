package com.klef.jfsd.erp.service;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.erp.model.Admin;
import com.klef.jfsd.erp.model.Course;
import com.klef.jfsd.erp.model.Faculty;
import com.klef.jfsd.erp.model.FacultyCourse;
import com.klef.jfsd.erp.model.Parent;
import com.klef.jfsd.erp.model.Student;
import com.klef.jfsd.erp.model.TimeTable;
import com.klef.jfsd.erp.repository.AdminRepository;
import com.klef.jfsd.erp.repository.CourseRepository;
import com.klef.jfsd.erp.repository.FacultyCourseRepository;
import com.klef.jfsd.erp.repository.FacultyRepository;
import com.klef.jfsd.erp.repository.ParentRepository;
import com.klef.jfsd.erp.repository.StudentRepository;
import com.klef.jfsd.erp.repository.TimeTableRepository;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminRepository adminRepository;
	@Autowired
	private StudentRepository studentRepository;
	@Autowired
	private FacultyRepository facultyRepository;
	@Autowired
	private CourseRepository courseRepository;
	@Autowired
	private ParentRepository parentRepository;
	@Autowired
	private TimeTableRepository timetableRepository;
	@Autowired
	private FacultyCourseRepository facultyCourseRepository;
	
	@Override
	public Admin checkadminlogin(String uname, String pwd) {
		
		return adminRepository.checkadminlogin(uname,pwd);
	}

	 @Override
	    public Long getMaleStudentCount() {
	        return studentRepository.countMaleStudents();
	    }

	    @Override
	    public Long getFemaleStudentCount() {
	        return studentRepository.countFemaleStudents();
	    }
	    
	    @Override
	    public Long getMaleFacultyCount() {
	        return facultyRepository.countMaleFacultys();
	    }

	    @Override
	    public Long getFemaleFacultyCount() {
	        return facultyRepository.countFemaleFacultys();
	    }
	@Override
	public String StudentRegistration(Student s) {
		studentRepository.save(s);
		return "Student Registered Successfully";
	}

	@Override
	public String FacultyRegistration(Faculty f) {
		facultyRepository.save(f);
		return "Faculty Registered Successfully";
	}

	@Override
	public List<Faculty> viewallfacultys() {
		
		return facultyRepository.findAll();
	}

	@Override
	public List<Student> viewallstudents() {
		
		return studentRepository.findAll();
	}

	@Override
	public String deletefaculty(int fid) {
		facultyRepository.deleteById(fid);
		return "Faculty Deleted Successfully";
	}

	@Override
	public String deletestudent(int sid) {
		studentRepository.deleteById(sid);
		return "Student Deleted Successfully";
	}




	@Override
	public String addcourse(Course c) {
		
		courseRepository.save(c);
		return "Course Added Successfully";
	}

	@Override
	public List<Course> viewallcourses() {
		
		return courseRepository.findAll();
	}

	@Override
	public String deletecourse(int cid) {
		
		courseRepository.deleteById(cid);
		return "Course Deleted Successfully";
	}

	

	@Override
	public List<Parent> viewallparents() {
		// TODO Auto-generated method stub
		return parentRepository.findAll();
	}

	@Override
	public String deleteparent(int pid) {
		// TODO Auto-generated method stub
		parentRepository.deleteById(pid);
		return "Parent deleted Successfully";
	}
	


	@Override
	public String updatestudentstatus(String sstatus, int sid) {
		// TODO Auto-generated method stub
		studentRepository.updatestudentstatus(sstatus, sid);
		return "Student Status Updated Successfully";
	}

	@Override
	public String updatefacultystatus(String fstatus, int fid) {
		// TODO Auto-generated method stub
		facultyRepository.updatefacultystatus(fstatus, fid);
		return "Faculty Status Updated Successfully";
	}

	@Override
	public Student displaystudentybyId(int sid) {
		// TODO Auto-generated method stub
		return studentRepository.findById(sid).get();
	}

	@Override
	public Faculty displayfacultybyId(int fid) {
		// TODO Auto-generated method stub
		return facultyRepository.findById(fid).get();
	}

	@Override
	public Parent displayparentbyId(int pid) {
		// TODO Auto-generated method stub
		return parentRepository.findById(pid).get();
	}

	@Override
	public Course displaycoursebyId(int cid) {
		// TODO Auto-generated method stub
		return courseRepository.findById(cid).get();
	}

	 public String updateStudent(Student s) {
	        Student stu = studentRepository.findById(s.getSid()).orElseThrow(() -> new RuntimeException("Student not found"));
	        
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
	        
	        return "Updated Successfully";
	    }
	

		@Override
		public String updateFaculty(Faculty f) {
			Faculty faculty = facultyRepository.findById(f.getFid()).orElseThrow(() -> new RuntimeException("Faculty not found"));
			
			faculty.setFname(f.getFname());
			faculty.setFfathername(f.getFfathername());
			faculty.setFmothername(f.getFmothername());
			faculty.setFgender(f.getFgender());
			faculty.setFdateofbirth(f.getFdateofbirth());
			faculty.setFdepartment(f.getFdepartment());
			faculty.setFsalary(f.getFsalary());
			faculty.setFpassword(f.getFpassword());
			faculty.setFlocation(f.getFlocation());
			faculty.setFcontact(f.getFcontact());
			faculty.setFmaritalstatus(f.getFmaritalstatus());
			faculty.setFurl(f.getFurl());
			faculty.setFreligion(f.getFreligion());

			facultyRepository.save(faculty);

			return "Faculty Updated Successfully";

		}

		@Override
		public String updateParent(Parent p) {
			Parent parent = parentRepository.findById(p.getPid()).orElseThrow(() -> new RuntimeException("Parent not found"));

			parent.setPusername(p.getPusername());
			parent.setPpassword(p.getPpassword());
			parent.setPgender(p.getPgender());
			parent.setPdateofbirth(p.getPdateofbirth());
			parent.setPrelation(p.getPrelation());
			parent.setPaddress(p.getPaddress());
			parent.setPcontact(p.getPcontact()); 

			
			parentRepository.save(parent);

			
			return "Parent Updated Successfully";
		}

		@Override
		public String updateCourse(Course c) {
			Course course = courseRepository.findById(c.getCid()).orElseThrow(() -> new RuntimeException("Course not found"));
			course.setCcode(c.getCcode());
			course.setCtitle(c.getCtitle());
			course.setCbranch(c.getCbranch());
			course.setCprogram(c.getCprogram());
			course.setCacademicyear(c.getCacademicyear());
			course.setCsemester(c.getCsemester());
			course.setCyear(c.getCyear());
			course.setCcredits(c.getCcredits());
			course.setCcoordinator(c.getCcoordinator());
		
			courseRepository.save(course);
			return "Course Updated Successfully";
		}

		///time table
		@Override
		public String addtotimetable(TimeTable t) {
			
			int duplicateCount = timetableRepository.checkDuplicateEntry(
			        t.getTtacademicyear(),
			        t.getTtyear(),
			        t.getTtsemester(),
			        t.getTtcbranch(),
			        t.getTtday(),
			        t.getTthour()
			    );
			    if (duplicateCount > 0) {
			        return "Error: Already there is other course that is being alloted to that hour. Addition not possible.";
			    }
			timetableRepository.save(t);
			return "Added to Time Table Successfully";
		}

		@Override
		public Map<String, Map<Integer, String>> getTimetable() {
		    List<TimeTable> timetableList = timetableRepository.findAll();
		    Map<String, Map<Integer, String>> timetable = new LinkedHashMap<>();
		    List<String> days = Arrays.asList("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday");
		    for (String day : days) {
		        Map<Integer, String> hoursMap = new LinkedHashMap<>();
		        for (int hour = 1; hour <= 16; hour++) {
		            hoursMap.put(hour, "----------"); 
		        }
		        timetable.put(day, hoursMap);
		    }
		    for (TimeTable entry : timetableList) {
		        String day = entry.getTtday();
		        int hour = entry.getTthour();
		        String courseCode = entry.getTtccode();
		        String type=entry.getTttype();

		        if (timetable.containsKey(day)) {
		        	 String firstLetterOfType = type.substring(0, 1).toUpperCase();
		             String combinedValue = courseCode + " (" + firstLetterOfType + ")";
		             timetable.get(day).put(hour, combinedValue);
		           
		        }
		    }

		    return timetable;
		}



		@Override
		public List<TimeTable> filterTimetable(String academicYear,int year, String semester, String branch) {
			
			return timetableRepository.findByTtacademicyearAndTtyearAndTtsemesterAndTtcbranch(academicYear,year, semester, branch);

		}

		
}

