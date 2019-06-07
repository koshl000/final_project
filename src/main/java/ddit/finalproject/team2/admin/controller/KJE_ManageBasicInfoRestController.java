package ddit.finalproject.team2.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.admin.service.KJE_ManageBasicInfoServiceImpl;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.KJE_OpenSemesterVo;
import ddit.finalproject.team2.vo.KJE_SubmitFileVo;

@RestController
public class KJE_ManageBasicInfoRestController {

	@Inject
	KJE_ManageBasicInfoServiceImpl manageBasicInfoService;
	
	@GetMapping(value="/getbasicInfoList", produces="application/json;charset=UTF-8")
	public Map<String, Object> getAttendApplyList(){
		
		Map<String, Object> map = new HashMap<>();
		List<KJE_OpenSemesterVo> list = manageBasicInfoService.retriveBInfoList();
		map.put("data", list);
		return map;
	}
	
	
	@RequestMapping(value="/saveInfo", method = RequestMethod.POST)
	public String saveInfo(@ModelAttribute("saveInfo") KJE_OpenSemesterVo saveInfo) {
		 ServiceResult result = manageBasicInfoService.createBInfo(saveInfo);
		return null;
	}
	
	
}
