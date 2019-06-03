package ddit.finalproject.team2.student.dao;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.GradeVo;

@Repository
public interface KJE_IStatisticsStuDao {
	
	/**
	 * 수강번호에 따른 성적 정보를 가져오는 메서드
	 * @param attend_no 수강번호
	 * @return 해당 수강 번호에 따른 성적 정보
	 */
	public GradeVo selectStudyState(String attend_no);
	
	
	/**
	 * 해당 과목에 대한 중간고사, 기말고사, 출석점수, 과제점수의 평균을 구하는 메서드
	 * @param lecture_code 과목코드
	 * @return 평균 성적 정보
	 */
	public GradeVo selectAvgStudyState(String lecture_code);
	
	/**
	 * 과목코드에 해당하는 과목 이름을 반환하는 메서드
	 * @param lecture_code
	 * @return
	 */
	public String selectLectureName(String lecture_code);
	
}
