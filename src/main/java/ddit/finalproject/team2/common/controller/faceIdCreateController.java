package ddit.finalproject.team2.common.controller;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ddit.finalproject.team2.common.service.KJE_IFaceIdService;
import ddit.finalproject.team2.vo.StudentVo;

@Controller
@RequestMapping("/createFaceId")
public class faceIdCreateController {
	
	@Inject
	KJE_IFaceIdService faceIdService;
	
	@RequestMapping(method=RequestMethod.POST)
	@ResponseBody
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
	
	
}

