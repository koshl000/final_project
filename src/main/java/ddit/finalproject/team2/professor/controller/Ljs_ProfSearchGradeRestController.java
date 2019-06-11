package ddit.finalproject.team2.professor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.professor.service.Ljs_IProfSearchGradeService;
import ddit.finalproject.team2.vo.LectureVo;
import ddit.finalproject.team2.vo.Ljs_AttendVo;

@RestController
@RequestMapping("/searchGrade")
public class Ljs_ProfSearchGradeRestController {
	@Inject
	Ljs_IProfSearchGradeService service;
	
	@GetMapping(value="{user_id}", produces="application/json;charset=UTF-8")
	public Map<String, Object> list(@PathVariable String user_id){
		Map<String, Object> map = new HashMap<>();
		LectureVo lecture = new LectureVo();
		lecture.setUser_id(user_id);
		List<LectureVo> lectureList = service.retrieveLectureListforProfessor(lecture);
		map.put("data", lectureList);
		return map;
	}
	
	@GetMapping(value="attendList/{lecture_code}", produces="application/json;charset=UTF-8")
	public Map<String, Object> attendList(@PathVariable String lecture_code){
		Map<String, Object> map = new HashMap<>();
		List<Ljs_AttendVo> list = service.retrieveAttendList(lecture_code);
		map.put("data", list);
		return map;
	}
}
