package ddit.finalproject.team2.professor.service;

import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.Ljs_EvaluationMaterialVo;

public interface Ljs_IGradeService {
	/**
	 * 시험 성적 입력을 위한 메서드
	 * @param material 학생의 id, 강좌코드를 넣은 vo
	 * @return 성공 : OK, 실패 : FAILED
	 */
	ServiceResult createExamGrade(Ljs_EvaluationMaterialVo material);
	
	/**
	 * 출석과 과제물 성적 입력을 위한 메서드
	 * @param material 학생의 id, 강좌코드를 넣은 vo
	 * @return 성공 : OK, 실패 : FAILED
	 */
	ServiceResult createAbsenceAndAssignmentGrade(Ljs_EvaluationMaterialVo material);
	
	ServiceResult evaluateAverage(String lecture_code);
}
