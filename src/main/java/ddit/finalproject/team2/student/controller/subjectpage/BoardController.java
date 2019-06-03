package ddit.finalproject.team2.student.controller.subjectpage;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ddit.finalproject.team2.student.service.Ljs_IBoardService;
import ddit.finalproject.team2.student.service.Ljs_ILectureService;
import ddit.finalproject.team2.util.enumpack.BrowserType;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.util.hint.InsertHint;
import ddit.finalproject.team2.vo.AttachmentVo;
import ddit.finalproject.team2.vo.Ljs_BoardVo;
import ddit.finalproject.team2.vo.UserVo;

/**
 * @author 이종선
 * @since 2019. 5. 16.
 * @version 1.0
 * @see 
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2019. 5. 16.      이종선       최초작성
 * Copyright (c) 2019 by DDIT All right reserved
 * 
 * 과목게시판 화면에서 동기 요청을 처리하기 위한 컨트롤러
 * </pre>
 */
@Controller
@RequestMapping("{lecture_code}")
public class BoardController {
	@Inject
	Ljs_IBoardService boardService;
	
	@Inject
	Ljs_ILectureService lectureService;
	
	@GetMapping("download/{attachment_no}")
	public String download(@PathVariable String attachment_no
		, @RequestHeader(name="User-Agent") String userAgent
		, HttpServletResponse resp) throws IOException {
		
		AttachmentVo attach = boardService.downloadAttachment(attachment_no);
		String savePath = attach.getFile_path();
		String filename = attach.getFile_name();
		
		BrowserType brType = BrowserType.matchedType(userAgent);
		if(BrowserType.IE.equals(brType) || BrowserType.TRIDENT.equals(brType)){
			filename = URLEncoder.encode(filename, "UTF-8");
		}else{
			filename = new String(filename.getBytes(), "ISO-8859-1");
		}
		
		File saveFile = new File(savePath);
		if(!saveFile.exists()){
			resp.sendError(404);
			return null;
		}
		
		resp.setHeader("Content-Disposition", "attachment;filename=\""+filename+"\"");
		
		try(
			InputStream is = new FileInputStream(saveFile);
			OutputStream os = resp.getOutputStream();
		){
			IOUtils.copy(is, os);
		}
		return null;
	}
	
	@GetMapping("board/create")
	public ModelAndView goCreate(@PathVariable String lecture_code, ModelAndView mv, Authentication au){
		mv.setViewName("new/boardAdd");
		mv.getModel().put("user", (UserVo)au.getPrincipal());
		mv.getModel().put("lectureCode", lecture_code);
		mv.getModel().put("lecture", lectureService.retrieveLecture(lecture_code));
		return mv;
	}
	
	@GetMapping("board/{board_no}")
	public ModelAndView goBoardView(@PathVariable String board_no, ModelAndView mv, Authentication au){
		mv.setViewName("new/boardDetail");
		mv.getModel().put("user", (UserVo)au.getPrincipal());
		List<Ljs_BoardVo> boardList = boardService.retrieveBoard(board_no);
		mv.getModel().put("boardList", boardList);
		mv.getModel().put("bo_no", board_no);
		
		return mv;
	}
	
	@PostMapping("board/create")
	public ModelAndView create(@PathVariable String lecture_code
			, @ModelAttribute("board") @Validated(InsertHint.class) Ljs_BoardVo board, Error errors
			, Authentication au, HttpServletResponse resp, ModelAndView mv) throws IOException{
		ServiceResult result = boardService.createBoard(board);
		
		if(ServiceResult.FAILED.equals(result)){
			resp.sendError(500);
		}
		mv.setViewName("new/lectureBoard");
		mv.getModel().put("user", (UserVo)au.getPrincipal());
		mv.getModel().put("lectureCode", lecture_code);
		return mv;
	}
}
