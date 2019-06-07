package ddit.finalproject.team2.student.service;

import java.util.List;

import ddit.finalproject.team2.vo.Ljs_SearchGradeVo;

public interface Ljs_ISearchGradeService {
	List<Ljs_SearchGradeVo> retrieveGradeList(String user_id);
	
}
