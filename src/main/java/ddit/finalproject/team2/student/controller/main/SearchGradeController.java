package ddit.finalproject.team2.student.controller.main;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.student.service.Ljs_ISearchGradeService;
import ddit.finalproject.team2.vo.Ljs_SearchGradeVo;

@RestController
@RequestMapping("/searchGrade/{user_id}")
public class SearchGradeController {
	@Inject
	Ljs_ISearchGradeService service;
	
	@GetMapping(produces="application/json;charset=UTF-8")
	public List<Ljs_SearchGradeVo> list(@PathVariable String user_id){
		List<Ljs_SearchGradeVo> list = service.retrieveGradeList(user_id);
		return list;
	}
}
