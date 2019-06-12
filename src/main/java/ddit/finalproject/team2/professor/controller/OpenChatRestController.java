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

@RestController
@RequestMapping("/openChat")
public class OpenChatRestController {
	@Inject
	Ljs_IProfSearchGradeService service;
	
	@GetMapping(value="{user_id}", produces="application/json;charset=UTF-8")
	public Map<String, Object> list(@PathVariable String user_id){
		Map<String, Object> map = new HashMap<>();
		LectureVo lecture = new LectureVo();
		lecture.setUser_id(user_id);
		List<LectureVo> list = service.retrieveLectureListForOpenChat(lecture);
		map.put("data", list);
		return map;
	}
}
