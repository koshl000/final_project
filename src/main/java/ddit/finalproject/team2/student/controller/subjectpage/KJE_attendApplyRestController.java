package ddit.finalproject.team2.student.controller.subjectpage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.student.service.KJE_IAttendApplyService;
import ddit.finalproject.team2.vo.KJE_LWeekAssignmentProVo;
import ddit.finalproject.team2.vo.KJE_attendApplyVo;
import ddit.finalproject.team2.vo.LecturePlanVo;

@RestController
public class KJE_attendApplyRestController {
	
	@Inject
	KJE_IAttendApplyService  attendApplyService; 
	
	@GetMapping(value="/getAttendApplyList", produces="application/json;charset=UTF-8")
	public Map<String, Object> getAttendApplyList(
//			@RequestParam (required =true)String openseme_no,
			Authentication au
			){
		
		String openseme_no="9";
		String user_id=au.getName();
		Map<String, String> stuInfo = new HashMap<>();
		
		stuInfo.put("openseme_no", openseme_no);
		stuInfo.put("user_id", user_id);
		
		Map<String, Object> map = new HashMap<>();
		List<KJE_attendApplyVo> list = attendApplyService.retriveAttendApplyList(stuInfo);
		map.put("data", list);
		return map;
	}
	
	
	@GetMapping(value="/getAttendApplyCompList", produces="application/json;charset=UTF-8")
	public Map<String, Object> getAttendApplyCompList(
			Authentication au
			
			){
		
		String openseme_no="9";
		String user_id=au.getName();
		Map<String, String> stuInfo = new HashMap<>();
		
		stuInfo.put("openseme_no", openseme_no);
		stuInfo.put("user_id", user_id);
		
		Map<String, Object> map = new HashMap<>();
		List<KJE_attendApplyVo> list = attendApplyService.retriveAttendApplyCompList(stuInfo);
		map.put("data", list);
		return map;
	}
	
	@GetMapping(value="/getLecturePlan")
	public LecturePlanVo getLecturePlan(
			@RequestParam (required =true)String lecture_code
			){
		LecturePlanVo lecturePlan = attendApplyService.retriveLecturePlan(lecture_code);
		return lecturePlan;
	}
	
	
	@GetMapping(value="/createAttend")
	public String createAttend(
			@RequestParam (required =true)String lecture_code,
			@RequestParam (required =true)String lecture_credit,
			Authentication au
			){
		
		String resp=null; 
		String user_id=au.getName();
		
		String sumCredit = attendApplyService.retriveSumCredit(user_id);
		
		if(Integer.parseInt(sumCredit)+Integer.parseInt(lecture_credit)>21){
			
			resp ="OVER";
		}else{
			
			Map<String, String> stuInfo = new HashMap<>();
			
			stuInfo.put("lecture_code", lecture_code);
			stuInfo.put("user_id", user_id);
			
			int cnt = attendApplyService.CreateAttend(stuInfo);
			if(cnt==0){
				resp="FULL";
				
			}else{
				resp ="SUCCESS";
			}
		}
		
		return resp;
	}
	
	
	@GetMapping(value="/cancelAttend")
	public String cancelAttend(
			@RequestParam (required =true)String attend_no
			){
		
		String resp=null; 
		attendApplyService.removeAttend(attend_no);
		return resp;
	}
	
}
