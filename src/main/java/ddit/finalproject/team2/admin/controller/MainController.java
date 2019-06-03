package ddit.finalproject.team2.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
 * Copyright (c) 2019 by DDIT All right reserved
 * 
 * 관리자 메인화면의 하위 항목들로 이동하기 위한 controller
 * </pre>
 */
@Controller("adminController")
@RequestMapping("/adminMain")
public class MainController {

	/**
	 * 기초정보관리 화면으로 이동하는 command handler
	 * @return
	 */
	@GetMapping("basic")
	public ModelAndView goBasic(ModelAndView mv){
		mv.setViewName("admin/information");
		return mv;
	}
	
	/**
	 * 사용자관리 화면으로 이동하는 command handler
	 * @return
	 */
	@GetMapping("user")
	public ModelAndView goUser(ModelAndView mv){
		mv.setViewName("admin/user");
		return mv;
	}
	
	/**
	 * 증명서관리 화면으로 이동하기 위한 command handler
	 * @return
	 */
	@GetMapping("certificate")
	public ModelAndView goCertificate(ModelAndView mv){
		mv.setViewName("admin/certificate");
		return mv;
	}
	
	/**
	 * 게시판관리 화면으로 이동하기 위한 command handler
	 * @return
	 */
	@GetMapping("board")
	public ModelAndView goBoard(ModelAndView mv){
		mv.setViewName("admin/board");
		return mv;
	}
	
	/**
	 * 통계관리 화면으로 이동하기 위한 command handler
	 * @return
	 */
	@GetMapping("statistics")
	public ModelAndView goStatistics(ModelAndView mv){
		mv.setViewName("admin/statistics");
		return mv;
	}
	
	/**
	 * 포털관리 화면으로 이동하기 위한 command handler
	 * @param mv
	 * @return
	 */
	@GetMapping("portal")
	public ModelAndView goPortal(ModelAndView mv){
		mv.setViewName("admin/portal");
		return mv;
	}
}
