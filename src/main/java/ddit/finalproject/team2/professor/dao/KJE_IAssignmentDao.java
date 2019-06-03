package ddit.finalproject.team2.professor.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.AssignmentVo;
import ddit.finalproject.team2.vo.KJE_AssFileVo;
import ddit.finalproject.team2.vo.KJE_AssignmentnFileVo;
import ddit.finalproject.team2.vo.KJE_LWeekAssignmentProVo;
import ddit.finalproject.team2.vo.KJE_SubmitAttendstuVo;
import ddit.finalproject.team2.vo.KJE_SubmitFileVo;

@Repository
public interface KJE_IAssignmentDao {

	/**
	 * 파라미터로 전달되는 과목에 대한 수업 주차 정보와 과제물 정보가 담긴 리스트를 반환하는 메서드
	 * @return 수업 주차 정보와 과제물 정보가 담긴 리스트
	 */
	public List<KJE_LWeekAssignmentProVo> selectLWeekAssignmentProList(String lecture_code);
	
	/**
	 * 파라미터로 과제번호를 전달받아 과제 내용을 반환하는 메서드
	 * @param assignment_no 과제번호
	 * @return 과제 내용이 담긴 Vo
	 */
	public KJE_AssignmentnFileVo selectAssignment(String assignment_no);
	
	/**
	 * 과제 에 대한 정보를 전달받아 내용을 저장하는 메서드 
	 * @param assignment 과제에 대한 내용
	 * @return insert 성공여부
	 */
	public int insertAssignment(KJE_AssignmentnFileVo assignment);
	
	
	/** 과제의 첨부파일에 대한 내용을 전달받아 저장하는 메서드 
	 * 
	 * @param assignment 과제에 대한 내용
	 * @return insert 성공여부
	 */
	public int insertAllAssFile(KJE_AssignmentnFileVo assignmentnFileVo);
	
	
	/**
	 * 과제 첨부파일 중 하나에 해당하는 정보를 반환하는 메서드
	 * @param file_no
	 * @return
	 */
	public KJE_AssFileVo selectAssFile(String file_no);
	
	
	/**
	 * 과제물 번호를 전달받아 해당 과제물을 제출한 학생의 정보와 파일 정보를 반환하는 메서드
	 * @param assignment_no
	 * @return 해당 과제물의 제출자 정보와 파일 정보가 담긴 Vo
	 */
	public List<KJE_SubmitAttendstuVo> selectSubmitStuList(String assignment_no);
	
	/**
	 * 제출파일 번호를 전달받아 해당 과제물 파일의 정보를 반환하는 메서드
	 * @param submitfile_no
	 * @return 과제물 파일의 정보가 담긴 Vo
	 */
	public KJE_SubmitFileVo seletSumitFile(String submitfile_no);
	
	/**
	 * 과제물 passFail 일괄 업데이트 하는 메서드
	 * @param pfCheckList
	 * @return
	 */
	public int updatePFchecked (List<KJE_SubmitFileVo> pfCheckList);
	
	/** 
	 * 과제물 번호를 매개변수로 받아 과제물을 삭제하는 메서드
	 * @param assignment_no 과제물 번호
	 * @return delete에 성공한 열의 수
	 */
	public int deleteAssignment(String assignment_no);
	
	/** 
	 * 과제물 번호를 매개변수로 받아 과제물 첨부파일을 삭제하는 메서드
	 * @param assignment_no 과제물 번호
	 * @return delete에 성공한 열의 수
	 */
	public int deleteAssignmentfile(String file_no);
	
	/** 
	 * 과제물 번호를 매개변수로 받아 과제물 제출파일을 삭제하는 메서드
	 * @param assignment_no 과제물 번호
	 * @return delete에 성공한 열의 수
	 */
	public int deleteSubmitfile(String submitfile_no);
	
	/**
	 * 과제물 정보를 받아 과제물을 수정하는 메서드
	 * @param assignmentnFileVo 과제물에 대한 정보를 저장한 Vo
	 * @return update에 성공한 열의 수
	 */
	public int updateAssignment(KJE_AssignmentnFileVo assignmentnFileVo);
	
}
