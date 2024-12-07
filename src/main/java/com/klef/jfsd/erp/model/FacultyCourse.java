package com.klef.jfsd.erp.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "faculty_course")
public class FacultyCourse {

      @Id
	  @GeneratedValue(strategy = GenerationType.IDENTITY)
	  private int mappingid;
	  
	  @ManyToOne(cascade = CascadeType.ALL)
	  @JoinColumn(name = "faculty_id") // foreign key column name
	  private Faculty faculty;
	  
	  @ManyToOne(cascade = CascadeType.ALL)
	  @JoinColumn(name = "course_id") // foreign key column name
	  private Course course;
	  

	    @Column(name="faculty_section", nullable=true, length=50)
		private String section;
	    @Column(name="faculty_roomno", nullable=true, length=50)
		private String roomno;
	    @Column(name="course_type", nullable=true, length=50)
		private String ctype;
		public int getMappingid() {
			return mappingid;
		}
		public void setMappingid(int mappingid) {
			this.mappingid = mappingid;
		}
		public Faculty getFaculty() {
			return faculty;
		}
		public void setFaculty(Faculty faculty) {
			this.faculty = faculty;
		}
		public Course getCourse() {
			return course;
		}
		public void setCourse(Course course) {
			this.course = course;
		}
		public String getSection() {
			return section;
		}
		public void setSection(String section) {
			this.section = section;
		}
		public String getRoomno() {
			return roomno;
		}
		public void setRoomno(String roomno) {
			this.roomno = roomno;
		}
		public String getCtype() {
			return ctype;
		}
		public void setCtype(String ctype) {
			this.ctype = ctype;
		}
    
}
