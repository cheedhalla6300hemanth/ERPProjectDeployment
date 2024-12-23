package com.klef.jfsd.erp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.erp.model.TimeTableStudent;

import jakarta.transaction.Transactional;

@Repository
public interface TimeTableStudentRepository extends JpaRepository<TimeTableStudent, Integer> {
    
}
