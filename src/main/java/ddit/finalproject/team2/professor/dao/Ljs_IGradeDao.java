package ddit.finalproject.team2.professor.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.GradeVo;

@Repository
public interface Ljs_IGradeDao {
	int insertGrade(GradeVo grade);
	GradeVo selectGrade(String attend_no);
	int updateGrade(GradeVo grade);
	int updateGradeAll(GradeVo grade);
	List<GradeVo> selectGradeList(String lecture_code);
}
