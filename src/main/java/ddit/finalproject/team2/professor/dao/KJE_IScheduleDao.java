package ddit.finalproject.team2.professor.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.KJE_ScheduleVo;
import ddit.finalproject.team2.vo.KJE_StlectureVo;

@Repository
public interface KJE_IScheduleDao {
	
	public List<KJE_ScheduleVo> selectScheduleList(String user_id);

	public List<KJE_StlectureVo> selectStLecture(Map<String,String> proInfo);
	
	public int insertSchedule(KJE_ScheduleVo schedule);
	
	public int delectSchedule(String schedule_no);
}
