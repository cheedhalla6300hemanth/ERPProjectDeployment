package com.klef.jfsd.erp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.erp.model.TimeTable;

@Repository
public interface TimeTableRepository extends JpaRepository<TimeTable, Integer> {
	public List<TimeTable> findByTtacademicyearAndTtyearAndTtsemesterAndTtcbranch(String ttacademicyear,int ttyear,String ttsemester,String ttbranch);

	//for duplicate checking 
	@Query("SELECT COUNT(t) FROM TimeTable t WHERE t.ttacademicyear = :ttacademicyear AND t.ttyear = :ttyear AND t.ttsemester = :ttsemester AND t.ttcbranch = :ttcbranch AND  t.ttday = :ttday AND t.tthour = :tthour")
	int checkDuplicateEntry(String ttacademicyear, int ttyear, String ttsemester, String ttcbranch, String ttday, int tthour);
	

	
}
