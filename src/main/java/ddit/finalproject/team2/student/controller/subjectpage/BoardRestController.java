package ddit.finalproject.team2.student.controller.subjectpage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ddit.finalproject.team2.student.service.Ljs_IBoardService;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.util.hint.UpdateHint;
import ddit.finalproject.team2.vo.Ljs_BoardVo;

/**
 * @author 이종선
 * @since 2019. 5. 14.
 * @version 1.0
 * @see 
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2019. 5. 14.      이종선       최초작성
 * Copyright (c) 2019 by DDIT All right reserved
 * 
 * 게시판 화면에서 비동기 요청을 처리하기 위한 controller
 * </pre>
 */
@RestController
@RequestMapping("{lecture_code}/board")
public class BoardRestController {
	@Inject
	Ljs_IBoardService boardService;

	@GetMapping(produces="application/json;charset=UTF-8")
	public Map<String, Object> getList(@PathVariable String lecture_code){
		Map<String, Object> map = new HashMap<>();
		List<Ljs_BoardVo> list = boardService.retrieveBoardList(lecture_code);
		map.put("data", list);
		return map;
	}
	
	@DeleteMapping("remove")
	public String remove(@RequestBody Ljs_BoardVo board){
		String msg = "실패";
		ServiceResult result = boardService.removeBoard(board);
		if(ServiceResult.OK.equals(result)){
			msg = "성공";
		}
		return msg;
	}
	
	@PostMapping(value="modify", produces="application/json;charset=UTF-8")
	public Ljs_BoardVo modify(@ModelAttribute("board") @Validated(UpdateHint.class) Ljs_BoardVo board
			, Error errors){
		Ljs_BoardVo vo = boardService.modifyBoard(board);
		return vo;
	}
}
