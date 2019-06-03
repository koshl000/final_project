package ddit.finalproject.team2.professor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class KJE_AssignmentSyncController {
	
	
	@RequestMapping("/assignmentView")
	public ModelAndView assignmentViewController(ModelAndView mv){
		
		mv.setViewName("professor/assignmentView");
		return mv;
	}
	
}
