package ddit.finalproject.team2.student.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.Ljs_GradeDetailVo;
import ddit.finalproject.team2.vo.Ljs_SearchGradeVo;

@Repository
public interface Ljs_ISearchGradeDao {
	List<Ljs_SearchGradeVo> selectAverageList(String user_id);
	List<Ljs_GradeDetailVo> selectGradeDetail(Ljs_GradeDetailVo detail);
}
