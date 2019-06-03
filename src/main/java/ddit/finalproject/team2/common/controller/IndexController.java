package ddit.finalproject.team2.common.controller;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ddit.finalproject.team2.util.AuthorityUtil;
import ddit.finalproject.team2.util.constant.AuthConstants;

@Controller
public class IndexController {
	@RequestMapping({"/", "/index"})
	public String index(Authentication authentication){
		String view = null;
		if(authentication!=null){
			List<String> list = AuthorityUtil.getAuthorityList(authentication);
			if(list.contains(AuthConstants.ROLE_STUDENT)
					|| list.contains(AuthConstants.ROLE_PROFESSOR)
					|| list.contains(AuthConstants.ROLE_ADMIN)){
				view = "redirect:/chooseMain";
			}
		}else{
			view = "common/login";
		}
		
		return view;
	}
}
