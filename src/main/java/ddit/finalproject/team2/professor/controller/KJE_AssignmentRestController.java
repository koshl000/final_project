package ddit.finalproject.team2.professor.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpRequest;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.professor.service.KJE_IAssignmentService;
import ddit.finalproject.team2.util.enumpack.BrowserType;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.KJE_AssFileVo;
import ddit.finalproject.team2.vo.KJE_AssignmentnFileVo;
import ddit.finalproject.team2.vo.KJE_LWeekAssignmentProVo;
import ddit.finalproject.team2.vo.KJE_SubmitAttendstuVo;
import ddit.finalproject.team2.vo.KJE_SubmitFileVo;

@RestController
public class KJE_AssignmentRestController {
	
	@Inject
	KJE_IAssignmentService assignmentService;
	
	@GetMapping(value="/getAssignmentList", produces="application/json;charset=UTF-8")
	public Map<String, Object> getList(
			@RequestParam (required =true)String lecture_code
			){
		Map<String, Object> map = new HashMap<>();
		List<KJE_LWeekAssignmentProVo> list = assignmentService.retrieveLWeekAssignmentProList(lecture_code);
		map.put("data", list);
		return map;
	}
	
	@GetMapping(value="/getAssignmentnFile",produces="application/json;charset=UTF-8")
	public KJE_AssignmentnFileVo getAssignmentnFile(
			@RequestParam (required =true)String assignment_no
			){
		KJE_AssignmentnFileVo resp = assignmentService.retriveAssignment(assignment_no);
		
		return resp;
	}
	
	@RequestMapping(value = "/saveAssignment", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String save(
			@ModelAttribute("assignment")KJE_AssignmentnFileVo assignment
		) throws Exception {
		String resp =null;
		ServiceResult result = assignmentService.createAssignment(assignment);
		return resp;
}
	
	@RequestMapping("/assFiledownload")
	public String downloadController(
			 @RequestParam(name="what", required=true)String file_no
			, @RequestHeader(name="User-Agent") String userAgent
			, HttpServletResponse resp
			) throws IOException{
		
		KJE_AssFileVo assfile = assignmentService.retriveAssFile(file_no);
		
		String savePath =  assfile.getFile_path();
		String filename = assfile.getFile_name();
		
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
	
	
	@GetMapping(value="/getSubmitStuList", produces="application/json;charset=UTF-8")
	public Map<String, Object> getSubmitStuList(
			@RequestParam (required =true)String assignment_no
			){
		Map<String, Object> map = new HashMap<>();
		List<KJE_SubmitAttendstuVo> list = assignmentService.retriveSubmitStuList(assignment_no);
		map.put("data", list);
		return map;
	}
	
	
	
	@RequestMapping("/stuSubmitFiledownload")
	public String studownloadController(
			 @RequestParam(name="submitfile_no", required=true)String submitfile_no
			 , @RequestHeader(name="User-Agent") String userAgent
			, HttpServletResponse resp
			) throws IOException{
		
		KJE_SubmitFileVo submitFile = assignmentService.retriveSumitFile(submitfile_no);
		
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
	
	@RequestMapping(value="/savepfChecked", method = RequestMethod.POST)
	public String savepfChecked(
			HttpServletRequest req) {
		 
		String[] submitfile_nos = req.getParameterValues("submitfile_no");
		String[] file_markscores = req.getParameterValues("file_markscore");
		
		List<KJE_SubmitFileVo> pfCheckList = new ArrayList<>();
		for(int i=0; i<submitfile_nos.length;i++){
			KJE_SubmitFileVo pfChecker = new KJE_SubmitFileVo();
			pfChecker.setSubmitfile_no(submitfile_nos[i]);
			pfChecker.setFile_markscore(file_markscores[i]);
			pfCheckList.add(pfChecker);
		}
		assignmentService.modifyFchecked(pfCheckList);
		
		return null;
	}
	
	@GetMapping(value="/delAssignment" )
	public Map<String, Object> delAssignment(
			@RequestParam (required =true)String assignment_no
			){
	
			assignmentService.deletAssignment(assignment_no);
		
		return null;
	}
	
	
	@RequestMapping(value = "/updateAssignment", produces = "text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String update(
			@ModelAttribute("assignment")KJE_AssignmentnFileVo assignment
		) throws Exception {
		String resp =null;
		ServiceResult result = assignmentService.modifyAssignment(assignment);
		
		return resp;
}
	
}
