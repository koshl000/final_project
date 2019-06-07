package ddit.finalproject.team2.professor.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;

import ddit.finalproject.team2.professor.dao.KJE_IScheduleDao;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.KJE_ScheduleVo;
import ddit.finalproject.team2.vo.KJE_fullcalenderVo;

@Service
public class KJE_ScheduleServiceImpl implements KJE_IScheduleService {

	@Inject
	KJE_IScheduleDao scheduleDao; 
	
	@Override
	public Map<String, List<KJE_fullcalenderVo>> retriveScheduleList(String user_id) {
		List<KJE_fullcalenderVo> schedule = new ArrayList<>();
		List<KJE_ScheduleVo> scheduleList = scheduleDao.selectScheduleList(user_id);
		Map<String, List<KJE_fullcalenderVo>> resp = new HashedMap();
		
		for(int i=0;i<scheduleList.size();i++){
			KJE_fullcalenderVo calender = new KJE_fullcalenderVo();
			calender.setSeq(scheduleList.get(i).getSchedule_no());
			calender.setTitle(scheduleList.get(i).getLecture_name()+":"+scheduleList.get(i).getSchedule_title());
			calender.setWriteDate(scheduleList.get(i).getSchedule_add());
			calender.setStartDate(scheduleList.get(i).getSchedule_start());
			calender.setEndDate(scheduleList.get(i).getSchedule_end());
			calender.setBgcolor(scheduleList.get(i).getSchedule_color());
			calender.setStatus("use");
			schedule.add(calender);
		}
		
		resp.put("schedule",schedule);
		return resp;
	}

	@Override
	public ServiceResult createSchedule(KJE_ScheduleVo schedule) {
		ServiceResult result = ServiceResult.FAILED;
		String stDate = schedule.getSchedule_start();
		String edDate = schedule.getSchedule_end();
		
		schedule.setSchedule_start(stDate+" "+schedule.getStTime());
		schedule.setSchedule_end(edDate+" "+schedule.getEdTime());
		schedule.setSchedule_type("교수");
		
		int rowCnt=scheduleDao.insertSchedule(schedule);
		if(rowCnt>0){
			result = ServiceResult.OK;
		}
		
		return result;
	}

}
