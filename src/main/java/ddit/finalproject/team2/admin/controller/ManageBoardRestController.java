package ddit.finalproject.team2.admin.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.admin.service.Ljs_IManageBoardService;
import ddit.finalproject.team2.student.service.Ljs_IBoardService;
import ddit.finalproject.team2.vo.Ljs_BoardVo;

@RestController
@RequestMapping("/manageBoard")
public class ManageBoardRestController {
	@Inject
	Ljs_IManageBoardService mbService;
	
	@GetMapping(produces="application/json;charset=UTF-8")
	public List<Ljs_BoardVo> list(){
		List<Ljs_BoardVo> list = mbService.retrieveAllBoard();
		return list;
	}
}
