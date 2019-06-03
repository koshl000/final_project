package ddit.finalproject.team2.common.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.common.service.Ljs_IRingService;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.RingVo;

@RestController
@RequestMapping("/ring")
public class RingRestController {
	@Inject
	Ljs_IRingService service;
	
	@GetMapping(value="{user_id}", produces="application/json;charset=UTF-8")
	public List<RingVo> getList(@PathVariable String user_id){
		List<RingVo> list = service.retrieveRingList(user_id);
		return list;
	}
	
	@PutMapping(value="read/{ring_code}", produces="text/plain;charset=UTF-8")
	public String readAlert(@PathVariable String ring_code){
		String msg = "실패";
		ServiceResult result = service.modifyRing(ring_code);
		if(ServiceResult.OK.equals(result)){
			msg = "성공";
		}
		return msg;
	}
}
