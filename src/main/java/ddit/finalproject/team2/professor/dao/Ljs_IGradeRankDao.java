package ddit.finalproject.team2.professor.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.GradeRankVo;

@Repository
public interface Ljs_IGradeRankDao {
	List<GradeRankVo> selectGradeRank(String lecture_code);
}
