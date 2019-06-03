package ddit.finalproject.team2.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.GradeRankVo;
import ddit.finalproject.team2.vo.KJE_PolicyManagementVo;
import ddit.finalproject.team2.vo.KJE_SemesterVo;

public interface KJE_IPolicyManagementService {
	

	/**
	 * 평가정책 리스트를 가져오는 메서드	
	 * @return 평가정책 리스트
	 */
	public List<KJE_PolicyManagementVo> getPolicyManagementAllList();
	/**
	 * 평가정책을 추가할 수 있는 학기 리스트를 가져오는 메서드
	 * @return 학년도, 학기, 학기번호 
	 */
	public List<KJE_SemesterVo> getAddSemesterList();
	
	/**
	 * 평가정책을  입력하는 메서드
	 * @param graderank 평가정책 정보
	 * @return
	 */
	public ServiceResult recordEvalpolicy(Map<String,Object> graderankInfo);
	
	/**
	 * 평가정책을  수정하는 메서드
	 * @param graderank 평가정책 정보
	 * @return
	 */
	public ServiceResult modifyGraderank(Map<String,Object> graderankMap);
}
