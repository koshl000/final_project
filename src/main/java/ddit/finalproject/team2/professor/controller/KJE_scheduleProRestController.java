package ddit.finalproject.team2.professor.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.professor.service.KJE_IScheduleService;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.KJE_OpenSemesterVo;
import ddit.finalproject.team2.vo.KJE_ScheduleVo;
import ddit.finalproject.team2.vo.KJE_fullcalenderVo;

@RestController
public class KJE_scheduleProRestController {
	
	@Inject
	KJE_IScheduleService scheduleService; 
	
	@RequestMapping(value="/getCalender", method=RequestMethod.GET)
	public Map<String, List<KJE_fullcalenderVo>> getCalender(
			Authentication au
			){
		
		String user_id = au.getName();
		Map<String, List<KJE_fullcalenderVo>> resp = scheduleService.retriveScheduleList(user_id);
		
		return resp;
	}
	
	@RequestMapping(value="/saveSchedule", method = RequestMethod.POST)
	public Map saveSchedule(@ModelAttribute("schedule") KJE_ScheduleVo schedule) {
		Map<String,Object> respMap = new HashMap<>(); 
		ServiceResult result= scheduleService.createSchedule(schedule);
		schedule.setSchedule_title(schedule.getLecture_name()+":"+ schedule.getSchedule_title());
		schedule.setBorder_color(schedule.getSchedule_color());
		String msg =null;
		if(ServiceResult.OK.equals(result)) {
			msg="SUCCESS";
			respMap.put("schedule", schedule);
		}else {
			msg="FAIL";
			
		}
		respMap.put("msg", msg);
		return respMap;
	}
	
	
}
