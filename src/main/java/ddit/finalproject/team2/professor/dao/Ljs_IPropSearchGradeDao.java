package ddit.finalproject.team2.professor.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.LectureVo;
import ddit.finalproject.team2.vo.OpenSemesterVo;

@Repository
public interface Ljs_IPropSearchGradeDao {
	List<LectureVo> selectLectureListForProfessor(LectureVo lecture);
	String selectOpensemeNo(OpenSemesterVo semester);
}
