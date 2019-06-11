package ddit.finalproject.team2.professor.controller;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ddit.finalproject.team2.student.service.Ljs_ILectureService;

@Controller
@RequestMapping("/openChat")
public class OpenChatRestController {
	@Inject
	Ljs_ILectureService service;
	
	@GetMapping(value="{user_id}", produces="application/json;charset=UTF-8")
	public Map<String, Object> list(@PathVariable String user_id){
		return null;
	}
}
