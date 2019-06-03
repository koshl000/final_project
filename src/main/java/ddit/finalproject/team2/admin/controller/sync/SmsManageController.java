package ddit.finalproject.team2.admin.controller.sync;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ddit.finalproject.team2.admin.service.Jch_SmsService;
import ddit.finalproject.team2.vo.Jch_UserVo;

@Controller
@RequestMapping("/sms")
public class SmsManageController {

	@Inject
	Jch_SmsService smsService;
	
	@GetMapping("menualList")
	public ModelAndView goGoal(ModelAndView mv){
		mv.setViewName("admin/smsManualSend");
		return mv;
	}
	
	@GetMapping(value="menualSend", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, List<Jch_UserVo>> getUserList() {
		Map<String, List<Jch_UserVo>> map = new HashMap<>();
		List<Jch_UserVo> userList = smsService.selectUserList();
		
		map.put("data", userList);
		return map;
	}
}
