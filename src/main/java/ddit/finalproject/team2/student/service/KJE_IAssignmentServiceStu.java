package ddit.finalproject.team2.student.service;

import java.util.List;
import java.util.Map;

import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.KJE_LWeekAssignmentProVo;
import ddit.finalproject.team2.vo.KJE_SubmitAttendstuVo;
import ddit.finalproject.team2.vo.KJE_SubmitFileVo;
import ddit.finalproject.team2.vo.SubmitFileVo;

public interface KJE_IAssignmentServiceStu {

	/**
	 * 파라미터로 전달되는 과목에 대한 수업 주차 정보와 과제물 정보가 담긴 리스트를 반환하는 메서드
	 * @return 수업 주차 정보와 과제물 정보가 담긴 리스트
	 */
	public List<KJE_LWeekAssignmentProVo> retrieveLWeekAssignmentProList(String lecture_code);
	
	
	/**
	 * 학생이 제출한 과제물 파일의 정보를 반환하는 메서드
	 * @param stuInfo 과제물번호, 학생의 수강번호, 
	 * @return 학생이 제출한 과제물 파일의 정보
	 */
	public SubmitFileVo retriveSubmitFile(Map<String, String> stuInfo);

	/**
	 * 학생이 제출한 과제물 파일을 저장하는 메서드
	 * @param submitFile
	 * @return
	 */
	public ServiceResult recordSubmitFile(KJE_SubmitFileVo submitFile);
	
	/** 
	 * 학생이 제출한 과제물 파일을 수정하는 메서드
	 * @param submitFile 학생이 제출한 과제물 파일의 정보
	 * @return 수정 성공 여부
	 */
	public ServiceResult modifySubmitFile(KJE_SubmitFileVo submitFile);
	

	
}
