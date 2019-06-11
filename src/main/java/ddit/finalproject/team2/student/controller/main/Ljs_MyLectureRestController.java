package ddit.finalproject.team2.student.controller.main;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.student.service.Lsh_ILectureService;

@RestController
@RequestMapping("/myLecture")
public class Ljs_MyLectureRestController {
	@Inject
	Lsh_ILectureService lectureService;
	
	@GetMapping(value="{user_id}", produces="application/json;charset=UTF-8")
	public Map<String, Object> list(@PathVariable String user_id){
		Map<String, Object> map = new HashMap<>();
		Map<String,String> paramMap=new HashMap<>();
		paramMap.put("user_id",user_id);
		map.put("data",lectureService.selectLectureListbyOpenseme(paramMap));
		return map;
	}
}
