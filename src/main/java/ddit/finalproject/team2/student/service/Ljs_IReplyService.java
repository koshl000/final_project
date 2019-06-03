package ddit.finalproject.team2.student.service;

import java.io.IOException;
import java.util.List;

import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.Ljs_ReplyVo;

public interface Ljs_IReplyService {
	List<Ljs_ReplyVo> retrieveReplyList(String board_no);
	ServiceResult createReply(Ljs_ReplyVo reply) throws IOException;
	ServiceResult removeReply(String reply_no);
	ServiceResult modifyReply(Ljs_ReplyVo reply);
}
