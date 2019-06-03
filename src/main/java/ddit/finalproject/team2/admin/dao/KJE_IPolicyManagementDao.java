package ddit.finalproject.team2.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.EvaluationPolicyVo;
import ddit.finalproject.team2.vo.GradeRankVo;
import ddit.finalproject.team2.vo.GradeVo;
import ddit.finalproject.team2.vo.KJE_PolicyManagementVo;
import ddit.finalproject.team2.vo.KJE_SemesterVo;

@Repository
public interface KJE_IPolicyManagementDao {

	/**
	 * 평가정책 리스트를 가져오는 메서드	
	 * @return 평가정책 리스트
	 */
	public List<KJE_PolicyManagementVo> selectPolicyManagementAllList();
	
	
	/**
	 * 평가정책을 추가할 수 있는 학기 리스트를 가져오는 메서드
	 * @return 학년도, 학기, 학기번호 
	 */
	public List<KJE_SemesterVo> selectAddSemesterList();
	
	/**
	 * 평가정책 코드를 추가하는 메서드
	 * @param evaluationPolicy 학기 번호
	 * @return
	 */
	public int insertEvaluationPolicy(EvaluationPolicyVo evaluationPolicy);
	
	/**
	 * 학기번호에 해당하는 평가정책 코드를 가져오는 메서드
	 * @param openseme_no 학기번호
	 * @return
	 */
	public String selectEvalpolicyCode(String openseme_no);
	
	/**
	 * 평가정책을  입력하는 메서드
	 * @param graderank 평가정책 정보
	 * @return
	 */
	public int insertGraderank(Map<String,Object> graderankMap);
	
	/**
	 * 평가정책을  수정하는 메서드
	 * @param graderank 평가정책 정보
	 * @return
	 */
	public int updateGraderank(Map<String,Object> graderankMap);
		
	
	
}
