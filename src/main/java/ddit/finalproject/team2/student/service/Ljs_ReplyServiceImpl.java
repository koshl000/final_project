package ddit.finalproject.team2.student.service;

import java.io.IOException;
import java.util.List;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import ddit.finalproject.team2.common.dao.Ljs_IRingDao;
import ddit.finalproject.team2.student.dao.Ljs_IAttendDao;
import ddit.finalproject.team2.student.dao.Ljs_IBoardDao;
import ddit.finalproject.team2.student.dao.Ljs_ILectureDao;
import ddit.finalproject.team2.student.dao.Ljs_IReplyDao;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.AttendVo;
import ddit.finalproject.team2.vo.Ljs_BoardVo;
import ddit.finalproject.team2.vo.Ljs_ReplyVo;
import ddit.finalproject.team2.vo.RingVo;
import ddit.finalproject.team2.vo.UserVo;

@Service
public class Ljs_ReplyServiceImpl implements Ljs_IReplyService{

	@Inject
	Ljs_IReplyDao dao;
	
	@Inject
	Ljs_IAttendDao attendDao;
	
	@Inject
	Ljs_IRingDao ringDao;
	
	@Inject
	Ljs_ILectureDao lectureDao;
	
	@Inject
	Ljs_IBoardDao boardDao;
	
	@Resource(name="socketSessionMap")
	ConcurrentMap<String, CopyOnWriteArrayList<WebSocketSession>> socketSessionMap;
	
	private void setRemover(List<Ljs_ReplyVo> list){
		for(Ljs_ReplyVo vo : list){
			if(vo.getAttend_no()!=null){
				vo.setUser(dao.selectWriterIdByAttendNo(vo.getAttend_no()));
			}else{
				vo.setUser(dao.selectWriterIdByLectureCode(vo.getLecture_code()));
			}
			vo.setUser_name(vo.getUser().getUser_name());
			vo.setRemover("<button type='button' class='delRepBtn' name='"+vo.getUser().getUser_id()+"' value='"+vo.getReply_no()+"'>삭제</button>");
		}
	}
	
	@Override
	public List<Ljs_ReplyVo> retrieveReplyList(String board_no) {
		List<Ljs_ReplyVo> list = dao.selectReplyList(board_no);
		if(list.size()!=0){
			setRemover(list);
		}
		return list;
	}

	@Override
	public ServiceResult createReply(Ljs_ReplyVo reply) throws IOException {
		ServiceResult result = ServiceResult.FAILED;
		Ljs_BoardVo vo = new Ljs_BoardVo(reply.getUser().getUser_id(), reply.getLecture_code());
		reply.setAttend_no(attendDao.selectAttendNo(vo));
		int cnt = dao.insertReply(reply);
		if(cnt>0){
			processRing(reply);
			result = ServiceResult.OK;
		}
		
		return result;
	}

	@Override
	@Transactional
	public ServiceResult removeReply(String reply_no) {
		ServiceResult result = ServiceResult.FAILED;
		int cnt = dao.deleteReply(reply_no);
		if(cnt>0){
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult modifyReply(Ljs_ReplyVo reply) {
		ServiceResult result = ServiceResult.FAILED;
		int cnt = dao.updateReply(reply);
		if(cnt>0){
			result = ServiceResult.OK;
		}
		return result;
	}
	
	private void processRing(Ljs_ReplyVo reply) throws IOException{
		//알림 처리(DB)
		UserVo me = (UserVo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String message = me.getUser_name()+" 님이 댓글을 작성했습니다.";
		
		List<Ljs_BoardVo> boardList = boardDao.selectboard(reply.getBoard_no());
		List<AttendVo> attendList = attendDao.selectAttendList(reply.getLecture_code());
		Ljs_BoardVo parent = null;
		for(Ljs_BoardVo vo : boardList){
			if(reply.getBoard_no().equals(vo.getBoard_no())){
				parent = vo;
				break;
			}
		}
		String parentUser = null;
		for(AttendVo att : attendList){
			if(parent.getAttend_no()!=null){
				if(att.getAttend_no().equals(parent.getAttend_no())){
					parentUser = att.getUser_id();
					break;
				}
			}else {
				parentUser = boardDao.selectWriterIdByLectureCode(parent.getLecture_code());
			}
		}
		
		ringDao.insertRing(
				new RingVo(null, parentUser, me.getUser_id(), "강좌게시판", null
					, "/"+reply.getLecture_code()+"/board/"+reply.getBoard_no()
					, null, null, "N", message));
		
		//알림 처리(푸쉬 메세지)
		if(socketSessionMap.size()>0){
			for(Entry<String, CopyOnWriteArrayList<WebSocketSession>> e : socketSessionMap.entrySet()){
				for(WebSocketSession session : e.getValue()){
					UserVo user = (UserVo) ((Authentication)session.getPrincipal()).getPrincipal();
					if(user.getUser_id().equals(parentUser)){
						session.sendMessage(new TextMessage(message));
					}
				}
			}
		}
	}

}
