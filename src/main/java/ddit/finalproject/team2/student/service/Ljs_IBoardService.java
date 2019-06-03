package ddit.finalproject.team2.student.service;

import java.io.IOException;
import java.util.List;

import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.AttachmentVo;
import ddit.finalproject.team2.vo.Ljs_BoardVo;

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
 * 과목게시판 게시글 처리를 위한 business logic layer 의 추상화
 * </pre>
 */
public interface Ljs_IBoardService {
	/**
	 * 과목게시판 게시글 목록을 가져오는 메서드
	 * @return not exist : common exception
	 */
	List<Ljs_BoardVo> retrieveBoardList(String lecture_code);
	
	/**
	 * 게시글을 가져오는 메서드
	 * @param board_no
	 * @return not exist : common exception
	 */
	List<Ljs_BoardVo> retrieveBoard(String board_no);
	
	/**
	 * 첨부파일 다운로드 처리를 위한 메서드
	 * @param attachment_no
	 * @return not exist : common exception
	 */
	AttachmentVo downloadAttachment(String attachment_no);
	
	/**
	 * 게시글 추가 메서드
	 * @param board
	 * @return OK, FAILED
	 * @throws IOException 
	 */
	ServiceResult createBoard(Ljs_BoardVo board) throws IOException;
	
	ServiceResult removeBoard(Ljs_BoardVo board);
	
	Ljs_BoardVo modifyBoard(Ljs_BoardVo board);
}
