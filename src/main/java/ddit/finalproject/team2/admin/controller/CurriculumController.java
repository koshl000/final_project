package ddit.finalproject.team2.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ddit.finalproject.team2.admin.service.Jch_CurriculumService;
import ddit.finalproject.team2.student.service.Jch_AllLectureService;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.Jch_LectureVo;
import ddit.finalproject.team2.vo.Jch_OpenSemesterVo;
import ddit.finalproject.team2.vo.Jch_UserVo;

@Controller
@RequestMapping("/curriculum")
public class CurriculumController {
	
	@Inject
	Jch_CurriculumService curriService;
	
	@Inject
	Jch_AllLectureService lecService;
	
	@GetMapping(value="lecture")
	public ModelAndView goLecture(ModelAndView mv){
		mv.setViewName("admin/curriculum");
		return mv;
	}
	
	@GetMapping(value="curAllLectureList", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> curAllLectureList(){
		Map<String, Object> map = new HashMap<>();
		List<Jch_LectureVo> list = lecService.getAllLectureList();
		map.put("data", list);
		return map;
	}
	
	@GetMapping("subject")
	public ModelAndView goSubject(ModelAndView mv){
		mv.setViewName("admin/curriculum-subject");
		return mv;
	} 
	
	@GetMapping("createLecture")
	public ModelAndView doGet(ModelAndView mv){
		List<Jch_UserVo> profList = curriService.getProfList();
		List<Jch_LectureVo> lowerList = curriService.getLowerList();
		Jch_OpenSemesterVo osVo = curriService.getOpenSemester();
		mv.addObject("profList", profList);
		mv.addObject("lowerList", lowerList);
		mv.addObject("osVo", osVo);
		mv.setViewName("admin/curriculumForm");
		return mv;
	}
	
	@PostMapping("createLecture")
	public ModelAndView doPost(
			@ModelAttribute("lecture") Jch_LectureVo lecture
			, Errors errors
			, ModelAndView mv
			){
		System.out.println(lecture.toString());
		ServiceResult result = curriService.insertLecutre(lecture);
		if (ServiceResult.OK.equals(result)) {
			mv.setViewName("admin/curriculum");
		} else {
			mv.setViewName("admin/curriculumForm");
		}
		return mv;
	}
	
}
