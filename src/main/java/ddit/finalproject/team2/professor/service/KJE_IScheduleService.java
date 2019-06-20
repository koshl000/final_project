package ddit.finalproject.team2.professor.service;

import java.util.List;
import java.util.Map;

import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.KJE_ScheduleVo;
import ddit.finalproject.team2.vo.KJE_fullcalenderVo;

public interface KJE_IScheduleService {
	
	public Map<String,List<KJE_fullcalenderVo>> retriveScheduleList(String user_id);
	
	public ServiceResult createSchedule(KJE_ScheduleVo schedule);
	
	public int removeSchedule(String schedule_no);

}
