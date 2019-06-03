package ddit.finalproject.team2.admin.controller;

import org.springframework.security.core.Authentication;
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
 * 포털관리 화면의 하위 항목으로 이동하기 위한 controller
 * </pre>
 */
@Controller
@RequestMapping("/portal")
public class PortalController {

	/**
	 * 일정 화면으로 이동하기 위한 command handler
	 * @param mv
	 * @param au
	 * @return
	 */
	@GetMapping("schedule")
	public ModelAndView goSchedule(ModelAndView mv, Authentication au){
		mv.setViewName("admin/schedule");
		mv.getModel().put("id", au.getName());
		return mv;
	}
	
	/**
	 * sms 화면으로 이동하기 위한 command handler
	 * @param mv
	 * @return
	 */
	@GetMapping("sms")
	public ModelAndView goSms(ModelAndView mv){
		mv.setViewName("admin/sms");
		return mv;
	}
	
	@GetMapping("system")
	public ModelAndView goSystem(ModelAndView mv){
		mv.setViewName("admin/system");
		return mv;
	}
}
