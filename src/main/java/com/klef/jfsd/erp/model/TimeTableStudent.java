package com.klef.jfsd.erp.model;

import jakarta.persistence.*;

@Entity
@Table(name = "timetable_student")
public class TimeTableStudent {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "timetable_student_id")
    private int id;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "student_id", nullable = false)
    private Student student;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "course_id", nullable = false)
    private Course course;
    
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "facultycourse_id", nullable = false)
    private FacultyCourse facultycourse;
    
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "timetable_id", nullable = false)
    private TimeTable timetable;

 

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public TimeTable getTimetable() {
        return timetable;
    }

    public void setTimetable(TimeTable timetable) {
        this.timetable = timetable;
    }

}
