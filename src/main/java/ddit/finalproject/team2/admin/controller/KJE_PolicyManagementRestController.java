package ddit.finalproject.team2.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.admin.service.KJE_IPolicyManagementService;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.GradeRankVo;
import ddit.finalproject.team2.vo.KJE_PolicyManagementVo;

@RestController
public class KJE_PolicyManagementRestController {
	
	@Inject 
	KJE_IPolicyManagementService policyManagementService;
	
	@GetMapping(value="/policyManagementList", produces="application/json;charset=UTF-8")
	public Map<String, Object> getList(){
		Map<String, Object> map = new HashMap<>();
		List<KJE_PolicyManagementVo> list = policyManagementService.getPolicyManagementAllList();
		map.put("data", list);
		return map;
	}
	
	@RequestMapping(value="/addGraderank", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String addGraderank(
			@RequestParam (required =true)String ratioA,
			@RequestParam (required =true)String ratioB,
			@RequestParam (required =true)String ratioC,
			@RequestParam (required =true)String ratioD,
			@RequestParam (required =true)String ratioF,
			@RequestParam (required =true)String openseme_no
			){
		List<GradeRankVo> gradeRankList = new ArrayList<>();
		GradeRankVo gradeRankA = new GradeRankVo();
		GradeRankVo gradeRankB = new GradeRankVo();
		GradeRankVo gradeRankC = new GradeRankVo();
		GradeRankVo gradeRankD = new GradeRankVo();
		GradeRankVo gradeRankF = new GradeRankVo();
		
		gradeRankA.setGraderank_rank("A");
		gradeRankA.setGraderank_ratio(ratioA);
		gradeRankList.add(gradeRankA);
		
		gradeRankB.setGraderank_rank("B");
		gradeRankB.setGraderank_ratio(ratioB);
		gradeRankList.add(gradeRankB);
		
		gradeRankC.setGraderank_rank("C");
		gradeRankC.setGraderank_ratio(ratioC);
		gradeRankList.add(gradeRankC);
		
		gradeRankD.setGraderank_rank("D");
		gradeRankD.setGraderank_ratio(ratioD);
		gradeRankList.add(gradeRankD);
		
		gradeRankF.setGraderank_rank("F");
		gradeRankF.setGraderank_ratio(ratioF);
		gradeRankList.add(gradeRankF);
		
		Map<String,Object> graderankInfo = new HashMap<>();
		graderankInfo.put("gradeRankList", gradeRankList);
		graderankInfo.put("openseme_no", openseme_no);
		
		ServiceResult result= policyManagementService.recordEvalpolicy(graderankInfo);
		
		String resp = "fail";
		
		if(ServiceResult.OK.equals(result)){
			resp = "success";
		}
		
		return  resp;
	}
	
	
	@RequestMapping(value="/updateGraderank", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String updateGraderank(
			@RequestParam (required =true)String ratioA,
			@RequestParam (required =true)String ratioB,
			@RequestParam (required =true)String ratioC,
			@RequestParam (required =true)String ratioD,
			@RequestParam (required =true)String ratioF,
			@RequestParam (required =true)String evalpolicy_code
			){
		List<GradeRankVo> gradeRankList = new ArrayList<>();
		GradeRankVo gradeRankA = new GradeRankVo();
		GradeRankVo gradeRankB = new GradeRankVo();
		GradeRankVo gradeRankC = new GradeRankVo();
		GradeRankVo gradeRankD = new GradeRankVo();
		GradeRankVo gradeRankF = new GradeRankVo();
		
		gradeRankA.setGraderank_rank("A");
		gradeRankA.setGraderank_ratio(ratioA);
		gradeRankList.add(gradeRankA);
		
		
		gradeRankB.setGraderank_rank("B");
		gradeRankB.setGraderank_ratio(ratioB);
		gradeRankList.add(gradeRankB);
		
		gradeRankC.setGraderank_rank("C");
		gradeRankC.setGraderank_ratio(ratioC);
		gradeRankList.add(gradeRankC);
		
		gradeRankD.setGraderank_rank("D");
		gradeRankD.setGraderank_ratio(ratioD);
		gradeRankList.add(gradeRankD);
		
		gradeRankF.setGraderank_rank("F");
		gradeRankF.setGraderank_ratio(ratioF);
		gradeRankList.add(gradeRankF);
		
		for(int i = 0; i<gradeRankList.size();i++){
			gradeRankList.get(i).setEvalpolicy_code(evalpolicy_code);
		}
		Map<String,Object> graderankInfo = new HashMap<>();
		graderankInfo.put("gradeRankList", gradeRankList);
		ServiceResult result= policyManagementService.modifyGraderank(graderankInfo);
		String resp = "fail";
		if(ServiceResult.OK.equals(result)){
			resp = "success";
		}
		return  resp;
	}
	
	
	
	
	
}
