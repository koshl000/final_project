package ddit.finalproject.team2.professor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ddit.finalproject.team2.admin.service.Jch_CurriculumService;
import ddit.finalproject.team2.vo.Jch_LectureVo;

@Controller
@RequestMapping("/professor")
public class Jch_LectureController {
	
	@Inject
	Jch_CurriculumService service;
	
	@GetMapping("alectureList")
	public ModelAndView lectureList(Authentication au, ModelAndView mv){
		System.out.println( au.getName());
		mv.setViewName("professor/lectureList");
		return mv;
	}
	
	@GetMapping(value="getLectureList", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> getLectureList(Authentication au){
		Map<String, Object> map = new HashMap<>();
		List<Jch_LectureVo> list = service.getLectureList(au.getName());
		map.put("data", list);
		return map;
	}
    
}
