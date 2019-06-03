package ddit.finalproject.team2.student.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

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
 * 과목게시판 첨부파일 관리를 위한 persistence layer 의 추상화
 * </pre>
 */
@Repository
public interface Ljs_IAttachmentDao {
	/**
	 * 첨부파일 하나를 조회하는 메서드
	 * @param attachment_no
	 * @return not exist : null
	 */
	AttachmentVo selectAttacment(String attachment_no);
	
	/**
	 * 게시글 수정 중 첨부파일 삭제 시 삭제 대상 파일을 한꺼번에 조회하는 메서드
	 * @param board
	 * @return failed < 1
	 */
	int insertAttachmentAll(Ljs_BoardVo board);
	
	/**
	 * @param board
	 * @return not exist : list.size() == 0
	 */
	List<AttachmentVo> selectAttachmentList(Ljs_BoardVo board);
	
	/**
	 * 게시글 수정 중 첨부파일 삭제 시 삭제 대상 파일을 한꺼번에 삭제
	 * @param board
	 * @return failed < 1
	 */
	int deleteAttachmentAll(Ljs_BoardVo board);
}
