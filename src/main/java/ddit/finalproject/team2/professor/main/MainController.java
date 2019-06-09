package ddit.finalproject.team2.professor.main;

import javax.inject.Inject;

import ddit.finalproject.team2.vo.UserVo;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ddit.finalproject.team2.admin.service.KJE_IStatisticsService;

import java.util.ArrayList;
import java.util.List;

@Controller("professorController")
@RequestMapping("/professorMain/")
public class MainController {
	@GetMapping("notice")
	public ModelAndView goNotice(ModelAndView mv) {
		mv.setViewName("professor/notice");
		return mv;
	}
	@GetMapping("mantoman/{lecture_code}")
	public ModelAndView goMantoMan(ModelAndView mv, Authentication au, @PathVariable String lecture_code) {
		mv.setViewName("common/exclude/mantoman");
		mv.getModel().put("id", au.getName());
		mv.getModel().put("user", (UserVo)au.getPrincipal());
		return mv;
	}
}
