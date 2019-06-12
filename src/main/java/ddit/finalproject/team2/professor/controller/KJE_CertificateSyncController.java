package ddit.finalproject.team2.professor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class KJE_CertificateSyncController {

	@RequestMapping("/professor/certificate")
	public ModelAndView assignmentViewController(ModelAndView mv){
		
		mv.setViewName("professor/certificate");
		return mv;
	}
	
	
}
