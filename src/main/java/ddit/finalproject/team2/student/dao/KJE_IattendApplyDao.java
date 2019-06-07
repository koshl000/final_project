package ddit.finalproject.team2.student.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.KJE_attendApplyVo;
import ddit.finalproject.team2.vo.LecturePlanVo;
import ddit.finalproject.team2.vo.OpenSemesterVo;

@Repository
public interface KJE_IattendApplyDao {
	
	/**
	 * 학기 번호를 매개변수로 받아 그 학기에 해당하는 모든 과목의 수강신청 리스트를 반환하는 메서드
	 * @param openseme_no 학기 번호
	 * @return 수강신청 가능 리스트
	 */
	public List<KJE_attendApplyVo> selectAttendApplyList(Map<String, String> stuInfo);
	
	/**
	 * 학생의 id와 학기 번호를 매개변수로 받아 학생이 수강신청 완료한 리스트를 반환하는 메서드
	 * @param stuInfo 
	 * @return
	 */
	public List<KJE_attendApplyVo> selectAttendApplyCompList(Map<String, String> stuInfo);
	
	
	/** 과목 코드를 매개변수로 받아 해당 과목의 강의 계획서 정보를 반환하는 메서드
	 * 
	 * @param lecture_code 과목 코드
	 * @return 강의계획서 정보
	 */
	public LecturePlanVo selectLecturePlan(String lecture_code);
	
	
	/**
	 *  학생의 ID와 과목 코드를 받아 수강신청 정보를 저장하는 메서드
	 * @param stuInfo 학생의 ID와 과목 코드가 담긴 Map
	 * @return Insert 성공 여부
	 */
	public int insertAttend(Map<String, String> stuInfo);
	
	/**
	 * 수강 번호를 받아 그에 해당하는 수강신청 정보를 삭제하는 메서드
	 * @param attend_no 수강 번호
	 * @return 삭제 성공 여부
	 */
	public int deleteAttend(String attend_no);
	

	/**
	 * user id를 매개변수로 받아 이미 수강신청한 학점의 합계를 반환하는 메서드
	 * @param user_id 사용자 id
	 * @return 수강 신청한 학점의 합계
	 */
	public String selectSumCredit(String user_id);
	
	/**
	 * 현재 날짜를 매개변수로 받아 현재 날짜에 해당하는 수강신청 날짜를 반환하는 메서드
	 * @param today 오늘 날짜
	 * @return 수강신청 날짜 정보가 담긴 Vo 
	 */
	public OpenSemesterVo selectAttendPeriod(String today); 
	
}
