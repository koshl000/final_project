package ddit.finalproject.team2.student.controller.subjectpage;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.student.service.KJE_IScheduleStuService;
import ddit.finalproject.team2.vo.KJE_fullcalenderVo;

@RestController
public class KJE_ScheduleStuRestController {
 
	@Inject
	KJE_IScheduleStuService scheduleStuService; 
	
	@RequestMapping(value="/getStuCalender", method=RequestMethod.GET)
	public Map<String, List<KJE_fullcalenderVo>> getCalender(
			Authentication au
			){
		
		String user_id = au.getName();
		Map<String, List<KJE_fullcalenderVo>> resp = scheduleStuService.retriveScheduleStuList(user_id);
		
		return resp;
	}
	
}
