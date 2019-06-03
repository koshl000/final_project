package ddit.finalproject.team2.student.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.KJE_SubmitFileVo;
import ddit.finalproject.team2.vo.SubmitFileVo;

@Repository
public interface KJE_IAssignmentsutDao {

	/**
	 * 
	 * @param stuInfo 과제물번호, 학생의 수강번호, 
	 * @return 학생이 제출한 과제물 파일의 정보
	 */
	public SubmitFileVo selectSubmitFile(Map<String, String> stuInfo);
	
	/**
	 * 학생이 제출한 과제물 파일을 저장하는 메서드
	 * @param submitFile
	 * @return
	 */
	public int insertSubmitFile(KJE_SubmitFileVo submitFile);
	
	
	/** 
	 * 학생이 제출한 과제물 파일을 수정하는 메서드
	 * @param submitFile 학생이 제출한 과제물 파일의 정보
	 * @return 수정 성공 여부
	 */
	public int updateSubmitFile(KJE_SubmitFileVo submitFile);
	
	
}
