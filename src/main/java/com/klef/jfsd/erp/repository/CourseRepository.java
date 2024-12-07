package com.klef.jfsd.erp.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.erp.model.Course;
import java.util.List;


@Repository
public interface CourseRepository extends JpaRepository<Course, Integer> {

	 Optional<Course> findByCtitle(String ctitle);
	 List<Course> findByCyearAndCsemester(int cyear, String csemester);
}
