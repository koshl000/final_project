package ddit.finalproject.team2.professor.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.maven.model.Model;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ddit.finalproject.team2.admin.service.Jch_CurriculumService;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.Jch_LecturePlanVo;
import ddit.finalproject.team2.vo.Jch_LectureVo;
import ddit.finalproject.team2.vo.Jch_LectureWeekVo;
import ddit.finalproject.team2.vo.Jch_SMSGroupVo;
import ddit.finalproject.team2.vo.Jch_UserVo;
import ddit.finalproject.team2.vo.SMSGroupVo;

@Controller
@RequestMapping("/professor")
public class Jch_LectureController {
	
	@Inject
	Jch_CurriculumService service;
	
	@GetMapping("alectureList")
	public ModelAndView lectureList(Authentication au, ModelAndView mv){
		Jch_UserVo userVo = service.getProfInfo(au.getName());
		Jch_LecturePlanVo jlpVo = service.getLecturePlanVO();
		mv.addObject("userVo", userVo);
		mv.addObject("jlpVo", jlpVo);
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
	
	@GetMapping(value="getLectureCode")
	public String getLectureCode(String no, Authentication au){
		String view = null;
		ServiceResult result = service.getLectureCode(no);
		if (ServiceResult.OK.equals(result)) {
	    	view = "professor/registerLecture";
		} else {
			view = "professor/alectureList";
		}
		return view;
	}
	
	@PostMapping(value="lectureWeekAdd")
	public String lectureWeekAdd(@RequestBody Map<String, String> params, HttpServletRequest request) {
		String view = null;
		String lecture_code = params.get("no");
		lecture_code = lecture_code.replaceAll("<a href='register/", "");
		lecture_code = lecture_code.substring(0, lecture_code.indexOf("'"));
		System.out.println(lecture_code);
	    if(lecture_code!=null) {
	    	params.remove("no");
	    }
		    
		List<String> aaa = new ArrayList<String>(params.keySet());
		List<String> list = new ArrayList<String>(params.values());
		List<Jch_LectureWeekVo> lwvList = new ArrayList<>();
		
		Jch_LectureWeekVo lwVo = null;
		for(int i=0; i<params.size(); i++) {
			int a = 0;
			if(aaa.get(i).contains("week")) {
				lwVo = new Jch_LectureWeekVo();
				lwVo.setLecture_code(lecture_code);
				lwVo.setLecture_week(list.get(i));
				continue;
			}
			if(aaa.get(i).contains("class")) {
				lwVo.setLecture_class(list.get(i));
				continue;
			}
			if(aaa.get(i).contains("subname")) {
				lwVo.setLecture_subname(list.get(i));
				lwvList.add(lwVo);
				continue;
			}
		}
			
		System.out.println(lwvList.toString());
		Jch_LectureWeekVo vo = new Jch_LectureWeekVo();
		vo.setLecWeek_list(lwvList);
		
		ServiceResult result = service.insertLectureWeekList(vo);
		if (ServiceResult.OK.equals(result)) {
	    	view = "redirect:alectureList";
		} else {
			view = "professor/lectureList";
		}
		return view;
	}
	
	@PostMapping(value="lecturePlanAdd")
	public String lecturePlanAdd(@RequestBody Map<String, String> params, HttpServletRequest request) {
		String view = null;
		String lecture_code = params.get("no");
		lecture_code = lecture_code.replaceAll("<a href='register/", "");
		lecture_code = lecture_code.substring(0, lecture_code.indexOf("'"));
		System.out.println(lecture_code);
	    if(lecture_code!=null) {
	    	params.remove("no");
	    }
	    Jch_LecturePlanVo vo = new Jch_LecturePlanVo();
		vo.setLecture_code(lecture_code);
		vo.setAssignment_info(params.get("studyAssi"));
		vo.setBook_material(params.get("book"));
		vo.setIntroduction(params.get("profInfo"));
		vo.setLec_plan_method(params.get("lecMethod"));
		vo.setLec_plan_summary(params.get("lecSummary"));
		vo.setWeek_content(params.get("weekCon"));
		
		ServiceResult result = service.insertLecturePlan(vo);
		
	    System.out.println(params.toString());
	    if (ServiceResult.OK.equals(result)) {
	    	view = "redirect:alectureList";
		} else {
			view = "professor/lectureList";
		}
		return view;
	}
	
	@GetMapping(value="lecturePlanView")
	@ResponseBody
	public Jch_LecturePlanVo getLecturePlanView(String no, Authentication au){
		no = no.replaceAll("<a href='register/", "");
		no = no.substring(0, no.indexOf("'"));
		Jch_LecturePlanVo vo = service.getLecturePlanView(no);
		return vo;
	}
	
	@GetMapping(value="lectureUpdateView")
	@ResponseBody
	public Jch_LectureVo getLectureUpdateView(String no, Authentication au, ModelAndView mv){
		List<Jch_LectureVo> lowerList = service.getLowerList();
		no = no.replaceAll("<a href='register/", "");
		no = no.substring(0, no.indexOf("'"));
		Jch_LectureVo lecture = service.getLectureData(no);
		lecture.setLowerList(lowerList);
		return lecture;
	}
	
}
