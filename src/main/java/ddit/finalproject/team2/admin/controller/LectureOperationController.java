package ddit.finalproject.team2.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ddit.finalproject.team2.admin.service.KJE_IPolicyManagementService;
import ddit.finalproject.team2.admin.service.KJE_IStatisticsService;
import ddit.finalproject.team2.vo.OpenSemesterVo;

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
 * 2019.5.26         김재은       평가정책관리, 강의평가 관리 View name수정
 * Copyright (c) 2019 by DDIT All right reserved
 * 
 * 강의운영관리 화면의 하위 항목으로 이동하기 위한 controller
 * </pre>
 */
@Controller
@RequestMapping("/operation")
public class LectureOperationController {
	@Inject
	KJE_IStatisticsService statisticsService;
	
	@Inject
	KJE_IPolicyManagementService policyManagementService; 
	
	/**
	 * 평가정책관리
	 * @param mv
	 * @return
	 */
	@GetMapping("policy")
	public ModelAndView goPolicy(ModelAndView mv){
		mv.addObject("addSemesterList",policyManagementService.getAddSemesterList());
		mv.setViewName("admin/policyManagement");
		return mv;
	}
	
	/**
	 * 수강신청관리 화면으로 이동하기 위한 command handler
	 * @return
	 */
	@GetMapping("attend")
	public ModelAndView goAttend(ModelAndView mv){
		mv.setViewName("admin/lectureOperation-attendance");
		return mv;
	}
	
	/**
	 * 수강관리 화면으로 이동하기 위한 command handler
	 * @return
	 */
	@GetMapping("attendList")
	public ModelAndView goLectureList(ModelAndView mv){
		mv.setViewName("admin/lectureOperation-attend");
		return mv;
	}
	
	/**
	 * 과제물관리 화면으로 이동하기 위한 command handler
	 * @return
	 */
	@GetMapping("assignment")
	public ModelAndView goAssignment(ModelAndView mv){
		Date date = new Date();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
		String todayString =sdFormat.format(date);
		OpenSemesterVo thisTimeSemester =statisticsService.getThisTimeSemester(todayString);
		String openseme_no =thisTimeSemester.getOpenseme_no();
		
		mv.addObject("lectureList", statisticsService.getStLecture(openseme_no));
		mv.addObject("professorList", statisticsService.getProfessorList());
    	
		mv.setViewName("professor/giveAssignment");
		
		mv.setViewName("admin/managehomework");
		return mv;
	}
	
	/**
	 * 시험관리 화면으로 이동하기 위한 command handler
	 * @return
	 */
	@GetMapping("exam")
	public ModelAndView goExam(ModelAndView mv){
		mv.setViewName("admin/manageExam");
		return mv;
	}
	
	/**
	 * 강의평가관리 화면으로 이동하기 위한 command handler
	 * @return
	 */
	@GetMapping("evaluation")
	public ModelAndView goEvaluation(ModelAndView mv){
		mv.setViewName("admin/lectureevaluation");
		return mv;
	}
}
