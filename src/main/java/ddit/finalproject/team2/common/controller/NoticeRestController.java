package ddit.finalproject.team2.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.common.service.Ljs_INoticeService;
import ddit.finalproject.team2.vo.Ljs_BoardVo;

@RestController
@RequestMapping("/notice")
public class NoticeRestController {
	@Inject
	Ljs_INoticeService service;
	
	@GetMapping(produces="application/json;charset=UTF-8")
	public Map<String, Object> getList(){
		Map<String, Object> map = new HashMap<>();
		List<Ljs_BoardVo> list = service.retrieveNoticeList();
		map.put("data", list);
		return map;
	}
	
}
