package ddit.finalproject.team2.professor.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.LectureVo;
import ddit.finalproject.team2.vo.Ljs_AttendVo;
import ddit.finalproject.team2.vo.OpenSemesterVo;

@Repository
public interface Ljs_IProfSearchGradeDao {
	List<LectureVo> selectLectureListForProfessor(LectureVo lecture);
	String selectOpensemeNo(OpenSemesterVo semester);
	List<Ljs_AttendVo> selectAttendList(String lecture_code);
}
