package ddit.finalproject.team2.student.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.KJE_ScheduleVo;

@Repository
public interface KJE_IScheduleStuDao {
	
	public List<KJE_ScheduleVo> selectScheduleList(String user_id);
	
}
