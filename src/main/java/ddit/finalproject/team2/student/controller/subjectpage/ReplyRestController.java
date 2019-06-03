package ddit.finalproject.team2.student.controller.subjectpage;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.student.service.Ljs_IReplyService;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.util.hint.InsertHint;
import ddit.finalproject.team2.util.hint.UpdateHint;
import ddit.finalproject.team2.vo.Ljs_ReplyVo;

@RestController
@RequestMapping("/{board_no}/reply")
public class ReplyRestController {
	@Inject
	Ljs_IReplyService service;
	
	@GetMapping(produces="application/json;charset=UTF-8")
	public Map<String, Object> getList(@PathVariable String board_no){
		Map<String, Object> map = new HashMap<>();
		List<Ljs_ReplyVo> list = service.retrieveReplyList(board_no);
		map.put("data", list);
		return map;
	}
	
	@PostMapping(value="create", produces="text/plain;charset=UTF-8")
	public String newReply(@RequestBody @Validated(InsertHint.class) Ljs_ReplyVo reply, Error errors) throws IOException{
		String msg = "실패";
		ServiceResult result = service.createReply(reply);
		if(ServiceResult.OK.equals(result)){
			msg = "성공";
		}
		return msg;
	}
	
	@DeleteMapping(value="remove/{reply_no}", produces="text/plain;charset=UTF-8")
	public String remove(@PathVariable String board_no, @PathVariable String reply_no){
		String msg = "실패";
		ServiceResult result = service.removeReply(reply_no);
		if(ServiceResult.OK.equals(result)){
			msg = "성공";
		}
		return msg;
	}
	
	@PutMapping(value="edit", produces="text/plain;charset=UTF-8")
	public String edit(@RequestBody @Validated(UpdateHint.class) Ljs_ReplyVo reply, Error errors){
		String msg = "실패";
		ServiceResult result = service.modifyReply(reply);
		if(ServiceResult.OK.equals(result)){
			msg = "성공";
		}
		return msg;
	}
}
