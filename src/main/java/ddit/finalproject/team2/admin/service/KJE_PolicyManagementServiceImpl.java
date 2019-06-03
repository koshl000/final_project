package ddit.finalproject.team2.admin.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;

import ddit.finalproject.team2.admin.dao.KJE_IPolicyManagementDao;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.EvaluationPolicyVo;
import ddit.finalproject.team2.vo.GradeRankVo;
import ddit.finalproject.team2.vo.KJE_PolicyManagementVo;
import ddit.finalproject.team2.vo.KJE_SemesterVo;

@Service
public class KJE_PolicyManagementServiceImpl implements KJE_IPolicyManagementService {
	
	@Inject
	KJE_IPolicyManagementDao policyManagementDao;
	
	@Override
	public List<KJE_PolicyManagementVo> getPolicyManagementAllList() {
		List<KJE_PolicyManagementVo> policyManagementAllList = policyManagementDao.selectPolicyManagementAllList();
		if(policyManagementAllList!=null){
		for(int i = 0 ; i<policyManagementAllList.size();i++){
			String yearSemestr = policyManagementAllList.get(i).getOpenseme_year()+"년"+policyManagementAllList.get(i).getOpenseme_semester()+"학기";
			String trem = policyManagementAllList.get(i).getOpenseme_period1()+"~"+policyManagementAllList.get(i).getOpenseme_period2();
			policyManagementAllList.get(i).setYearSemestr(yearSemestr);
			policyManagementAllList.get(i).setTrem(trem);
			policyManagementAllList.get(i).setBtnUpdate("<button class='btn btn-default notika-btn-default updatebtn' name='"+
						policyManagementAllList.get(i).getEvalpolicy_code()+"'>수정</button>");
		
		}
		
		}
		
		return policyManagementAllList;
	}

	@Override
	public List<KJE_SemesterVo> getAddSemesterList() {
		List<KJE_SemesterVo> addSemesterList = policyManagementDao.selectAddSemesterList();
		return addSemesterList;
	}

	@Override
	public ServiceResult recordEvalpolicy(Map<String, Object> graderankInfo) {
		ServiceResult result = ServiceResult.FAILED;
		String openseme_no = (String) graderankInfo.get("openseme_no");
		List<GradeRankVo> gradeRankList = (List<GradeRankVo>) graderankInfo.get("gradeRankList");
		EvaluationPolicyVo evaluationPolicy = new EvaluationPolicyVo();
		evaluationPolicy.setOpenseme_no(openseme_no);
		
		policyManagementDao.insertEvaluationPolicy(evaluationPolicy);
		
		String evalpolicy_code = policyManagementDao.selectEvalpolicyCode(openseme_no);
		
		for(int i = 0 ; i<gradeRankList.size();i++){
			if(gradeRankList.get(i).getGraderank_rank().equals("A")){
				gradeRankList.get(i).setGraderank_max("4.5");
				gradeRankList.get(i).setGraderank_min("4.0");
			}else if(gradeRankList.get(i).getGraderank_rank().equals("B")){
				gradeRankList.get(i).setGraderank_max("3.9");
				gradeRankList.get(i).setGraderank_min("3.0");
			}else if(gradeRankList.get(i).getGraderank_rank().equals("C")){
				gradeRankList.get(i).setGraderank_max("2.9");
				gradeRankList.get(i).setGraderank_min("2.0");
			}else if(gradeRankList.get(i).getGraderank_rank().equals("D")){
				gradeRankList.get(i).setGraderank_max("1.0");
				gradeRankList.get(i).setGraderank_min("1.9");
			}else if(gradeRankList.get(i).getGraderank_rank().equals("F")){
				gradeRankList.get(i).setGraderank_max("0.9");
				gradeRankList.get(i).setGraderank_min("0");
			}
			gradeRankList.get(i).setEvalpolicy_code(evalpolicy_code);
		}
		
		Map<String, Object> graderankMap = new HashedMap();
		graderankMap.put("gradeRankList", gradeRankList);
		int cnt = policyManagementDao.insertGraderank(graderankMap);
		if(cnt>0) result = ServiceResult.OK;
		
		return result;
	}

	@Override
	public ServiceResult modifyGraderank(Map<String, Object> graderankMap) {
		ServiceResult result = ServiceResult.FAILED;
		int cnt = policyManagementDao.updateGraderank(graderankMap);
		if(cnt>0) result = ServiceResult.OK;
		
		return result;
	}
	
	

}
