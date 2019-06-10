package ddit.finalproject.team2.student.controller.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.student.service.Ljs_ISearchGradeService;
import ddit.finalproject.team2.vo.Ljs_GradeDetailVo;
import ddit.finalproject.team2.vo.Ljs_SearchGradeVo;
import ddit.finalproject.team2.vo.UserVo;

@RestController
@RequestMapping("/searchGrade")
public class SearchGradeRestController {
	@Inject
	Ljs_ISearchGradeService service;
	
	@GetMapping(value="list/{user_id}", produces="application/json;charset=UTF-8")
	public Map<String, Object> list(@PathVariable String user_id){
		Map<String, Object> map = new HashMap<>();
		List<Ljs_SearchGradeVo> list = service.retrieveGradeList(user_id);
		map.put("data", list);
		return map;
	}
	
	@GetMapping(value="detail/{openseme_no}", produces="application/json;charset=UTF-8")
	public Map<String, Object> detail(@PathVariable String openseme_no, Authentication au){
		Map<String, Object> map = new HashMap<>();
		UserVo user = (UserVo) au.getPrincipal();
		List<Ljs_GradeDetailVo> list = service.retrieveGradeDetail(new Ljs_GradeDetailVo(user.getUser_id(), openseme_no));
		map.put("data", list);
		return map;
	}
}
