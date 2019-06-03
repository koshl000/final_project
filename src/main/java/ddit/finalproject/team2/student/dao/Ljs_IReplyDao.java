package ddit.finalproject.team2.student.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ddit.finalproject.team2.vo.Ljs_ReplyVo;
import ddit.finalproject.team2.vo.UserVo;

@Repository
@Transactional
public interface Ljs_IReplyDao {
	/**
	 * 게시글의 댓글의 개수를 조회하는 메서드
	 * @param board_no
	 * @return
	 */
	int selectReplyCount(String board_no);
	
	/**
	 * 게시글의 댓글 목록을 조회하는 메서드
	 * @param board_no
	 * @return not exist : list.size()==0
	 */
	List<Ljs_ReplyVo> selectReplyList(String board_no);
	
	int insertReply(Ljs_ReplyVo vo);
	int deleteReply(String reply_no);
	
	int deleteAllReply(String board_no);
	
	int updateReply(Ljs_ReplyVo reply);
	
	UserVo selectWriterIdByLectureCode(String lecture_code);
	UserVo selectWriterIdByAttendNo(String attend_no);
	
}
