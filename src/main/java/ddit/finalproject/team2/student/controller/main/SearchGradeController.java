package ddit.finalproject.team2.student.controller.main;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ddit.finalproject.team2.student.service.Ljs_ISearchGradeService;
import ddit.finalproject.team2.vo.UserVo;

@Controller
@RequestMapping("studentMain/searchGrade/{openseme_no}")
public class SearchGradeController {

	@Inject
	Ljs_ISearchGradeService service;
	
	@GetMapping("detail")
	public ModelAndView detail(@PathVariable String openseme_no, Authentication au, ModelAndView mv){
		mv.setViewName("student/searchGradeDetail");
		mv.getModel().put("user", (UserVo)au.getPrincipal());
		mv.getModel().put("openseme_no", openseme_no);
		return mv;
	}
}
