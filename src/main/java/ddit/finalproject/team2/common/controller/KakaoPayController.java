package ddit.finalproject.team2.common.controller;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ddit.finalproject.team2.common.service.KJE_CertificateServiceImpl;
import ddit.finalproject.team2.common.service.KJE_KakaoPayService;
import ddit.finalproject.team2.vo.IssueVo;
import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
public class KakaoPayController {

	 @Setter(onMethod_ = @Autowired)
	    private KJE_KakaoPayService kakaopay;
	    
	 @Inject
		KJE_CertificateServiceImpl certificateService;
	    
	 
	    @GetMapping("/kakaoPay")
	    public void kakaoPayGet() {
	        
	    }
	    
	    @PostMapping("/kakaoPay")
	    public String kakaoPay(
	    		Authentication authentication,
	    		@RequestParam (required =false)String code,
	    		@RequestParam (required =false)String name,
	    		@RequestParam (required =false)String count,
	    		@RequestParam (required =false)String sum
	    		) {
	        log.info("kakaoPay post............................................");
	        
	        Map<String, String> Values= new LinkedHashMap<String, String>();
	        Values.put("code", code);
	        Values.put("name", name);
	        Values.put("count", count);
	        Values.put("sum",sum);
	        
	        IssueVo issue = new IssueVo();
	        issue.setUser_id(authentication.getName());
	        issue.setIssue_count(count);
	        issue.setCertificate_code(code.substring(0, 9));
	        issue.setIssue_totalprice(sum);
	        
	        certificateService.recordIssu(issue);
	        
	        return "redirect:" + kakaopay.kakaoPayReady(Values);
	 
	    }
	    
	    @GetMapping("/kakaoPaySuccess")
	    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
	        log.info("kakaoPaySuccess get............................................");
	        log.info("kakaoPaySuccess pg_token : " + pg_token);
	        
	        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
	        
	        return "/kakaoPay/kakaoPaySuccess";
	    }
	
}
