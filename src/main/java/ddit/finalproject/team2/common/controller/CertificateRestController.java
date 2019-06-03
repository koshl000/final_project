package ddit.finalproject.team2.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.common.service.KJE_CertificateServiceImpl;
import ddit.finalproject.team2.util.AuthorityUtil;
import ddit.finalproject.team2.util.constant.AuthConstants;
import ddit.finalproject.team2.vo.KJE_CertificateVo;
import ddit.finalproject.team2.vo.KJE_CertificatieAdminVo;
import ddit.finalproject.team2.vo.Ljs_BoardVo;
import ddit.finalproject.team2.vo.UserVo;

@RestController
public class CertificateRestController {
	@Inject
	KJE_CertificateServiceImpl certificateService;
	
	@GetMapping(value="/certificateList", produces="application/json;charset=UTF-8")
	public Map<String, Object> getList(Authentication authentication){
		Map<String, Object> map = new HashMap<>();
		List<String> alist = AuthorityUtil.getAuthorityList(authentication);
		String user_authority = null;
		for(String role : alist){
			if(AuthConstants.ROLE_STUDENT.equals(role) || AuthConstants.ROLE_PROFESSOR.equals(role)){
				user_authority = role;
				break;
			}
		}
		List<KJE_CertificateVo> list = certificateService.retriveCertificateList(user_authority);
		map.put("data", list);
		return map;
	}
	
	
	@GetMapping(value="/certificateAdminList", produces="application/json;charset=UTF-8")
	public Map<String, Object> getAdminList(Authentication authentication){
		Map<String, Object> map = new HashMap<>();
		List<KJE_CertificatieAdminVo> list = certificateService.retriveCertificateAdminList();
		map.put("data", list);
		return map;
	}
}
