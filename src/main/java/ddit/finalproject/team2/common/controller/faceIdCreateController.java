package ddit.finalproject.team2.common.controller;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.common.dao.KJE_IStudentDao;
import ddit.finalproject.team2.common.service.KJE_IFaceIdService;
import ddit.finalproject.team2.vo.StudentVo;

@RestController
public class faceIdCreateController {
	
	@Inject
	KJE_IFaceIdService faceIdService;
	
	@Inject
	KJE_IStudentDao studentDao;
	
	
	@RequestMapping(value="/createFaceId", method=RequestMethod.POST)
	public String cFaceId(
			Authentication authentication,
			@RequestParam String faceId
			){
			String result=null;
			StudentVo student = new StudentVo();
			student.setFace_id(faceId);
			student.setUser_id(authentication.getName());
			
			int cnt = faceIdService.modifyFaceId(student);
			if(cnt>0){
				result = "success";
			}else{
				result ="fail";
			}
		return result;
	}
	
	
	@RequestMapping(value="/getFaceId")
	public String getFaceId(Authentication au){
		
		String result=null;
		String user_Id =au.getName(); 
		result = studentDao.selectFaceId(user_Id);
		return result;
	}
	
	
}
	
	
	


