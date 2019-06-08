package ddit.finalproject.team2.professor.dao;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.Ljs_EvaluationMaterialVo;

@Repository
public interface Ljs_IEvaluationDao {
	Ljs_EvaluationMaterialVo selectExam(Ljs_EvaluationMaterialVo material);
	Ljs_EvaluationMaterialVo selectAbsenceAndAssignment(Ljs_EvaluationMaterialVo material);
}
