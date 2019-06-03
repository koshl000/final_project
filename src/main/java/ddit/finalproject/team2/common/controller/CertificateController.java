package ddit.finalproject.team2.common.controller;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ddit.finalproject.team2.common.service.KJE_ICertificateService;
import ddit.finalproject.team2.common.service.KJE_IFaceIdService;
import ddit.finalproject.team2.util.EncryptUtils;
import ddit.finalproject.team2.vo.KJE_SRVo;
import ddit.finalproject.team2.vo.UserVo;

@Controller
public class CertificateController {
	
	@Inject
	KJE_ICertificateService CertificateService;
	
	@RequestMapping("/001-00001")
	public String transcriptSempleSelect(){
	
		return "student/Certificate/KJE_TranscriptSemple";
	}

	
	@RequestMapping("/001-00002")
	public String grauduateSempleSelect(){
		return "student/Certificate/KJE_grauduateSemple";
	}
	
	@RequestMapping("/001-00002ap")
	public String grauduateSelect(){
		return "student/Certificate/KJE_grauduate";
	}
	
	
	@RequestMapping("/001-00003")
	public String completionSempleSelect(){
		return "student/Certificate/KJE_CompletionSemple";
	}
	
	@RequestMapping("/001-00004")
	public String schoolRegisterSelect(){
		return "student/Certificate/KJE_SchoolRegisterSemple";
	}
	@RequestMapping("/001-00004ap")
	public String schoolRegister(Model model,Authentication authentication){
		String userId = authentication.getName();
		KJE_SRVo srInfo = CertificateService.getSRinfo(userId);
		srInfo.setUser_id(userId);
		model.addAttribute("srInfo", srInfo);
		return "student/Certificate/KJE_SchoolRegister";
	}
	
	
	
}
