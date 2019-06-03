package ddit.finalproject.team2.common.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.KJE_ScheduleVo;
import ddit.finalproject.team2.vo.OpenSemesterVo;
import ddit.finalproject.team2.vo.ScheduleVo;

@Repository
public interface KJE_ChatBotDao {
	
	/**
	 * 해당 년도, 학기의 일정정보를 가저오는 메서드
	 * @param semester 해당 학기의 학기, 일정정보
	 * @return
	 */
	OpenSemesterVo selectOpenSemester(Map<String, String> semester);
	

	/**
	 * 개인별 개별 일정을 가져오는 메서드
	 * @param user_id USER ID
	 * @return 일정이 담긴 List
	 */
	List<KJE_ScheduleVo> selectSchedule(String user_id);
	
}
