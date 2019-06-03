package ddit.finalproject.team2.student.controller.subjectpage;

import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.admin.dao.KJE_IStatisticsDao;
import ddit.finalproject.team2.admin.service.KJE_IStatisticsService;
import ddit.finalproject.team2.student.service.KJE_IStatisticsStuService;
import ddit.finalproject.team2.vo.AttendVo;
import ddit.finalproject.team2.vo.GradeVo;

@Controller
@RestController
public class KJE_StudyStateRestController {
	
	@Inject
	KJE_IStatisticsStuService statisticsStuService;
	
	@Inject
	KJE_IStatisticsDao statisticsDao ;
	
	@RequestMapping(value="/studyStatestatis", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public Map<String,Object> studyStatestatis  (
			Authentication authentication,
			@RequestParam (required =false)String lecture_code
			){
		
		String user_id = authentication.getName();
		Map<String,String> userinfo = new HashedMap();
		
		userinfo.put("user_id", user_id);
		userinfo.put("lecture_code", lecture_code);
		
		AttendVo attendinfo = statisticsDao.selectAttend(userinfo);
		
		String attend_no = attendinfo.getAttend_no();
		
		Map<String,Object> resp = new HashedMap();
		
		GradeVo userGrade = statisticsStuService.getStudyState(attend_no);
		GradeVo avgGrade = statisticsStuService.getAvgStudyState(lecture_code);
		
		resp.put("userGrade", userGrade);
		resp.put("avgGrade", avgGrade);
		resp.put("lecture_name",statisticsStuService.getLectureName(lecture_code));
		
		return resp;
	}
	
}
