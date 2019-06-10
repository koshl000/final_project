package ddit.finalproject.team2.student.controller.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ddit.finalproject.team2.student.service.Jch_AllLectureService;
import ddit.finalproject.team2.vo.Jch_LectureVo;

@Controller
@RequestMapping("/studentMain/allLecture")
public class AllLectureController {

	@Inject
	Jch_AllLectureService lecService;
	
	@GetMapping(value="allLectureList", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> getAllLectureList(){
		Map<String, Object> map = new HashMap<>();
		List<Jch_LectureVo> list = lecService.getAllLectureList();
		map.put("data", list);
		return map;
	}
}
