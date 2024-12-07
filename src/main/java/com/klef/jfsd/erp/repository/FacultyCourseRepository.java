package com.klef.jfsd.erp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.erp.model.FacultyCourse;

import jakarta.transaction.Transactional;

@Repository
public interface FacultyCourseRepository extends JpaRepository<FacultyCourse, Integer> {

    FacultyCourse findByCourse_CidAndFaculty_FidAndCtypeAndSectionAndRoomno(int courseId, int facultyId,String ctype,String csec,String croomno);

    @Transactional
    @Modifying
    @Query("DELETE FROM FacultyCourse fc WHERE fc.mappingid = :mid")
    public void deleteByMid(@Param("mid") int mid);

    boolean existsById(int mid);
    
    
}
