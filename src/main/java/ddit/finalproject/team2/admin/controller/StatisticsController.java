package ddit.finalproject.team2.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ddit.finalproject.team2.admin.service.KJE_IStatisticsService;
import ddit.finalproject.team2.vo.OpenSemesterVo;
import ddit.finalproject.team2.vo.OrganizationVo;

/**
 * @author 이종선
 * @since 2019. 5. 14.
 * @version 1.0
 * @see 
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2019. 5. 14.      이종선       최초작성
 * 2019. 5. 21 		  김재은	 goSubject 수정
 * 2019. 5. 24 		  김재은      사용자통계를 운영통계로 수정
 * Copyright (c) 2019 by DDIT All right reserved
 * 
 * 통계관리 화면의 하위 항목들로 이동하기 위한 controller
 * </pre>
 */
@Controller
@RequestMapping("/statistics")
public class StatisticsController {
	@Inject
	KJE_IStatisticsService statisticsService;
	
	/**
	 * 과목통계 화면으로 이동하기 위한 command handler
	 * @return
	 */
	@GetMapping("subject")
	public ModelAndView goSubject(ModelAndView mv){
		mv.addObject("upperOrganizationList", statisticsService.getUpperOrganization());
		mv.addObject("lowerOrganizationList", statisticsService.getLowerOrganization());
		
		Date date = new Date();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
		
		String todayString =sdFormat.format(date);
		
		OpenSemesterVo thisTimeSemester =statisticsService.getThisTimeSemester(todayString);
		String openseme_no =thisTimeSemester.getOpenseme_no();
		
		mv.addObject("lectureList", statisticsService.getStLecture(openseme_no));
		  
		mv.setViewName("admin/subjectStats");
		return mv;
	}
	
	/**
	 * 운영통계 화면으로 이동하기 위한 command handler
	 * @param mv
	 * @return
	 */
	@GetMapping("operation")
	public ModelAndView goUser(ModelAndView mv){
		mv.addObject("lowerOrganizationList", statisticsService.getLowerOrganization());
		mv.addObject("semesterList",statisticsService.getSemesterList());
		mv.setViewName("admin/operationStats");
		return mv;
	}
	
	/**
	 * 포털 접속통계 화면으로 이동하기 위한 command handler
	 * @param mv
	 * @return
	 */
	@GetMapping("portal")
	public ModelAndView goSystem(ModelAndView mv){
		mv.setViewName("admin/portalaccessstatistics");
		return mv;
	}
	
	/**
	 * 교수활동통계 화면으로 이동하기 위한 command handler
	 * @param mv
	 * @return
	 */
	@GetMapping("behavior")
	public ModelAndView goBehavior(ModelAndView mv){

		Date date = new Date();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
		String todayString =sdFormat.format(date);
		OpenSemesterVo thisTimeSemester =statisticsService.getThisTimeSemester(todayString);
		String openseme_no =thisTimeSemester.getOpenseme_no();
		
		mv.addObject("lectureList", statisticsService.getStLecture(openseme_no));
		mv.addObject("professorList", statisticsService.getProfessorList());
		mv.setViewName("admin/behaviorStats");
		return mv;
	}
}
