package ddit.finalproject.team2.datatabletest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.datatabletest.service.DataTableTestService;
import ddit.finalproject.team2.vo.UserVo;

@RestController
@RequestMapping("/dataTable")
public class DataTableController {
	
	@Inject
	DataTableTestService service;

	@GetMapping("list")
	public Map<String, List<UserVo>> getList(){
		Map<String, List<UserVo>> map = new HashMap<>();
		List<UserVo> userList = service.retrieveUserList();
		
		map.put("data", userList);
		return map;
	}
}
