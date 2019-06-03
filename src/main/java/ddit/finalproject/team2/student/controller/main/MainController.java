package ddit.finalproject.team2.student.controller.main;

import ddit.finalproject.team2.student.service.Lsh_ILectureService;
import ddit.finalproject.team2.vo.UserVo;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 이종선
 * @since 2019. 5. 13.
 * @version 1.0
 * @see
 * 
 *      <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2019. 5. 13.      이종선       최초작성
 * Copyright (c) 2019 by DDIT All right reserved
 * 
 * 메인페이지에서 권한에 따라 하위 항목들로 이동하기 위한 controller
 *      </pre>
 */
@Controller("studentController")
@RequestMapping("/studentMain")
public class MainController {

	@Inject
	Lsh_ILectureService lectureService;
	/**
	 * 성적조회 화면으로 이동하기 위한 command handler
	 * 
	 * @param mv
	 * @param au
	 * @return
	 */
	@GetMapping("searchGrade")
	public ModelAndView goGrade(ModelAndView mv, Authentication au) {
		mv.setViewName("student/searchGrade");
		mv.getModel().put("id", au.getName());
		mv.getModel().put("user", (UserVo)au.getPrincipal());
		return mv;
	}

	/**
	 * 나의정보 화면으로 이동하기 위한 command handler
	 * 
	 * @param mv
	 * @param au
	 * @return
	 */
	@GetMapping("myInfo")
	public ModelAndView goMyInfo(ModelAndView mv, Authentication au) {
		mv.setViewName("student/myInfo");
		mv.getModel().put("id", au.getName());
		mv.getModel().put("user", (UserVo)au.getPrincipal());
		return mv;
	}

	/**
	 * 일정 화면으로 이동하기 위한 command handler
	 * 
	 * @param mv
	 * @param au
	 * @return
	 */
	@GetMapping("schedule")
	public ModelAndView goSchedule(ModelAndView mv, Authentication au) {
		mv.setViewName("student/schedule");
		mv.getModel().put("id", au.getName());
		mv.getModel().put("user", (UserVo)au.getPrincipal());
		return mv;
	}

	/**
	 * 학생용 수강과목 페이지로 이동하는 command handler
	 * 
	 * @param mv
	 * @param au
	 * @return
	 */
	@GetMapping("attendList")
	public ModelAndView goAttendList(ModelAndView mv, Authentication au) {
		mv.setViewName("student/attendList");
		mv.getModel().put("id", au.getName());
		mv.getModel().put("user", (UserVo)au.getPrincipal());
		return mv;
	}

	/**
	 * 증명서 화면으로 이동하는 command handler
	 * 
	 * @param user_id
	 * @param mv
	 * @param au
	 * @return
	 */
	@GetMapping("certificate")
	public ModelAndView goCertificate(ModelAndView mv, Authentication au) {
		mv.setViewName("student/certificate");
		mv.getModel().put("id", au.getName());
		mv.getModel().put("user", (UserVo)au.getPrincipal());
		return mv;
	}

	/**
	 * 공지사항 화면으로 이동하는 command handler
	 * 
	 * @param mv
	 * @param au
	 * @return
	 */
	@GetMapping("notice")
	public ModelAndView goNotice(ModelAndView mv, Authentication au) {
		mv.setViewName("common/notice");
		mv.getModel().put("id", au.getName());
		mv.getModel().put("user", (UserVo)au.getPrincipal());
		return mv;
	}

	/**
	 * 학생용 수강신청 페이지로 이동하는 command handler
	 * 
	 * @param mv
	 * @param au
	 * @return
	 */
	@GetMapping("attendApply")
	public ModelAndView goAttendance(ModelAndView mv, Authentication au) {
		mv.setViewName("student/attendApply");
		mv.getModel().put("id", au.getName());
		mv.getModel().put("user", (UserVo)au.getPrincipal());
		return mv;
	}

	@GetMapping("myLecture")
	public ModelAndView goMyLecture(ModelAndView mv, Authentication au) {
		mv.setViewName("student/myLecture");
		mv.getModel().put("id", au.getName());
		mv.getModel().put("user", (UserVo)au.getPrincipal());

		Map<String,String> map=new HashMap<>();
		map.put("user_id",au.getName());
		map.put("openseme_year","2019");
		map.put("openseme_semester","1");
		mv.getModel().put("lectures",lectureService.selectLectureListbyOpenseme(map));
		return mv;
	}

	/**
	 * 학생용 모든강의 페이지로 이동하는 command handler
	 * 
	 * @param mv
	 * @param au
	 * @return
	 */
	@GetMapping("allLecture")
	public ModelAndView goAllLecture(ModelAndView mv, Authentication au) {
		mv.setViewName("student/allLecture");
		mv.getModel().put("id", au.getName());
		mv.getModel().put("user", (UserVo)au.getPrincipal());
		return mv;
	}

}
