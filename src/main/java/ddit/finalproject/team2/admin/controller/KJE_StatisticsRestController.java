package ddit.finalproject.team2.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.admin.service.KJE_IStatisticsService;
import ddit.finalproject.team2.vo.KJE_OperationStatisticsVo;
import ddit.finalproject.team2.vo.KJE_StlectureVo;
import ddit.finalproject.team2.vo.KJE_TimeStatisticsVo;
import ddit.finalproject.team2.vo.OpenSemesterVo;

@RestController
@Controller
public class KJE_StatisticsRestController {

	@Inject
	KJE_IStatisticsService StatisticsService; 
	
	@RequestMapping(value="/letureStatistics", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public List<KJE_TimeStatisticsVo> getTimeStatistics(
			@RequestParam (required =false)String lecture_code,
			@RequestParam (required =false)String start_date,
			@RequestParam (required =false)String end_date
			){
		
		Map<String, String> stinfo = new HashedMap();
		stinfo.put("lecture_code", lecture_code);
		stinfo.put("start_date", start_date);
		stinfo.put("end_date", end_date);
		
		List<KJE_TimeStatisticsVo> resp = StatisticsService.getLectureStatistics(stinfo);
				
		return resp;
	}
	
	@RequestMapping(value="/behaviorStatistics", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public Map<String, String> getProBehaviorStatistics(
			@RequestParam (required =false)String lecture_code,
			@RequestParam (required =false)String start_date,
			@RequestParam (required =false)String end_date
			){
		
		Map<String, String> stinfo = new HashedMap();
		stinfo.put("lecture_code", lecture_code);
		stinfo.put("start_date", start_date);
		stinfo.put("end_date", end_date);
		
		Map<String, String> resp = StatisticsService.getProBehaviorStatistics(stinfo);
		return resp;
	}
	
	@RequestMapping(value="/potalStatistics", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public List<KJE_TimeStatisticsVo> getTimeStatistics(
			@RequestParam (required =false)String start_date,
			@RequestParam (required =false)String end_date
			){
		
		Map<String, String> stinfo = new HashedMap();
		stinfo.put("start_date", start_date);
		stinfo.put("end_date", end_date);
		
		List<KJE_TimeStatisticsVo> resp = StatisticsService.getPotalStatistics(stinfo);
				
		return resp;
	}
	
	@RequestMapping(value = "/operationSt",method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public List<KJE_OperationStatisticsVo> getOperationSt(
			@RequestParam (required =false)String openseme_no,
			@RequestParam (required =false)String lower_organization
			){
		
		Map<String, String> stinfo = new HashedMap();
		stinfo.put("openseme_no", openseme_no);
		
		if(StringUtils.isNotBlank(lower_organization)){
			stinfo.put("lower_organization", lower_organization);
		}
		List<KJE_OperationStatisticsVo> resp = StatisticsService.getOperationStList(stinfo);
		
		return resp;
	}
	
	@RequestMapping(value = "/thisTimeSemester",method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public OpenSemesterVo getThisSemester(
			@RequestParam (required =false)String today
			){
		OpenSemesterVo resp =  StatisticsService.getThisTimeSemester(today);
		return resp;
		
	}
	
	
	
	
}
