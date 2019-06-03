package ddit.finalproject.team2.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/curriculum")
public class CurriculumController {
	
	@GetMapping("lecture")
	public ModelAndView goLecture(ModelAndView mv){
		mv.setViewName("admin/curriculum");
		return mv;
	} 
	
	@GetMapping("subject")
	public ModelAndView goSubject(ModelAndView mv){
		mv.setViewName("admin/curriculum-subject");
		return mv;
	} 
}
