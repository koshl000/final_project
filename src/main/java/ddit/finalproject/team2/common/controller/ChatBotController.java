package ddit.finalproject.team2.common.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ddit.finalproject.team2.vo.UserVo;

@Controller
public class ChatBotController {
	@RequestMapping("/chatbot")
	public String chatbotController(Model model,Authentication authentication){
		UserVo user = (UserVo) authentication.getPrincipal();
		model.addAttribute("user", user);
		return "student/chatbot";
	}
	
	
}
