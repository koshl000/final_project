package ddit.finalproject.team2.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author 이종선
 * @since 2019. 6. 1.
 * @version 1.0
 * @see 
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2019. 6. 1.      이종선       최초작성
 * Copyright (c) 2019 by DDIT All right reserved
 * 
 * 성적 산출을 위한 성적 데이터를 확보하기 위한 vo
 * 검색한 학생의 중간, 기말, 출석, 과제 점수를 수집한다.
 * 검색 조건 : 학생 id
 * </pre>
 */
@NoArgsConstructor
@Data
@EqualsAndHashCode(of={"user_id", "lecture"})
@ToString(exclude="exams")
public class Ljs_EvaluationMaterialVo implements Serializable{
	//검색조건
	private String user_id; //조회하려는 학생의 id
	private String lecture_code; //조회하려는 강좌
	private String attend_no;
	
	//데이터(강좌, 시험, 반영비율)
	private LectureVo lecture; //성적 처리의 대상 강좌
	private List<EvaluationStudyVo> evaluationRatio; //강좌의 반영비율 데이터
	private List<Ljs_ExamVo> exams; //해당 학생의 중간, 기말고사 시험과 답안 데이터
	
	//데이터(과제, 출석)
	private List<AssignmentVo> assignmentNoList; //과제물 번호 리스트
	private List<SubmitFileVo> submitFileList; //해당 학생의 제출된 과제물 리스트
	private List<AbsenceVo> absenceList; //해당 학생의 출석 리스트
	
	/**
	 * 검색조건 세팅을 위한 생성자
	 * 조건을 쓰지 않으려면 null 값을 넣는다.
	 * @param user_id 검색하려는 학생의 id
	 * @param examType 검색하려는 시험 유형
	 * @param searchYear 검색하려는 학년도
	 * @param searchSemester 검색하려는 학기
	 */
	public Ljs_EvaluationMaterialVo(String user_id, String lecture_code){
		this.user_id = user_id;
		this.lecture_code = lecture_code;
	}
}
