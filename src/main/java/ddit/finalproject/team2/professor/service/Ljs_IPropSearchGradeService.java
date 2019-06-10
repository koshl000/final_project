package ddit.finalproject.team2.professor.service;

import java.util.List;

import ddit.finalproject.team2.vo.LectureVo;

public interface Ljs_IPropSearchGradeService {
	List<LectureVo> retrieveLectureListforProfessor(LectureVo lecture);
}
