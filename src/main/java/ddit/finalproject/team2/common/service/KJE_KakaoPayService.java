package ddit.finalproject.team2.common.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import ddit.finalproject.team2.vo.KJE_KakaoPayApprovalVO;
import ddit.finalproject.team2.vo.KJE_KakaoPayReadyVO;
import lombok.extern.java.Log;

@Log
@Service
public class KJE_KakaoPayService {

	  private static final String HOST = "https://kapi.kakao.com";
	    
	    private KJE_KakaoPayReadyVO kakaoPayReadyVO;

	    private KJE_KakaoPayApprovalVO kakaoPayApprovalVO;
	    
	    public String kakaoPayReady(Map<String, String> values) {
	 
	        RestTemplate restTemplate = new RestTemplate();
	        
	        String code = (String)values.get("code");
	        String name = (String)values.get("name");
	        String count = (String)values.get("count");
	        String sum = (String)values.get("sum");
	        
	        // 서버로 요청할 Header
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "KakaoAK " + "2b7e17bb7bcbeae8ee1a66b303456cc7");
	        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
	        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
	        
	        // 서버로 요청할 Body
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        
	        params.add("cid", "TC0ONETIME");
	        params.add("partner_order_id", code);
	        params.add("partner_user_id", "gorany");
	        params.add("item_name", name);
	        params.add("quantity", count);
	        params.add("total_amount", sum);
	        params.add("tax_free_amount", "100");
	        params.add("approval_url", "http://localhost/projecttemplate/"+code);
	        params.add("cancel_url", "http://localhost:8080/kakaoPayCancel");
	        params.add("fail_url", "http://localhost:8080/kakaoPaySuccessFail");
	 
	         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
	 
	        try {
	            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KJE_KakaoPayReadyVO.class);
	            
	            log.info("" + kakaoPayReadyVO);
	            
	            return kakaoPayReadyVO.getNext_redirect_pc_url();
	 
	        } catch (RestClientException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (URISyntaxException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        
	        return "/pay";
	        
	    }
	    
	    public KJE_KakaoPayApprovalVO kakaoPayInfo(String pg_token) {
	    	 
	        log.info("KakaoPayInfoVO............................................");
	        log.info("-----------------------------");
	        
	        RestTemplate restTemplate = new RestTemplate();
	 
	        // 서버로 요청할 Header
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "KakaoAK " + "2b7e17bb7bcbeae8ee1a66b303456cc7");
	        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
	        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
	 
	        // 서버로 요청할 Body
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        params.add("cid", "TC0ONETIME");
	        params.add("tid", kakaoPayReadyVO.getTid());
	        params.add("partner_order_id", "1001");
	        params.add("partner_user_id", "gorany");
	        params.add("pg_token", pg_token);
	        params.add("total_amount", "2100");
	        
	        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
	        
	        try {
	            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KJE_KakaoPayApprovalVO.class);
	            log.info("" + kakaoPayApprovalVO);
	          
	            return kakaoPayApprovalVO;
	        
	        } catch (RestClientException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (URISyntaxException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        
	        return null;
	    }
	    
	
}
