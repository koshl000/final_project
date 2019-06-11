package ddit.finalproject.team2.professor.service;

import java.util.List;

import ddit.finalproject.team2.vo.LectureVo;
import ddit.finalproject.team2.vo.Ljs_AttendVo;

public interface Ljs_IProfSearchGradeService {
	List<LectureVo> retrieveLectureListforProfessor(LectureVo lecture);
	List<Ljs_AttendVo> retrieveAttendList(String lecture_code);
}
