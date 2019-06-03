package ddit.finalproject.team2.student.controller.subjectpage;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.professor.service.KJE_IAssignmentService;
import ddit.finalproject.team2.student.service.KJE_IAssignmentServiceStu;
import ddit.finalproject.team2.util.enumpack.BrowserType;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.AttendVo;
import ddit.finalproject.team2.vo.KJE_AssFileVo;
import ddit.finalproject.team2.vo.KJE_AssignmentnFileVo;
import ddit.finalproject.team2.vo.KJE_LWeekAssignmentProVo;
import ddit.finalproject.team2.vo.KJE_SubmitFileVo;
import ddit.finalproject.team2.vo.SubmitFileVo;
import ddit.finalproject.team2.vo.UserVo;

@RestController
public class KJE_AssignmentstuRestController {
	
	@Inject
	KJE_IAssignmentServiceStu assignmentService;
	
	@GetMapping(value="/getAssignmentsutList", produces="application/json;charset=UTF-8")
	public Map<String, Object> getList(
			@RequestParam (required =true)String lecture_code
			){
		Map<String, Object> map = new HashMap<>();
		List<KJE_LWeekAssignmentProVo> list = assignmentService.retrieveLWeekAssignmentProList(lecture_code);
		map.put("data", list);
		return map;
	}
	
	@RequestMapping(value="/getAssignmentnSubmitFile",method=RequestMethod.POST, produces="application/json;charset=UTF-8" )
	public SubmitFileVo getAssignmentnSubmitFile(
			@RequestParam(required=true)String lecture_code,
			@RequestParam(required=true)String assignment_no,
			Authentication au
			){
				String attend_no=null;
				UserVo user= (UserVo) au.getPrincipal();
				List<AttendVo> attendList = user.getAttendNoList();
				for(int i =0;i<attendList.size();i++){
					if(attendList.get(i).getLecture_code().equals(lecture_code)){
						attend_no=attendList.get(i).getAttend_no();
					}
				}
				
				Map<String,String> stuInfo = new HashMap<>();
				stuInfo.put("attend_no", attend_no);
				stuInfo.put("assignment_no", assignment_no);
				
				SubmitFileVo resp = assignmentService.retriveSubmitFile(stuInfo);
				
				if(resp==null){
					resp= new SubmitFileVo();
					resp.setAttend_no(attend_no);
					resp.setFile_name("미재출");
					resp.setFile_date("미재출");
				}
				
		return resp;
	}
	
	
	@RequestMapping(value = "/saveSubmitFile", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String save(
			@ModelAttribute("submitFile")KJE_SubmitFileVo submitFile
		) throws Exception {
		String resp =null;
		ServiceResult result = assignmentService.recordSubmitFile(submitFile);
		return resp;
	}
	
	
	@RequestMapping("/submitFiledownload")
	public String downloadController(
			@RequestParam(required=true)String attend_no,
			@RequestParam(required=true)String assignment_no,
			 @RequestHeader(name="User-Agent") String userAgent,
			 HttpServletResponse resp
			) throws IOException{
		
		Map<String,String> stuInfo = new HashMap<>();
		stuInfo.put("attend_no", attend_no);
		stuInfo.put("assignment_no", assignment_no);
		
		SubmitFileVo submitFile = assignmentService.retriveSubmitFile(stuInfo);
		
		String savePath =  submitFile.getFile_url();
		String filename = submitFile.getFile_name();
		
		BrowserType brType = BrowserType.matchedType(userAgent);
		
		if(BrowserType.IE.equals(brType)||BrowserType.TRIDENT.equals(brType)) {
			filename = URLEncoder.encode((filename),"UTF-8");
		}else {
			filename = new String(filename.getBytes(),"ISO-8859-1");
		}
		File saveFile = new File(savePath);
		
		if(!saveFile.exists()) {
			resp.sendError(400);
			return null;
		}
		
		resp.setHeader("Content-Disposition", "attachment;filename=\""+filename+"\"");
		
		try(
				 InputStream is = new FileInputStream(saveFile);
					OutputStream os = resp.getOutputStream();	
				){
			                
			IOUtils.copy(is, os);
			
		}
		
		return null;
		
	}
	

	@RequestMapping(value = "/updateSubmitFile", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String updateSubmitFile(
			@ModelAttribute("submitFile")KJE_SubmitFileVo submitFile
		) throws Exception {
		String resp =null;
		ServiceResult result = assignmentService.modifySubmitFile(submitFile);
		return resp;
	}
	
	
	
}
