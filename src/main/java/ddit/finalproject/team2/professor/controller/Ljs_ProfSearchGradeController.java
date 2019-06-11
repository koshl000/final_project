package ddit.finalproject.team2.professor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/professorMain/searchGrade")
public class Ljs_ProfSearchGradeController {

	@GetMapping("{lecture_code}")
	public ModelAndView goAttendList(@PathVariable String lecture_code, ModelAndView mv){
		mv.setViewName("professor/attendListView");
		mv.getModel().put("lecture_code", lecture_code);
		return mv;
	}
}
