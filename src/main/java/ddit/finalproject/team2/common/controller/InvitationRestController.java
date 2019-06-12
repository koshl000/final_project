package ddit.finalproject.team2.common.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import ddit.finalproject.team2.common.service.Ljs_IRingService;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.Ljs_InvitationVo;

@Controller
@RequestMapping("/invitation")
public class InvitationRestController {
	@Inject
	Ljs_IRingService service;
	
	@PostMapping(value="sending", produces="text/plain;charset=UTF-8")
	public String ringForInvitation(@RequestBody(required=true) Ljs_InvitationVo vo){
		String msg = "초대 알림 발송에 실패했습니다.";
		ServiceResult result = service.createInvitationRing(vo);
		if(ServiceResult.OK.equals(result)) msg = "초대 알림을 발송했습니다.";
		return msg;
	}
}
